$(document).ready(function() {
				
				$('.carousel').carousel({
					  interval: 3000
					})
				
				
				$('ul.nav li.dropdown').hover(
						function() {
							$(this).find('.dropdown-menu').stop(true, true)
									.delay(200).fadeIn(500);
						},
						function() {
							$(this).find('.dropdown-menu').stop(true, true)
									.delay(200).fadeOut(500);
						});
				
			})