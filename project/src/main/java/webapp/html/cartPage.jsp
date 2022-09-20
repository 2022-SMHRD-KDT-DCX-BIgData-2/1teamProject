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
    <title>관심상품 페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/20629bba5a.js"
      crossorigin="anonymous"
    ></script>
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
input[type=submit]{
background-color:white;
border:1px solid lightgray;
border-radius:5px;
padding: 5px;
}
main{
 position:relative;
 top:250px;
 margin-left:160px;
 height:800px;
 text-align:left;
 display:flex;
 }
table {
 text-align:center;
 margin-top:10px;
 border-collapse:collapse;
 border-top:1px solid lightgray;
 padding:20px;
}
table, tr, td{
border-bottom:1px solid lightgray;
}
.line{
padding:5px;
font-size:20px;
}
img{
width:50px;
height:50px;
}
table td:nth-child(1){
width:25px;
}
table td:nth-child(2){
width:100px;
}
table td:nth-child(3){
width:80px;
}
table td:nth-child(4){
width:350px;
padding:20px;
}
table td:nth-child(5){
width:150px;
}
table td:nth-child(6){
width:100px;
}
table td:nth-child(7){
width:100px;
padding:5px;
}
#main_footer{
display:absolute;
bottom:0px;
}
.addbox{
border:1px solid lightgray; 
border-radius:4px;
width:310px; 
height:400px;
margin:50px 40px;
padding:5px;
}
table p{
text-align:left;
}
#postcode{
width:150px;
}
#address, #extraAddress, #detailAddress{
width:280px;
}
ul li>input{
margin: 5px 5px;
padding:3px 8px;
border: 1px solid #f2f2f2;
border-radius:4px;
}
#findadd{
background-color:#f2f2f2;
}
.martname{
font-size:1px;
font-weight:bold;
padding:8px 15px;
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
		script.println("alert('로그인이 필요한 서비스입니다.')");
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
	 <div id = "martbox"  style="overflow:scroll; width:900px; height:500px;">
	 
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
    <div class="addbox">
    <div style="padding:15px;">배송지 &nbsp;<i class="fa-solid fa-location-dot"></i></div>
    <ul>
   		<li>
   			<input type = "text" name = "zipCode" id = "postcode" placeholder = "우편번호"/>
   			<input type = "button" id = "findadd" onclick = "execDaumPostcode()" value = "주소 검색"/>
   		</li>
   		<li>
   			<input type = "text" name = "userAddr1" id = "address" size = "100" placeholder = "주소"/><br>
   			<input type = "text" name = "userAddr3" id = "extraAddress" size = "48" placeholder = "참고항목"/>
   			<input type = "text" name = "userAddr2" id = "detailAddress" size = "45" placeholder = "상세주소"/>
   		</li>
   	<div style="padding:15px;">전체금액 &nbsp;<i class="fa-solid fa-wallet"></i></div>
   	<div style="margin:0px 32px;">
	<table style="text-align:center;">
		<tr>
			<td></td>
			<td style="width:130px;">금액</td>
		</tr>
		<tr>
			<td style="width:100px;padding: 2px">롯데마트</td>
			<td><%=dao.martPrice(userid, "롯데마트") %></td>
		</tr>
		<tr>
			<td style="width:100px;padding: 2px">이마트</td>
			<td><%=dao.martPrice(userid, "이마트") %></td>
		</tr>
		<tr>
			<td style="width:100px;padding: 2px">홈플러스</td>
			<td><%=dao.martPrice(userid, "홈플러스") %></td>
		</tr>
	</table>
	</div>
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	    // 우편번호 찾기 화면을 넣을 element
	    var element_layer = document.getElementById('layer');
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_layer.style.display = 'none';
	            },
	            width : '100%',
	            height : '100%',
	            maxSuggestItems : 5
	        }).embed(element_layer);
	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';
	
	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();
	    }
	
	    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	    function initLayerPosition(){
	        var width = 300; //우편번호서비스가 들어갈 element의 width
	        var height = 400; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 1.5; //샘플에서 사용하는 border의 두께
	
	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth+20) + 'px';
	    }
	</script>                  		
   
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
