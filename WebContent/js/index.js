
$(document).ready(function() {
	AOS.init({
		duration : 1200,
	});
	function numberWithCommas(x) {
		return x.toString().replace(
				/\B(?=(\d{3})+(?!\d))/g, ",");
	};

	$.ajax({
		url : "data.com",
		type : "get",
		success : function(resp) {
			for (var i = 0; resp.length > i; i++) {
				var total = resp[i].DT;
				$("#c" + i).attr("data-count", total);
			}

			var data1 = parseFloat($("#c0").attr(
			"data-count"));
			var data2 = parseFloat($("#c1").attr(
			"data-count"));
			$("#c0").attr("data-count", data1 * 1000);
			$("#c1").attr("data-count", data2 * 1000);
		},
		error : function() {
			console.log("에러 발생!");
		}

	});

	$('#section2').parallax({
		imageSrc : 'images/배경5.jpg'
	});

	$('#section3').parallax({
		imageSrc : 'images/배경6.jpg'
	});
	$('#section4').parallax({
		imageSrc : 'images/배경8.jpg'
	});



	var a = 0;
	$(window).scroll(function() {
		var oTop = $('#shiva').offset().top
		- window.innerHeight;
		if (a == 0
				&& $(window)
				.scrollTop() > oTop) {
			$('.count')
			.each(
					function() {
						var $this = $(this), countTo = $this
						.attr('data-count');
						$(
								{
									countNum : $this
									.text()
								})
								.animate(
										{
											countNum : countTo
										},
										{
											duration : 1500,
											easing : 'swing',
											step : function() {
												$this
												.text(Math
														.floor(this.countNum));
											},
											complete : function() {
												$this
												.text(numberWithCommas(this.countNum));
												//alert('finished');
											}
										});
					});
			a = 1;
		}
		


	});
});



