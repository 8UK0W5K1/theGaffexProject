class Repertory {
    constructor(repertory) {
        this.repertory = repertory;
        this.pin = repertory.querySelector('#icon');
    }

    clickListener() {
        this.pin.addEventListener('click', () => {
            if (this.repertory.style.position === 'absolute') {
                this.unFix();
            } else {0
                this.fix();
            }
        })
    }

    unFix() {
        this.pin.firstElementChild.setAttribute('data-icon', 'mdi:pin')
        this.repertory.style.position = 'fixed'
        this.repertory.style.top = '37%'
        this.repertory.style.left = '83.5%'
    }

    fix() {
        this.pin.firstElementChild.setAttribute('data-icon', 'mdi:pin-off')
        this.repertory.style.position = 'absolute'
        this.repertory.style.top = '12%'
        this.repertory.style.left = '97%'
    }
}

function init() {
    const repertory = document.querySelector('#repertory');
    const r = new Repertory(repertory);
    r.clickListener();
}

init()
