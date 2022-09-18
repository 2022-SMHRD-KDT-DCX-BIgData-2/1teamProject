const hover_event = document.getElementById("hover_event");
const menu = document.getElementById("menu");
hover_event.addEventListener("mouseover", () => {
  if (menu.style.display === "block") {
    menu.style.display = "none";
  } else {
    menu.style.display = "block";
  }
});

menu.addEventListener("mouseleave", () => {
  if (menu.style.display === "block") {
    menu.style.display = "none";
  } else {
    menu.style.display = "block";
  }
});

const pagecontroller = document.getElementById("page_up");
let ScorllY = 380;

addEventListener("scroll", () => {
  const pageScorll = window.scrollY;
  const main_header = document.getElementById("main_header");
  const scroll_input = document.getElementById("scroll_input");
  if (ScorllY <= pageScorll) {
    pagecontroller.style.opacity = "1";
    main_header.style.display = "none";
    scroll_input.style.display = "block";
  } else {
    pagecontroller.style.opacity = "0";
    main_header.style.display = "flex";
    scroll_input.style.display = "none";
  }
});
/**
 * 배너 동작 로직
 */
const bannerBox = document.querySelector("#bannerBox > ul");
const bannerItem = document.querySelectorAll(".banner_item");
//배열 반환

const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

const size = bannerItem[0].clientWidth;
//패딩을 포함한 넓이를 가지고오는 기능
//해당 요소의 길이를 가지고 온다
let counter = 0;

// addEventListener
// 이벤트를 동작시킵니다

nextBtn.addEventListener("click", () => {
  if (counter < bannerItem.length - 1) {
    counter++;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  } else if (counter === bannerItem.length - 1) {
    counter = 0;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  }
});

prevBtn.addEventListener("click", () => {
  if (counter > 0) {
    counter--;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  } else if (counter === 0) {
    counter = bannerItem.length - 1;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  }
});
/*
 setInterval
 :반복 
 */
let banner = setInterval(() => {
  if (counter < bannerItem.length - 1) {
    counter++;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  } else if (counter === bannerItem.length - 1) {
    counter = 0;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  }
}, 5000);
//1000ms = 1초
//업로드 확인
