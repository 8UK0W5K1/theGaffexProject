const keywordContainer = document.querySelector('.keywords-container');
const inputField = document.querySelector('#keyword-input');
const keywordsArray = document.querySelector('#keywords-array')

function getKeywords(keywords) {
    keywords.split(';').forEach(name => {
        const keyword = newKeyword(name)
        keywordContainer.append(keyword)
        unFade(keyword)
        inputField.value = ''
        keywordsArray.value += name + ';'
        console.log(keywordsArray.value)
    })
}

function newKeyword(name) {
    const div = document.createElement('div')
    div.setAttribute('class', 'keyword btn btn-primary mt-3 mx-1')
    const span = document.createElement('span')
    span.innerHTML = name
    const close = document.createElement('span')
    close.setAttribute('class', 'iconify ml-2')
    close.setAttribute('data-icon', 'mdi:close')
    close.setAttribute('id', 'close')
    div.appendChild(span);
    div.appendChild(close);
    div.addEventListener('click', (e) => {
        if (e.target.id === 'close') {
            removeKeyword(div, name)
        }
    })
    return div
}

function removeKeyword(div, name) {
    fade(div)
    setTimeout(() => {div.remove()}, 1500)
    let keywords = keywordsArray.value.split(';');
    keywords.splice(keywords.indexOf(name), 1);
    keywordsArray.value = keywords.join(';')
    console.log(keywordsArray.value)
}

function init() {
    inputField.addEventListener('keyup', function (e) {
        if (e.key === ' ') {
            const name = inputField.value.slice(0, -1)
            const keyword = newKeyword(name)
            keywordContainer.append(keyword)
            unFade(keyword)
            inputField.value = ''
            keywordsArray.value += name + ';'
        }
    })
}

init()
