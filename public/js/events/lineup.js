var lineups = [];
var interval = (1000 * 60 * 60);

function make_resizable(idx, node) {
	var _lineup = {
		start: new Date($(node).data('start')),
		end: new Date($(node).data('end')),
	};
	_lineup.duration = (_lineup.end.getTime() - _lineup.start.getTime()) / interval;
	lineups.push(_lineup);
	
	$(node)
		.css('height', (19 *  _lineup.duration) + 'px')
		.resizable({ 
			handles: 's', 
			grid:[0, 19],
			stop: function(ev, ui) {
				var newheight = $(ev.target).css('height').replace('px', '');
				$('.duration', ev.target).val((newheight / 19));
			}
		});
	$('.duration', node).val(_lineup.duration);
};

$('#sortable li').each(make_resizable);


stage.event.start_date_time = new Date(stage.event.start_date_time);
stage.event.end_date_time = new Date(stage.event.end_date_time);
var event = stage.event;
event.duration = (event.end_date_time.getTime() - event.start_date_time.getTime()) / interval;

for (var i = 0; i < event.duration ; i++) {
	$('#hours tbody').append('<tr><td style="width:10%;background-color: red"/></td><td></td></tr>');
}

$('#sortable')
	.css('height', (18 * (24 * 2.5)) + 'px')
	.sortable();

$('BODY').append(
	'<div id="add-artist-dialog">' + 
		'<input name="artists" type="text">' + 
		'<button id="add-artist-submit">Add to lineup</button>' +
	'</div>'
);

$('#add-artist-dialog').dialog({
	autoOpen: false,
	width: 500
});

$('#add-artist').click(function() {
	$('#add-artist-dialog').dialog('open');
	return false;
});

$('#add-artist-submit').on('click', function() {
	
	var title = $('#track-title').val();
	var _lid = 'new-' + (parseFloat(Math.random()*100000000)).toFixed(0);
	var _sid = 'new-' + (parseFloat(Math.random()*100000000)).toFixed(0);
	var $input = $('<input type="hidden" class="duration" name="lineup[' + _lid + '][duration]" value="1"/>');
	var artistnames = [];
	
	$.each($('#add-artist-dialog input[name="artists"]').tagit('assignedTags'), function(i, artist_id) {
		
		// Add real or pseudo IDs to add more than one artist...
		// Yada yada...
		$input.append(
			'<input type="hidden" name="lineup[' + _lid + '][slots][' + _sid + '][artist]" value="' + artist_id + '">'
		);
		
		for (i in artists) {
			if (artists[i].id == artist_id) {
				artistnames.push(artists[i].label);
				break;
			}
		}
	});
	
	$('#add-artist-dialog input').val('');
	$('#add-artist-dialog artists').tagit("removeAll");
	$('#add-artist-dialog').dialog('close');
	
	var _li = $('<li class="ui-state-default"/>')
		.html($input)
		.append(artistnames.join(' vs '));
	
	_li.data('start', new Date(lineups[(lineups.length-1)].end));
	_li.data('end', _li.data('start').getTime() + (interval * 1));
	
	$('#sortable').append(_li);
	
	make_resizable(0, _li);
	$('#sortable').sortable('refresh');
});

$('#add-artist-dialog input[name="artists"]').tagit({
	availableTags: artists,
	allowDuplicates: false,
	fieldName: 'artists'
});