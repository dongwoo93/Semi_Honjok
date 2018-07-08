<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
</head>
<body>
<script>
var IMP = window.IMP;
IMP.init('imp39249154');

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${product_name}',
    amount : '${price}',
    buyer_email : "${email}",
    buyer_name : '${buyer_name}',
    buyer_tel : '${phone}',
    buyer_addr : '${address}',
    buyer_postcode : '${zipcode}'
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	alert("결제가 완료되었습니다");
    	location.href = "complete.shop?pid=${pid}";
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
        location.href = "shopmain.shop";
    }
});
</script>
</body>
</html>