<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
${name} <br>
${price}

<script>
var IMP = window.IMP; // ��������
IMP.init('imp39249154'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${name1}',
    amount : ${price1},
    buyer_email : 'iamport@siot.do',
    buyer_name : '�������̸�',
    buyer_tel : '010-1234-5678',
    buyer_addr : '����Ư���� ������ �Ｚ��',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
    	jQuery.ajax({
    		url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� ������ ���������� ����
    		type: 'POST',
    		dataType: 'json',
    		data: {
	    		imp_uid : rsp.imp_uid,
	    		merchant_uid : rsp.merchant_uid,
	    		paid_amount : rsp.paid_amount,
	    		apply_num : rsp.apply_num
	    		//��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
    		}
    	}).done(function(data) {
    		//[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
    		if ( everythings_fine ) {
    			var msg = '������ �Ϸ�Ǿ����ϴ�.';
    			msg += '\n����ID : ' + rsp.imp_uid;
    			msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
    			msg += '\���� �ݾ� : ' + rsp.paid_amount;
    			msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
    			alert(msg);
    		} else {
    			//[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
    			//[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
    		}
    	});
    } else {
        var msg = '������ �����Ͽ����ϴ�.';
        msg += '�������� : ' + rsp.error_msg;

        alert(msg);
    }
});
</script>
</body>
</html>