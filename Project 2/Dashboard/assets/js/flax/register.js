//var add = document.getElementById("addSubjectsButton12");

////Grade 12 Subjects
//add.onclick = function () {
//    //Create session for subjects
//    if (document.getElementById("homeLanguage12").checked) {
//        sessionStorage.setItem("HomeLang12", "Grade 12 " + document.getElementById("home12").value + " HL")
//    }

//    if (document.getElementById("falLanguage12").checked) {
//        sessionStorage.setItem("FirstAddLang12", "Grade 12 " + document.getElementById("fal12").value + " FAL")
//    }

//    if (document.getElementById("math12").checked) {
//        sessionStorage.setItem("Maths12", "Grade 12 Mathematics")
//    }

//    if (document.getElementById("techMaths12").checked) {
//        sessionStorage.setItem("TechMaths12", "Grade 12 Mathematics")
//    }

//    if (document.getElementById("mathsLit12").checked) {
//        sessionStorage.setItem("MathsLit12", "Grade 12 Mathematical Literacy")
//    }
//}

/////////////////////////Get DOM checkboxes G12/////////////////////////////

//var homeLangG12 = document.getElementById("homeLanguage12");

//homeLangG12.onchange = function () {
//    if (homeLangG12.disabled = false) {
//        sessionStorage.setItem("HomeLang12", "Grade 12 " + document.getElementById("home12").value + " HL")
//    }
//}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

document.getElementById("home12").onchange = function () {
    //sessionStorage.setItem("HomeLang12", "Grade 12 " + document.getElementById("home12").value + " HL");
    document.cookie = "HomeLang12=" + "Grade 12 " + document.getElementById("home12").value + " HL";
}

document.getElementById("fal12").onchange = function () {
    //sessionStorage.setItem("FALLang12", "Grade 12 " + document.getElementById("fal12").value + " FAL");
    document.cookie = "FALLang12=" + "Grade 12 " + document.getElementById("fal12").value + " FAL";
}