<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.client.MemberDAO" %>
<%@ page import= "java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id= "dto" class= "com.client.MemberDTO" scope= "page"/>
<jsp:setProperty name= "dto" property= "userid"/>
<jsp:setProperty name= "dto" property= "pwd"/>
<jsp:setProperty name= "dto" property= "name"/>
<jsp:setProperty name= "dto" property= "email_id"/>
<jsp:setProperty name= "dto" property= "email_domain"/>
<jsp:setProperty name= "dto" property= "phone"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(dto.getUserid() == null || dto.getPwd() == null || dto.getName() == null || 
	dto.getEmail_id() == null ||dto.getEmail_domain() == null  || dto.getPhone() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");		
	}else{
		MemberDAO member = new MemberDAO();
		int result= member.join(dto);
		if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			session.setAttribute("userid", dto.getUserid());
			script.println("<script>");
			script.println("location.href = './html/loginPage.jsp'");// 매인 페이지
			script.println("</script>");
		}
	}

	
	
%>
</body>
</html>