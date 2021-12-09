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
        this.btnPrev = ul.querySelector('#btn-prev');

    }

    pageNullUrl() {
        this.btn1.firstElementChild.href = this.url + '1';
        this.btn2.firstElementChild.href = this.url + '2';
        this.btn3.firstElementChild.href = this.url + '3';
        this.btn4.firstElementChild.href = this.url + '4';
        this.btn5.firstElementChild.href = this.url + '5';
    }

    pageNull() {
        this.btn1.firstElementChild.textContent = '1'
        this.btn2.firstElementChild.textContent = '2'
        this.btn3.firstElementChild.textContent = '3'
        this.btn4.firstElementChild.textContent = '4'
        this.btn5.firstElementChild.textContent = '5'
        this.btn1.classList.add('active');
        this.btnPrev.classList.add('disabled')
        this.pageNullUrl()
    }

    pageOneUrl() {
        this.btn1.firstElementChild.href = this.url + this.page.toString();
        this.btn2.firstElementChild.href = this.url + (this.page + 1).toString();
        this.btn3.firstElementChild.href = this.url + (this.page + 2).toString();
        this.btn4.firstElementChild.href = this.url + (this.page + 3).toString();
        this.btn5.firstElementChild.href = this.url + (this.page + 4).toString();
    }

    pageOne() {
        this.btn1.firstElementChild.textContent = this.page.toString()
        this.btn2.firstElementChild.textContent = (this.page + 1).toString()
        this.btn3.firstElementChild.textContent = (this.page + 2).toString()
        this.btn4.firstElementChild.textContent = (this.page + 3).toString()
        this.btn5.firstElementChild.textContent = (this.page + 4).toString()
        this.btn1.classList.add('active');
        this.btnPrev.classList.add('disabled')
        this.pageOneUrl()
    }

    pageTwoUrl() {
        this.btn1.firstElementChild.href = this.url + (this.page - 1).toString();
        this.btn2.firstElementChild.href = this.url + (this.page).toString();
        this.btn3.firstElementChild.href = this.url + (1 + this.page).toString();
        this.btn4.firstElementChild.href = this.url + (2 + this.page).toString();
        this.btn5.firstElementChild.href = this.url + (3 + this.page).toString();
    }

    pageTwo() {
        this.btn1.firstElementChild.textContent = (this.page - 1).toString()
        this.btn2.firstElementChild.textContent = (this.page).toString()
        this.btn3.firstElementChild.textContent = (1 + this.page).toString()
        this.btn4.firstElementChild.textContent = (2 + this.page).toString()
        this.btn5.firstElementChild.textContent = (3 + this.page).toString()
        this.btn2.classList.add('active');
        this.pageTwoUrl()
    }

    pageDefault() {
        this.btn3.classList.add('active');
        this.btn1.firstElementChild.href = this.url + (this.page - 2).toString();
        this.btn2.firstElementChild.href = this.url + (this.page - 1).toString();
        this.btn3.firstElementChild.href = this.url + this.page.toString();
        this.btn4.firstElementChild.href = this.url + (this.page + 1).toString();
        this.btn5.firstElementChild.href = this.url + (this.page + 2).toString();
    }

    init() {
        console.log(this.page);
        switch (this.page) {
            case NaN:
                this.pageNull();
                break
            case 1:
                this.pageOne();
                break
            case 2:
                this.pageTwo();
                break
            default:
                this.pageDefault()
        }
    }
}
