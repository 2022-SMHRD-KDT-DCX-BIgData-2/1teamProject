<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.client.MemberDAO" %>
<%@ page import= "java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id= "dto" class= "com.client.MemberDTO" scope= "page"/>
<jsp:setProperty name= "dto" property= "userid"/>
<jsp:setProperty name= "dto" property= "pwd"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDAO member = new MemberDAO();
	int result= member.login(dto.getUserid(), dto.getPwd());//오류가 있는데 모르겠어요
	if (result ==1){
		PrintWriter script = response.getWriter();
		session.setAttribute("userid", dto.getUserid());
		script.println("<script>");
		script.println("location.href = './html/mainPage.jsp'");// 매인 페이지
		script.println("</script>");
	}
	else if (result ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (result ==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (result ==-2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
%>

</body>
</html>