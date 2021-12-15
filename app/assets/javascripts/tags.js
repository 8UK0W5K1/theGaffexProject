const tagContainer = document.querySelector('.tag-container');
const inputField = document.querySelector('#tag-input');
const tagArray = document.querySelector('#tags-array')

function getTags(tags) {
    tags.split(' ').forEach(e => {
        const tag = newTag(e)
        tagContainer.append(tag)
        unFade(tag)
        inputField.value = ''
        tagArray.value += name + ';'
    })
}

function newTag(name) {
    const div = document.createElement('div')
    div.setAttribute('class', 'tag btn btn-primary mt-3 mx-1')
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
            fade(div)
            setTimeout(() => {div.remove()}, 1500)
        }
    })
    return div
}

function init() {
    inputField.addEventListener('keyup', function (e) {
        if (e.key === ';') {
            const name = inputField.value.slice(0, -1)
            const tag = newTag(name)
            tagContainer.append(tag)
            unFade(tag)
            inputField.value = ''
            tagArray.value += name + ';'
        }
    })
}

init()
