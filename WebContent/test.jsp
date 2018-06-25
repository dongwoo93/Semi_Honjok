<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script>
$(document).ready(function() {
	$('#summernote').summernote({
        placeholder: 'Hello bootstrap 4',
        tabsize: 2,
        height: 700,
        width: 1000,
        minHeight: null,      // �ּ� ���̰�(null�� ���� ����)
        maxHeight: null,      // �ִ� ���̰�(null�� ���� ����)
        focus: true,          // �������� ������ ��Ŀ���� ������
        lang: 'ko-KR',         // �ѱ��� ����(�⺻���� en-US)
      });
	
	
})
</script>
</head>
<body>
    <div class="container">
    <h1 class="page-header">Summernote Sample</h1>
    <form class="form-horizontal" method="get" action="">
      <div class="form-group">
        <label for="content" class="col-sm-2 control-label">�����Է�</label>
        <div class="col-sm-10">
          <textarea name="content" id="summernote"></textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-default">Save</button>
        </div>
      </div>
    </form>
  </div>
</body>
</html>