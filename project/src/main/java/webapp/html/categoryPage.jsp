<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.*" %>
    <%@page import="com.product.ProductDAO" %>
    <%@page import="com.product.ProductDTO" %>
    <%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<%
	String categoryName = null;
	if(request.getParameter("categoryName")!=null){
		categoryName = (String)request.getParameter("categoryName");
	}
	String pageNum = null;
	int pageint = 1;
	if(request.getParameter("pageNum") !=null){
		pageNum = (String)request.getParameter("pageNum");
		pageint = Integer.parseInt(pageNum);
	}
	
	
%>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리별</title>
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
        <div class="main_title"><%=categoryName %></div>
      </div>
    </main>
    
     <% ProductDAO dao = new ProductDAO();
     	ArrayList<ProductDTO> list = dao.productList(categoryName);
	      System.out.println(categoryName);
	   try{
	    if(pageint == 1){  
	      for(int i = 0 ; i< 97;i+=3){%>
      <section id="main_container">
          <div class="main_contents">
            <div class="main_item"><a><img src=<%=list.get(i).getProdImage()%>></a>
            <p><%=list.get(i).getProdName()%><p>
            <p><%=list.get(i).getProdPrice()%><p>
            </div>
            <div class="main_item"><img src=<%=list.get(i+1).getProdImage()%>>
            <p><%=list.get(i+1).getProdName()%><p>
            <p><%=list.get(i+1).getProdPrice()%><p></div>
            <div class="main_item"><img src=<%=dao.productList(categoryName).get(i+2).getProdImage()%>>
            <p><%=list.get(i+2).getProdName()%><p>
            <p><%=list.get(i+2).getProdPrice()%><p>
            </div>
          </div>
      </section>
      <%}
	    }else{
    	  for(int i = pageint*100 ; i< (pageint*100)+97;i+=3){%>
          <section id="main_container">
              <div class="main_contents">
                <div class="main_item"><a><img src=<%=list.get(i).getProdImage()%>></a>
                <p><%=list.get(i).getProdName()%><p>
                <p><%=list.get(i).getProdPrice()%><p>
                </div>
                <div class="main_item"><img src=<%=list.get(i+1).getProdImage()%>>
                <p><%=list.get(i+1).getProdName()%><p>
                <p><%=list.get(i+1).getProdPrice()%><p></div>
                <div class="main_item"><img src=<%=dao.productList(categoryName).get(i+2).getProdImage()%>>
                <p><%=list.get(i+2).getProdName()%><p>
                <p><%=list.get(i+2).getProdPrice()%><p>
                </div>
              </div>
          </section>
      <% }}%>
   <nav aria-label="Page navigation example">
    <ul class="pagination">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <%
      	System.out.print(list.size()/100);
      	for(int j = 1;j<(list.size()/100);j++){
      %>
      <li class="page-item"><a class="page-link" href="categoryPage.jsp?categoryName=<%=categoryName %>&&pageNum=<%=j%>"><%=j%></a></li>
	<%}
      	}catch(Exception e){%>
      		 </div>
          </section>
          <style></style>
      	<% }%>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
    <footer id="main_footer">
      <div class="footer_box">
        <div>
          스마트인재 개발원<span style="font-size: 18px">
            tell ) 070-4120-6295</span
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
 
  </body>
</html>