class Paging {
    constructor(ul, url, page, keyword = null) {
        this.ul = ul;
        this.url = url;
        this.page = parseInt(page);
        this.btn1 = ul.querySelector('#btn-1');
        this.btn2 = ul.querySelector('#btn-2');
        this.btn3 = ul.querySelector('#btn-3');
        this.btn4 = ul.querySelector('#btn-4');
        this.btn5 = ul.querySelector('#btn-5');
        this.btnPrev = ul.querySelector('#btn-prev');
        this.btnNext = ul.querySelector('#btn-next');
        this.keyword = keyword
    }

    pageNull() {
        this.btn1.classList.add('active');
    }

    pageOne() {
        this.btn1.classList.add('active');
    }

    pageTwo() {
        this.btn2.classList.add('active');
        this.btnPrev.classList.remove('disabled');
        this.btnPrev.firstElementChild.href = this.url + (this.page - 1).toString();
        this.btnNext.firstElementChild.href = this.url + (this.page + 1).toString();
    }

    pageDefault() {
        this.btn3.classList.add('active');
        this.btnPrev.classList.remove('disabled');
        this.btn1.firstElementChild.href = this.url + (this.page - 2).toString();
        this.btn2.firstElementChild.href = this.url + (this.page - 1).toString();
        this.btn3.firstElementChild.href = this.url + this.page.toString();
        this.btn4.firstElementChild.href = this.url + (this.page + 1).toString();
        this.btn5.firstElementChild.href = this.url + (this.page + 2).toString();
        this.btnPrev.firstElementChild.href = this.url + (this.page - 1).toString();
        this.btnNext.firstElementChild.href = this.url + (this.page + 1).toString();
    }

    pageDefaultText() {
        this.btn1.firstElementChild.textContent = (this.page - 2).toString();
        this.btn2.firstElementChild.textContent = (this.page - 1).toString();
        this.btn3.firstElementChild.textContent = (this.page).toString();
        this.btn4.firstElementChild.textContent = (this.page + 1).toString();
        this.btn5.firstElementChild.textContent = (this.page + 2).toString();
    }

    buildUrl() {
        if (this.keyword !== null){
            this.url += '?keyword=' + this.keyword + '&page=';
        } else {
            this.url += '?page='
        }
    }

    init() {
        this.buildUrl();
        switch (this.page) {
            case isNaN(this.page) :
                this.pageNull();
                break
            case 1:
                this.pageOne();
                break
            case 2:
                this.pageTwo();
                break
            default:
                this.pageDefault();
                this.pageDefaultText();
        }
    }
}
