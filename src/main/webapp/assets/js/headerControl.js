


var header = document.querySelector("header");
currentscrollY = 0;
window.addEventListener("scroll", function () {
    var Y = this.scrollY;
    header.style.backgroundColor = "#0D6780";
    if (currentscrollY > Y) {
        header.classList.remove('disappear');
    } else if (currentscrollY < Y) {
        header.classList.add('disappear');
    }
    currentscrollY = Y;
}, false);