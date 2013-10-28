<div id="topbar">
	<ul id="sdt_menu" class="sdt_menu">
		<li>
			<a href="/">
					<span class="main_active"></span>
					<span class="main_wrap">
						<span class="main_link">Home</span>
						<span class="main_descr">Main page</span>
				</span>
			</a>
		</li>
	
		<li>
			<a href="/events/1/stages">
				<img src="/img/2.jpg" alt=""/>
					<span class="main_active"></span>
					<span class="main_wrap">
						<span class="main_link">The Line up</span>
						<span class="main_descr">Perfoming artists</span>
				</span>	
			</a>	
		</li>
	
		<li>
			<a href="#">
				<img src="/img/3.jpg" alt=""/>
					<span class="main_active"></span>
					<span class="main_wrap">
						<span class="main_link">Shuttle</span>
						<span class="main_descr">Get a ride!</span>
				</span>
			</a>
		</li>
	
		<li>
			<a href="#">
				<img src="/img/4.jpg" alt=""/>
				<span class="main_active"></span>
				<span class="main_wrap">
					<span class="main_link">Gallery</span>
					<span class="main_descr">Pictures & Videos</span>
				</span>
			</a>
		</li>
						
		<li>
			<a href="/events">
				<img src="/img/6.jpg" alt=""/>
				<span class="main_active"></span>
				<span class="main_wrap">
					<span class="main_link">Events</span>
					<span class="main_descr">Related Parties</span>
				</span>
			</a>	
		</li>
				
		<li>
			<a href="#">
				<img src="/img/5.jpg" alt=""/>
				<span class="main_active"></span>
				<span class="main_wrap">
					<span class="main_link">News</span>
					<span class="main_descr">What's new?</span>
				</span>
			</a>
		</li>
								
		<li>
			<a href="#">
				<img src="/img/6.jpg" alt=""/>
				<span class="main_active"></span>
				<span class="main_wrap">
					<span class="main_link">Applications</span>
					<span class="main_descr">Get Involved!</span>
				</span>
			</a>
		</li>
	</ul>
	
	<div id="menu_wrapper">

		<div id="adminbox">
		
			<ul class="menu">
			{{#menus}}
				<li><a href="{{url}}">{{title}}</a>
				<ul>
					{{#children}}
					<li><a href="{{url}}">{{title}}</a><li>
					{{/children}}
				</ul>
				<li>
			{{/menus}}
			{{#user}}
				<li class="username">{{login}}</li>
			{{/user}}
			</ul>
		</div>
	</div>	
</div>
     					
        <!-- Script for main menu -->
	<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript">
            $(function() {
			
			$('#main_menu > li').bind('mouseenter',function(){
					var $elem = $(this);
					$elem.find('.main_wrap')
					     .stop(true)
						 .andSelf()
						 .find('.main_active')
					     .stop(true)
						 .animate({'height':'30px'},300,function(){
						var $sub_menu = $elem.find('.main_box');
						if($sub_menu.length){
							var left = '130px';
							if($elem.parent().children().length == $elem.index()+1)
								left = '-180px';
							$sub_menu.show().animate({'left':left},50);
						}	
						
				
					});
				}).bind('mouseleave',function(){
					var $elem = $(this);
					var $sub_menu = $elem.find('.main_box');
					if($sub_menu.length)
						$sub_menu.hide().css('left','0px');
					
					$elem.find('.main_active')
						 .stop(true)
						 .animate({'height':'0px'},300)
						 .andSelf().find('img')
						 .stop(true)
						 .animate({
							'width':'0px',
							'height':'0px',
							'left':'85px'},400)
						 .andSelf()
						 .find('.main_wrap')
						 .stop(true)
						 
				});
            });
        </script>

<div id="submenu">

	<ul class="semiopaquemenu">
		{{#breadcrumbs}}
		<li><a href="{{url}}">{{title}}</a></li>
		{{/breadcrumbs}}
	</ul>

</div>
