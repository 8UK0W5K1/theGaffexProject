class Paging {
    constructor(ul, url, page) {
        this.ul = ul;
        this.url = url;
        this.page = parseInt(page);
        this.btn1 = ul.querySelector('#btn-1');
        this.btn2 = ul.querySelector('#btn-2');
        this.btn3 = ul.querySelector('#btn-3');
        this.btn4 = ul.querySelector('#btn-4');
        this.btn5 = ul.querySelector('#btn-5');

    }

    pageNull() {
        this.btn1.firstElementChild.textContent = '1'
        this.btn2.firstElementChild.textContent = '2'
        this.btn3.firstElementChild.textContent = '3'
        this.btn4.firstElementChild.textContent = '4'
        this.btn5.firstElementChild.textContent = '5'
    }

    pageOne() {
        this.btn1.firstElementChild.textContent = this.page.toString()
        this.btn2.firstElementChild.textContent = (this.page + 1).toString()
        this.btn3.firstElementChild.textContent = (this.page + 2).toString()
        this.btn4.firstElementChild.textContent = (this.page + 3).toString()
        this.btn5.firstElementChild.textContent = (this.page + 4).toString()
    }

    pageTwo() {
        this.btn1.firstElementChild.textContent = (this.page - 1).toString()
        this.btn2.firstElementChild.textContent = (this.page).toString()
        this.btn3.firstElementChild.textContent = (1 + this.page).toString()
        this.btn4.firstElementChild.textContent = (2 + this.page).toString()
        this.btn5.firstElementChild.textContent = (3 + this.page).toString()
    }

    init() {
        switch (this.page) {
            case null:
                this.pageNull();
                break
            case 1:
                this.pageOne();
                break
            case 2:
                this.pageTwo();
                break
        }
    }
}
