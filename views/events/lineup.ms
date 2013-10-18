<div class="lineup">
  {{#stage}}
    <h1>{{title}}</h1>
    {{#lineups}}
      <div id="lineup_box">
        <ul>
          <li>
            {{#slots}}
              {{#artist}}
                <a href="/artists/{{id}}">{{#picture}}<img src="{{#scale}}250_150{{/scale}}"/>{{/picture}}</a>
                <h3>{{name}}</h3>
              {{/artist}}
            {{/slots}}
          </li>
        </ul>
       
      </div>
    
<script>
  $(document).ready(function() {
  $("h1").animate({
  top: 140, 
  opacity: 1 
  }, 700 );
  });
</script>
	
	{{/lineups}}
  {{/stage}}
  
  </div>
 <div style="clear:both"></div> 
 