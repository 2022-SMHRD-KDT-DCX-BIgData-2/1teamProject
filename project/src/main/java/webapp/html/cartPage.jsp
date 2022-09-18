<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <script
      src="https://kit.fontawesome.com/20629bba5a.js"
      crossorigin="anonymous"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#header").load("../html/header.jsp"); // 원하는 파일 경로를 삽입
      });
    </script>

  </head>
  <style>
main{
 position:relative;
 top:250px;
 margin:0px auto;
 width:800px;
 height:800px;
 text-align:left;
 }
table {
 width: 100%;
 
 text-align:center;
 margin-top:10px;
}
.line{
border-bottom:1px solid gray;
padding:5px;
}

table td:nth-child(1){
width:25px;
}
table td:nth-child(2){
width:180px;
}
 #main_footer{
 display:absolute;
 bottom:0px;
 }
  </style>
  <body>
    <header>
      <div id="header"></div>
    </header>
    <main>
	 <div id = "martbox">
	   	<div class="line">롯데마트</div>
	    <table>
	      	<tr>
	      		<td><input type="checkbox"></td>
	      		<td>사진</td> <!-- 이미지 -->
	      		<td>초콜릿</td> <!-- 상품명 -->
	      		<td>12,000원</td> <!-- 가격 -->
	      		<td><input type="button" value="제거"></td>
	      	</tr>
	    </table><br><br>
	    <div class="line">홈플러스</div>
	    <table>
	      	<tr>
	      		<td><input type="checkbox"></td>
	      		<td>d</td>
	      		<td>ㅇ</td>
	      		<td>ㅇ</td>
	      		<td>ㅇ</td>
	      		<td><input type="button" value="제거"></td>
	      	</tr>
	      </table><br><br>
	      <div class="line">이마트</div>
		    <table>
	      	<tr>
	      		<td><input type="checkbox"></td>
	      		<td>d</td>
	      		<td>ㅇ</td>
	      		<td>ㅇ</td>
	      		<td>ㅇ</td>
	      		<td><input type="button" value="제거"></td>
	      	</tr>
	      </table>
	  </div>
    </main>
      <footer id="main_footer">
        <div class="footer_box">
          <div>
            스마트인재 개발원<span style="font-size: 18px">
              tel ) 070-4120-6295</span
            >
          </div>
          <div>K-Digital Training</div>
          <div>DCX기반 빅데이터분석 서비스 개발자 과정</div>
        </div>
        <div class="footer_box">
          <div>TEAM_ NEXTLEVEL</div>
          <div id="team_name">
            <div>오진서</div>
            <div>이지영</div>
            <div>임태규</div>
            <div>이정욱</div>
          </div>
        </div>
        <div class="icon_style">
          <a href="https://www.facebook.com/"
            ><i class="fa-brands fa-facebook"></i
          ></a>
          <a href="https://github.com/"
            ><i class="fa-brands fa-square-github"></i
          ></a>
          <a href="https://www.youtube.com/channel/UCubIpLB7cA9tWIUZ26WFKPg"
            ><i class="fa-brands fa-youtube"></i
          ></a>
          <a href=""><i class="fa-brands fa-square-js"></i></a>
        </div>
      </footer>
    <script src="../script/change_email.js"></script>
    <script src="../script/pwdCheck.js"></script>
  </body>
</html>
