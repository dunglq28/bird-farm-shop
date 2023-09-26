

header.style.backgroundColor = "rgba(0, 0, 0, 0)";
window.onscroll = () => {
    var Y = this.scrollY;
    if (currentscrollY == 0) {
        header.style.backgroundColor = "rgba(0, 0, 0, 0)";
    } 
    else if (currentscrollY != Y) {
        header.style.backgroundColor = "#0D6780";
    }
}
