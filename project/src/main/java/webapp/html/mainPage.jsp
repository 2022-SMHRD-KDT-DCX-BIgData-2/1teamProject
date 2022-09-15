<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@page import="com.product.ProductDAO" %>
    <%@page import="com.product.ProductDTO" %>
    <%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query</title>
     <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#header").load("../html/header.jsp"); // 원하는 파일 경로를 삽입
      });
    </script>
    <script src="https://kit.fontawesome.com/20629bba5a.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="../css/style.css">
  </head>
<body>	
 	<header>
        <div id="header"></div>
     </header>
      <div id="container">
        <section id="banner">
          <img id="prevBtn" />
          <div id="bannerBox">
            <ul>
              <li class="banner_item">1</li>
              <li class="banner_item">2</li>
              <li class="banner_item">3</li>
              <li class="banner_item">4</li>
            </ul>
          </div>
          <img id="nextBtn" />
        </section>
      </div>
      <% ProductDAO dao = new ProductDAO();
	      int[] randomlist = new int[12];
	      int len = dao.productAll().size();
	      for(int i = 0 ;i<randomlist.length;i++){
	      	int a = (int)(Math.random()*len);
	      	randomlist[i] = a;
	      }
	      String title[] = {"이 상품 어때요?","Query 추천상품","이것만 담아도 장바구니 뚝딱!","수고했어 오늘도"};
	      int j =0;
	      for(int i = 0; i<10;i+=3){%>
      <section id="main_container">
          <div class="main_title"><%=title[j] %></div>
          <div class="main_contents">
            <div class="main_item"><a>
            <div style="background-image: url(<%=dao.mainSug(randomlist[i]).getProdImage()%>); width:250px; height:320px;"></div>
            <p><%=dao.mainSug(randomlist[i]).getMartName()%><p>
            <p><%=dao.mainSug(randomlist[i]).getProdName()%><p>
            <p><%=dao.mainSug(randomlist[i]).getProdPrice()%><p></a>
            </div>
            <div class="main_item"><a>
            <div style="background-image: url(<%=dao.mainSug(randomlist[i+1]).getProdImage()%>); width:250px; height:320px;"></div>
            <p><%=dao.mainSug(randomlist[i+1]).getMartName()%><p>
            <p><%=dao.mainSug(randomlist[i+1]).getProdName()%><p>
            <p><%=dao.mainSug(randomlist[i+1]).getProdPrice()%><p></a>
            </div>
            <div class="main_item"><a>
            <div style="background-image: url(<%=dao.mainSug(randomlist[i+2]).getProdImage()%>); width:250px; height:320px;"></div>
            <p><%=dao.mainSug(randomlist[i+2]).getMartName()%><p>
            <p><%=dao.mainSug(randomlist[i+2]).getProdName()%><p>
            <p><%=dao.mainSug(randomlist[i+2]).getProdPrice()%><p></a>
            </div>
          </div>
      </section>
      <%j++;
      } %>
     
  <footer id="main_footer">
    <div class="footer_box">
      <div>스마트인재 개발원<span style="font-size: 18px;"> tell ) 070-4120-6295</span></div>
      <div>K-Digital Training</div>
      <div>DCX기반 빅데이터분석 서비스 개발자 과정</div>
    </div>
    <div class="footer_box">
      <div>TEAM_ NEXTLEVEL </div>
      <div id="team_name">
        <div>오진서</div>
        <div>이지영</div>
        <div>임태규</div>
        <div>이정욱</div>
      </div>
    </div>
    <div class="icon_style">
      <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a>
      <a href="https://github.com/"><i class="fa-brands fa-square-github"></i></a>
      <a href="https://www.youtube.com/channel/UCubIpLB7cA9tWIUZ26WFKPg"><i class="fa-brands fa-youtube"></i></a>
      <a href=""><i class="fa-brands fa-square-js"></i></a>
    </div>
  </footer>

</body>
</html>