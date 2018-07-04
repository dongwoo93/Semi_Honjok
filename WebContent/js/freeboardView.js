$(document).ready(function() {

		$("#all").click(function() {
			$(location).attr('href', "freeboardView.freeb")
		})
		$("#chat").click(function() {
			$(location).attr('href', "ajax01.freeb")
		})
		$("#humor").click(function() {
			$(location).attr('href', "ajax02.freeb")
		})
		$("#beast").click(function() {
			$(location).attr('href', "ajax03.freeb")
		})
		
		$("#sbtn").click(function(){
			$("#formid").submit();
		})
	})