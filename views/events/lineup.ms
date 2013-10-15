<div id="main_box">
  {{#stage}}
  <h1>{{title}}</h1>
    {{#lineups}}
      <h2>{{duration}} - {{start_date_time}}</h2>
      <ul>
        {{#slots}}
          {{#artist}}
            <h3>{{name}}</h3>
            {{#picture}}<img src="{{#scale}}200_100{{/scale}}"/>{{/picture}}
          {{/artist}}
        {{/slots}}
      </ul>
    {{/lineups}}
  {{/stage}}
</div>
