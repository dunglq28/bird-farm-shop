/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.addEventListener("DOMContentLoaded", function () {

    var radioInput = document.getElementById("exampleRadios2");
    

    var datePickerDiv = document.getElementById("datePickerDiv");


    radioInput.addEventListener("change", function () {
        // Kiểm tra nếu radio button được chọn, thì hiển thị thẻ div, ngược lại ẩn nó
        if (radioInput.checked) {
            datePickerDiv.style.display = "block";
        } else {
            datePickerDiv.style.display = "none";
        }
    });
});
