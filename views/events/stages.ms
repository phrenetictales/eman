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
<div id="stages">
  {{#event}}
  <h2>{{title}}</h2>
    {{#stages}}
      <h3>
        <a href="/events/{{#event}}{{id}}{{/event}}/stages/{{id}}/lineup">
          {{title}}
        </a>
      </h3>
      <div class="box_skitter slideshow" style="height: 450px; width: 650px">
      <ul class="rslides" style="background-color: red">
      {{#lineups}}
        {{#slots}}
        {{#artist}}
          <li>
            <a href="/artists/{{id}}">
              <img src="{{#picture}}{{#scale}}650_450{{/scale}}{{/picture}}" class="cut">
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
</script>
