// Javascript of responsive navigation menu
const menuBtn = document.querySelector(".menu-btn");
const navigation = document.querySelector(".navigation");

menuBtn.addEventListener("click", () => {
    menuBtn.classList.toggle("active");
    navigation.classList.toggle("active");
});

header.style.backgroundColor = "rgba(0, 0, 0, 0)";
window.onscroll = () => {
    var Y = this.scrollY;
    if (currentscrollY == 0) {
        header.style.backgroundColor = "rgba(0, 0, 0, 0)";
    } else if (currentscrollY != Y) {
        header.style.backgroundColor = "#0D6780";
    }
}

// Javascript for video slider navigation
const btns = document.querySelectorAll(".nav-btn");
const slides = document.querySelectorAll(".video-slide");
const contents = document.querySelectorAll(".content");
const videoSlide = document.querySelector(".video-slide");

var sliderNav = function (manual) {
    btns.forEach((btn) => {
        btn.classList.remove("active");
    });

    slides.forEach((slide) => {
        slide.classList.remove("active");
    });

    contents.forEach((content) => {
        content.classList.remove("active");
    });

    btns[manual].classList.add("active");
    slides[manual].classList.add("active");
    contents[manual].classList.add("active");
}
var i = 0;

btns.forEach((btn, iClick) => {
    btn.addEventListener("click", () => {
        i = iClick;
        sliderNav(i);
    })
});

function autoPlay(i) {
    return sliderNav(i);
}
setInterval(() => {
    i++;
    if (i >= slides.length) {
        i = 0;
    }
    autoPlay(i);

}, 7000);


