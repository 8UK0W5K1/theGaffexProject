let params = new URLSearchParams(location.search);
switch (params.get('page')) {
    case null:
        document.querySelector('#btn--1').firstElementChild.textContent = '1';
        document.querySelector('#btn--1').firstElementChild.href = ' '
        document.querySelector('#btn-0').firstElementChild.textContent = '2';
        document.querySelector('#btn-1').firstElementChild.textContent = '3';
        document.querySelector('#btn-2').firstElementChild.textContent = '4';
        document.querySelector('#btn-3').firstElementChild.textContent = '5';
        break
    case '1':
        document.querySelector('#btn-' + (params.get('page') - 2)).firstElementChild.textContent = '1'
        document.querySelector('#btn-' + (params.get('page') - 1)).firstElementChild.textContent = '2'
        document.querySelector('#btn-' + params.get('page')).firstElementChild.textContent = '3'
        document.querySelector('#btn-' + (params.get('page') + 1)).firstElementChild.textContent = '4'
        document.querySelector('#btn-' + (params.get('page') + 2)).firstElementChild.textContent = '5'
        break
    case '2':
        document.querySelector('#btn-' + (params.get('page') - 2)).firstElementChild.textContent = '2'
        document.querySelector('#btn-' + (params.get('page') - 1)).firstElementChild.textContent = '3'
        document.querySelector('#btn-' + params.get('page')).firstElementChild.textContent = '4'
        document.querySelector('#btn-' + (params.get('page') + 1)).firstElementChild.textContent = '5'
        document.querySelector('#btn-' + (params.get('page') + 2)).firstElementChild.textContent = '6'
        break
}

if (params.get('page') !== null && params.get('page') > 2) document.querySelector('#btn-' + params.get('page')).classList.add('active')