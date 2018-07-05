<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게사판관리(마이페이지)</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"> 
    
    <style>
        #columns {
            
            column-width: 320px;
            column-gap: 15px;
            width: 90%;
            max-width: 770px;
            margin: 50px auto;
        }

        #columns .card {
            background: #fefefe;
            border: 2px solid #fcfcfc;
            box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
            margin: 0 2px 15px;
            padding: 15px;
            padding-bottom: 10px;
            transition: opacity .4s ease-in-out;
            -webkit-column-break-inside: avoid;
            page-break-inside: avoid;
            break-inside: avoid;
            column-break-inside: avoid;
            display: inline-block;
            background-color: #e8e8e8;
        }

        #columns:hover .card:not(:hover) {
            opacity: 0.4;
        }

        #card1 {
            width: 320px;
            height: 200px;
        }

        #card2 {
            width: 320px;
            height: 200px;
        }

        #card3 {
            width: 320px;
            height: 200px;
        }

        #card4 {
            width: 320px;
            height: 200px;
        }
        
        h3{
        padding:50px;
        fontstyle:extrabold;
        }
    </style>
    
</head>

<body>
   <h3 align=center>게시글 관리</h3>
   
    <div id="columns">
        <div id="card1" class="card">
            <tr>
                <td>내가올린 게시글</td>
            </tr>
            <tr>
                <td>${result[0].header}</td>
            </tr>
            
        </div>
        <div id="card2" class="card">
        <tr><td>게시글내용</td></tr>
        <tr><td><a href=""></a></td></tr>
        </div>

        <div id="card3" class="card">
        <tr><td>게시일</td></tr>
        <tr><td>${result[0].writedate}</td></tr>
        </div>

        <div id="card4" class="card">
            <tr>
                <td>좋아요</td>
            </tr><br>
            <tr>
                <td><i class="fa fa-heart-o" style="font-size: 75px;"></i></td>
            </tr>
            <tr><td>${result[0].like}</td></tr>
        </div>
    </div>
</body>

</html>






