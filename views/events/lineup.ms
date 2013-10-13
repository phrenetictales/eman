<div style="width: 50%;margin:auto">
  {{#stage}}
  <h2>{{title}}</h2>
    {{#lineups}}
      <h3>{{start_date_time}} -> {{end_date_time}}</h3>
      <ul>
        {{#slots}}
          {{#artist}}
            {{name}}
            {{#picture}}<img src="{{url}}"/>{{/picture}}
          {{/artist}}
        {{/slots}}
      </ul>
    {{/lineups}}
  {{/stage}}
<div>
