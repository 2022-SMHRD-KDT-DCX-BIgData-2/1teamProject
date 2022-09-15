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
	      for(int i = 0 ; i< 97;i+=3){
	    	  %>
      <section id="main_container">
          <div class="main_contents">
            <div class="main_item" ><a>
            <div style="background-image: url(<%=list.get(i).getProdImage()%>); width:250px; height:320px;"></div>
            <p><%=list.get(i).getMartName()%></p>
            <p><%=list.get(i).getProdName()%></p>
            <p><%=list.get(i).getProdPrice()%></p></a>
            </div>
            <div class="main_item" ><a>
            <div style="background-image: url(<%=list.get(i+1).getProdImage()%>); width:250px; height:320px;"></div>
            <p><%=list.get(i+1).getMartName()%></p>
            <p><%=list.get(i+1).getProdName()%></p>
            <p><%=list.get(i+1).getProdPrice()%></p></a>
            </div>
            <div class="main_item" ><a>
            <div style="background-image: url(<%=list.get(i+2).getProdImage()%>); width:250px; height:320px;"></div>
            <p><%=list.get(i+2).getMartName()%></p>
            <p><%=list.get(i+2).getProdName()%></p>
            <p><%=list.get(i+2).getProdPrice()%></p></a>
            </div>
          </div>
      </section>
      <%	}
	    }else if(pageint == list.size()/100){
	    	int size =0;
	    	if((list.size()%100)%3 == 0){
	    		size = (pageint*100)+(list.size()%100)-2;
	    	}else if((list.size()%100)%3 == 1){
	    		size = (pageint*100)+(list.size()%100)-1;
	    	}else{
	    		size = (pageint*100)+(list.size()%100);
	    	}
	    	for(int i = pageint*100 ; i< size ;i+=3){%>
		      <section id="main_container">
		          <div class="main_contents">
		            <div class="main_item" ><a>
		            <div style="background-image: url(<%=list.get(i).getProdImage()%>); width:250px; height:320px;"></div>
		            <p><%=list.get(i).getMartName()%></p>
		            <p><%=list.get(i).getProdName()%></p>
		            <p><%=list.get(i).getProdPrice()%></p></a>
		            </div>
		            <div class="main_item" ><a>
		            <div style="background-image: url(<%=list.get(i+1).getProdImage()%>); width:250px; height:320px;"></div>
		            <p><%=list.get(i+1).getMartName()%></p>
		            <p><%=list.get(i+1).getProdName()%></p>
		            <p><%=list.get(i+1).getProdPrice()%></p></a>
		            </div>
		            <div class="main_item" ><a>
		            <div style="background-image: url(<%=list.get(i+2).getProdImage()%>); width:250px; height:320px;"></div>
		            <p><%=list.get(i+2).getMartName()%></p>
		            <p><%=list.get(i+2).getProdName()%></p>
		            <p><%=list.get(i+2).getProdPrice()%></p></a>
		            </div>
		          </div>
		      </section>
	      <% }
	    	}
	    else{
    	  for(int i = pageint*100 ; i< (pageint*100)+97;i+=3){%>
          <section id="main_container">
              <div class="main_contents">
                <div class="main_item"><a><img src=<%=list.get(i).getProdImage()%>></a>
                <p><%=list.get(i).getMartName()%><p>
                <p><%=list.get(i).getProdName()%><p>
                <p><%=list.get(i).getProdPrice()%><p>
                </div>
                <div class="main_item"><img src=<%=list.get(i+1).getProdImage()%>>
                <p><%=list.get(i+1).getMartName()%><p>
                <p><%=list.get(i+1).getProdName()%><p>
                <p><%=list.get(i+1).getProdPrice()%><p></div>
                <div class="main_item"><img src=<%=dao.productList(categoryName).get(i+2).getProdImage()%>>
                <p><%=list.get(i+2).getMartName()%><p>
                <p><%=list.get(i+2).getProdName()%><p>
                <p><%=list.get(i+2).getProdPrice()%><p>
                </div>
              </div>
          </section>
      <% }}
	    }catch(Exception e){%>
      		 </div>
          </section>
          <style></style>
      	<% }%>
   <nav aria-label="Page navigation example">
    <ul class="pagination">
   	<!-- 이전버튼 -->
      <li class="page-item">
      <%int pagebtn = 0;
      	if(pageint >= 11){
      		pagebtn = pageint-10;
    	  %>
      <% }else{
      	pagebtn = 1;
      	}%>
        <a class="page-link" href="categoryPage.jsp?categoryName=<%=categoryName %>&&pageNum=<%=pagebtn%>" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <%
      	
      	int list_length = 0;
      	if((list.size()%100) == 0){
      		list_length = list.size()/100;
      	}else{
      		list_length = list.size()/100+1;
      	}
      	System.out.println(list_length);
      	System.out.println((list.size()%100));
      	if((list.size()%100) == 0){
      		int lastPage = 0;
      		if( (10+pageint) > list_length){
      			lastPage = list_length;
      		}else{
      			lastPage = 10+pageint;
      		}
          	//입력된 값 + 10 보다 마지막 페이지가 작을 경우 마지막 페이지만 나와주게하는 조건문 생성 
          		for(int j = pageint ;j< lastPage;j++){
            	      %>
            	      <li class="page-item"><a class="page-link" href="categoryPage.jsp?categoryName=<%=categoryName %>&&pageNum=<%=j%>"><%=j%></a></li>
            	<%}
      	}else{
      		 if((pageint%10 != 0)&&(pageint/10 == list_length/10)){
          		int last = pageint/10*10;
          		for(int j = last ;j< list_length;j++){
            	      %>
            	      <li class="page-item"><a class="page-link" href="categoryPage.jsp?categoryName=<%=categoryName %>&&pageNum=<%=j%>"><%=j%></a></li>
            		<%}
          	}
      		 else if (pageint/10 == list_length/10){
          		for(int j = pageint ;j< pageint + list_length%10 ;j++){
          	      %>
          	      <li class="page-item"><a class="page-link" href="categoryPage.jsp?categoryName=<%=categoryName %>&&pageNum=<%=j%>"><%=j%></a></li>
          		<%}
          	}else{
          		for(int j = pageint ;j< 10+pageint;j++){
          	      %>
          	      <li class="page-item"><a class="page-link" href="categoryPage.jsp?categoryName=<%=categoryName %>&&pageNum=<%=j%>"><%=j%></a></li>
          		<%
          		}
        	}
      	}
       %>
       <!-- 다음버튼 -->
      <li class="page-item">
      <%int nextbtn = 0;
      	if((pageint+10) >= list_length){
      		nextbtn = list_length-10;
      	}else{
      		nextbtn = pageint+10;
      	}
      	%>
        <a class="page-link" href="categoryPage.jsp?categoryName=<%=categoryName %>&&pageNum=<%=nextbtn%>" aria-label="Next">
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