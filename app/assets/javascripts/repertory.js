class Repertory {
    constructor(repertory) {
        this.repertory = repertory;
        this.pin = repertory.querySelector('#icon')
    }

    clickListener() {
        this.pin.addEventListener('click', () => {
            if (this.repertory.classList.contains('repertory-fixed')) {
                this.unFix();
            } else {
                this.fix();
            }
        })
    }

    unFix() {
        this.repertory.classList.remove('repertory-fixed');
        this.repertory.classList.add('repertory');
        this.pin.firstElementChild.setAttribute('data-icon', 'mdi:pin')
    }

    fix() {
        this.repertory.classList.remove('repertory');
        this.repertory.classList.add('repertory-fixed');
        this.pin.firstElementChild.setAttribute('data-icon', 'mdi:pin-off')
    }
}

function init() {
    const repertory = document.querySelector('#repertory');
    const r = new Repertory(repertory);
    r.clickListener();
}

init()
