$(document).ready(function () {

    "use strict"; // Start of use strict

    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        // e.g. linkElement: 'a:not([target="_blank"]):not([href^="#"])'
        loading: true,
        loadingParentElement: 'body', //animsition wrapper element
        loadingClass: 'animsition-loading',
       // loadingInner: '', // e.g '<img src="loading.svg" />'
        timeout: false,
        timeoutCountdown: 5000,
        onLoadEvent: true,
        browser: ['animation-duration', '-webkit-animation-duration'],
        // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
        // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
        overlay: false,
        overlayClass: 'animsition-overlay-slide',
        overlayParentElement: 'body',
        transition: function (url) {
            window.location.href = url;
        }
    });

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
    $(function () {
        $(window).bind("load resize", function () {
            var topOffset = 70;
            var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
            if (width < 768) {
                $('div.navbar-collapse').addClass('collapse');
                topOffset = 100; // 2-row-menu
            } else {
                $('div.navbar-collapse').removeClass('collapse');
            }

            var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
            height = height - topOffset;
            if (height < 1)
                height = 1;
            if (height > topOffset) {
                $("#page-wrapper").css("min-height", (height) + "px");
            }
        });

        var url = window.location;
        // var element = $('ul.nav a').filter(function() {
        //     return this.href == url;
        // }).addClass('active').parent().parent().addClass('in').parent();
        var element = $('ul.nav a').filter(function () {
            return this.href === url;
        }).addClass('active').parent();

        while (true) {
            if (element.is('li')) {
                element = element.parent().addClass('in').parent();
            } else {
                break;
            }
        }
    });

    //first click
    if ('addEventListener' in document) {
        document.addEventListener('DOMContentLoaded', function () {
            FastClick.attach(document.body);
        }, false);
    }

    //back to top
    $('body').append('<div id="toTop" class="btn back-top"><span class="ti-arrow-up"></span></div>');
    $(window).on("scroll", function () {
        if ($(this).scrollTop() !== 0) {
            $('#toTop').fadeIn();
        } else {
            $('#toTop').fadeOut();
        }
    });
    $('#toTop').on("click", function () {
        $("html, body").animate({scrollTop: 0}, 600);
        return false;
    });

   
    //sidemenu
    //se movió a app feengster $('#side-menu').metisMenu();

    //color styleSwitcher
    $('#styleOptions').styleSwitcher();

    //logo changed
    $(function () {
        $('#styleOptions li a').on('click',function () {
            $(".main-logo").attr('src', "../assets/dist/img/logos/logo-light-PNG.png");
        });
        $('#styleOptions li a.skin-logo').click(function () {
            $(".main-logo").attr('src', "../assets/dist/img/logos/logo-dark-PNG.png");
        });
    });

    //search area
    var wHeight = window.innerHeight;
    //search bar middle alignment
    $("#fullscreen-searchform").css("top", wHeight / 2);
    //reform search bar
    jQuery(window).resize(function () {
        wHeight = window.innerHeight;
        $("#fullscreen-searchform").css("top", wHeight / 2);
    });
    // Search
    $(".search-trigger").click(function () {
        console.log("Open Search, Search Centered");
        $("div.fullscreen-search-overlay").addClass(
                "fullscreen-search-overlay-show"
                );
    });
    $("a.fullscreen-close").click(function () {
        console.log("Closed Search");
        $("div.fullscreen-search-overlay").removeClass(
                "fullscreen-search-overlay-show"
                );
    });

    //Right sidebar menu toggle
    $("#menu-toggle").on('click',function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    //Dropdown multi menu
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
        $(this).parent().siblings().removeClass('open');
        $(this).parent().toggleClass('open');
    });

    // Material Ripple effect
    $(".material-ripple").on('click',function (event) {
        var surface = $(this);

        // create .material-ink element if doesn't exist
        if (surface.find(".material-ink").length === 0) {
            surface.prepend("<div class='material-ink'></div>");
        }

        var ink = surface.find(".material-ink");

        // in case of quick double clicks stop the previous animation
        ink.removeClass("animate");

        // set size of .ink
        if (!ink.height() && !ink.width()) {
            // use surface's width or height whichever is larger for
            // the diameter to make a circle which can cover the entire element
            var diameter = Math.max(surface.outerWidth(), surface.outerHeight());
            ink.css({height: diameter, width: diameter});
        }

        // get click coordinates
        // Logic:
        // click coordinates relative to page minus
        // surface's position relative to page minus
        // half of self height/width to make it controllable from the center
        var xPos = event.pageX - surface.offset().left - (ink.width() / 2);
        var yPos = event.pageY - surface.offset().top - (ink.height() / 2);

        var rippleColor = surface.data("ripple-color");

        //set the position and add class .animate
        ink.css({
            top: yPos + 'px',
            left: xPos + 'px',
            background: rippleColor
        }).addClass("animate");
    });


//Fullscreen API
    $(function () {
        var requestFullscreen = function (ele) {
            if (ele.requestFullscreen) {
                ele.requestFullscreen();
            } else if (ele.webkitRequestFullscreen) {
                ele.webkitRequestFullscreen();
            } else if (ele.mozRequestFullScreen) {
                ele.mozRequestFullScreen();
            } else if (ele.msRequestFullscreen) {
                ele.msRequestFullscreen();
            } else {
                console.log("Fullscreen API is not supported.");
            }
        };

        var exitFullscreen = function () {
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            } else {
                console.log("Fullscreen API is not supported.");
            }
        };

        var fsDocButton = document.getElementById("fullscreen");
        var fsExitDocButton = document.getElementById("fullscreen");

        fsDocButton.addEventListener("click", function (e) {
            e.preventDefault();
            requestFullscreen(document.documentElement);
        });

        fsExitDocButton.addEventListener("click", function (e) {
            e.preventDefault();
            exitFullscreen();
        });
    });


    // se movio a route.js! lobipanel
    // $('.lobidrag').lobiPanel({
    //     sortable: true,
    //     editTitle: {
    //         icon: 'ti-pencil'
    //     },
    //     unpin: {
    //         icon: 'ti-move'
    //     },
    //     reload: {
    //         icon: 'ti-reload'
    //     },
    //     minimize: {
    //         icon: 'ti-minus',
    //         icon2: 'ti-plus'
    //     },
    //     close: {
    //         icon: 'ti-close'
    //     },
    //     expand: {
    //         icon: 'ti-fullscreen',
    //         icon2: 'ti-fullscreen'
    //     }
    // });

    // $('.lobidisable').lobiPanel({
    //     reload: false,
    //     close: false,
    //     editTitle: false,
    //     sortable: true,
    //     unpin: {
    //         icon: 'ti-move'
    //     },
    //     minimize: {
    //         icon: 'ti-minus',
    //         icon2: 'ti-plus'
    //     },
    //     expand: {
    //         icon: 'ti-fullscreen',
    //         icon2: 'ti-fullscreen'
    //     }
    // });

});

function yo(){
    alert('yo')
}

