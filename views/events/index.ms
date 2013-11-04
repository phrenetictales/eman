<div class="lineup2">
  {{#events}}
  <h1>Upcomming Events</h1>
  <h2><a href="/events/{{id}}/stages">{{title}}</a></h2>
  {{/events}}
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
