<div style="width: 50%;margin:auto">
  {{#stage}}
  <h2>{{title}}</h2>
    {{#lineups}}
      <h3>{{start_date_time}} -> {{end_date_time}}</h3>
      <h4>
        {{#slots}}
          {{id}} - {{#artist}}{{name}}{{/artist}}
        {{/slots}}
      </h4>
    {{/lineups}}
  {{/stage}}
<div>
