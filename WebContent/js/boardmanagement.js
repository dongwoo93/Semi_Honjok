$(document).ready(function(){
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
		var delList = new Array();
		$('#chk:checked').each(function(index, element) { 
			 delList[index] = $(this).val();
		   });
		$(location).attr('href', "user_del_board.mp?delList="+delList);
		
	});
})