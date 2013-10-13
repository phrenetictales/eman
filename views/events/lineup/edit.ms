<style>
#sorter { float: right; width: 90%;}
#sortable { list-style-type: none; margin: 0; padding: 0px; width: 90%;}
#sortable li { margin: 0; padding: 0; font-size: 1.4em;}
#sortable li span { position: absolute; }
#hours, #sortable { position: absolute; }
#hours { width: 100%; margin: 1px;}
#hours tr { height: 19px; }
#hours td { border: solid 1px black;}
.ui-state-default { border-top: none !important;}
</style>
<form method="POST" action="/events/1/stages/1/lineup/edit">
<div style="width: 50%;margin:auto;position:relative">
  {{#stage}}
  <h2>{{title}}</h2>
    <table id="hours" border=0 cellpadding=0 cellspacing=0>
      <thead/>
      <tbody/>
    </table>
    <div id="sorter">
    <ul id="sortable">
    {{#lineups}}
      <li class="ui-state-default" data-start="{{start_date_time}}" data-end="{{end_date_time}}">
        <input type="hidden" class="duration" name="lineup[{{id}}][duration]" value="">
        {{#slots}}
          <input type="hidden" name="lineup[{{#lineup}}{{id}}{{/lineup}}][slots][{{id}}][artist]" value="{{#artist}}{{id}}{{/artist}}">
          {{#artist}}{{name}}{{/artist}}
        {{/slots}}
        </span>
      </li>
    {{/lineups}}
    </ul>
  </div>
  {{/stage}}
</div>

<input type="Submit">
<button id="add-artist">Add Artist</button>

<script>
var stage = {{{stage}}}; /*$.parseJSON('{{{stage}}}'.replace(/(\n|\r)/g, ''));*/
var artists = $.parseJSON('{{{artists}}}');
</script>

<link rel="stylesheet" type="text/css" href="/css/jquery.tagit.css"></link>
<script src="/js/tag-it.js"></script>
<script src="/js/events/lineup.js"></script>
