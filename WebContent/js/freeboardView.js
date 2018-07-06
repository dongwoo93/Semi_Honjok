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
		
		$("#chk_all").click(function(){
		    if($("#chk_all").is(":checked")){
		        $(".chk").prop("checked", true);
		    }
		    else{
		        $(".chk").prop("checked", false);
		    }
		});
		$(".chk").click(function(){
		    if($("input[name='chk']:checked").length == 3){
		        $("#chk_all").prop("checked", true);
		    }else{
		        $("#chk_all").prop("checked", false);
		    }
		});
		
		$("#delete").click(function(){
			var cat = $("#hiddenCategory").val();
			var delList = new Array();
			$('#chk:checked').each(function(index, element) { 
				 delList[index] = $(this).val();
			   });
			$(location).attr('href', "admin_del_board.freeb?delList="+delList+"&cat="+cat);
			
		})
	})