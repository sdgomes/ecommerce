document.addEventListener("DOMContentLoaded", function (event) {
    tns({
        container: '.hero-slider',
        slideBy: 'page',
        autoplay: true,
        autoplayButtonOutput: false,
        mouseDrag: true,
        gutter: 0,
        items: 1,
        nav: false,
        controls: true,
        controlsText: ['<i class="fa-light fa-angle-left"></i>', '<i class="fa-light fa-angle-right"></i>'],
    });
});