const hover_event = document.getElementById("hover_event");
const menu = document.getElementById("menu");
hover_event.addEventListener("click", () => {
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

const add_menu = document.getElementsByClassName("add_menu");
const add_menu_list = document.getElementsByClassName("add_menu_list");

for (let i = 0; i < document.getElementsByClassName("add_menu").length; i++) {
  add_menu[i].addEventListener("mouseover", () => {
    add_menu_list[i].style.opacity = "1";
  });
  add_menu[i].addEventListener("mouseout", () => {
    add_menu_list[i].style.opacity = "0";
  });
}

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
