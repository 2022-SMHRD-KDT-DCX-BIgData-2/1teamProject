<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@page import="com.product.ProductDAO" %>
    <%@page import="com.product.ProductDTO" %>
    <%@page import="java.io.PrintWriter" %>
    <%@ page import= "com.product.ProductDAO" %>
    <%@ page import= "com.product.ProductDTO" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색기능 로직</title>
</head>
<body>
	<%
		System.out.println(request.getParameter("Search_bar"));
		String search = request.getParameter("Search_bar");
		System.out.println(search);
		PrintWriter print = response.getWriter();
		if(search == ""){ 
			print.println("<script>alert('검색어를 입력해주세요'); location.href = './html/mainPage.jsp';</script>");	
		}else if(search.equals("과일")||search.equals("채소")||search.equals("건강식품")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName="+search+"';</script>");
		}else if(search.equals("쌀")||search.equals("잡곡")||search.equals("견과")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=쌀/잡곡/견과';</script>");
		}else if(search.equals("정육")||search.equals("계란")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=정육/계란';</script>");
		}else if(search.equals("수산")||search.equals("건해산물")||search.equals("해산물")||search.equals("건어물")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=수산/건해산물';</script>");
		}else if(search.equals("냉장")||search.equals("냉동")||search.equals("밀키트")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=냉장/냉동/밀키트';</script>");
		}else if(search.equals("우유")||search.equals("유제품")||search.equals("베이커리")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=우유/유제품/베이커리';</script>");
		}else if(search.equals("김치")||search.equals("반찬")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=김치/반찬';</script>");
		}else if(search.equals("장류")||search.equals("양념")||search.equals("오일")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=장류/양념/오일';</script>");
		}else if(search.equals("과자")||search.equals("간식")||search.equals("시리얼")||search.equals("떡")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=과자/간식/시리얼/떡';</script>");
		}else if(search.equals("생수")||search.equals("음료")||search.equals("커피")||search.equals("차")||search.equals("주류")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=생수/음료/커피/차/주류';</script>");
		}else if(search.equals("라면")||search.equals("통조림")||search.equals("즉석식품")){
			print.println("<script> location.href = './html/categoryPage.jsp?categoryName=라면/통조림/즉석식품';</script>");
		}else{
			ProductDAO dao = new ProductDAO();
			if(dao.productSearch(search) != null){
				print.println("<script> location.href = './html/searchPage.jsp?prodName="+search+"';</script>");
			}else{
				print.println("<script>alert('해당 상품은 없습니다 다시 검색해주세요.'); location.href = './html/mainPage.jsp';</script>");	
			}
		}
		%>
</body>
</html>