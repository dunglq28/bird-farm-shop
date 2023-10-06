document.addEventListener("DOMContentLoaded", function () {

    var radioInput1 = document.getElementById("exampleRadios1");
    var radioInput2 = document.getElementById("exampleRadios2");


    var datePickerDiv = document.getElementById("datePickerDiv");
    var feeShip = document.getElementById("Ship");
    var total_order = document.getElementById("total_order");


    radioInput2.addEventListener("change", function () {
        // Kiểm tra nếu radio button2 được chọn, thì hiển thị thẻ div
        if (radioInput2.checked) {
            datePickerDiv.style.display = "block";
            feeShip.innerHTML = "0 đ";
        } 
    });
    
    radioInput1.addEventListener("change", function () {
        // Kiểm tra nếu radio button1 được chọn, thì ẩn thị thẻ div
        if (radioInput1.checked) {
            datePickerDiv.style.display = "none";
            feeShip.innerHTML = "125.000 đ";
        }
    });
});
