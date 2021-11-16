//Get the student button element
var studentlogin = document.getElementById("studentLogin");

//Get the Title for Student/Educator
var loginTitle = document.getElementById("title");

//Get the login DIV
var loginPanel = document.getElementById("loginPanel");

//Get the role selector Panel
var role = document.getElementById("role");

//Onclick Function for the student button
studentlogin.onclick = function () {
    //Set Title to Student
    loginTitle.innerHTML = "Student";

    //Hide the role Delector DIV
    role.classList.remove("fadeOut");
    role.classList.add("fadeOut");
    role.style.visibility = "hidden";
    role.style.display = "none";

    //Show the login DIV
    loginPanel.classList.remove("fadeOut");
    loginPanel.classList.add("fadeIn");
    loginPanel.style.visibility = "visible";
    loginPanel.style.display = "block";

    //Student Login Indicator
    sessionStorage.setItem("role", "student");
}

var Changerole = document.getElementById("Rolechange");

Changerole.onclick = function () {
    //Hide the login DIV
    loginPanel.classList.remove("fadeIn");
    loginPanel.classList.add("fadeOut");
    loginPanel.style.visibility = "hidden";
    loginPanel.style.display = "none";

    //Show the role Delector DIV
    role.classList.remove("fadeOut");
    role.classList.add("fadeIn");
    role.style.visibility = "visible";
    role.style.display = "block";
}

//Get educator button element
var eduLogin = document.getElementById("eduLogin");

eduLogin.onclick = function () {
    //Set Title to Student
    loginTitle.innerHTML = "Educator";

    //Hide the role Delector DIV
    role.classList.remove("fadeOut");
    role.classList.add("fadeOut");
    role.style.visibility = "hidden";
    role.style.display = "none";

    //Show the login DIV
    loginPanel.classList.remove("fadeOut");
    loginPanel.classList.add("fadeIn");
    loginPanel.style.visibility = "visible";
    loginPanel.style.display = "block";

    //Student Login Indicator
    sessionStorage.setItem("role", "educator");
}

//Get Submitting button
var submitBtn = document.getElementById("submitButton");

$("#form1").submit(function (e) {
    e.preventDefault();
});