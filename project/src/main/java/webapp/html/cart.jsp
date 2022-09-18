<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#cartitem{
	position:fixed;
	z-index:1020;
	border:2px solid lightgray;
	border-radius:20px;
	height:300px;
	width:290px;
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
</style>
<body>
	<div id = "cartitem">
		<div class="item"><i class="fa-solid fa-heart like"></i> 관심상품 <i class="fa-solid fa-heart like"></i></div>
		<table>
			<tr>
				<td>1</td>
				<td><input type="checkbox" name = "item" class = "checkbox"></td>
			</tr>
	
		</table>
		<div>총 금액 : </div>
	</div>
</body>
</html>