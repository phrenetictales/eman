<div class="add_artist_form">
{{#artist.name}}
  <h1>{{.}}</h1>
{{/artist.name}}
{{^artist.name}}
  <h1 class="add_artist_form">New Artist</h1>
{{/artist.name}}
<form method="POST" action="/artists/save/{{#artist}}{{id}}{{/artist}}">
  {{> artists/_form}}
  {{> artists/_form_long}}
  <button>Save</button>
</form>
</div>
</div>