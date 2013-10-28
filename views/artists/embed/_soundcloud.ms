<div>
	<iframe width="100%" height="450" scrolling="no" frameborder="no" 
		src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/users/{{soundcloud_id}}&amp;color=0700ff&amp;auto_play=false&amp;show_artwork=true">
	</iframe>
	<script>
	
	;(function() {
		var script = document.getElementsByTagName("script");
		script = script[script.length - 1];
		
		var widget = SC.Widget($(script).siblings('iframe')[0]);
		
		/*
		 * SC.Widget.Events.LOAD_PROGRESS — fired periodically while the sound is loading.
		 * SC.Widget.Events.PLAY_PROGRESS — fired periodically while the sound is playing.
		 * SC.Widget.Events.PLAY — fired when the sound begins to play.
		 * SC.Widget.Events.PAUSE — fired when the sound pauses.
		 * SC.Widget.Events.FINISH — fired when the sound finishes.
		 * SC.Widget.Events.SEEK — fired when the user seeks.
		 */
		widget.bind(SC.Widget.Events.PLAY, function(ev) {
			/*
			{
				"playback_count" : 411,
				"release_year" : null,
				"sharing" : "public",
				"key_signature" : "",
				"tag_list" : "DarkPsy",
				"downloadable" : true,
				"waveform_url" : "https://w1.sndcdn.com/6vhk3v51sNfI_m.png",
				"state" : "finished",
				"comment_count" : 1,
				"streamable" : true,
				"original_format" : "mp3",
				"user" : {
					"permalink_url" : "http://soundcloud.com/madjester",
					"kind" : "user",
					"avatar_url" : "https://i1.sndcdn.com/avatars-000029459503-3yz65g-large.jpg?3eddc42",
					"id" : 557468,
					"uri" : "https://api.soundcloud.com/users/557468",
					"username" : "Madjester",
					"permalink" : "madjester"
				},
				"favoritings_count" : 19,
				"id" : 114881475,
				"original_content_size" : 264035361,
				"permalink_url" : "https://soundcloud.com/madjester/hidef-hitech",
				"label_name" : "",
				"isrc" : "",
				"duration" : 6601526,
				"artwork_url" : "https://i1.sndcdn.com/artworks-000059888388-l3m252-large.jpg?3eddc42",
				"description" : "Playlist\r\n----------\r\nMergel de Gamaliel - Alice\r\nDark Whisper - Indigo Generation\r\nKasatka & Antagon - Catatonic Despair\r\nHighcosmos - Virgin Galactic\r\nFurious & Meon - Portals\r\nMetaform - Lets Rock\r\nInsector - Mercury\r\nDemoniac Insomniac - Was that a Dream?\r\nMergel - Love in Silence (Original Mix)\r\nNeonglo - ThunDABirds\r\nOxidaksi, Furious & Insector - Sky net\r\nArcek - Dinamita\r\nDroga (Metaform & Dzimental Plamorh) - Slash\r\nJESUS RAVES - Waltruummusig Fur Sennebuebe\r\nLoose Connection - Obscure Angels\r\nAural Environmentalist - Pulse\r\nXandoz - Xanthotoxin",
				"uri" : "https://api.soundcloud.com/tracks/114881475?secret_token=",
				"video_url" : null,
				"genre" : "Hitech Psytrance",
				"purchase_title" : null,
				"_resource_id" : 114881475,
				"attachments_uri" : "https://api.soundcloud.com/tracks/114881475/attachments",
				"title" : "Madjester - Hidef Hitech",
				"user_id" : 557468,
				"purchase_url" : null,
				"embeddable_by" : "all",
				"download_count" : 43,
				"permalink" : "hidef-hitech",
				"release_month" : null,
				"_resource_type" : "sound",
				"created_at" : "2013/10/11 16:07:50 +0000",
				"kind" : "track",
				"bpm" : null,
				"release_day" : null,
				"commentable" : true,
				"reposts_count" : 1,
				"likes_count" : 19,
				"download_url" : "https://api.soundcloud.com/tracks/114881475/download?secret_token=",
				"stream_url" : "https://api.soundcloud.com/tracks/114881475/stream?secret_token=",
				"release" : "",
				"license" : "all-rights-reserved",
				"track_type" : "",
				"label_id" : null
			}
			*/
			widget.getCurrentSound(function(sound) {
			});
		});
	})();
	</script>
</div>
