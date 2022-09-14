/**
 * 
 */
  function pwdCheck(){
	
	var p1= document.getElementById('pwd').value;
	
	if (p1.length <0 || p1.length>20){
		document.getElementById('pwd').value= document.getElementById('pwd2').value='';
		document.getElementById('same').innerHTML='';
	}
	if(document.getElementById('pwd').value!='' && document.getElementById('pwd2').value!=''){
		if(document.getElementById('pwd').value == document.getElementById('pwd2').value){
			document.getElementById('same').innerHTML='입력하신 비밀번호가 일치합니다.';
			document.getElementById('same').style.color='blue';
		}else{
			document.getElementById('same').innerHTML='입력하신 비밀번호가 다릅니다.';
			document.getElementById('same').style.color='red';
		}
	}

}