<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상품페이지</title>
    <script
      src="https://kit.fontawesome.com/20629bba5a.js"
      crossorigin="anonymous"
    ></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#header").load("../html/header.jsp"); // 원하는 파일 경로를 삽입
      });
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/prodPage.css" />
  </head>
  <body>
    <header>
      <div id="header"></div>
    </header>
    <main>
      <div id="main_box">
        <div class="main_title">상품 상세정보</div>
      </div>
      <div class="article">
        <div id="prodImg"></div>
        <div id="main_box2">
          <div>저탄소 GAP 추희 자두 1.1kg</div>
          <div><b>9900원</b></div>
          <div>4.5(11개)</div>
          <div>마트별 가격비교</div>
          <div>
            진서님~상세페이지는 대략 이런 구성으로~? 페이지 너무 밋밋한거는 좀
            더 생각해보께요~~~ :)
          </div>
        </div>
      </div>
    </main>
   <footer id="main_footer">
  <div class="footer_box">
    <div>
      스마트인재 개발원<span style="font-size: 18px"> tel ) 070-4120-6295</span>
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
    <a href=""><i class="fa-brands fa-facebook"></i></a>
    <a href=""><i class="fa-brands fa-square-github"></i></a>
    <a href=""><i class="fa-brands fa-youtube"></i></a>
    <a href=""><i class="fa-brands fa-square-js"></i></a>
  </div>
</footer>

  </body>
</html>
