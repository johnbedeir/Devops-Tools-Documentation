"use strict";
var $ = jQuery;

//Form Stylization
function formStylization(){
	var radio    = 'input[type="radio"]',
			checkbox = 'input[type="checkbox"]';

	$(radio).wrap('<div class="new-radio"></div>').closest('.new-radio').append('<span></span>');
	$(checkbox).wrap('<div class="new-checkbox"></div>').closest('.new-checkbox').append('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 13 11" enable-background="new 0 0 13 11" xml:space="preserve"><polyline points="0.2,4.6 1,4 5,9 12,0 12.8,0.6 5.8,9.6 5,10.6 4.2,9.6 0.2,4.6 "/></svg>');
	$(checkbox + ':checked').parent('.new-checkbox').addClass('checked');
	$(radio + ':checked').parent('.new-radio').addClass('checked');
	$(checkbox + ':disabled').closest('.checkbox').addClass('disabled');
	$(radio + ':disabled').closest('.radio').addClass('disabled');

	$('body').on('click', function(){
		$(radio).parent('.new-radio').removeClass('checked');
		$(radio + ':checked').parent('.new-radio').addClass('checked');
		$(checkbox).parent('.new-checkbox').removeClass('checked');
		$(checkbox + ':checked').parent('.new-checkbox').addClass('checked');
		$(radio).closest('.radio').removeClass('disabled');
		$(checkbox).closest('.checkbox').removeClass('disabled');
		$(radio + ':disabled').closest('.radio').addClass('disabled');
		$(checkbox + ':disabled').closest('.checkbox').addClass('disabled');
	});

	if($.fn.selectpicker){
		$('select:not(".without-styles")').selectpicker();
	}
}

//Main Menu
function mainMenu(){
	var menu   = $('#main-menu'),
			link   = $('#main-menu a, .go-section'),
			url    = window.location.href,
			hash   = url.substring(url.indexOf('#')),
			homeId = 'home';

	link.on('click', function(e){
		var $this    = $(this),
				id       = $this.attr('href').split('#').pop(),
				duration = 1;

		e.preventDefault();

		if (!$('#' + id).length) {
			console.log('No such section!');
			return false;
		}

		link.removeClass('active');

		animateFinish();

		$('.section.active [data-out-animation]').each(function(){
			var $this = $(this);
			
			if ($this.data('outAnimationDelay')){
				if ($this.data('outAnimationDelay') >= duration) {
					duration = $this.data('outAnimationDelay');
				}
			}
		});

		if (!$this.hasClass('open')) {
			link.removeClass('open');

			menu.find('[href="#'+ id +'"]').addClass('active').addClass('open');

			$('body').find('.preloader').delay(duration + 500).fadeIn(400, function() {
				$('.section').removeClass('active');

				$('#' + id).addClass('active');

				$(this).fadeOut(400);

				setTimeout(function(){
					contentScroll();
					animateStart();
				}, 0);

				document.location.hash = '#' + id;
			});
		} else {
			$('body').find('.preloader').delay(duration + 500).fadeIn(400, function() {
				link.removeClass('open');

				$('.section').removeClass('active');

				$('#' + homeId).addClass('active');

				$(this).fadeOut(400);

				setTimeout(function(){
					contentScroll();
					animateStart();
				}, 0);

				document.location.hash = '#' + homeId;
			});
		}
	});

	if (hash != '#')
		$('[href="'+ hash +'"]').trigger('click');
}

//Animate Start
function animateStart(){
	var activeSection = $('.section.active');

	$('[data-animation]').each(function(){
		var $this     = $(this),
				animation = 'fadeIn',
				delay     = 1;

		if ($this.data('animation')){
			animation = $this.data('animation');
		}

		if ($this.data('animationDelay')){
			delay = $this.data('animationDelay');
		}

		if ($this.closest('.section').hasClass('active')){
			$this.css('animation-delay', delay + 'ms').addClass('animated').addClass(animation);
		}
	});
}

//Animate Finish
function animateFinish(){
	var activeSection = $('.section.active'),
			duration      = 1;

	$('[data-out-animation]').each(function(){
		var $this        = $(this),
				animation    = 'fadeIn',
				outAnimation = 'fadeOut',
				delay        = 1,
				outDelay     = 1;

		if ($this.data('animation')){
			animation = $this.data('animation');
		}

		if ($this.data('outAnimation')){
			outAnimation = $this.data('outAnimation');
		}

		if ($this.data('animationDelay')){
			delay = $this.data('animationDelay');
		}

		if ($this.data('outAnimationDelay')){
			outDelay = $this.data('outAnimationDelay');
		}

		$this.css('animation-delay', delay + 'ms');

		if ($this.closest('.carousel')) {
			var carousel = $this.closest('.carousel'),
					carouselAnimate = 'zoomIn';

			if (carousel.data('carouselAnimation')){
				carouselAnimate = carousel.data('carouselAnimation');
			}

			$this.removeClass(carouselAnimate);
		}

		if ($this.closest('.section').hasClass('active')){
			if (outDelay >= duration) {
				duration = outDelay;
			}

			$this.removeClass(animation).addClass(outAnimation);

			if ($this.data('outAnimationDelay')){
				$this.css('animation-delay', outDelay + 'ms');
			} else {
				$this.css('animation-delay', '1ms');
			}
		} else {
			$this.removeClass(animation).removeClass(outAnimation).removeAttr('style', 'animation-delay');
		}
	});
}

//Carousels
function carousels(){
	var carouselBox = $('.carousel-box');

	carouselBox.each(function(){
		var thisBox      = $(this),
				carousel     = $(this).find('.carousel'),
				animation    = 'zoomIn',
				animationOut = 'zoomOut',
				items        = {0 : {items : 1}, 768 : { items : 3}};

		if (thisBox.data('carouselAnimation')){
			animation = thisBox.data('carouselAnimation');
		}

		if (thisBox.data('carouselOutAnimation')){
			animationOut = thisBox.data('carouselOutAnimation');
		}

		carousel.owlCarousel({
			loop            : true,
			margin          : 20,
			pullDrag        : false,
			responsiveClass : true,
			responsive      : items,
			mouseDrag       : false,
			touchDrag       : false,
			navRewind       : false,
			dots            : false
		}).touchwipe({
			wipeLeft: function(){
				thisBox.find('.carousel-controls .next').trigger('click');
			},
			wipeRight: function(){
				thisBox.find('.carousel-controls .prev').trigger('click');
			},
			preventDefaultEvents: false
		});

		carousel.closest('.carousel-box').on('click', '.nav-item', function(e){
			var item = carousel.find('.owl-item .item');

			e.preventDefault();

			item.css('animation-delay', '1ms');

			item.each(function(){
				var $this = $(this);

				if ($this.data('animation')){
					$this.removeClass($this.data('animation'));
				}

				$this.addClass(animationOut);
			});

			var event = 'next';

			if ($(this).hasClass('prev')) {
				event = 'prev';
			}

			setTimeout(function(){
				carousel.trigger(event + '.owl.carousel');
			}, 400);

			setTimeout(function(){
				item.removeClass(animationOut).addClass(animation);
			}, 800);
		});
	});
}

//Google Map
function initialize(){
	var mapCanvas = $('.map-canvas');

	mapCanvas.each(function (){
	var $this           = $(this),
			zoom            = 8,
			lat             = -34,
			lng             = 150,
			scrollwheel     = false,
			draggable       = true,
			mapType         = google.maps.MapTypeId.ROADMAP,
			title           = '',
			contentString   = '';

	if ($this.data('zoom')){
		zoom = parseFloat($this.data('zoom'));
	}

	if ($this.data('lat')){
		lat = parseFloat($this.data('lat'));
	}

	if ($this.data('lng')){
		lng = parseFloat($this.data('lng'));
	}

	if ($this.data('scrollwheel')){
		scrollwheel = $this.data('scrollwheel');
	}

	if ($this.data('type')){
		if ($this.data('type') == 'satellite'){
			mapType = google.maps.MapTypeId.SATELLITE;
		} else if ($this.data('type') == 'hybrid'){
			mapType = google.maps.MapTypeId.HYBRID;
		} else if ($this.data('type') == 'terrain'){
			mapType = google.maps.MapTypeId.TERRAIN;
		}
	}

	if ($this.data('title')){
		title = $this.data('title');
	}

	if( navigator.userAgent.match(/iPad|iPhone|Android/i) ){
		draggable = false;
	}

	var mapOptions = {
		zoom              : zoom,
		scrollwheel       : scrollwheel,
		draggable         : draggable,
		center            : new google.maps.LatLng(lat, lng),
		mapTypeId         : mapType,
		streetViewControl : false
	};

	var map = new google.maps.Map($this[0], mapOptions);

	var is_internetExplorer11= navigator.userAgent.toLowerCase().indexOf('trident') > -1;
	var image = ( is_internetExplorer11 ) ? 'img/map-marker.png' : 'img/svg/map-marker.svg';

	if ($this.data('content')){
		contentString = '<div class="map-content">' +
		'<h3 class="title">' + title + '</h3>' +
		$this.data('content') +
		'</div>';
	}

	var infowindow = new google.maps.InfoWindow({
			content: contentString
	});

	var marker = new google.maps.Marker({
		position : new google.maps.LatLng(lat, lng),
		map      : map,
		icon     : image,
		title    : title
	});

		if ($this.data('content')){
			google.maps.event.addListener(marker, 'click', function(){
				infowindow.open(map,marker);
			});
		}
	});
}

// Load google maps script
function loadScript(){
	var script      = document.createElement('script');
			script.type = 'text/javascript';
			script.src  = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=initialize';

	document.body.appendChild(script);
}

window.onload = loadScript;

//Map
function mapBox(){
	$('.map-show').on('click', function(e){
		var id = $(this).attr('href');

		e.preventDefault();

		$(id).addClass('active animated zoomIn');
	});

	$('.map-box .close').on('click', function(e){
		var mapBox = $(this).closest('.map-box');

		e.preventDefault();

		mapBox.removeClass('zoomIn').addClass('zoomOut');

		setTimeout(function() {
			mapBox.removeClass('active').removeClass('zoomOut');
		}, 500);
	});
}

//HTML5 Video Background
function videoBg(){
	var $this = $('.background-video');

	if ($this.find('video').length){
		var video = $this.find('video');

		if (video.width() == $this.width()){
			video.css({
				marginLeft : 0,
				marginTop : -((video.height() - $this.height()) / 2)
			});
		} else {
			video.css({
				marginTop : 0,
				marginLeft : -((video.width() - $this.width()) / 2)
			});
		}
	}
}

//YouTube Video Background
function youtubeVideoBg(){
	var $this = $('.background-video');

	if (($this.data('video')) && ($.fn.tubular)){
		if ($this.find('video').length){
			$this.find('video').remove();
		}

		if (!$this.find('.tubular-container').length) {
			var videoId = '';

			if ($this.data('video')) {
				videoId = $this.data('video');
			}

			$this.tubular({
				videoId   : videoId,
				container : $this
			});
		}
	}
}

//Slider Background
function backgroundSlider() {
	var slider = $('.background-slider');

	if (slider.length) {
		var autoplayTimeout = 2000,
				animateIn       = 'fadeIn',
				animateOut      = 'fadeOut';

		if (slider.data('animateIn')) {
			animateIn = slider.data('animateIn');
		}

		if (slider.data('animateOut')) {
			animateOut = slider.data('animateOut');
		}

		if (slider.data('timeout')) {
			autoplayTimeout = slider.data('timeout');
		}

		slider.owlCarousel({
			animateIn       : animateIn,
			animateOut      : animateOut,
			items           : 1,
			loop            : true,
			autoplay        : true,
			autoplayTimeout : autoplayTimeout
		});
	}
}

//Send Email
function sendEmail(){
	$('.send-email').on('click', function(e){
		var $this = $(this);

		e.preventDefault();

		$.ajax({
			url  : 'php/u-c.php',
			type : 'POST',
			data : $this.closest('.under-construction').serialize(),
			success : function(data){
				if ($(data).is('.send-true')){
					$this.addClass('loading').delay(650).queue(function(){
						$this.addClass('success').addClass('loaded').dequeue();
					});
				} else {
					$this.addClass('error');
				}

				$this.delay(500).queue(function(){
					$this.removeClass('loaded').removeClass('loading').dequeue();
				});

				$this.delay(400).queue(function(){
					if ($(data).is('.send-true')){
						$this.removeClass('success').closest('.under-construction').trigger('reset');
					} else {
						$this.removeClass('error');
					}
					$this.dequeue();
				});
			}
		});

		return false;
	});
}

//Contact Form
function contactForm(){
	$('.btn-submit').on('click',function(e){
		var $this = $(this);

		e.preventDefault();

		$.ajax({
			url  : 'php/contact.php',
			type : 'POST',
			data : $this.closest('.contact-form').serialize(),
			success : function(data){
				if ($(data).is('.send-true')){
					$this.addClass('loading').delay(650).queue(function(){
						$this.addClass('success').addClass('loaded').dequeue();
					});
				} else {
					$this.addClass('error');
				}

				$this.delay(500).queue(function(){
					$this.removeClass('loaded').removeClass('loading').dequeue();
				});

				$this.delay(400).queue(function(){
					if ($(data).is('.send-true')){
						$this.removeClass('success').closest('.contact-form').trigger('reset');
					} else {
						$this.removeClass('error');
					}
					$this.dequeue();
				});
			}
		});
	});
}

//Content Scroll
function contentScroll(){
	var section = $('.section.active');

	if (section.length && $.fn.mCustomScrollbar) {
		section.each(function (){
			var $this = $(this);

			if (($this.height() - 40) < $this.find('.container').height()) {
				$this.addClass('scroll-content');

				if(!navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/)){
					$this.find('.section-content').mCustomScrollbar({
						scrollInertia : 100
					});
				}
			} else {
				$this.removeClass('scroll-content');
			}
		});
	}
}

//Notify My
function notifyMy(){
	var margin = 70;

	if (($('body').height() < 600) || ($('body').width() < 768)) {
		margin = 0;
	}

	$('.notify-my .modal-dialog').css('margin-top', (($('body').height() - $('.notify-my .modal-dialog').height()) / 2) - margin);
}

$(document).ready(function(){
	'use strict';

	var isTouchDevice = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/);

	//Touch device
	if(isTouchDevice){
		$('body').addClass('touch-device');
		$('.background-video').remove();
	}

	//Bootstrap Elements
	$('[data-toggle="tooltip"], .tooltip-link').tooltip();

	$('a[data-toggle=popover]')
	.popover()
	.on('click', function(e){
		e.preventDefault();
	});

	$('.disabled, fieldset[disabled] .selectBox').on('click', function (){
		return false;
	});

	//Functions
	formStylization();
	mainMenu();
	mapBox();
	youtubeVideoBg();
	sendEmail();
	contactForm();
	backgroundSlider();

	//Functions(load)
	$(window).on('load', function(){
		animateStart();
		carousels();
		videoBg();
		contentScroll();

		//Preloader
		$('body').delay(500).addClass('loaded').find('.preloader').fadeOut(400);
	});

	//Notify me (MailChimp)
	if (($('.mailchimp').length) && ($.fn.ajaxChimp)) {
		$('.mailchimp').ajaxChimp({
			url: 'http://us10.list-manage.com/subscribe/post?u=69007f000c70b89e124b9308d&amp;id=1225ba8aee'
		});
	}

	//Retina
	if('devicePixelRatio' in window && window.devicePixelRatio >= 2){
		var imgToReplace = $('img.replace-2x').get();

		for (var i=0,l=imgToReplace.length; i<l; i++){
			var src = imgToReplace[i].src;

			src = src.replace(/\.(png|jpg|gif)+$/i, '@2x.$1');

			imgToReplace[i].src = src;

			$(imgToReplace[i]).on('load', function(){
				$(this).addClass('loaded');
			});
		}
	}

	//Count Down
	if (($('.countdown').length) && ($.fn.countdown)) {
		var countdown = $('.countdown');

		countdown.each(function (){
			var $this   = $(this),
					austDay = new Date(2016, 1-1, 1);

			if ($this.data('date')){
				var date = $this.data('date').split(' ');

				austDay = new Date(parseFloat(date[0]), parseFloat(date[1]) - 1, parseFloat(date[2]));
			}

			$this.countdown({
				until       : austDay,
				format      : 'DHMS',
				significant : 1,
				description : ' left'
			});
		});
	}

	//Notify My
	$('.notify-my').on('shown.bs.modal', function () {
		notifyMy();
	});

	//Vimeo Start/Stop
	$('.modal').on('shown.bs.modal', function (e) {
		var video = $(this).find('.vimeo-video iframe');

		if (video.length && video.closest('.vimeo-video').data('autoplay')) {
			var player = $f(video[0]);

			player.api('play');
		}
	});

	$('.modal').on('hidden.bs.modal', function (e) {
		var video = $(this).find('.vimeo-video iframe');

		if (video.length) {
			var player = $f(video[0]);

			player.api('pause');
		}
	});

	//Twitter
	if ($('.twitter-widget').length){
		!function(d,s,id){
			var js,
					fjs=d.getElementsByTagName(s)[0],
					p=/^http:/.test(d.location)?'http':'https';

			if(!d.getElementById(id)){
				js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';
				fjs.parentNode.insertBefore(js,fjs);
			}
		}(document,'script','twitter-wjs');

		window.setTimeout(function() {
			$('.twitter-timeline').contents().find('.footer').css('display', 'none');
		}, 1000);
	}

	//Pin It
	if ($('[data-pin-do]').length){
		!function(a,b,c){
			var d,e,f;

			f='PIN_'+~~((new Date).getTime()/864e5),a[f]||(a[f]=!0,a.setTimeout(function(){
				d=b.getElementsByTagName('SCRIPT')[0],
				e=b.createElement('SCRIPT'),
				e.type='text/javascript',
				e.async=!0,
				e.src=c+'?'+f,
				d.parentNode.insertBefore(e,d)
			},10))
		}(window,document,'//assets.pinterest.com/js/pinit_main.js');
	}
});

//Window Resize
(function(){
	var delay = (function(){
		var timer = 0;
		return function(callback, ms){
			clearTimeout (timer);
			timer = setTimeout(callback, ms);
		};
	})();

	function resizeFunctions(){
		//Functions
		videoBg();
		contentScroll();
		notifyMy();
	}

	if(navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/)){
		$(window).on('orientationchange', function(){
			resizeFunctions();
		});
	} else {
		$(window).on('resize', function(){
			delay(function(){
				resizeFunctions();
			}, 500);
		});
	}
}());