<style>
#sorter { float: right; width: 90%;}
#sortable { list-style-type: none; margin: 0; padding: 0px; width: 90%;}
#sortable li { margin: 0; padding: 0; font-size: 1.4em;}
#sortable li span { position: absolute; }
#hours, #sortable { position: absolute; }
#hours { width: 100%; margin: 1px;}
#hours tr { height: 19px; }
#hours td { border: solid 1px black;}
#hours td.time { width:10%;background-color: green;font-size:small;}
#hours td.daychange {border-top: solid 1px red; background-color: red}
.ui-state-default { border-top: none !important;}
</style>
{{#stage}}
<form method="POST" action="/events/{{event.id}}/stages/{{id}}/lineup/edit">
<div style="width: 50%;margin:auto;position:relative">
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
          {{#artist}}{{name}} - <span class="durationText"></span>{{/artist}}
        {{/slots}}
        </span>
      </li>
    {{/lineups}}
    </ul>
  </div>
</div>

<input type="Submit">
<button id="add-artist">Add Artist</button>

</form>

{{/stage}}


<script>
var stage = {{{stage}}}; /*$.parseJSON('{{{stage}}}'.replace(/(\n|\r)/g, ''));*/
var artists = $.parseJSON('{{{artists}}}');
</script>

<link rel="stylesheet" type="text/css" href="/css/jquery.tagit.css"></link>
<script src="/js/tag-it.js"></script>
<script src="/js/events/lineup.js"></script>
