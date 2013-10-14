<img src="/img/banner.jpg" style="display:block; margin: 0 auto 0 auto;">
<ul id="menu" class="topnav">
  <li>
    <a href="/">Home</a>
  </li>
  <li>
    <a href="/news">News</a>
  </li>
  <li>
    <a href="/events">Events</a>
  </li>
  <li>
    <a href="/events/1/stages">Lineup</a>
    <ul class="subnav">
      <li><a href="/events/1/stages/1/lineup">Psytrance</a></li>
      <li><a href="/events/1/stages/2/lineup">Techno</a></li>
    </ul>
  </li>
  <li>
    <a href="/tickets">Tickets</a>
  </li>
  <li>
    <a href="/gallery">Gallery</a>
  </li>
  <li>
    <a href="/shuttle">Shuttle</a>
  </li>
  <li>
    <a href="/volunteer">Application</a>
  </li>
</ul>
<script>
$(document).ready(function() {
  $('#menu').slideDown(2000);
});

$(document).ready(function(){
  
  $("ul.topnav > li").each(function(i, node) {
    var subnav = $('ul.subnav', node);
    if (subnav.length > 0) {
      $(node).hover(
        function() {
          subnav.show();
        },
        function() {
          subnav.hide();
        }
      );
    }
  });
});
</script>
