class Repertory {
    constructor(repertory) {
        this.repertory = repertory;
        this.pin = repertory.querySelector('#icon');
    }

    clickListener() {
        this.pin.addEventListener('click', () => {
            if (this.repertory.style.position === 'absolute') {
                this.unFix();
            } else {
                this.fix();
            }
        })
    }

    unFix() {
        this.pin.firstElementChild.setAttribute('data-icon', 'mdi:pin')
        this.repertory.style.position = 'fixed'
        this.repertory.style.top = '37%'
        this.repertory.classList.remove('repertory-fixed')
        if (document.querySelector('#nav-opened').style.display === 'flex') {
            this.repertory.style.left = '85%'
        } else {
            this.repertory.style.left = '83.5%'
        }
    }

    fix() {
        this.pin.firstElementChild.setAttribute('data-icon', 'mdi:pin-off')
        this.repertory.style.position = 'absolute'
        this.repertory.style.top = '24vh'
        this.repertory.style.left = '97.5%'
        this.repertory.classList.add('repertory-fixed')
    }
}

function init() {
    const repertory = document.querySelector('#repertory');
    const r = new Repertory(repertory);
    r.clickListener();
}

init()
