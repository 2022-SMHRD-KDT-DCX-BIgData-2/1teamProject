<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
button{
position:relative;
right:45px;
top:278px;
border-radius:50%;
font-size:20px;
height:2em;
width:2em;
background-color:white;
}
button:hover{
color:orange;
}
</style>
<body>
	<form name = "addForm" action="../cartAction.jsp" method="post">
		<button type="submit" name="cartBtn" id="cartBtn" value="버튼" onclick="addToCart()"><i class="fa-solid fa-cart-plus"></i></button>
	</form>
</body>
<script>
function addToCart(){
	if(confirm("상품을 관심상품에 추가하시겠습니까?")){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
	
	let cb = document.getElementById("cartBtn");
	console.log(cd.value);
}

</script>
</html>