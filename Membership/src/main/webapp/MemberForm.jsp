<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/change_email.js"></script>
<script src="./js/juminCheck.js"></script>
<style>
	.title{margin:40px 30px 30px 30px;}
	.container{width:900px;}
	.right{float:right;}
	.red{color:red;}
	tbody.tbody>tr{display:table; width:900px;}
	tbody.tbody>tr>td:nth-child(1){width:16%; vertical-align:middle; display:table-cell; text-align:center;}
	tbody.tbody>tr>td:nth-child(2){width:100%;}
	#detailAddress::placeholder{color:blue}
</style>
</head>
<body>
   <form name="memberForm" method="POST" action="member_control.jsp">
      <input type="hidden" name="action" value="insert"/>
      <div align="center">
         <h1 class="title">회원가입</h2>
         <div class="container">
            <div class="right"><span class="red">*</span>필수입력항목</div>
            <table border="2">
               <thead>
                  <tr>
                     <th colspan="2" border="0" bgcolor="orange">회원 가입</th>
                  </tr>
               </thead>
               <tbody class="tbody">
                  <tr>
                     <td>아이디<span class="red">*</span></td>
                     <td>
                        <input type="text" name="mem_id"
                        placeholder="6자 이상의 영문자 및 숫자"
                        required autofocus
                         />
                        <input type="button" value="ID중복확인" />
                     </td>
                  </tr>
                  <tr>
                     <td>비밀번호<span class="red">*</span></td>
                     <td>
                        <input type="password" name="mem_passwd"
                        maxlength="12" minlength="8"
                        required
                         />
                        <span>8~12자리 영문 대소문자와 숫자, 특수문자만 입력</span>
                     </td>
                  </tr>
                  <tr>
                     <td>비밀번호확인<span class="red">*</span></td>
                     <td>
                        <input type="password" name="mem_passwd"
                        maxlength="12" minlength="8"
                        required
                         />
                     </td>
                  </tr>
                  <tr>
                     <td>이름<span class="red">*</span></td>
                     <td>
                        <input type="text" name="mem_name"
                        required
                         />
                     </td>
                  </tr>
                  <tr>
                     <td>닉네임<span class="red"></span></td>
                     <td>
                        <input type="text" name="mem_nickname"
                        required
                         />
                     </td>
                  </tr> 
                  <tr>
                     <td>이메일<span class="red">*</span></td>
                     <td>
                        <input type="text" name="mem_email_id" id = "email_id"/>@
                        <input type="text" name="mem_email_domain" id = "email_add"/>
                        <select name = "email_sel" id = "email_sel" style = "font-size:16px; height:30px;" onchange="change_email();">
                        	<option value = "">직접입력</option>
                        	<option value = "naver.com">naver.com</option>
                        	<option value = "hanmail.net">hanmail.net</option>
                        	<option value = "gmail.com">gmail.com</option>
                        	<option value = "nate.com">nate.com</option>
                        	<option value = "kakao.com">kakao.com</option>
                        	<option value = "korea.com">korea.com</option>
                        	<option value = "dreamwiz.com">dreamwiz.com</option>
                       	</select>
                     </td>
                  </tr>
                  <tr>
                     <td>주민번호<span class="red">*</span></td>
                     <td> <!-- 일반적으로는 함수명이 오는데 주민번호js는 약간 특이케이스... -->
                        <input type="text" name="mem_num1" maxlength = "6" onkeyup="if(this.value.length == 6) memberForm.mem_num2.focus();"/> -
                        <input type="text" name="mem_num2" maxlength = "7"/>
                        <input type="button" value = "주민번호 정상 유무 체크" onclick = "juminCheck(mem_num1.value, mem_num2.value)"/>
                     </td>
                  </tr> 
                  <tr>
                     <td>휴대폰번호<span class="red">*</span></td>
                     <td>
                        <input type="tel" name="mem_phone" maxlength ="13" pattern='010-[0-9]{4}-[0-9]{4}' required/> 
                     </td>
                  </tr> 
                  <tr>
                     <td>성별</td>
                     <td>
                        <input type="radio" name="mem_gender" value="남성" checked/>남성&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="mem_gender" value="여성"/>여성&nbsp;&nbsp;&nbsp;
                     </td>
                  </tr> 
                  <tr>
                  	<td>생년월일<span class = "red">*</span></td>
                  	<td>
                  		<script>
                  			const today = new Date();
                  			const toyear = parseInt(today.getFullYear()); //2022
                  			const start = toyear - 15; //만14세? 이하는 부모동의 필요
                  			const end = toyear - 80;
                  			
                  			document.write("<select name = mem_birthday1> ");
                  			for(i=start; i>=end; i--){
                  				document.write("<option value='"+i+"'>" + i);
                  			}
                  			document.write("</select>년 ")
                  			
                  			//[해결문제] 월과 일 소스 코딩~              
                  			document.write("<select name = mem_birthday2> ");
                  			for(i=1; i<=12; i++){
                  				document.write("<option value='"+i+"'>" + i);
                  			}
                  			document.write("</select>월");    
                  			
                  			document.write("<select name = mem_birthday3> ");
                  			for(i=1; i<=31; i++){
                  				document.write("<option value='"+i+"'>" + i);
                  			}
                  			document.write("</select>일");
                  		</script>
                  	</td>
                  </tr>
                  <tr>
                     <td>직업<span class="red">*</span></td>     
                     <td>
                        <select name = "mem_job">
                        	<option value = "">직업선택</option>
                        	<option value = "웹프로그래머">웹프로그래머</option>
                        	<option value = "회사원">회사원</option>
                        	<option value = "소방관">소방관</option>
                        	<option value = "데이터분석가">데이터분석가</option>
                        	<option value = "기타">기타</option>
                        </select>
                     </td>
                  </tr>                   
                  <tr>
                    <td>주소<span class="red">*</span></td>                  
                  	<td>
                  		<div class = "inputArea">
                  		<p>
                  			<input type = "text" name = "zipCode" id = "postcode" placeholder = "우편번호"/>
                  			<input type = "button" onclick = "execDaumPostcode()" value = "우편번호 찾기"/>
                  		</p>
                  		<p>
                  			<input type = "text" name = "userAddr1" id = "address" size = "100" placeholder = "주소"/><br>
                  			<input type = "text" name = "userAddr3" id = "extraAddress" size = "48" placeholder = "참고항목(도로명인 경우 : 지역 동이름과 아파트 이름)"/>
                  			<input type = "text" name = "userAddr2" id = "detailAddress" size = "45" placeholder = "상세주소(아파트 동호수 또는 빌딩이름 입력)"/>
                  		</p>
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
						        var borderWidth = 5; //샘플에서 사용하는 border의 두께
						
						        // 위에서 선언한 값들을 실제 element에 넣는다.
						        element_layer.style.width = width + 'px';
						        element_layer.style.height = height + 'px';
						        element_layer.style.border = borderWidth + 'px solid';
						        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
						        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
						        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
						    }
						</script>                  		
                  		</div>
                  	</td>
                  </tr> 
                  <tr>
                  	<td colspan="2" style="text-align:center">
                  		<input type = "submit" value = "회원가입 등록"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  		<input type = "reset" value = "다시쓰기"/>
                  	</td>
                  </tr>             
               </tbody>
            </table>
         </div>
      </div>
   </form>
</body>
</html>