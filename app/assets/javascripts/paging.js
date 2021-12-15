class Paging {
    constructor(ul, url, page, totalPages, keyword = null) {
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
        this.totalPages = totalPages
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

    buildPaging() {
        if (parseInt(this.btn1.firstElementChild.textContent) > this.totalPages) this.btn1.remove();
        if (parseInt(this.btn2.firstElementChild.textContent) > this.totalPages) this.btn2.remove();
        if (parseInt(this.btn3.firstElementChild.textContent) > this.totalPages) this.btn3.remove();
        if (parseInt(this.btn4.firstElementChild.textContent) > this.totalPages) this.btn4.remove();
        if (parseInt(this.btn5.firstElementChild.textContent) > this.totalPages) this.btn5.remove();
        if (this.page === this.totalPages) this.btnNext.remove();
        if (this.btnPrev.classList.contains('disabled')) this.btnPrev.remove()
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
        this.buildPaging()
    }
}
