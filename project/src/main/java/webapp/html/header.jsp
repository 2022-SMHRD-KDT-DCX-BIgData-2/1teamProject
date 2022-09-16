<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query</title>
    <script src="https://kit.fontawesome.com/20629bba5a.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="../css/style.css">
  </head>
<body>
<%	
	String userid = null;
	if(session.getAttribute("userid") != null ){
		userid = (String)session.getAttribute("userid");
	}
%>
    <header>
    <form action="../prodSearch.jsp" method="post">
        <div id="main_header">
          <div id="logo"><a href="mainPage.jsp"><img src="../image/logo.png" class="main_logo" alt="main_log"></a></div>
          <div id="Search">
            <input type="text" name="Search_bar" id="Search_bar" placeholder="검색어를 입력해주세요"/>
            <label><i class="fa-solid fa-magnifying-glass search-icon"></i><button style="display:none;"></button></label>
          </div>
          <%if(userid == null){%>
          <div id="login_sign">
            <a href="loginPage.jsp">로그인</a>
            <a href="create.jsp"> 회원가입</a>
            <a href="#">관심상품</a>
            <i class="fa-solid fa-cart-shopping cart-icon"></i>
          </div>
          <%}else{ %>
          <div id="login_sign">
          	<a href="#"><%=userid %>님 안녕하세요</a>
            <a href="../logout.jsp"> 로그아웃</a>
            <a href="#">관심상품</a>
            <i class="fa-solid fa-cart-shopping cart-icon"></i>
             </div>
          <%} %>
        </div>
        </form>
        <button id="page_up" onclick="window.scrollTo(0, 0)">TOP</button>
        <navbar id="navber">
          <a href ="mainPage.jsp" id="hover_event" class="menu_item" ><i class="fa-solid fa-bars"></i> &nbsp;&nbsp;카테고리
          </a>
          <div class="menu_item">
              <a href="martPage.jsp?martName=이마트">이마트</a>
            </ul>
          </div>
          <div class="menu_item">
          	  <a href="martPage.jsp?martName=이마트">롯데마트</a>
            </ul>
          </div>
          <div class="menu_item">
              <a>최저가 상품</a>
            </ul>
          </div>
        </navbar>
        <div id="menu_bar">
          <ul id="menu">
            <a href="categoryPage.jsp?categoryName=과일"><li><div class="add_menu">과일</div></li></a>
            <a href="categoryPage.jsp?categoryName=채소"><li><div class="add_menu">채소</div></li></a>
            <a href="categoryPage.jsp?categoryName=쌀/잡곡/견과"><li><div class="add_menu">쌀/잡곡/견과</div></li></a>
            <a href="categoryPage.jsp?categoryName=정육/계란"><li><div class="add_menu">정육/계란</div></li></a>
            <a href="categoryPage.jsp?categoryName=수산/건해산물"><li><div class="add_menu">수산/건해산물</div></li></a>
            <a href="categoryPage.jsp?categoryName=냉장/냉동/밀키트"><li><div class="add_menu">냉장/냉동/밀키트</div></li></a>
            <a href="categoryPage.jsp?categoryName=우유/유제품/베이커리"><li><div class="add_menu">우유/유제품/베이커리</div></li></a>
            <a href="categoryPage.jsp?categoryName=김치/반찬"><li><div class="add_menu">김치/반찬</div></li></a>
            <a href="categoryPage.jsp?categoryName=장류/양념/오일"><li><div class="add_menu">장류/양념/오일</div></li></a>
            <a href="categoryPage.jsp?categoryName=과자/간식/시리얼/떡"><li><div class="add_menu">과자/간식/시리얼/떡</div></li></a>
            <a href="categoryPage.jsp?categoryName=생수/음료/커피/차/주류"><li><div class="add_menu">생수/음료/커피/차/주류</div></li></a>
            <a href="categoryPage.jsp?categoryName=라면/통조림/즉석식품"><li><div class="add_menu">라면/통조림/즉석식품</div></li></a>
            <a href="categoryPage.jsp?categoryName=건강식품"><li><div class="add_menu">건강식품</div></li></a>
            
        </ul>
        </div>
      </header>
  <script src="../script/script.js"></script>
</body>
</html>