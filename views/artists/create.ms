{{#artist}}
  <h1>{{name}}</h1>
{{/artist}}
{{#artist?}}
  <h1>New Artist</h1>
{{/artist?}}
<form method="POST" action="/artists/save/{{#artist}}{{id}}{{/artist}}">
  {{> artists/_form}}
  {{> artists/_form_long}}
  <button>Save</button>
</form>
