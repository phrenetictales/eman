<div class="lineup">
  <h1>Artists</h1>
  {{#artists}}
  <h2>{{name}}</h2>
  {{#picture}}<img src="{{#scale}}250{{/scale}}"/>{{/picture}}
  <p>
    {{bio}}
  </p>
  {{/artists}}
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
