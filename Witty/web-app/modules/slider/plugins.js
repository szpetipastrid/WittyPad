/* PLUGINS.js */



//		Created and selected by Kreatura Media

		var KFWPluginsVersion = '3.2.20110923';
		


/* BACKGROUNDS & IMAGES ************************************************************/



/* animate background-position */

	(function($) {
		if(!document.defaultView || !document.defaultView.getComputedStyle){ // IE6-IE8
			var oldCurCSS = jQuery.curCSS;
			jQuery.curCSS = function(elem, name, force){
				if(name === 'background-position'){
					name = 'backgroundPosition';
				}
				if(name !== 'backgroundPosition' || !elem.currentStyle || elem.currentStyle[ name ]){
					return oldCurCSS.apply(this, arguments);
				}
				var style = elem.style;
				if ( !force && style && style[ name ] ){
					return style[ name ];
				}
				return oldCurCSS(elem, 'backgroundPositionX', force) +' '+ oldCurCSS(elem, 'backgroundPositionY', force);
			};
		}
	
		var oldAnim = $.fn.animate;
		$.fn.animate = function(prop){
			if('background-position' in prop){
				prop.backgroundPosition = prop['background-position'];
				delete prop['background-position'];
			}
			if('backgroundPosition' in prop){
				prop.backgroundPosition = '('+ prop.backgroundPosition;
			}
			return oldAnim.apply(this, arguments);
		};
	
		function toArray(strg){
			strg = strg.replace(/left|top/g,'0px');
			strg = strg.replace(/right|bottom/g,'100%');
			strg = strg.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
			var res = strg.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
			return [parseFloat(res[1],10),res[2],parseFloat(res[3],10),res[4]];
		}
	
		$.fx.step. backgroundPosition = function(fx) {
			if (!fx.bgPosReady) {
				var start = $.curCSS(fx.elem,'backgroundPosition');
			
				if(!start){//FF2 no inline-style fallback
					start = '0px 0px';
				}
			
				start = toArray(start);
			
				fx.start = [start[0],start[2]];
			
				var end = toArray(fx.options.curAnim.backgroundPosition);
				fx.end = [end[0],end[2]];
			
				fx.unit = [end[1],end[3]];
				fx.bgPosReady = true;
			}
			//return;
			var nowPosX = [];
			nowPosX[0] = ((fx.end[0] - fx.start[0]) * fx.pos) + fx.start[0] + fx.unit[0];
			nowPosX[1] = ((fx.end[1] - fx.start[1]) * fx.pos) + fx.start[1] + fx.unit[1];           
			fx.elem.style.backgroundPosition = nowPosX[0]+' '+nowPosX[1];

		};
	})(jQuery);



/* imgJustify */

		(function($){

			$.fn.imgJustify = function( p ){

				o = $.extend({
					minMargin : 5,
					width : this.width(),
					autoFloat : false
				}, p);

				g = {
					allImg : this.find('img').length - 1,
					curImg : 0,
					firstImg : 0,
					lastImg : null,
					tempAllWidth : -o.minMargin,
					tempImgWidth : 0
				}

				var c = this;
				this.css({
					'overflow-x' : 'hidden'
				});

				var inner = document.createElement('div');
				$(inner).css({
					'width' : o.width + 20
				})
				this.contents().wrapAll( inner );

				loadImages();

				function loadImages(){
					var lastwidth, tempmargin;
					for(x=g.firstImg;( o.width > g.tempAllWidth && x < g.allImg+1 );x++){
						last = c.find('img:eq('+x+')');
						if(o.autoFloat == true){
							last.css({'float' : 'left'});
						}	
						lastwidth = last.width();
						g.tempImgWidth += lastwidth;
						g.tempAllWidth += lastwidth + o.minMargin;
						g.lastImg = x;
					}
					g.tempImgWidth -= lastwidth;
					if(g.lastImg < g.allImg){
						g.lastImg -= 1;
					}
					tempmargin = g.lastImg < g.allImg ? Math.ceil((o.width - g.tempImgWidth) / (g.lastImg - g.firstImg)) : o.minMargin;
					for(x=g.firstImg;x<g.lastImg;x++){
						c.find('img:eq('+x+')').css({
							'margin-right' : tempmargin
						});
					}	
					if(g.lastImg<g.allImg-1){
						g.tempAllWidth = -o.minMargin;
						g.tempImgWidth = 0;
						g.firstImg = g.lastImg+1;
						loadImages();
					}	
				}			
			}	
		})(jQuery);



/* imgPreload */

	( function($){

		$.fn.imgPreload = function( p ){

      		o = $.extend({
				fadeTime : 350,
				fadeIn : false,
				imgFadeTime : 200,
				imgFadeDelayTime : 1500,
				each : function(){},
				callback : function(){ $('#imgpreloadoverlay').fadeOut( o.fadeTime ); }
			}, p);
			
			if(!$('#imgpreloadoverlay').length){
				var ipo = document.createElement('div');
				$(ipo).attr('id','imgpreloadoverlay');
				$('body').append(ipo);
			}
			
			if( o.fadeIn == true){
				$('#imgpreloadoverlay').css({
					'display' : 'none'
				});
			}

			var loadedImages = 0;

			if( !o.images ){
				var images = [];
				$(this).find('*').each(function(){
					if( $(this).css('background-image').split('url(')[1] ){
						_t = $(this).css('background-image').split('url(')[1].split(')')[0];
						if( _t.indexOf('"') != -1){
							_t = _t.split('"')[1]
						}
						images.push( _t );
					}
					if( $(this).filter('img').attr('src') ){
						src = $(this).attr('src');
						if( src.indexOf( 'http' ) == -1 ){
							src = 'http://' + document.location.href.split('http://')[1].split('/')[0] + src;
						}
						if(o.fadeIn == true){
							$(this).css({
								'opacity' : 0
							}).load(function(){
								$(this).delay( Math.round(Math.random()*o.imgFadeDelayTime) ).animate({
									'opacity' : 1
								}, o.imgFadeTime);
							}).attr('src',src);
						}
						images.push( src );
					}
				});
			}else{
				var images = o.images;
			}

			var ob = this;

			if(images.length>0){
				for(x=0;x<images.length;x++){
					$('<img>').load(function(){
						o.each();
						loadedImages += 1;
						if(loadedImages == images.length){
							o.callback();
						}
					}).attr( 'src', images[x] );
				}
			}else{
				o.callback();					
			}	
		};
	})(jQuery);



/* slider */

	(function($){
	
		$.fn.slider = function(p){
	
			var o = $.extend({
				animTime : 300,
				waitTime : 5000,
				animType : 'easeInOutQuad',
				tilesNum : 6,
				curTile : 1
			}, p);

			return this.each(function(){
				
				if( !o.width ){
					o.width = $(this).width();
				}

				$(this).find('img').css({
					'margin-left' : '-'+((o.curTile-1)*o.width)+'px'
				});
				
				var si = setInterval( function(obj,id){

					if( !$('#'+id).length ){
						clearTimeout(si);
					}else{
						if( o.curTile < o.tilesNum){
							o.curTile++;
						}else{
							o.curTile=1;
						}
						obj.animate({
							'margin-left' : '-'+((o.curTile-1)*o.width)+'px'
						},o.animTime,o.animType);											
					}
				},o.animTime + o.waitTime,$(this).find('img'),$(this).attr('id'));
			});
		};
	})(jQuery);



/* tiles */

	var tiles = {

		o : {
			useDOM : false,
			images : [],
			imgNum : 2,
			imgDir : '/gallery/tiles/',
			imgName : 'tile_',
			imgExt : 'jpg',
			curImage : 0,
			firstImage : 'random',
			sortBy : 'normal',
			tiles : 10,
			tilesArr : [],
			a_type : ['easeOutQuad','easeOutElastic'],
			a_time : [200,800],
			a_timeOut : 200,
			a_tileDelay : 50,
			a_periodicTime : 7000
		},

		g : {
			ended : 0,
			curImg : null,
			running : false,
			posXArr : [],
			posYArr : [],
			timer : null,
			isAnim : false
		},

		init : function( p ){

			tiles.g.running = true;
			tiles.o = $.extend( tiles.o, p);
			
			if( tiles.o.firstImage == 'random'){
				tiles.o.firstImage = Math.ceil(Math.random()*tiles.o.imgNum);				
			}
			
			if( tiles.o.useDOM == true ){
				tiles.o.imgNum = $('#tiles_content .tile_c').length;
				$('#tiles_content .tile_c a').each(function(){
					tiles.o.images.push( tiles.o.imgDir + $(this).attr('rel').split(':')[1] + '.' + tiles.o.imgExt );
				});
			}else{
				if(tiles.o.images.length==0){
					for(x=1;x<tiles.o.imgNum+1;x++){
						tiles.o.images.push( tiles.o.imgDir + tiles.o.imgName + x + '.' + tiles.o.imgExt );
					}					
				}else{
					tiles.o.imgNum = tiles.o.images.length;
				}
			}

			var _oc = $( '#tiles_container' ).offset();
			for( x=0; x<tiles.o.tiles;x++){
				tiles.o.tilesArr[x] = x;
				$( '#tiles_container' ).append( '<div class="tile_container"><div id="tile_' + x + '"></div></div>' );
				var _ot = $( '#tile_' + x ).offset();
				$( '#tile_' + x ).css( 'background-position', (_oc.left-_ot.left) + 'px ' + (_oc.top-_ot.top) + 'px' );
			};				

			// nav
			$('#tiles_container').append('<div id="tiles_nav"></div>')
			for(x=0;x<tiles.o.imgNum;x++){
				$('#tiles_nav').append('<a class="tile_nav" href="#"></a>')
			}
			$('#tiles_nav a').click(function(event){
				event.preventDefault();
				if( !$(this).hasClass('active') ){
					clearTimeout(tiles.g.timer);
					tiles.change( $('#tiles_nav a').index(this) + 1 );
				}
			});
			
			_w = $('#tiles_container .tile_container:eq(0) div:eq(0)').width();
			_h = $('#tiles_container .tile_container:eq(0) div:eq(0)').height();

			tiles.g.posXArr = [_w,-_w];
			tiles.g.posYArr = [0];

			tiles.change( tiles.o.firstImage );
		},

		change : function( imageNum, stop ){

			if( tiles.g.isAnim == false ){

				tiles.g.isAnim = true;
				var imageNum = imageNum;
				var stop = stop;

				if( !stop ){						
					if( imageNum == tiles.o.curImage ){
						if( tiles.o.curImage < tiles.o.imgNum ){
							imageNum += 1;
						}else{
							imageNum = 1;
						}
					}else if( imageNum > tiles.o.imgNum ){
						imageNum = 1;
					}
					tiles.o.curImage = imageNum;
				}	

				tiles.g.curImg = $('<img src="'+tiles.o.images[imageNum-1]+'" alt="">');

				tiles.g.curImg.load(function(){

					if( tiles.o.sortBy == 'random' ){						
						tiles.o.tilesArr.sort( tiles.rnd );
					}

					var _animRnd = Math.floor(Math.random() * tiles.o.a_type.length );
					var _animType = tiles.o.a_type[ _animRnd ];
					var _animTime = tiles.o.a_time[ _animRnd ];
					var _posX = tiles.g.posXArr[ Math.floor(Math.random() * tiles.g.posXArr.length) ];
					var _posY = tiles.g.posYArr[ Math.floor(Math.random() * tiles.g.posYArr.length) ];
					var _delay = tiles.o.a_timeOut + ( tiles.o.tiles  - 1 ) * tiles.o.a_tileDelay  + _animTime;

					if( !stop ){
						tiles.g.timer = setTimeout( 'tiles.change( tiles.o.curImage )', _delay + tiles.o.a_periodicTime );
					}else{
						tiles.stop();
						$(  '#screen_' + ( imageNum - 100 ) ).delay( _delay / 2 ).fadeIn( 350 );
					}

					$('#tiles_outer .tile_c').stop().fadeOut(500, function(){
						$(this).remove();
					});

					for(x=0;x<tiles.o.tiles;x++){
						$( '#tile_' + tiles.o.tilesArr[x] ).delay( x *  tiles.o.a_tileDelay ).animate({
							'margin-left' : _posX,
							'margin-top' : _posY
						}, tiles.o.a_timeOut, 'easeInQuad', function(){
						$(this).css({
								'margin-left' : -_posX,
								'margin-top' : -_posY,
								'background-image' : 'url(' + tiles.o.images[imageNum-1] + ')'
							}).animate({
								'margin-left' : 0,
								'margin-top' : 0
							}, _animTime, _animType, function(){
								tiles.g.ended += 1;
								if( tiles.g.ended == tiles.o.tiles ){
									tiles.g.ended = 0;
									$('#tiles_nav a').removeClass('active');
									$('#tiles_nav a:eq('+(imageNum-1)+')').addClass('active');
									if( tiles.o.useDOM == false ){
										tiles.g.isAnim = false;
									}
								}
							});
						});
					}

					if( tiles.o.useDOM == true ){
						$('#tiles_content').children('div:eq('+(imageNum-1)+')').clone().css({
							'display' : 'none',
							'margin-top' : '-50px'
						}).appendTo('#tiles_outer').stop().delay(_delay).animate({
							'margin-top' : 0
						},500).fadeIn(500,function(){
							tiles.g.isAnim = false;
						});						
					}
				});

				if(jQuery.browser.opera || (jQuery.browser.msie && parseInt(jQuery.browser.version) == 6)){
					tiles.g.curImg.load();
				}
			}

		},

		start : function(){

			clearTimeout(tiles.g.timer);
			$(  '.screen' ).each( function(){
				if( $( this ).css( 'display' ) == 'block' ){
					$( this ).fadeOut( 350, function(){
						tiles.change( tiles.o.curImage );		
					});
				}
			});				
		},

		stop : function(){
			clearTimeout(tiles.g.timer);
			tiles.g.isAnim = false;
		},

		rnd : function(){

			return (Math.round(Math.random())-0.5);
		}
	};



/* DOM & SCROLL ************************************************************/



/* pageCut */

	(function($){
	
		$.fn.pageCut = function( p ){
			
			var o = $.extend({
				animTimeOut : 500,
				animTimeIn : 400,
				animTypeOut : 'easeInOutQuad',
				animTypeIn : 'easeOutQuad',
				callback_show : function(){},
				callback_hide : function(){},
				width : 800,
				clickToHide : '.pc_close',
				source : 'default.php',
				clickToHide : '.pc_close'
			}, p);
			
			 var g = {
				loaded : false,
				htmlOriginal : null,
				fb : {}
			}

			return this.click(function(event){
				event.preventDefault();
				h = $('body').height() < $(window).height() ? $(window).height() : $('body').height();

				g.fb.obj = [];
				g.fb.html = [];
				
				// Facebook gombok eltávolítása (akad miatta az animáció!)
				
				$('.fbiframe').each( function(){
					g.fb.obj.push( $(this).parent() );
					g.fb.html.push( $(this).parent().html() );
				}).remove();

				g.htmlOriginal = $('#dim').html();
				
				$('#dim').css({
					'visibility' : 'hidden'
				})
				
				$('<div><div id="pc_inner"></div></div>').attr({
					'id' : 'pc_container'
				}).css({
					'width' : '100%',
					'height' : h,
					'position' : 'absolute',
					'top' : 0,
					'left' : 0,
					'z-index' : 1000,
					'overflow' : 'hidden'
				}).appendTo('body');

				$('#pc_inner').css({
					'width' : '200%',
					'height' : '100%'
				});

				$('<div><div class="pc_orig"></div></div>').attr({
					'id' : 'pc_left',
					'class' : 'pc_side'
				}).css({
					'left' : 0
				}).appendTo('#pc_inner');

				$('<div></div>').attr({
					'id' : 'pc_content'
				}).css({
					'width' : 0,
					'height' : '100%',
					'background' : '#000',
					'float' : 'left',
					'overflow' : 'hidden'
				}).appendTo('#pc_inner');

				$('<div><div class="pc_orig"></div></div>').attr({
					'id' : 'pc_right',
					'class' : 'pc_side'
				}).css({
					'right' : 0
				}).appendTo('#pc_inner');

				$('.pc_side').css({
					'width' : '25%',
					'height' : '100%',
					'float' : 'left',
					'overflow' : 'hidden'
				});

				$('.pc_orig').css({
					'width' : '200%',
					'position' : 'absolute',
					'top' : 0
				}).html( g.htmlOriginal );
									
				
				$('<div></div>').attr({
					'class' : 'pc_close'
				}).css({
					'width' : '100%',
					'height' : '100%',
					'position' : 'absolute',
					'left' : '0px',
					'top' : '0px',
					'cursor' : 'pointer',
					'z-index' : 1000
				}).appendTo('.pc_side');
				
				$('#pc_left .pc_orig').css({
					'left' : 0
				});

				$('#pc_right .pc_orig').css({
					'right' : 0
				});
									
				$('#pc_left').animate({
					'margin-left' : -o.width / 2
				}, o.animTimeOut, o.animTypeOut, function(){
					if($.browser.msie){
						$('.pc_side .pc_close').css({
							'background' : 'white',
							'opacity' : .01
						})							
					}
				});

				$('#pc_content').animate({
					'width' : o.width
				}, o.animTimeOut, o.animTypeOut);
				
				if(g.loaded == false){
					$(window).bind( 'resize', function(){
						h = $('#pc_left .pc_orig').height() < $(window).height() ? $(window).height() : $('#pc_left .pc_orig').height();
						$('#pc_container').height(h);
					});
				}
				
				$( o.clickToHide ).click( function(){

					if($.browser.msie){
						$('.pc_side .pc_close').css({
							'background' : '',
							'opacity' : ''
						})							
					}

					$('#pc_left').animate({
						'margin-left' : 0
					}, o.animTimeIn, o.animTypeIn);

					$('#pc_content').animate({
						'width' : 0
					}, o.animTimeIn, o.animTypeIn, function(){
						$('#pc_container').remove();
						$('#dim').css({
							'visibility' : 'visible'
						});
						
						// Facebook gombok visszarakása

						for(x=0;x<g.fb.obj.length;x++){
							g.fb.obj[x].html( g.fb.html[x] );
						}
					});
				});
			});			
		};
	})(jQuery);



/* pageSlide */

	(function($){
		
		$.fn.pageSlide = function( p ){
		
			var o = $.extend({
				animTime : 500,
				animType : 'easeInOutQuad',
				callback_show : function(){},
				callback_hide : function(){},
				width : 300,
				source : 'default.php',
				clickToHide : '#ps_overlay, .ps_close',
				bgOverlay : '#000',
				bgSidebar : '#000'
			}, p);
			
			if( !$('#ps_sidebar').length ){
				$('<div></div>').attr({
					'id' : 'ps_sidebar'
				}).css({
					'top' : 0,
					'right' : 0,
					'width' : 0,
					'height' : '100%',
					'display' : 'none',
					'position' : 'fixed',
					'background' : o.bgSidebar,
					'z-index' : 1000
				}).appendTo('body');
				$('<div></div>').attr({
					'id' : 'ps_inner'
				}).css({
					'width' : o.width,
					'height' : '100%',
					'display' : 'none'
				}).appendTo('#ps_sidebar');
				if( $('body').css('position') == 'static' ){
					$('body').css('position' , 'relative' );
				}
			}
			
			return this.each(function(){

				var s = $(this).attr('href') ? $(this).attr('href') : o.source;				
				$(this).click(function(event){
					var ml = parseInt( $('body').css( 'margin-left' ));
					event.preventDefault();
					$('<div></div>').attr({
						'id' : 'ps_overlay'
					}).css({
						'top' : '0px',
						'left' : '0px',
						'width' : '100%',
						'height' : '100%',
						'position' : 'fixed',
						'z-index' : 900,
						'opacity' : 0,
						'background' : o.bgOverlay
					}).appendTo('body');	
					$.get( s, function(data){
						$('#ps_inner').html(data).delay( o.animTime / 3 * 1 ).fadeIn( o.animTime / 3 * 2, o.animType );
					});
					$('body').css({
						'width' : $('body').width()
					}).animate({
						'margin-left' : ( ml - o.width ) + 'px'
					}, o.animTime, o.animType, o.callback_show );	
					$('#ps_sidebar').css({
						'display' : 'block'
					}).animate({
						'width' : o.width
					}, o.animTime, o.animType, function(){
						$('#ps_overlay').animate({
							'opacity' : .3
						}, o.animTime / 2, o.animType);
						$( o.clickToHide ).click( function(){
							$('#ps_overlay').css({
								'background' : 'transparent',
								'opacity' : 1
							})
							$('#ps_inner').fadeOut( o.animTime / 3 * 2, o.animType );
							$(this).unbind('click');
							$('body').animate({
								'margin-left' : ml + 'px'
							}, o.animTime, o.animType, o.callback_hide );
							$('#ps_sidebar').animate({
								'width' : 0								
							}, o.animTime, o.animType, function(){
								$(this).css({
									'display' : 'none'			
								});
								$('#ps_overlay').remove();
								$('body').css({
									'width' : 'auto'
								});
							});
						});
					});
				});
			});	
		};
	})(jQuery);



/* scrollBar */

	var _sb = {
			
		o : {
			where : null,
			what : null,
			type : 'vertical',
			sbid : null,
			animTime: 200,
			scrollTime: 400,
			scrollType: 'easeOutBack',
			minSize: 75,
			scrpx : 60,
			opacity : .5
		},

		init : function( o ){
		
			if( $( o.where ).length ){

				if( !$(o.sbid).length ){
					$( o.where ).append( '<div class="sb '+ o.type +'" id="' + o.sbid.split('#')[1] + '"><div class="sb_ '+ o.type +'"></div></div>' );
				}

				$(o.sbid).data('o', $.extend( {}, _sb.o , o ));
				_sb.create( o.sbid );				
			}

		},
		
		create : function(sbid){
		
			o = $(sbid).data('o');

			o.mt = o.mt ? o.mt : parseInt( $( sbid ).css( 'margin-top' ));
			o.mr = o.mr ? o.mr :  parseInt( $( sbid ).css( 'margin-right' ));
			o.mb = o.mb ? o.mb :  parseInt( $( sbid ).css( 'margin-bottom' ));
			o.ml = o.ml ? o.ml :  parseInt( $( sbid ).css( 'margin-left' ));

			_w = $( o.where ).css( 'position' );
			if ( _w != 'absolute' && _w != 'relative' ){
				_w = $( o.where ).css( 'position', 'relative' );
			}
			
			if( o.type == 'vertical' ){
				$( o.what ).parent().add( sbid ).mousewheel( function(e, d){
					e.preventDefault();
					_sb.mouseScroll( d,  sbid );  
				});
			}	

			$( o.what ).parent().css( 'overflow', 'hidden' );
			
			if( o.type == 'vertical' ){
				$( sbid ).css({
					'right' : o.mr,
					'top' : o.mt
				}).css({
					'margin' : 0
				});
			}else{
				$( sbid ).css({
					'left' : o.ml,
					'bottom' : o.mb
				}).css({
					'margin' : 0
				});			
			}

			_sb.setDim( sbid );

			$(window).bind( 'resize', function(){
				_sb.setDim( sbid );
			});

			$( sbid + ' .sb_' ).mousedown( function( e ){
				e.preventDefault();
				_sb.startDrag( sbid, e.pageX, e.pageY );
				$( sbid ).unbind( 'mouseout' );
				return false;
			});			
		},

		scrollTo : function( sbid, obj ){

			if(sbid && obj){
				o = $( sbid ).data('o');
				o.wmt = -( $( o.what ).find('a[name="' + obj.attr('href').split('#')[1] + '"]').position().top );
				if( o.wmt < o.sh - o.wh ){
					o.wmt = o.sh - o.wh + o.mt + o.mb;
				}
				_sb.setMarginTop(sbid);
				$( o.what ).stop().animate({
					'margin-top' : o.wmt
				}, o.scrollTime, o.scrollType);
				$( sbid + ' .vertical').stop().animate({
					'margin-top' : o.ssmt
				}, o.scrollTime, o.scrollType);
			}
		},
		
		setMarginTop : function( sbid, h ){
			
			o = $( sbid ).data('o');

			if(!h){
				h = o.ssh;
			}
			
			return o.ssmt = -o.wmt / ( o.wh - o.wph ) * ( o.sh - h );
		},

		setMarginLeft : function( sbid, w ){
			
			o = $( sbid ).data('o');

			if(!w){
				w = o.ssw;
			}
			
			return o.ssml = -o.wml / ( o.ww - o.wpw ) * ( o.sw - w );
		},
		
		setDim : function( sbid ){

			o = $( sbid ).data('o');

			if( o ){

				if( o.type == 'vertical' ){				
					o.sh = $( o.where ).outerHeight() - o.mt - o.mb;
					o.wph = $(o.what).parent().outerHeight(); 
					o.wh = $(o.what).outerHeight();
					o.wmt = parseInt($(o.what).css('margin-top'));

					$( sbid ).height( o.sh );
					a = o.wph / o.wh;
					k = o.wph - o.wh;
					k2 = o.wh - o.wph;

					if( o.wmt < k && k < 0 ){
						$(o.what).css('margin-top', k );
						o.wmt = k;
					}

					if ( a < 1 ){
						h = a * o.sh;
						if(h < o.minSize){
							h = o.minSize;
						}
						o.ssh = h;
						$( sbid + ' .sb_' ).stop().animate({
							'margin-top' : _sb.setMarginTop(sbid, h),
							'height' : h
						}, o.animTime );
						$( sbid ).fadeIn( o.animTime );
					}else{
						o.ssmt = 0
						$( sbid + ' .sb_').css ( 'margin-top', o.ssmt );
						o.wmt = 0
						$( o.what ).css ( 'margin-top', o.wmt );
						o.ssh = o.sh;
						$( sbid + ' .sb_' ).height( o.ssh );
						$( sbid ).fadeOut( o.animTime );
					}
				}else{				
					o.sw = $( o.where ).outerWidth() - o.ml - o.mr;
					o.wpw = $(o.what).parent().outerWidth(); 
					o.ww = $(o.what).outerWidth();
					o.wml = parseInt($(o.what).css('margin-left'));

					$( sbid ).width( o.sw );
					a = o.wpw / o.ww;
					k = o.wpw - o.ww;
					k2 = o.ww - o.wpw;

					if( o.wml < k && k < 0 ){
						$(o.what).css('margin-left', k );
						o.wml = k;
					}

					if ( a < 1 ){
						w = a * o.sw;
						if(w < o.minSize){
							w = o.minSize;
						}
						o.ssw = w;
						$( sbid + ' .sb_' ).stop().animate({
							'margin-left' : _sb.setMarginLeft(sbid, w),
							'height' : w
						}, o.animTime );
						$( sbid ).fadeIn( o.animTime );
					}else{
						o.ssml = 0
						$( sbid + ' .sb_').css ( 'margin-left', o.ssml );
						o.wml = 0
						$( o.what ).css ( 'margin-left', o.wml );
						o.ssw = o.sw;
						$( sbid + ' .sb_' ).width( o.ssw );
						$( sbid ).fadeOut( o.animTime );
					}
				}				
			}
		},
		
		startDrag : function( sbid, mX, mY ){
			
			o = $( sbid ).data('o');
			
			o.myk = mY;			
			o.tk = o.ssmt;
			o.mxk = mX;			
			o.lk = o.ssml;
			_sb.onDrag( sbid );			
		},
		
		onDrag : function( sbid ){
			
			o = $( sbid ).data('o');
			
			$(document).mousemove( function(e){
				if( o.type == 'vertical' ){
					var cst = e.pageY - o.myk + o.tk;
					if( cst < 0 ){
						cst = 0;
					}else if( cst > o.sh - o.ssh ){
						cst = o.sh - o.ssh;
					}
					o.ssmt = cst;
					$( sbid + ' .sb_' ).css ( 'margin-top', o.ssmt );
					ct = ( - cst / ( o.sh - o.ssh ) * ( o.wh - o.wph ) );
					if ( -ct >  o.wh - o.wph ){
						ct = o.wph - o.wh;
					}
					o.wmt = ct;
					$( o.what ).css( 'margin-top', o.wmt );
				}else{
					var csl = e.pageX - o.mxk + o.lk;
					if( csl < 0 ){
						csl = 0;
					}else if( csl > o.sw - o.ssw ){
						csl = o.sw - o.ssw;
					}
					o.ssml = csl;
					$( sbid + ' .sb_' ).css ( 'margin-left', o.ssml );
					cl = ( - csl / ( o.sw - o.ssw ) * ( o.ww - o.wpw ) );
					if ( -cl >  o.ww - o.wpw ){
						cl = o.wpw - o.ww;
					}
					o.wml = cl;
					$( o.what ).css( 'margin-left', o.wml );
				}
			});
			$(document).mouseup( function(){

				$(this).unbind( 'mousemove' );
				$(this).unbind( 'mouseup' );
			});
		},
		
		mouseScroll : function( d, sbid ){

			o = $( sbid ).data('o');		
			k = o.wph - o.wh;
			t = o.wmt + (d * o.scrpx);

			if( t 	> 0 ){
				t = 0;
			}else if( t < k ){
				t = k;
			}

			if( o.wph - o.wh < -1 ){
				o.wmt = t;
				$( o.what ).css( 'margin-top', o.wmt );
				$( sbid + ' .sb_' ).css ( 'margin-top', _sb.setMarginTop(sbid) );
			}	
		}
	};



/* scrollTo */

	(function($){
		
		$.fn.scrollTo = function( p ){

      		var o = $.extend({					
				addHash : true,
				animTime : 750,
				animType : 'easeInOutQuart',
				top : 20
      		}, p);
        
			return this.find('a[href*="#"], area[href*="#"]').each(function(){
				$(this).unbind('click');
				$(this).click(function(event){
					event.preventDefault();				
					var href = $(this).attr('href');
					var num = href.split('#')[1];
					$('html:not(:animated),body:not(:animated)').animate({ scrollTop :  $('html a[name="'+ num +'"]').offset().top - o.top }, o.animTime, o.animType, function(){
						if( o.addHash == true ){
							window.location.hash = href;
						}
					});
				});	
			});	
		};
	})(jQuery);



/* mousewheel */

	(function($) {

		var types = ['DOMMouseScroll', 'mousewheel'];

		$.event.special.mousewheel = {
	    	setup: function() {
	        	if ( this.addEventListener )
	            	for ( var i=types.length; i; )
					this.addEventListener( types[--i], handler, false );
	        	else
	            	this.onmousewheel = handler;
	    	},
    
	    	teardown: function() {
	        	if ( this.removeEventListener )
	            	for ( var i=types.length; i; )
					this.removeEventListener( types[--i], handler, false );
				else
					this.onmousewheel = null;
	    	}
		};

		$.fn.extend({
	    	mousewheel: function(fn) {
				return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
	    	},
			unmousewheel: function(fn) {
	        	return this.unbind("mousewheel", fn);
	    	}
		});

		function handler(event) {
		    var args = [].slice.call( arguments, 1 ), delta = 0, returnValue = true;
    
		    event = $.event.fix(event || window.event);
		    event.type = "mousewheel";
    
		    if ( event.wheelDelta ) delta = event.wheelDelta/120;
		    if ( event.detail     ) delta = -event.detail/3;
    
		    // Add event and delta to the front of the arguments
		    args.unshift(event, delta);

		    return $.event.handle.apply(this, args);
		}
	})(jQuery);



/* noSelect */

	$(function(){
	    $.extend($.fn.noSelect = function() {
	        return this.each(function(){
	            if($.browser.mozilla){//Firefox
	                $(this).css('MozUserSelect','none');
	            }else if($.browser.msie){//IE
	                $(this).bind('selectstart',function(){return false;});
	            }else{//Opera, etc.
	                $(this).mousedown(function(){return false;});
	            }
	        });
	    });
	});



/* FORMS & INPUTS ************************************************************/



/* repCheckbox */

	( function($) {
	    $.fn.repCheckbox = function() {

	        return this.each(function() {
            
	            // Create the replacement element ....
	            var tmp = $('<div></div>').insertAfter($(this));
            
	            // Store some neccesary datas ...
	            $(tmp).data('name', $(this).attr('name') );
	            $(tmp).data('status', $(this).attr('checked') );
            
	            // Remove the original checkbox ...
	            $(this).remove();
            
	            // Here we comes ....
	            $(tmp).toggle(
	                function() { 
                    
	                    // Add the 'active' class
	                    $(this).attr('class', 'ch_active');
                    
	                    // Create the hidden input field
	                    var rep = $('<input type="hidden" value="1" />').insertAfter( $(this) );
                    
	                    // Set original params ...
	                    $(rep).attr('name', $(this).data('name') );
	                }, 
                
	                function() { 
	                    $(this).attr('class', 'ch_inactive');
	                    $(this).next('input[type=hidden]').remove();
	                }
	            );
            
	            // Finally, check for original status
	            if( $(tmp).data('status') == true ) {
	                $(tmp).click();
	            } else {
	                $(tmp).attr('class', 'ch_inactive');
	            }
            
	        });
	    };
	})( jQuery );


/* repRadiobutton */

	( function($) {
	    $.fn.repRadioButton = function() {
        
	        return this.each(function() {
            
	            // Create the replacement element ....
	            var tmp = $('<div></div>').insertAfter($(this));
            
	            // Store some neccesary datas ...
	            $(tmp).data('name', $(this).attr('name') );
	            $(tmp).data('value', $(this).attr('value') );
	            $(tmp).addClass('rad_inactive');
	            $(tmp).addClass('radio_'+$(this).attr('name')+'');
            
	            // Remove the original checkbox ...
	            $(this).remove();
            
	            // Here we comes ....
	            $(tmp).click(function() {
                
	                // Remove active style and remove existing hidden fields ...
	                $(this).parent('form').find('div.radio_'+$(this).data('name')+'').each(function() {
	                    $(this).removeClass('rad_active');
	                    $(this).addClass('rad_inactive');
                    
	                    if( $(this).next().is('input[name='+$(this).data('name')+']') ) {
	                        $(this).next().remove();
	                    }
	                });
                
	                // Maintain styles ...
	                $(this).removeClass('rad_inactive');
	                $(this).addClass('rad_active');
                
	                var rep = $('<input type="hidden">').insertAfter($(this));
	                $(rep).attr('name', $(this).data('name') );
	                $(rep).attr('value', $(this).data('value') );
	            });
            
	            // Finaly, maintain original status
	            if($(this).attr('checked')) {
	                $(tmp).click();
	            }

	        });
	    };
	})( jQuery );


/* repSelectbox */

	( function($) {
	    $.fn.repSelectbox = function() {

	        return this.each(function() {
            
	            // Create the replacement element ....
	            var tmp = $('<div class="select_box"><p></p><ul></ul></div>').insertAfter($(this));
	            var hid = $('<input type="hidden" name="'+$(this).attr('name')+'">').insertAfter($(tmp));

            
	            // Iterate over the original select box
	            $(this).children().each(function() {
	                var tmpOpt = $('<li>'+$(this).text()+'</li>').appendTo( $(tmp).children('ul') );
	                    $(tmpOpt).data('val', $(this).val());
                    
	                    // Make selected on click
	                    $(tmpOpt).click(function() {
	                        $(this).parent('ul').prev().text( $(this).text() );
	                        $(hid).attr('value', $(tmpOpt).data('val'));
	                    });
	            });

	            // Create the handler child
	            $(tmp).children('p').html( $(tmp).find('li:first').text() );

	            // Maintain original selection
	            if($(this).find('option:selected').length) {
	                var index = $(this).find('option:selected').index();
	                $(tmp).find('li').eq( index ).click();
                
	            // No predefined selected option, select the first one
	            } else {
	                $(tmp).find('li:first').click();
	            }
            
	            // Show / hide effect
	            $(tmp).click(
					function(){
						if( $(this).css('overflow') == 'visible'){
							$(this).find('ul').fadeOut(200, function(){
								$(tmp).css('overflow', 'hidden');
								$('html, body, #dim').css('height','auto');								
							});							
						}else{
							$(this).css('overflow', 'visible');
							$(this).find('ul').fadeIn(200);
							var heightNeed = $(this).offset().top + $(this).outerHeight() + $(this).find('ul').outerHeight() + 20;
							if( $('html').height() < ( heightNeed ) ){
 								$('html, body #dim').height( heightNeed );
							}
						}						
					}
	            );

			  	if( $.browser.msie && $.browser.version.slice(0,1) == "7" ){
			  	}else{
		            $(tmp).mouseleave(
		                function(){
							$(this).find('ul').fadeOut(200, function(){
								$(tmp).css('overflow', 'hidden');
								$('html, body, #dim').css('height','auto');								
							});							
						}
		            );				
				}
           
	            // Remove original element
	            $(this).remove();
	        });
	    };
	})( jQuery );


/* inputClick */
		
	( function($) {
		$.fn.inputClick = function() {

			this.each(function() {
				$(this).data('val', $(this).val());
			});

			this.focus(function() {
				if($(this).val() == $(this).data('val')) {
					$(this).val('');
				}
			});

			this.blur(function() {
				if($(this).val() == '') {
					$(this).val( $(this).data('val') );
				}
			});

			return this;

		};
	})( jQuery );



/* inputClass */

	(function($){
		
		$.fn.inputClass = function(){
		
			this.filter('[type="checkbox"]').each(function(){
				
				$(this).addClass('checkbox');
			});
			this.filter('[type="radio"]').each(function(){
				
				$(this).addClass('radio');
			});
			return this;
		};
	})(jQuery);



/* LINKS, SOCIAL ************************************************************/



/* gMapAppend */

	(function($){
	
		$.fn.gMapAppend = function( p ){
		
			var o = $.extend({
				lng : 'hu',
				timeOut : 1,
				zoom : 15,
				outerZoom : 17,
				width : this.width(),
				height : this.height(),
				mapType : 'terrain',
				outerMapType : 'roadmap',
				showBubble : true,
				marker : {
					color : 'red',
					label : 'o'					
				},
				gMapObj : this,
				callback : function(){}
			}, p);

			o.iwloc = o.showBubble ? '' : '&amp;iwloc=';

			switch(o.outerMapType){
				case 'roadmap':
				o.t = '';
				break;
				case 'terrain':
				o.t = 'p';
				break;
				case 'satellite':
				o.t = 'h';
				break;			
				default:
				o.t = '';
			}
			
			if( !o.address ){
				o.address = this.html();
			}			
						
			function gmapappend(){
				o.gMapObj.html('<a class="gmap" target="_blank" href="http://maps.google.com/maps?t='+o.t+o.iwloc+'&amp;hl='+o.lng+'&amp;q='+o.address+'&amp;ie=UTF8&amp;hnear='+o.address+'&amp;z='+o.outerZoom+'&amp;output=embed"><img src="http://maps.google.com/maps/api/staticmap?center='+o.address+'&amp;zoom='+o.zoom+'&amp;size='+o.width+'x'+o.height+'&amp;maptype='+o.mapType+'&amp;markers=color:'+o.marker.color+'|label:'+o.marker.label+'|'+o.address+'&amp;sensor=false"></a>').css({
					'visibility' : 'visible'
				});
				o.callback();
			}

			setTimeout( function(){ gmapappend(); }, o.timeOut);

			return this;
		};
	})(jQuery);



/* social */

	(function($){

			$.fn.social = function( p ){

				this.each(function(){
					var o = $.extend({
						lng : 'hu_HU',
						layout : 'button_count',
						faces : 'true',
						width : 100,
						height : 21,
						action : $(this).hasClass('share') ? 'share' : 'like',
						color : 'light',
						timeOut : 1000,
						url : $(this).html().length > 12 ? $(this).html() : document.location.href,
						el : $(this),
						social : 'facebook'
					}, p);

					if( $(this).hasClass('iwiw') ){
						o.social = 'iwiw';
					}

					function fb(){

						if( o.action == 'share' ){
							ob = $('<a target="_blank" class="fbshare" href="http://www.facebook.com/sharer.php?u=' + encodeURIComponent(o.url) + '&t=' + encodeURIComponent(document.title) + '" style="margin-top : '+o.el.height()+'px;"></a>');
							o.el.html( ob );
							ob.socialAnimate();
						}else{
							o.el.html('<iframe onload="$(this).socialAnimate();" class="fbiframe" src="http://www.facebook.com/plugins/like.php?href=' + encodeURIComponent(o.url) + '&amp;layout='+ o.layout +'&amp;show_faces='+ o.faces +'&amp;width='+ o.width +'&amp;action='+ o.action +'&amp;colorscheme='+ o.color +'&amp;height='+ o.height +'" scrolling="no" frameborder="0" style="margin-top : '+o.el.height()+'px; border:none; overflow:hidden; width:'+ o.width +'px; height:'+ o.height +'px;" allowTransparency="true"></iframe>');						
						}
					}

					function iw(){

						var iwLike = '';
						var iwColor = 'white';

						if( o.action == 'like' ){
							iwLike = '&t=tetszik';
						}
						if( o.color == 'dark' ){
							iwColor = 'blue';
						}

						o.el.html('<iframe onload="$(this).socialAnimate();" src="http://iwiw.hu/like.jsp?u='+ encodeURIComponent(o.url) +'&title=' + encodeURIComponent(document.title) + iwLike + '&s=' + iwColor + '" width="220px" height="21px" style="margin-top : '+o.el.height()+'px; border: none;" scrolling="no" frameBorder="0" allowTransparency="true"></iframe>');
					}

					if( o.social == 'facebook' ){					
						setTimeout( function(){ fb(); }, o.timeOut);
					}else if( o.social == 'iwiw' ){					
						setTimeout( function(){ iw(); }, o.timeOut);
					}			
				});

				return this;
			};

			$.fn.socialAnimate = function(){
				this.animate({'margin-top' : 0}, 300, 'easeOutQuad');
			};
		})(jQuery);



/* noSpam */

	(function($){
		
		$.fn.noSpam = function(){
		
			return this.find('.mapson').each(function(){

				if($(this).html().indexOf('href') == -1){
					$(this).removeClass('mapson');
					var _class = $(this).attr('class');
					var _temp = $(this).html().split(',,');
					var _eadd = _temp[1] + '@' + _temp[0] + '.' + _temp[2]; 
					var _etxt = _temp[3] ? _temp[3] : _eadd;
					$('<a class="'+_class+'" href="mailto:' + _eadd + '">' + _etxt + '</a>').insertAfter($(this));
					$(this).remove();
				}				
			});
		};
	})(jQuery);
		


/* forceWidth */

	(function($){
		
		$.fn.forceWidth = function(){
		
			this.find('.forcew').each(function(){
				
				$(this).width( $(this).attr('class').split('forcew')[1].split('w')[1] );
			});
			return this;
		};
	})(jQuery);



/* setBlank */

	(function($){
		
		$.fn.setBlank = function(){

			return this.find('a[href*="http:"]').each(function(){
				if(!$(this).attr( 'target' )){
					$(this).attr({ 'target' : '_blank' });
				}
			});	
		};
	})(jQuery);
