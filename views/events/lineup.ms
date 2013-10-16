<div id="main_box">
  
  {{#stage}}
  <h1>{{title}}</h2><br>
    <div style="width:80%; margin:0 auto;" class="columns">
	{{#lineups}}
	<div id="lineup_box">
	<ul class="lineup">
	  <li class="lineup">
	  
        {{#slots}}
          {{#artist}}
            {{#picture}}<img src="{{#scale}}300_200{{/scale}}"/>{{/picture}}
			<a href="#"><h3>{{name}}</h3></a>
          </div>
		  </li>
  </ul>
		  
		  {{/artist}}
        {{/slots}}
        {{/lineups}}
  {{/stage}}
  
</div>
</div>
