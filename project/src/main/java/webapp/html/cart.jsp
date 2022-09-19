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
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>
</head>
<script src="https://kit.fontawesome.com/20629bba5a.js" crossorigin="anonymous"></script>
<style>
input[type:"submit"]{
font-family:FontAwesome;
}
#cartitem{
	position:fixed;
	z-index:1020;
	border:2px solid lightgray;
	border-radius:20px;
	height:330px;
	width:300px;
	right:50px;
	padding: 10px;
	background-color:white;
}
.item{
	border-bottom:1px solid lightgray;
	text-align:center;	
	padding:5px;
	margin-bottom:10px;
}
.like{
	font-size:10px;
	color:red;
}
input[type=submit]{
background-color:white;
border:1px solid gray;
border-radius:3px;
padding:2px 2px;
}

table td{
font-size:10px;
padding:3px;
}
table td:nth-child(1){
font-size:7px;
width:45px;
color:darkblue;
}
table td:nth-child(2){
font-size:7px;
width:170px;
}
table td:nth-child(3){
font-size:7px;
font-weight:bold;
width:48px;
}
.deleteBtn{
background-color:white;
padding: 0px 2px;
}
</style>
  <%	
//세션값에 들어있는 로그인 정보를 가져오는 로직
	String userid = null;
	if(session.getAttribute("userid") != null ){
		userid = (String)session.getAttribute("userid");
	}
	CartDAO dao2 = new CartDAO();
	ArrayList<CartDTO> list2 = dao2.cartlist(userid);
	
%>
<style>
#cartitem::-webkit-scrollbar {
    display: none;
}
</style>
<body>
	<div id = "cartitem" style="overflow-y:scroll; width:290ㅔㅌ; height:300px;">
		<div class="item"><i class="fa-solid fa-heart like"></i> 관심상품 <i class="fa-solid fa-heart like"></i></div>
	    <table>
	    <%if(userid != null){
	    for(int i = 0 ; i <list2.size();i++ ){
	    	%>
	      	<tr>
	      		<td><%=list2.get(i).getMartName() %></td> <!-- 마트이름 -->
	      		<td><%=list2.get(i).getProdName() %></td> <!-- 가격 -->
	      		<td><%=list2.get(i).getProdPrice() %>원</td> 
	      		<form action= "../deleteAction.jsp" method="post">
	      		<input type="text" name="prodCode" value="<%=list2.get(i).getProdCode() %>" style="display:none;">
	      		<td><input type="submit" class="deleteBtn" name = "delete" value="x"></td>
	      		</form>
	      	</tr>
	      	<% }
	    }else{%>
	    <tr>
      		<td style="width:300px; font-size:16px; text-align:center;">로그인이 필요한 서비스입니다.</td>		
      	</tr>
	    <%} %>
	    </table>
		
	</div>
	        <script type="text/javascript">
  window.addEventListener("scroll", (e) => {
	  const x = this.scrollX;
	  const y = this.scrollY;
	  const cartitem = document.getElementById("cartitem");
  	console.log(y);
  	if(y > 300){
  		cartitem.style.top = "150px";
  	}else{
  		cartitem.style.top = "300px";
  	}
  });
  </script>
</body>
</html>