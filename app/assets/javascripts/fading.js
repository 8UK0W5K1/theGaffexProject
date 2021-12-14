function fade(element) {
    let op = 1;
    let timer = setInterval(function () {
        if (op < 0.1) {
            clearInterval(timer);
            element.remove()
        }
        element.style.opacity = op;
        element.style.filter = "alpha(opacity=" + op * 100 + ")";
        op -= op * 0.1;
    }, 20);
}

function unFade(element) {
    let op = 0.1;  // initial opacity
    element.style.opacity = op;
    let timer = setInterval(function () {
        if (op >= 1) {
            clearInterval(timer);
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op += op * 0.1;
    }, 20);
}
