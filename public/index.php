<?php

define('ROOTDIR', dirname(__DIR__));
require_once ROOTDIR."/vendor/autoload.php";

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Connection as DatabaseConnection;
use Illuminate\Database\MySqlConnection as MySqlConnection;
use Illuminate\Events\Dispatcher as EventDispatcher;


O\O::init();

date_default_timezone_set('America/Vancouver');

////////////////////////////////////////////////////////////////////////////////
// Load the Mustache Template engine and configure it                         //
////////////////////////////////////////////////////////////////////////////////
$mustache = new Mustache_Engine([
	'loader' => new Mustache_Loader_FilesystemLoader(
		ROOTDIR.'/views/', 
		['extension' => '.ms']
	),
	'partials_loader' => new Mustache_Loader_FilesystemLoader(
		ROOTDIR.'/views/',
		['extension' => '.ms']
	)
]);

class SlimViewSimple extends \Slim\View
{
	protected $_engine = null;
	
	public function __construct($engine)
	{
		$this->_engine = $engine;
	}
	
	public function render($tpl)
	{
		if ($this->_engine == null) {
			$this->_engine = new Mustache_Engine;
		}
		$page = $this->_engine->loadTemplate('content');
		$m = $this->_engine->loadTemplate($tpl);
		return $page->render(['main' => $m->render($this->data)]);
	}
}

$app = new \Slim\Slim(['view' => new SlimViewSimple($mustache)]);

////////////////////////////////////////////////////////////////////////////////
// Load Laravel Database and ORM (Eloquent)                                   //
////////////////////////////////////////////////////////////////////////////////

require_once __DIR__.'/../config/database.php';

$capsule = new Capsule;
$capsule->addConnection($DATABASE_CONFIG);
$capsule->setEventDispatcher(new EventDispatcher());
$capsule->bootEloquent();
$capsule->setAsGlobal();

spl_autoload_register(function ($class) {
	$ns = O\c(O\s($class))->explode('\\');
	if ($ns->count() <= 3) {
		return;
	}
	
	if ($ns->slice(0, 3)->implode('\\') == 'RMAN\Models\ORM') {
		$path = ROOTDIR.'/models/ORM/'.
				$ns->slice(3)->implode('/').
				'.php';
		
		if (file_exists($path)) {
			include $path;
		}
	}
});

////////////////////////////////////////////////////////////////////////////////
// Hello World!                                                               //
// TODO: replace with front page: slideshow, news, etc..                      //
////////////////////////////////////////////////////////////////////////////////
$app->get('/', function() use ($app) {
	$app->render('index');
});

////////////////////////////////////////////////////////////////////////////////
// Artists                                                                    //
//                                                                            //
// * List                                                                     //
// * Create                                                                   //
// * Save                                                                     //
// * View                                                                     //
//                                                                            //
// TODO: edit                                                                 //
////////////////////////////////////////////////////////////////////////////////
$app->get('/artists/', function() use ($app) {
	$artists = RMAN\Models\ORM\Artist::get();
	$app->render('artists/index', ['artists' => $artists]);
});

$app->get('/artists/:id', function($id) use ($app) {
	$artist = RMAN\Models\ORM\Artist::with('picture')->find($id);
	$app->render('artists/view', ['artist' => $artist]);
})->conditions(['id' => '\d+']);

$app->get('/artists/create/', function() use ($app) {
	$artist = new RMAN\Models\ORM\Artist;
	$app->render('artists/create', ['artist' => $artist]);
});

$app->get('/artists/edit/:id', function($id) use ($app) {
	$artist = RMAN\Models\ORM\Artist::with('picture')->find($id);
	$app->render('artists/create', ['artist' => $artist]);
})->conditions(['id' => '\d+']);

$app->post('/artists/save(/:id)', function($id) use ($app) {
	if ($id) {
		$artist = RMAN\Models\ORM\Artist::find($id);
		foreach($_POST as $k => $v) {
			$artist->$k = $v;
		}
	}
	else {
		$artist = new RMAN\Models\ORM\Artist($app->request()->post());
	}
	
	$artist->save();
	$app->response()->redirect('/artists/' . $artist->id);
});

////////////////////////////////////////////////////////////////////////////////
// Releases                                                                   //
//                                                                            //
// * List                                                                     //
// * Create                                                                   //
// * Save                                                                     //
// * View                                                                     //
//                                                                            //
// TODO: edit                                                                 //
////////////////////////////////////////////////////////////////////////////////
$app->get('/releases/', function() use ($app) {
	$releases = RMAN\Models\ORM\Release::get();
	$app->render('releases/index', ['releases' => $releases]);
});

$app->get('/releases/:id', function($id) use ($app) {
	$release = RMAN\Models\ORM\Release::with('picture')->find($id);
	$app->render('releases/view', ['release' => $release]);
})->conditions(['id' => '\d+']);

$app->get('/releases/create/', function() use ($app) {
	$release = new RMAN\Models\ORM\Release;
	$tags = RMAN\Models\ORM\Artist::tags();
	
	$app->render('releases/create', [
		'release'	=> $release,
		'tags'	=> json_encode($tags)
	]);
});

$app->post('/releases/save/', function() use ($app) {
	
	$request = $app->request();
	$release = new RMAN\Models\ORM\Release;
	
	
	$release->title = $request->post('title');
	$release->picture_id = $request->post('picture_id');
	
	$release->save();
	
	$order = 0;
	
	foreach($request->post('tracks') as $trk) {
		if (is_integer($trk)) {
			$track = RMAN\Models\ORM\Track::find($track);
			$release->tracks()->save($track);
		}
		else {
			$track = new RMAN\Models\ORM\Track;
			$track->title = $trk['title'];
			$track->order = ++$order;
			$release->tracks()->save($track);
			
			
			foreach($trk['artists'] as $artist_id) {
				$artist = RMAN\Models\ORM\Artist::find($artist_id);
				$track->artists()->attach($artist->id);
			}
			
			$track->push();
		}
		
	}
	
	$release->push();
	$app->response()->redirect('/releases/' . $release->id);
});

////////////////////////////////////////////////////////////////////////////////
// Pictures                                                                   //
//                                                                            //
// * Upload                                                                   //
// * Display                                                                  //
////////////////////////////////////////////////////////////////////////////////
$app->post('/pictures/upload/', function() use ($app) {
	$pictures = [];
	
	
	foreach($_FILES as $file) {
		
		try {
			$img = Intervention\Image\Image::make($file['tmp_name']);
			$storename = Phrenetic\StoreFile::instance('pictures')
						->add($file['tmp_name']);
			
			$picture = new RMAN\Models\ORM\Picture([
				'type'		=> $file['type'],
				'name'		=> $file['name'],
				'storename'	=> $storename
			]);
			$picture->width = $img->width;
			$picture->height = $img->height;
			$picture->save();
			
			$pictures[] = $picture->toArray();
		}
		catch (Exception $e) {
			$pictures[] = ['error' => $e->getMessage()];
		}
	}
	
	$response = $app->response();
	
	$response['Content-Type'] = 'application/json';
	$response->body(json_encode($pictures));
});

$app->get('/pictures/display/:storename', function($storename) use ($app) {
	
	$store = new Phrenetic\StoreFile('pictures');
	$picture = RMAN\Models\ORM\Picture::where('storename', $storename)->where('default', 1)->first();
	
	if (empty($picture)) {
		die('FOOBAR');
	}
	
	$response = $app->response();
	$response['Content-Type'] = $picture->type;
	$response->body($store->get($picture->storename));
});

$app->get('/pictures/resized/:x/:y/:storename', function($size_x, $size_y, $storename) use ($app) {
	
	$store = new Phrenetic\StoreFile('pictures');
	$q = RMAN\Models\ORM\Picture::where('storename', $storename);
	$db = $q->getQuery();
	
	$columns = ['pictures.*'];
	
	
	if ($size_x) {
		$columns[] = $db->raw((int)$size_x.' - width as wdiff');
		$q->orderBy('wdiff', 'asc');
	}
	
	
	if ($size_y) {
		$columns[] = $db->raw((int)$size_y.' - height as hdiff');
		$q->orderBy('hdiff', 'asc');
	}
	
	$q->select($columns);
	
	
	$picture = $q->first();
	if (empty($picture)) {
		die('FOOBAR');
	}
	
	if (($size_x && $picture->wdiff) && !$size_y) {
		try {
			$img = Intervention\Image\Image::make($store->filename($picture->storename));
			
			$resized = new RMAN\Models\ORM\Picture([
				'type'		=> $picture->type,
				'name'		=> $picture->name,
				'storename'	=> $picture->storename,
				'resizedname'	=> $store->add($picture->storename),
				'default'	=> 0
			]);
			
			$img->resize($size_x, null, true);
			$img->save($store->filename($resized->resizedname));
			
			$resized->width = $img->width;
			$resized->height = $img->height;
			$resized->save();
		}
		catch (Exception $e) {
			die('ERROR: '.$e->getMessage());
		}
		
		$response = $app->response();
		$response['Content-Type'] = $resized->type;
		$response->body($store->get($resized->resizedname));
		
		return;
	}
	else if (($size_y && $picture->hdiff) && !$size_x) {
		try {
			$img = Intervention\Image\Image::make($store->filename($picture->storename));
			
			$resized = new RMAN\Models\ORM\Picture([
				'type'		=> $picture->type,
				'name'		=> $picture->name,
				'storename'	=> $picture->storename,
				'resizedname'	=> $store->add($picture->storename),
				'default'	=> 0
			]);
			
			$img->resize(null, $size_y, true);
			$img->save($store->filename($resized->resizedname));
			
			$resized->width = $img->width;
			$resized->height = $img->height;
			$resized->save();
		}
		catch (Exception $e) {
			die('ERROR: '.$e->getMessage());
		}
		
		$response = $app->response();
		$response['Content-Type'] = $resized->type;
		$response->body($store->get($resized->resizedname));
		
		return;
	}
	else if (($size_y && $size_x) && (($size_y != $picture->hdiff) || ($size_x && $picture->wdiff))) {
		try {
			$img = Intervention\Image\Image::make($store->filename($picture->storename));
			
			$resized = new RMAN\Models\ORM\Picture([
				'type'		=> $picture->type,
				'name'		=> $picture->name,
				'storename'	=> $picture->storename,
				'resizedname'	=> $store->add($picture->storename),
				'default'	=> 0
			]);
			
			if ($picture->width > $picture->height) {
				$img->resize($size_x, null, true);
			}
			else {
				$img->resize(null, $size_y, true);
			}
			
			$img->crop($size_x, $size_y);
			$img->save($store->filename($resized->resizedname));
			
			$resized->width = $img->width;
			$resized->height = $img->height;
			$resized->save();
		}
		catch (Exception $e) {
			die('ERROR: '.$e->getMessage());
		}
		
		$response = $app->response();
		$response['Content-Type'] = $resized->type;
		$response->body($store->get($resized->resizedname));
		
		return;
	}
	
	$response = $app->response();
	$response['Content-Type'] = $picture->type;
	$response->body($store->get($picture->resizedname));
});

////////////////////////////////////////////////////////////////////////////////
// Events                                                                     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

$app->get('/events/', function() use ($app) {
	$events = RMAN\Models\ORM\Event::all();
	$app->render('events/index', ['events' => $events]);
});

$app->get('/events/:eid/stages', function($eid) use ($app) {
	$event = RMAN\Models\ORM\Event::with(
				'stages',
				'stages.lineups',
				'stages.lineups.artists',
				'stages.lineups.artists.picture'
			)
		->find($eid);
	
	$app->render('events/stages', ['event' => $event]);
});

$app->get('/events/:eid/stages/:sid/lineup', function($eid, $sid) use ($app) {
	$stage = RMAN\Models\ORM\Stage::with(
				'event',
				'lineups', 
				'lineups.slots',
				'lineups.slots.artist'
			)
			->find($sid);
	
	$app->render('events/lineup', ['stage' => $stage]);
});

$app->get('/events/:eid/stages/:sid/lineup/edit', function($eid, $sid) use ($app) {
	$stage = RMAN\Models\ORM\Stage::with(
				'event',
				'lineups', 
				'lineups.slots',
				'lineups.slots.artist',
				'lineups.slots.lineup'
			)
			->find($sid);
	$artists = json_encode(RMAN\Models\ORM\Artist::tags());
	$app->render('events/lineup/edit', ['stage' => $stage, 'artists' => $artists]);
});

$app->post('/events/:eid/stages/:sid/lineup/edit', function($eid, $sid) use ($app) {
	
	$event = RMAN\Models\ORM\Event::find($sid);
	$stage = RMAN\Models\ORM\Stage::with('event')->find($sid);
	$end = Carbon\Carbon::parse($stage->event->start_date_time);
	
	foreach($_POST['lineup'] as $lid => $data) {
		if (substr($lid, 0, 3) == 'new') {
			$lineup = new RMAN\Models\ORM\Lineup;
			$lineup->stage_id = $stage->id;
		}
		else {
			$lineup = RMAN\Models\ORM\Lineup::find($lid);
		}
		
		if (!isset($data['slots'])) {
			print "<pre>"; print_r($data);
			die('FFS');
			continue;
		}
		
		$lineup->start_date_time = (string)$end;
		$end = $end->addMinutes($data['duration'] * 60);
		$lineup->end_date_time = (string)$end;
		
		$lineup->save();
		
		$lineup->artists()->detach();
		
		$lineup->artists()->sync(array_map(function($elem) {
			return $elem['artist'];
		}, $data['slots']));
		
	}
	
	$app->redirect("/events/{$eid}/stages/{$sid}/lineup/edit");
});

error_reporting(E_ALL);
$app->run();
