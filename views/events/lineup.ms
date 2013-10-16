<div class="lineup">
  {{#stage}}
    <h1>{{title}}</h1><br>
    {{#lineups}}
      <div id="lineup_box">
        <ul>
          <li>
            {{#slots}}
              {{#artist}}
                {{#picture}}<img src="{{#scale}}250_150{{/scale}}"/>{{/picture}}
                <a href="/artists/{{id}}"><h3>{{name}}</h3></a>
              {{/artist}}
            {{/slots}}
          </li>
        </ul>
        <div style="clear:both"></div> 
      </div>
    {{/lineups}}
  {{/stage}}
</div>
