<link type="text/css" href="/css/skitter.styles.css" media="all" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
<!-- <script type="text/javascript" src="/js/jquery.animate-colors-min.js"></script> -->
<script type="text/javascript" src="/js/jquery.skitter.min.js"></script>
<script>
var _animations = [
  'cube', 
  'cubeRandom', 
  'block', 
  'cubeStop', 
  'cubeHide', 
  'cubeSize', 
  'horizontal', 
  'showBars', 
  'showBarsRandom', 
  'tube', 
  'fade', 
  'fadeFour', 
  'paralell', 
  'blind', 
  'blindHeight', 
  'blindWidth', 
  'directionTop', 
  'directionBottom',
  'directionRight', 
  'directionLeft', 
  'cubeStopRandom', 
  'cubeSpread', 
  'cubeJelly', 
  'glassCube', 
  'glassBlock', 
  'circles', 
  'circlesInside', 
  'circlesRotate', 
  'cubeShow', 
  'upBars', 
  'downBars', 
  'hideBars', 
  'swapBars', 
  'swapBarsBack', 
  'swapBlocks', 
  'cut', 
  'random', 
  'randomSmart'
];
</script>

<div id="submenu">

<style type="text/css">

ul.semiopaquemenu{ 
font: bold 10px Georgia ;
font-color: #fff;
width: 100%;
background: url(/img/transbg.png);
padding: 7px 0 5px 8px; 
margin: 0;
text-align: left; 
}

ul.semiopaquemenu li{
display: inline;
margin-left: 0px;
}

ul.semiopaquemenu li a{
color: #fff;
padding: 6px 8px 6px 8px; 
margin-right: 15px; 
text-decoration: none;
}

ul.semiopaquemenu li a:hover, ul.semiopaquemenu li a.selected{
color: black;
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIwLjgyIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiIHN0b3Atb3BhY2l0eT0iMC4xNiIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+); 
background: -moz-linear-gradient(top,  rgba(255,255,255,0.82) 0%, rgba(255,255,255,0.16) 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,255,255,0.82)), color-stop(100%,rgba(255,255,255,0.16)));
background: -webkit-linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
background: -o-linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
background: -ms-linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
background: linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d1ffffff', endColorstr='#29ffffff',GradientType=0 );
-moz-box-shadow: 0 0 5px #595959; /* CSS3 box shadows */
-webkit-box-shadow: 0 0 5px #595959;
box-shadow: 0 0 5px #595959;
padding-top: 12px;
padding-bottom: 12px; 
}

</style>

<ul class="semiopaquemenu">
	{{#event}}
	{{#stages}}

		<li><a href="/events/{{#event}}{{id}}{{/event}}/stages/{{id}}/lineup">{{title}} Stage</a></li>

	{{/stages}}
	{{/event}}
</ul>


</div>

<div class="lineup">
  {{#event}}
<h1>Alluvium 2014 Lineup</h1>
  <h2>{{title}}</h2>
    {{#stages}}
      <h3>
        <a href="/events/{{#event}}{{id}}{{/event}}/stages/{{id}}/lineup">
          {{title}}
        </a>
      </h3>
      <div class="box_skitter slideshow" style="height: 350px; width: 550px">
      <ul class="rslides" style="background-color: red">
      {{#lineups}}
        {{#slots}}
        {{#artist}}
          <li>
            <a href="/artists/{{id}}">
              <img src="{{#picture}}{{#scale}}550_350{{/scale}}{{/picture}}" class="cut">
            </a>
            <div class="label_text"><p>{{name}}</p></div>
          </li>
        {{/artist}}
        {{/slots}}
      {{/lineups}}
      </ul>
      </div>
    {{/stages}}
  {{/event}}
</div>
<div style="clear:both"></div> 
<script>
/*
$(function() {
  $(".rslides").responsiveSlides({random: true, maxwidth: 300});
});
*/
$(".slideshow").skitter({
  /*
  imageSwitched: function() {
    var _animation = _animations[(Math.floor(Math.random() * _animations.length))];
    console.log('SWITCH ANIMATION = ' + _animation);
    $("#slideshow").skitter('animation', _animation);
    //$('.label_text p').html(_animation);
  }
  */
  with_animations: ['cut', 'cubeShow', 'circlesInside', 'swapBlocks', 'swapBars', 'swapBarsBack'],
  show_randomly: true,
  hideTools: true
  
});

 $(document).ready(function() {
  $("h1").animate({
  top: 140, 
  opacity: 1 
  }, 700 );
  });
</script>
