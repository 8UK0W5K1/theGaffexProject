document.querySelector('#nav-closed-toggler').addEventListener('click', () => {
    document.querySelector('#nav-closed').style.display = 'none';
    document.querySelector('#nav-closed').classList.remove('d-flex');
    unFade(document.querySelector('#nav-opened'));
    document.querySelector('#nav-opened').style.display = 'flex';
    if (!document.querySelector('#repertory').classList.contains('repertory-fixed')) {
        document.querySelector('#repertory').style.left = '85%'
    }
})

document.querySelector('#nav-opened-toggler').addEventListener('click', () => {
    document.querySelector('#nav-opened').style.display = 'none';
    document.querySelector('#nav-opened').classList.remove('d-flex');
    unFade(document.querySelector('#nav-closed'))
    document.querySelector('#nav-closed').style.display = 'flex';
    if (!document.querySelector('#repertory').classList.contains('repertory-fixed')) {
        document.querySelector('#repertory').style.left = '83.5%'
    }
})
