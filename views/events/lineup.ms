<div align="center" id="main_box">
  
  {{#stage}}
  <h1>{{title}}</h2><br>
    <div class="columns">
	{{#lineups}}
      {{duration}} - {{start_date_time}}
	<ul class="lineup">
	  <li class="lineup">
	  
        {{#slots}}
          {{#artist}}
            <h3>{{name}}</h3>
            {{#picture}}<img src="{{#scale}}200_100{{/scale}}"/>{{/picture}}
          </li>
  </ul>
		  
		  {{/artist}}
        {{/slots}}
        {{/lineups}}
  {{/stage}}
  
</div>
</div>
