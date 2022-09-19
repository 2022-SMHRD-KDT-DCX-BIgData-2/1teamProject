<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<%@page import="com.product.ProductDAO" %>
<%@page import="com.product.ProductDTO" %>
<%@page import="com.client.MemberDTO" %>
<%@page import="com.client.MemberDAO" %>
<%@page import="com.cart.CartDAO" %>
<%@page import="com.cart.CartDTO" %>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관심상품 페이지 ! </title>
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
  #martbox::-webkit-scrollbar {
    display: none;
}
main{
 position:relative;
 top:250px;
 margin: 0px auto;
 width:800px;
 height:800px;
 text-align:left;
 }
table {
 width: 100%;
 text-align:center;
 margin-top:10px;
}
table tr{
height:70px;
}
.line{
border-bottom:1px solid gray;
padding:5px;
}
img{
width:70px;
height:70px;
}
table td:nth-child(1){
width:25px;
}
table td:nth-child(2){
width:100px;
}
table td:nth-child(3){
width:70px;
}
table td:nth-child(4){
width:350px;
}
table td:nth-child(5){
width:150px;
}
table td:nth-child(6){
width:100px;
}
table td:nth-child(7){
width:50px;
}
#main_footer{
display:absolute;
bottom:0px;
}
</style>
  
  <%	
//세션값에 들어있는 로그인 정보를 가져오는 로직
	String userid = null;
	if(session.getAttribute("userid") != null ){
		userid = (String)session.getAttribute("userid");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	CartDAO dao = new CartDAO();
	ArrayList<CartDTO> list = dao.cartlist(userid);
%>
  <body>
    <header>
      <div id="header"></div>
    </header>
    <main>
	 <div id = "martbox"  style="overflow:scroll; width:1440px; height:500px;">
	 
	   	<div class="line" >관심상품목록</div>
	    <table>
	    <%for(int i = 0 ; i <list.size();i++ ){
	    	%>
	      	<tr>
	      		<td><%=i+1 %></td>
	      		<td><%=list.get(i).getMartName() %></td> <!-- 마트이름 -->
	      		<td><img src=<%=list.get(i).getProdImage() %>></td> <!-- 마트이미지 -->
	      		<td><%=list.get(i).getProdName() %></td> <!-- 가격 -->
	      		<td><%=list.get(i).getProdPrice() %>원</td> <!-- 가격 -->
	      		<td><a href=<%=list.get(i).getLink() %>>상세정보</td> <!-- 가격 -->
	      		<form action="../deleteAction.jsp" method="post">
	      		<input type="text" name="prodCode" value="<%=list.get(i).getProdCode() %>" style="display:none;">
	      		<td><input type="submit" value="제거" name="delete"></td>
	      		</form>
	      	</tr>
	      	<% }%>
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
