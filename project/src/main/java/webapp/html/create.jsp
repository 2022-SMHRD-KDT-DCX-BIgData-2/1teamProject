<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <script
      src="https://kit.fontawesome.com/20629bba5a.js"
      crossorigin="anonymous"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#header").load("../html/header.jsp"); // 원하는 파일 경로를 삽입
      });
    </script>
    <link rel="stylesheet" href="../css/create.css" />
    <link rel="stylesheet" href="../css/style.css" />
  </head>
  <body>
    <header>
      <div id="header"></div>
    </header>
    <main>
    <form method= "post" action= "../createAction.jsp">
      <div class="bigbox1">
        <div id="create">회원가입</div>
        <div class="bigbox2">
          <div class="smallbox1"><label>아이디</label></div>
          <div>
            <input
              type="text"
              name="userid"
              class="inputBox"
              placeholder="아이디를 입력해주세요"
            />
          </div>
          <div><button type="button" class="idBtn">중복확인</button></div>
        </div>
        <div class="bigbox2">
          <div class="smallbox1"><label>비밀번호</label></div>
          <div>
            <input
              type="password"
              name="pwd"
              class="inputBox"
              placeholder="비밀번호를 입력해주세요"
            />
          </div>
        </div>
        <div class="bigbox2">
          <div class="smallbox1"><label>비밀번호 확인</label></div>
          <div>
            <input
              type="password"
              name="pw2"
              class="inputBox"
              placeholder="비밀번호를 한번 더 입력해주세요"
            />
          </div>
        </div>
        <div class="bigbox2">
          <div class="smallbox1"><label>이름</label></div>
          <div>
            <input
              type="text"
              name="name"
              class="inputBox"
              placeholder="이름을 입력해주세요"
            />
          </div>
        </div>
        <div class="bigbox2">
          <div class="smallbox1"><label>이메일</label></div>
          <div>
            <input
              type="text"
              name="email_id"
              id="email_id"
              placeholder="이메일 아이디"
              class="inputBox emailBox"
            />@
            <input
              type="text"
              name="email_domain"
              id="email_domain"
              placeholder="ex) naver.com"
              class="inputBox emailBox"
            />&nbsp;&nbsp;&nbsp;
            <select
              name="email_sel"
              id="email_sel"
              style="font-size: 16px; height: 30px" onchange="change_email();">
              	<option value="">직접입력</option>
              	<option value="naver.com">naver.com</option>
              	<option value="hanmail.net">hanmail.net</option>
              	<option value="gmail.com">gmail.com</option>
              	<option value="nate.com">nate.com</option>
              	<option value="kakao.com">kakao.com</option>
            </select>
          </div>
        </div>
        <div class="bigbox2">
          <div class="smallbox1"><label>휴대폰</label></div>
          <div>
            <input
              type="text"
              name="phone"
              class="inputBox"
              placeholder="전화번호입력해주세요"
            />
          </div>
        </div>
        <div class="loginBtn" style="text-align: center">
          <button type="submit">회원가입</button>
        </div>
      </div>
      </form>
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
    </main>
    <script src="../script/change_email.js"></script>
  </body>
</html>
