<div style="width: 50%;margin:auto">
  {{#event}}
  <h2>{{title}}</h2>
    {{#stages}}
      <h3>
        <a href="/events/{{#event}}{{id}}{{/event}}/stages/{{id}}/lineup">
          {{title}}
        </a>
      </h3>
    {{/stages}}
  {{/event}}
<div>