<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ�� ���� ������ �Դϴ�.</title>
		<script type="text/javascript" src="../css/prototype.js"></script>
		<script type="text/javascript">
		
			/*
			*	DB�� ���� �Է� �� ID�� ���� �ϴ� �� �Ѵ�.
			*/
			function idChk()
			{
				var vForm = document.vForm;
				var id = vForm.id.value;
				 
				if(id == "")
				{
					alert("����Ͻ� ���̵� �Է� �� ID �ߺ� üũ�� �Ͻʽÿ�.");
					vForm.id.focus();
					return;
				}
				
				var url = "../login.do?task=idChk";
				var myAjax = new Ajax.Request(url,
							{	
								method: 'post', 
								parameters: Form.serialize('vForm'),
								onComplete: callbacka
							}
						);
			}
				
			function callbacka(originalRequest)
			{
				var forward = originalRequest.responseText;
				
				// �̹� �����ϴ� id �� ������ �Ұ����� ���̵��� ���.
				if( forward == "idChkNo" )
				{
					$('type1').style.display = 'none';
					$('type2').style.display = '';
					//alert("�̹� �����ϴ� ���̵� �Դϴ�.");
				}
				else	// idChkOk �� �Ѿ�� ��� ������ ������ ���̵�.
				{
					$('type1').style.display = '';
					$('type2').style.display = 'none';
					//alert("����� ������ ���̵� �Դϴ�.");
				}
			}
			
			/*
			*	ȸ�� ����
			*/
			function userInner()
			{
				var vForm = document.vForm;
				
				vForm.task.value = "newUser";
				vForm.method = "post";
				vForm.action = "../login.do";
				vForm.submit();
			}
			
			/*
			*	ȸ�� ���� ���
			*/
			function reset()
			{
				var vForm = document.vForm;
				
				chked = confirm("ȸ�� ������ ��� �Ͻðڽ��ϱ�?");
				
				if(chked == true)	// ����ڰ� ���� ��Ҹ� �� ��� ��� ���� ������ ����.
				{
					vForm.id.value = "";
					vForm.name.value = "";
					vForm.jumin1.value = "";
					vForm.jumin2.value = "";
					vForm.address.value = "";
					vForm.email.value = "";
					vForm.num1.value = "";
					vForm.num2.value = "";
					vForm.num3.value = "";
				}
			}

		</script>
	</head>
	<body>
		<h3>ȸ�� ������ �ʿ� �մϴ�.</h3><hr><p>
		<form name="vForm" style="margin: 0; padding: 0"> 
		<form name="vForm" method="post" action="/login/login.do" style="margin: 0; padding: 0">
		<input type="hidden" name="task">
		<table width="600" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="3" align="center"><h3>ȸ�� ����</h3></td>
			</tr>
			<tr style="background-color: #e4eefe">
				<td height="30" width="120"><font color="red">*</font> ID :</td>
				<td width="250"><input type="text" name="id">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:idChk()">ID �ߺ� üũ</a></td>
				<td><div id="type1" style="display: none"><font color='red'>��</font> ��� ������ ���̵� �Դϴ�.</div><div id="type2" style="display: none"><font color='red'>��</font> �̹� �����ϴ� ���̵� �Դϴ�.</div></td>
			</tr>
			<tr>
				<td height="30"><font color="red">*</font> �̸� :</td>
				<td colspan="2"><input type="text" name="name"></td>
			</tr>
			<tr style="background-color: #e4eefe">
				<td height="30"><font color="red">*</font> �ֹε�Ϲ�ȣ :</td>
				<td colspan="2"><input type="text" name="jumin1"> ~ <input type="password" name="jumin2"></td>
			</tr>
			<tr>
				<td height="30">&nbsp;&nbsp;�ּ� :</td>
				<td colspan="2"><input type="text" name="address" size="43"></td>
			</tr>
			<tr style="background-color: #e4eefe">
				<td height="30"><font color="red">*</font> email :</td>
				<td colspan="2"><input type="text" name="email" size="15">&nbsp;@&nbsp;<input type="text" name="email2" size="15"></td>
			</tr>
			<tr>
				<td height="30"><font color="red">*</font> ����ó :</td>
				<td colspan="2"><input type="text" name="num1" size="5">&nbsp;-&nbsp;<input type="text" name="num2" size="11">&nbsp;-&nbsp;<input type="text" name="num3" size="11"></td>
			</tr>
			<tr style="background-color: #e4eefe" align="center">
				<td colspan="3" height="60"><a href="javascript:userInner()">ȸ������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:reset()">���</a></td>
			</tr>
		</table>
		</form>
		</body>
