<div class="lineup">
  {{#stage}}
<<<<<<< HEAD
  <h1>{{title}}</h1><br>
    
	{{#lineups}}
	<div id="lineup_box">
	<ul>
	  <li>
	  
        {{#slots}}
          {{#artist}}
            {{#picture}}<img src="{{#scale}}250_150{{/scale}}"/>{{/picture}}
			<a href="#"><h3>{{name}}</h3></a>
          </div>
		  </li>
  </ul>
		  
		  {{/artist}}
        {{/slots}}
        {{/lineups}}
=======
    <h1>{{title}}</h1><br>
    {{#lineups}}
      <div id="lineup_box">
        <ul>
          <li>
            {{#slots}}
              {{#artist}}
                {{#picture}}<img src="{{#scale}}300_200{{/scale}}"/>{{/picture}}
                <a href="/artists/{{id}}"><h3>{{name}}</h3></a>
              {{/artist}}
            {{/slots}}
          </li>
        </ul>
        <div style="clear:both"></div> 
      </div>
    {{/lineups}}
>>>>>>> add9965d2f6545c31f7811e23e0b5ea4c6c69ac9
  {{/stage}}
</div>
