/**
 *  사용자가 이메일 입력 시 도메인을 선택하면 자동으로 세팅하기
 *  change_email.js 자바스크립트 파일
 */

function change_email() {
  var email_add = document.getElementById("email_domain");
  var email_sel = document.getElementById("email_sel");

  //사용자가 선택하나 옵션의 순서와 값 구하기
  var idx = email_sel.options.selectedIndex;
  var val = email_sel.options[idx].value;

  email_add.value = val;
}
