<div id="main_box">

		{{#artist.name}}
			<h1>{{.}}</h1>
		{{/artist.name}}
		{{^artist.name}}
			<h1>New Artist</h1>
		{{/artist.name}}
		<form method="POST" action="/artists/save/{{#artist}}{{id}}{{/artist}}">
		{{> artists/_form}}
		{{> artists/_form_long}}
		<button>Save</button>
		</form>

</div>

<script>
  
  $(document).ready(function() {
  $("h1").animate({
  top: 120, 
  opacity: 1 
  }, 700 );
  });
</script>
