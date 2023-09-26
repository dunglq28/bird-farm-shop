var header = document.querySelector("header");
header.style.backgroundColor = "rgba(0, 0, 0, 0)";
currentPageYOffset = 0;
window.onscroll = () => {
    var Y = this.scrollY;
    if (currentPageYOffset == Y) {
        header.style.backgroundColor = "rgba(0, 0, 0, 0)";

    } else if (currentPageYOffset < Y) {
        header.style.backgroundColor = "#0D6780";
    }
}