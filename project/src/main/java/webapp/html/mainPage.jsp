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
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/style.css">
  </head>
<body>	
 	<header>
        <div id="header"></div>
     </header>
   
      <div id = "container">
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="10000">
              <img src="../image/background1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="2000">
              <img src="../image/background2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="../image/background4.jpg" class="d-block w-100" alt="...">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
 
      <% ProductDAO dao = new ProductDAO();
      //우리가원하는 상품 갯수만큼 랜덤숫자 부여하는 로직 ! 
	      int[] randomlist = new int[12];
	      int len = dao.productAll().size();//전체상품 길이를 받아오는 dao
	      //리스트의 길이만금 랜덤숫자 부여 
	      for(int i = 0 ;i<randomlist.length;i++){
	      	int a = (int)(Math.random()*len);
	      	randomlist[i] = a;
	      }
	      //타이틀 들어갈곳
	      String title[] = {"이 상품 어때요?","Query 추천상품","이것만 담아도 장바구니 뚝딱!","수고했어 오늘도"};
	      int j =0;
	      //위에 랜덤으로 정해준 숫자를 통해 상품 정보를 받아옴 dao.mainSug(randomlist[i])  ->randomlist[i]이게 매개변수 
	      for(int i = 0; i<10;i+=3){%>
      <section id="main_container">
          <div class="main_title"><%=title[j] %></div>
          <div class="main_contents">
            <div class="main_item"><a href=<%=dao.mainSug(randomlist[i]).getLink() %>>
            <a href="#"><div  class = "prodImg" style="background-image: url(<%=dao.mainSug(randomlist[i]).getProdImage()%>);"></a>
            <button onclick=""><i class="fa-solid fa-cart-plus"></i></button></div>
            <p class="mart"><%=dao.mainSug(randomlist[i]).getMartName()%><p>
            <p class="prodName"><%=dao.mainSug(randomlist[i]).getProdName()%><p>
            <p class="prodPrice"><%=dao.mainSug(randomlist[i]).getProdPrice()%>&nbsp;&nbsp;<span class="prodReview"><%=dao.mainSug(randomlist[i]).getProdStar()%>점</span>
            <span class="prodReview">(<%=dao.mainSug(randomlist[i]).getProdReview()%>개)</span></a>
            </div>
            <div class="main_item"><a href=<%=dao.mainSug(randomlist[i]).getLink() %>>
            <div class = "prodImg" style="background-image: url(<%=dao.mainSug(randomlist[i+1]).getProdImage()%>);">
            <button onclick=""><i class="fa-solid fa-cart-plus"></i></button></div>
            <p class="mart"><%=dao.mainSug(randomlist[i+1]).getMartName()%><p>
            <p class="prodName"><%=dao.mainSug(randomlist[i+1]).getProdName()%><p>
            <p class="prodPrice"><%=dao.mainSug(randomlist[i+1]).getProdPrice()%>&nbsp;&nbsp;<span class="prodReview"><%=dao.mainSug(randomlist[i]).getProdStar()%>점</span>
            <span class="prodReview">(<%=dao.mainSug(randomlist[i]).getProdReview()%>개)</span></a>
            </div>
            <div class="main_item"><a href=<%=dao.mainSug(randomlist[i]).getLink() %>>
            <div class = "prodImg" style="background-image: url(<%=dao.mainSug(randomlist[i+2]).getProdImage()%>);">
            <button onclick=""><i class="fa-solid fa-cart-plus"></i></button></div>
            <p class="mart"><%=dao.mainSug(randomlist[i+2]).getMartName()%><p>
            <p class="prodName"><%=dao.mainSug(randomlist[i+2]).getProdName()%><p>
            <p class="prodPrice"><%=dao.mainSug(randomlist[i+2]).getProdPrice()%>&nbsp;&nbsp;<span class="prodReview"><%=dao.mainSug(randomlist[i]).getProdStar()%>점</span>
            <span class="prodReview">(<%=dao.mainSug(randomlist[i]).getProdReview()%>개)</span></a>
            </div>
          </div>
      </section>
      <%
      //j인덱스 값 더해줌
      j++;
      } %>
     
  <footer id="main_footer">
    <div class="footer_box">
	    <div>스마트인재 개발원</div>
	    <div>tel) 070-4120-6295</div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>