{{#profile}}
  <label for="email">E-Mail</label><br/>
  {{email}}<br/>
  <label for="fname">First Name</label><br/>
  {{fname}}<br/>
  <label for="lname">Last Name</label><br/>
  {{lname}}<br/>
  <ul id="artists">
  {{#artists}}
    <li style="list-style:none">
      <a href="/artists/{{id}}">
        {{name}}<br/>
        <img width="400" height="300" src="{{#picture.scale}}400_300{{/picture.scale}}"/>
      </a>
      <br/>
      {{#soundclouds}}
        {{> artists/embed/_soundcloud }}
      {{/soundclouds}}
      {{^soundclouds}}
        <a href="{{soundcloud.getAuthorizeUrl}}"><img src="/img/connect/soundcloud/btn-connect-l.png"/></a>
      {{/soundclouds}}
      <a href="{{mixcloud.getAuthorizationUri}}">Connect to Mixcloud</a>
    </li>
  {{/artists}}
  </ul>
{{/profile}}
<br/>
<br/>
<br/>
<br/>
<br/>
