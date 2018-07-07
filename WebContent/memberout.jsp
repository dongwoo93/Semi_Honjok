<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Hi+Melody" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Caveat" rel="stylesheet">

<style>
body {
	margin-top: 30px;
	font-family: 'Noto Sans KR', sans-serif;
 	font-size: 16px;		
}

b {
	font-size: 20px;
	font-family: 나눔스퀘어라운드;
	font-weight: bolder;
	color: #c0c0c0;
}

hr {
	border-color: #c0c0c0;
	border-width: 4px;
	padding-left: 160px;
	width: 1000px;
}

.form-control {
	width: 32%;
}





</style>

</head>

<body>
	
	<c:choose>
	
		<c:when test="${num == 1}">
			<script>
			alert("아이디와 패스워드를 확인해주세요");
			</script>
		</c:when>
	
	</c:choose>
	
	<div class="container">
		<form id="form1" action="memberout.mem" method="post">
			<div class="row setup-content" id="step-1">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Hollo 회원탈퇴</h3>

						<tr>
							<td height="60%" align="center">
								<hr> <br> <span style="padding-left: 160px"> </span> <br>
								<textarea rows="20" cols="150" readonly="readonly">

 √ 회원 탈퇴 전 다음 사항을 꼭 확인하시기 바랍니다.

 - 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.          
 - 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제 됩니다.
회원정보 및 게시글, 자료 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
                    
 - 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다. 
혼톡게시판 게시글, 댓글, 업로드파일등 올린 자료는 탈퇴시 자동 삭제되지 않고 그대로 남아 있습니다.
삭제를 원하는 게시글이 있다면 반드시 탈퇴전 삭제하시거나 비공개 처리하시기 바랍니다.
탈퇴후에는 회원정보가 삭제되며 본인 여부를 확인할 수 있는 방법이 없어, 게시글, 자료 등은 임의로 삭제해드릴 수 없습니다. 

 - Hollo 아이디를 사용해 다른 서비스에 로그인 할 수 없게됩니다. 
                    
 - 탈퇴 후에는 사용하고 계신 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.    
                    
 √ 탈퇴회원 회원정보 보존기간
회원탈퇴가 완료되더라도 다음과 같이 회원정보가 일정기간 보존됨을 알려드립니다.
                    
- 관계법령에 의거하여 보존이 필요한 경우에 한하여 보존됩니다.  
                        
                     </textarea> <br> <br> <input type="checkbox" class="control-label" name="req" id="check"> 
                    	 안내 사항을 모두 확인하였으며, 이에 동의합니다. <br> <hr> </td>
						</tr>
					

						<c:choose>
						<c:when test="${result[0].portal != ''}">
						<div>그냥 탈퇴될거임</div>
						<input type="hidden" name="id" value="${result[0].id}">
						<button id="btn2" class="btn btn-secondary btn-lg pull-right" type="submit">회원탈퇴</button>
						</c:when>
						<c:otherwise>
						<div class="form-group">
							<label class="control-label">아이디</label> <input maxlength="50"
								type="text" id="id" name="id" required="required"
								class="form-control" placeholder="아이디를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label">패스워드</label> <input maxlength="50"
								type="password" id="pw" name="pw" required="required"
								class="form-control" placeholder="패스워드를 입력해주세요"> <br>
								<button id="btn" class="btn btn-secondary btn-lg pull-right" type="button">회원탈퇴</button>
						</div>
						</c:otherwise>
						</c:choose>
						
						
						
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<script>
	if("${result.portal}" != null) {
		$("#btn").click(function () {
			var agreement = $(check).is(":checked");
			if(agreement) {
				$("#form1").submit();
			}else {
				alert("약관에 동의하지 않으시면 탈퇴할수 없습니다.")
			}
		})
	}
		

		
	
						
						
						
						
	</script>
	
</body>

</html>