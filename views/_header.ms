
<div id="topbar">      
 
<ul id="sdt_menu" class="sdt_menu">
				<li>
					<a href="/">
						<img src="/img/1.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Home</span>
							<span class="sdt_descr">Main page</span>
						</span>
					</a>
				</li>
				<li>
					<a href="/events/1/stages">
						<img src="/img/2.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">The Line up</span>
							<span class="sdt_descr">Perfoming artists</span>
						</span>
					</a>
					
				</li>
				<li>
					<a href="#">
						<img src="/img/3.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Shuttle</span>
							<span class="sdt_descr">Get a ride!</span>
						</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="/img/4.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Gallery</span>
							<span class="sdt_descr">Pictures & Videos</span>
						</span>
					</a>
				</li>
				
				<li>
					<a href="/events">
						<img src="/img/6.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Events</span>
							<span class="sdt_descr">Related Parties</span>
						</span>
					</a>
					
				</li>
				
				<li>
					<a href="#">
						<img src="/img/5.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">News</span>
							<span class="sdt_descr">What's new?</span>
						</span>
					</a>
				</li>
								
				<li>
					<a href="#">
						<img src="/img/6.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Applications</span>
							<span class="sdt_descr">Get Involved!</span>
						</span>
					</a>
				
				</li>
			</ul>
	
	<div id="userbox">username</div>
		</div>
	

     					
        <!-- The JavaScript -->
	<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript">
            $(function() {
				/**
				* for each menu element, on mouseenter, 
				* we enlarge the image, and show both sdt_active span and 
				* sdt_wrap span. If the element has a sub menu (sdt_box),
				* then we slide it - if the element is the last one in the menu
				* we slide it to the left, otherwise to the right
				*/
                $('#sdt_menu > li').bind('mouseenter',function(){
					var $elem = $(this);
					$elem.find('.sdt_wrap')
					     .stop(true)
						 .andSelf()
						 .find('.sdt_active')
					     .stop(true)
						 .animate({'height':'30px'},300,function(){
						var $sub_menu = $elem.find('.sdt_box');
						if($sub_menu.length){
							var left = '130px';
							if($elem.parent().children().length == $elem.index()+1)
								left = '-180px';
							$sub_menu.show().animate({'left':left},50);
						}	
						
				
					});
				}).bind('mouseleave',function(){
					var $elem = $(this);
					var $sub_menu = $elem.find('.sdt_box');
					if($sub_menu.length)
						$sub_menu.hide().css('left','0px');
					
					$elem.find('.sdt_active')
						 .stop(true)
						 .animate({'height':'0px'},300)
						 .andSelf().find('img')
						 .stop(true)
						 .animate({
							'width':'0px',
							'height':'0px',
							'left':'85px'},400)
						 .andSelf()
						 .find('.sdt_wrap')
						 .stop(true)
						 
				});
            });
        </script>

<div id="submenu">

<style type="text/css">

ul.semiopaquemenu{ 
font: bold 10px Georgia ;
font-color: #fff;
width: 100%;
background: url(/img/transbg.png);
padding: 7px 0 5px 8px; 
margin: 0;
text-align: left; 
}

ul.semiopaquemenu li{
display: inline;
margin-left: 0px;
}

ul.semiopaquemenu li a{
color: #fff;
padding: 6px 8px 6px 8px; 
margin-right: 15px; 
text-decoration: none;
}

ul.semiopaquemenu li a:hover, ul.semiopaquemenu li a.selected{
color: black;
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIwLjgyIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiIHN0b3Atb3BhY2l0eT0iMC4xNiIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+); 
background: -moz-linear-gradient(top,  rgba(255,255,255,0.82) 0%, rgba(255,255,255,0.16) 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,255,255,0.82)), color-stop(100%,rgba(255,255,255,0.16)));
background: -webkit-linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
background: -o-linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
background: -ms-linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
background: linear-gradient(top,  rgba(255,255,255,0.82) 0%,rgba(255,255,255,0.16) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d1ffffff', endColorstr='#29ffffff',GradientType=0 );
-moz-box-shadow: 0 0 5px #595959; /* CSS3 box shadows */
-webkit-box-shadow: 0 0 5px #595959;
box-shadow: 0 0 5px #595959;
padding-top: 12px;
padding-bottom: 12px; 
}

</style>

<ul class="semiopaquemenu">
	{{#breadcrumbs}}
    <li><a href="{{url}}">{{title}}</a></li>
	{{/breadcrumbs}}
</ul>

</div>
