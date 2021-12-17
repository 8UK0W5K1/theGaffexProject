document.querySelector('#nav-closed-toggler').addEventListener('click', () => {    
    document.querySelector('#nav-closed').classList.remove('d-xl-flex');
    unFade(document.querySelector('#nav-opened'));
    document.querySelector('#nav-opened').classList.add('d-xl-flex')
    if (!document.querySelector('#repertory').classList.contains('repertory-fixed')) {
        document.querySelector('#repertory').style.left = '85%'
    }
})

document.querySelector('#nav-opened-toggler').addEventListener('click', () => {
    document.querySelector('#nav-opened').style.display = 'none';
    document.querySelector('#nav-opened').classList.remove('d-xl-flex');
    unFade(document.querySelector('#nav-closed'))
    document.querySelector('#nav-closed').classList.add("d-xl-flex")
    if (!document.querySelector('#repertory').classList.contains('repertory-fixed')) {
        document.querySelector('#repertory').style.left = '83.5%'
    }
})
