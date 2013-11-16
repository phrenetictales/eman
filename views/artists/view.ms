<div class="lineup">
{{#artist}}
<h1>{{name}}'s profile</h1>
{{#picture}}<img src="{{#scale}}350_250{{/scale}}" align="left"/>{{/picture}}
<p>{{bio}}</p>
{{#soundclouds}}
  {{> artists/embed/_soundcloud}}
{{/soundclouds}}
{{/artist}}
<script>
  $(document).ready(function() {
  $("h1").animate({
  top: 120, 
  opacity: 1 
  }, 700 );
  });
</script>
</div>
<div style="clear:both"></div> 
