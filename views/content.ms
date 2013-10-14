<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Slide Down Box Menu with jQuery and CSS3</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Slide Down Box Menu with jQuery and CSS3" />
        <meta name="keywords" content="jquery, css3, sliding, box, menu, cube, navigation, portfolio, thumbnails"/>
		<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="css/site.css" type="text/css" media="screen"/>
        <style>
			body{
				background:#333 url(bg.jpg) repeat top left;
				font-family:Arial;
			}
			span.reference{
				position:fixed;
				left:10px;
				bottom:10px;
				font-size:12px;
			}
			span.reference a{
				color:#aaa;
				text-transform:uppercase;
				text-decoration:none;
				text-shadow:1px 1px 1px #000;
				margin-right:30px;
			}
			span.reference a:hover{
				color:#ddd;
			}
			ul.menu{
				margin-top:150px;
			}
			h1.title{
				text-indent:-9000px;
				background:transparent url(title.png) no-repeat top left;
				width:633px;
				height:69px;
			}
		</style>
    </head>

    <body>
		
			<ul id="sdt_menu" class="sdt_menu">
				<li>
					<a href="#">
						<img src="img/2.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Home</span>
							<span class="sdt_descr">Main page</span>
						</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="img/1.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Line up</span>
							<span class="sdt_descr">Perfoming artists</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="#">Psytrance Stage</a>
							<a href="#">Techno Stage</a>
							<a href="#">Third Stage</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/3.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Shuttle</span>
							<span class="sdt_descr">Get a seat on the bus</span>
						</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="img/4.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Gallery</span>
							<span class="sdt_descr">Photos from past events</span>
						</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="img/5.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">News</span>
							<span class="sdt_descr">Latest developements</span>
						</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="img/6.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Events</span>
							<span class="sdt_descr">I like to code</span>
						</span>
					</a>
					<div class="sdt_box">
						<a href="#">Mushroom on Elm Street</a>
						<a href="#">New Years</a>
						<a href="#">Alluvium 2014</a>
					</div>
				</li>
			</ul>
		</div>
        
        <!-- The JavaScript -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
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
					$elem.find('img')
						 .stop(true)
						 .animate({
							'width':'170px',
							'height':'170px',
							'left':'0px'
						 },400,'easeOutBack')
						 .andSelf()
						 .find('.sdt_wrap')
					     .stop(true)
						 .animate({'top':'140px'},500,'easeOutBack')
						 .andSelf()
						 .find('.sdt_active')
					     .stop(true)
						 .animate({'height':'170px'},300,function(){
						var $sub_menu = $elem.find('.sdt_box');
						if($sub_menu.length){
							var left = '170px';
							if($elem.parent().children().length == $elem.index()+1)
								left = '-170px';
							$sub_menu.show().animate({'left':left},200);
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
						 .animate({'top':'25px'},500);
				});
            });
        </script>

    {{> _header}}
    <div id="main">{{{main}}}</div>
    {{> _footer}}
  </body>
</html>
