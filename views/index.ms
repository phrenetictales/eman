<div style="width: 50%;margin:auto">
  {{#news}}
    <h2>{{title}}</h2>
    {{{content}}}
  {{/news}}
  <div id="slideshow" class="box_skitter" style="height: 450px; width: 650px">
    <ul>
    {{#artists}}
        <li>
          <a href="/artists/{{id}}">
            <img src="{{#picture}}{{#scale}}650_450{{/scale}}{{/picture}}" class="cut">
          </a>
          <div class="label_text"><p>{{name}}</p></div>
        </li>
    {{/artists}}
    </ul>
  </div>
<div>
<link type="text/css" href="/css/skitter.styles.css" media="all" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/jquery.skitter.min.js"></script>
<script>
$("#slideshow").skitter({
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
