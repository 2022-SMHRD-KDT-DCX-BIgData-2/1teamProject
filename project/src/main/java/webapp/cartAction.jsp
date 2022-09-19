<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%request.setCharacterEncoding("UTF-8"); %>
    <%@ page import= "java.io.PrintWriter"%>
    <%@ page import= "com.cart.CartDAO" %>
    <%@page import="com.product.ProductDAO" %>
    <%@page import="com.product.ProductDTO" %>

    <jsp:useBean id= "dto" class= "com.product.ProductDTO" scope= "page"/>
	<jsp:setProperty name= "dto" property= "link"/>
	<jsp:setProperty name= "dto" property= "prodImage"/>
	<jsp:setProperty name= "dto" property= "martName"/>
	<jsp:setProperty name= "dto" property= "prodName"/>
	<jsp:setProperty name= "dto" property= "prodPrice"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	
%>

<%
	System.out.println(dto.getLink());
	System.out.println(dto.getProdImage());

	
	CartDAO cart = new CartDAO();
	int result = cart.add(userid, dto.getMartName(), dto.getProdImage(), dto.getProdName(), dto.getProdPrice(), dto.getLink());
	String url = request.getHeader("referer");
	if(result != -1)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href= '"+url+"'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 있습니다. 확인해주세요 ')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>