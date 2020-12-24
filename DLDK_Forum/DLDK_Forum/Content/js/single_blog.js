var classA = document.getElementsByClassName("TC");

function ngu(id) {
    for (var item of classA) {
        item.style.color = "black";
    }
    document.getElementById(id).style.color = "red";
}