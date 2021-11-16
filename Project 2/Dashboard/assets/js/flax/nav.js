var educationPanel = document.getElementById("educators");

//Show Education Panel
educationPanel.onclick = function () {
    hideAllPanels();

    //Show Education Panel
    //var a = document.getElementById("EducatorsPanel");
    //a.style.visibility = "visible";
    //a.style.display = "block";
}

var reg = document.getElementById("registration");

reg.onclick = function () {
    hideAllPanels();
    //Show Education Panel
    var a = document.getElementById("RegistrationPanel");
    a.style.visibility = "visible";
    a.style.display = "block";
}

function hideAllPanels() {
    var a, b, c, d, e;
    a = document.getElementById("Dashboard");
    b = document.getElementById("RegistrationPanel");
    c = document.getElementById("ReportPanel");
    d = document.getElementById("AnnouncementPanel");
    e = document.getElementById("EducatorsPanel");

    //Visibility
    a.style.visibility = "hidden";
    b.style.visibility = "hidden";
    c.style.visibility = "hidden";
    d.style.visibility = "hidden";

    //Display
    a.style.display = "none";
    b.style.display = "none";
    c.style.display = "none";
    d.style.display = "none";
}

//Get home language dropdown subjects
var showhomeDrop = document.getElementById("home12");

//Listen for any changes in Home Language check box
var getHome = document.getElementById("homeLanguage12");

getHome.onchange = function () {
    if (getHome.checked) {
        showhomeDrop.disabled = false;
        //create cookie
        document.cookie = "HomeLang12=" + "Grade 12 " + document.getElementById("home12").value + " HL";
    } else {
        showhomeDrop.disabled = true;

        //Delete cookie
        document.cookie = "HomeLang12=; expires=Thu, 01 Jan 1960 00:00:00";
    }
}

/////////////////////////////////////////////////////
//Get home language dropdown subjects
var showfalDrop = document.getElementById("fal12");

//Listen for any changes in Home Language check box
var getFal = document.getElementById("falLanguage12");

getFal.onchange = function () {
    if (getFal.checked) {
        showfalDrop.disabled = false;
        //create cookie
        document.cookie = "FALLang12=" + "Grade 12 " + document.getElementById("fal12").value + " FAL";
    } else {
        showfalDrop.disabled = true;
        //Delete cookie
        document.cookie = "FALLang12=; expires=Thu, 01 Jan 1960 00:00:00";
    }
}

