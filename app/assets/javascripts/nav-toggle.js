function unFade(element) {
    let op = 0.1;  // initial opacity
    element.style.opacity = op;
    element.style.display = 'flex';
    let timer = setInterval(function () {
        if (op >= 1){
            clearInterval(timer);
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op += op * 0.1;
    }, 20);
}

document.querySelector('#nav-closed-toggler').addEventListener('click', () => {
    document.querySelector('#nav-closed').style.display = 'none';
    document.querySelector('#nav-closed').classList.remove('d-flex');
    unFade(document.querySelector('#nav-opened'))
    document.querySelector('div.repertory').style.left = '85%'
})

document.querySelector('#nav-opened-toggler').addEventListener('click', () => {
    document.querySelector('#nav-opened').style.display = 'none';
    document.querySelector('#nav-opened').classList.remove('d-flex');
    unFade(document.querySelector('#nav-closed'))
    document.querySelector('div.repertory').style.left = '83.5%'
})


