
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
	
<div id="menu_wrapper">

	<div id="adminbox">
	
		<ul class="menu">
 
			<li><a href="#">Artists</a>
 
				<ul>
					<li><a href="#">Add</a></li>
					<li><a href="#">Edit</a></li>
            
				</ul>
 
			</li>
    
			<li><a href="#">Stages</a>
 
				<ul>
					<li><a href="#">Add</a></li>
					<li><a href="#">Edit stage1</a></li>
					<li><a href="#">Edit stage2</a></li>
					<li><a href="#">Edit stage3</a></li>
				</ul>
 
			</li>
	
			<li><a href="#">Events</a>
				<ul>
					<li><a href="#">Add</a></li>
					<li><a href="#">Edit</a></li>
         
				</ul>
 			</li>
	
			<li><a href="#">Logout</a></li>
			<li class="username">username</li>
	
		</ul>

		</div>
	</div>
</div>	

     					
        <!-- Script for main menu -->
	<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript">
            $(function() {
			
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

	<ul class="semiopaquemenu">
		{{#breadcrumbs}}
		<li><a href="{{url}}">{{title}}</a></li>
		{{/breadcrumbs}}
	</ul>

</div>
