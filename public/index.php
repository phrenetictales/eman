<?php


require_once __DIR__.'/../init.php';


$app = new \Slim\Slim(['view' => new Phrenetic\SlimMustacheView($mustache)]);
$app->container = $container;


////////////////////////////////////////////////////////////////////////////////
// Hello World!                                                               //
// TODO: replace with front page: slideshow, news, etc..                      //
////////////////////////////////////////////////////////////////////////////////
$app->get('/', function() use ($app) {
	$artists = RMAN\Models\ORM\Artist::with('picture')->get();
		
	$news = [
		[
			'title'		=> "No Lorem Ipsum",
			'date'		=> '2013-14-10',
			'content'	=> 
				"Lorem Ipsum doesn't work on Mikes PC"
		]
	];
	
	$app->render('index', [
		'artists'	=> $artists,
		'news'		=> $news
	]);
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

$app->post('/artists/save/(:id)', function($id = 0) use ($app) {
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

$app->post('/releases/save(/:id)', function() use ($app) {
	
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
				'stages.lineups.slots.artist',
				'stages.lineups.slots.artist.picture'
			)
		->find($eid);
	
	$breadcrumbs = array_map(function($stage) use ($event) {
		
		return [
			'title' => $stage['title'].' Stage', 
			'url' => "/events/{$event->id}/stages/{$stage['id']}/lineup"
		];
	}, $event->stages->toArray());
	
	$app->render('events/stages', [
		'event'		=> $event,
		'breadcrumbs'	=> $breadcrumbs
	]);
});

$app->get('/events/:eid/stages/:sid/lineup', function($eid, $sid) use ($app) {
	
	$event = RMAN\Models\ORM\Event::with('stages')->find($eid);
	$breadcrumbs = array_map(function($stage) use ($event) {
		
		return [
			'title' => $stage['title'].' Stage', 
			'url' => "/events/{$event->id}/stages/{$stage['id']}/lineup"
		];
	}, $event->stages->toArray());
	
	
	$stage = RMAN\Models\ORM\Stage::with(
				'event',
				'lineups', 
				'lineups.slots',
				'lineups.slots.artist'
			)
			->find($sid);
	
	$app->render('events/lineup', ['stage' => $stage, 'breadcrumbs' => $breadcrumbs]);
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
	
	$event = RMAN\Models\ORM\Event::find($eid);
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

$app->get('/login', function() use ($app) {
	$app->render('login');
});

$app->post('/login', function() use($app, $container) {
	
	$auth = $container->resolve('Eman\\ServiceProvider\\Authentication');
	try {
		$auth->login(
			$app->request()->post('login'),
			$app->request()->post('password')
		);
	}
	catch(Eman\Exception\Authentication $ae) {
		$app->flash('error.title', $ae->getTitle());
		$app->flash('error.message', $ae->getmessage());
		$app->redirect('/login');
	}
	
	$app->redirect('/');
});

$app->get('/logout', function() use ($app) {
	$auth = $app->container->resolve('Eman\\ServiceProvider\\Authentication');
	$auth->logout();
	$app->redirect('/');
});

error_reporting(E_ALL);
$app->run();
