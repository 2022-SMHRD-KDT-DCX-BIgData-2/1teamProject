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
<title>Insert title here</title>
</head>
<body>
<%
CartDAO dao = new CartDAO();
CartDTO dto = new CartDTO();
int prodCode = Integer.parseInt(request.getParameter("prodCode"));
 dto.setProdCode(prodCode);
int result = dao.delete(dto.getProdCode());
if(result != -1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href='./html/cartPage.jsp'");
	script.println("</script>");
}

%>
</body>
</html>