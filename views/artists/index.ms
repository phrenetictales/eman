<div id="main_box">
  <h1>Artists</h1>
  {{#artists}}
  <h2>{{name}}</h2>
  {{#picture}}<img src="{{#scale}}250{{/scale}}"/>{{/picture}}
  <p>
    {{bio}}
  </p>
  {{/artists}}
<div>
