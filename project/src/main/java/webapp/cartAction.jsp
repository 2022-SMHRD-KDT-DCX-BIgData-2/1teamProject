<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.cart.CartDAO" %>
<%@ page import= "java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id= "dto" class= "com.cart.CartDTO" scope= "page"/>
<jsp:setProperty name= "dto" property= "userid"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	CartDAO cart = new CartDAO();
	int result = cart.add(dto);
	if(result == 1 ){
		
	}
%>
</body>
</html>