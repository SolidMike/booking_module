$(document).ready(function () {
    AOS.init({
        delay: 100,
        duration: 1000,
        disable: 'mobile'
    });
});

$(".modal-zvonok-link").click(function () {
    $.ajax({
        url: $(this).data('href'),
        type: "post",
        cache: false,
        dataType: "html",
        success: function(html) {
            if ($(".modal-zvonok").find('*').length == 0) {
                $(".modal-zvonok").append(html);
            }
            $.fancybox.open($(".modal-zvonok").html());
            $(".modal-zvonok").html('');
            $(".phone").mask("+7 (999) 999-99-99");

            $(".konf").click(function () {
                $.ajax({
                    url: "/forms/forms/get/personal",
                    type: "post",
                    cache: false,
                    dataType: "html",
                    success: function(html) {
                        if ($(".modal-konf").find('*').length == 0) {
                            $(".modal-konf").append(html);
                        }
                        $.fancybox.open($(".modal-konf").html());
                        $(".phone").mask("+7 (999) 999-99-99");
                    }
                });
                return false;
            });
        }
    });
    return false;
});

/*=========================/booking_form/=============*/

$(".booking_button").click(function () {
    var id_cottage = $(this).data('id');
    var price = $(this).data('price');
    var number_of_person = $(this).parent().prev('.form_block').find("input[name='number_of_person']").val();
    var nutrition = $(this).parent().prev('.form_block').find("#nutrition option:selected").val();
    var start_date =  Date.parse($("input[name='start_date']").val())/1000;
    var end_date = Date.parse($("input[name='end_date']").val())/1000;
    var total_time = parseInt(end_date - start_date)/86400;
    var total_price = ((parseInt(price) + parseInt(nutrition)) * parseInt(number_of_person)) * total_time;
   /* console.log((parseInt(price) + parseInt(nutrition)));
    console.log(total_time);
    console.log(start_date);
    console.log(end_date);
    console.log(total_price);
    console.log(number_of_person);
    console.log(nutrition);*/
    $.ajax({
        url: $(this).data('href'),
        method: "post",
        cache: false,
        data: {
        	"id": id_cottage, 
        "number_of_person": number_of_person, 
        "nutrition": nutrition, 
        "start_date": start_date,  
        "end_date": end_date,
        "total_price": total_price
      	},
        dataType: "html",
        success: function(html) {
            if ($(".modal-booking").find('*').length == 0) {
                $(".modal-booking").append(html);
            }
            $.fancybox.open($(".modal-booking").html());
            $(".modal-booking").html('');
            $(".phone").mask("+7 (999) 999-99-99");
            gtag('event', 'zabronirovat_dom_cottadges', {'category': 'clickbutton'});
            ym(56708566, 'reachGoal', 'zabronirovat_dom_cottadges');
            $(".konf").click(function () {
                $.ajax({
                    url: "/forms/forms/get/personal",
                    type: "post",
                    cache: false,
                    dataType: "html",
                    success: function(html) {
                        if ($(".modal-konf").find('*').length == 0) {
                            $(".modal-konf").append(html);
                        }

                        $.fancybox.open($(".modal-konf").html());
                        $(".phone").mask("+7 (999) 999-99-99");
                    }
                });
                return false;
            });
        }
    });
    return false;
});

$(".modal-form-link").click(function () {
    $.ajax({
        url: $(this).data('href'),
        type: "post",
        cache: false,
        dataType: "html",
        success: function(html) {
            if ($(".modal-form").find('*').length == 0) {
                $(".modal-form").append(html);
            }
            $.fancybox.open($(".modal-form").html());
            $(".modal-form").html('');
            $(".phone").mask("+7 (999) 999-99-99");

            $(".konf").click(function () {
                $.ajax({
                    url: "/forms/forms/get/personal",
                    type: "post",
                    cache: false,
                    dataType: "html",
                    success: function(html) {
                        if ($(".modal-konf").find('*').length == 0) {
                            $(".modal-konf").append(html);
                        }
                        $.fancybox.open($(".modal-konf").html());
                        $(".phone").mask("+7 (999) 999-99-99");
                    }
                });
                return false;
            });
        }
    });
    return false;
});

$(".konf").click(function () {
    $.ajax({
        url: "/forms/forms/get/personal",
        type: "post",
        cache: false,
        dataType: "html",
        success: function(html) {
            if ($(".modal-konf").find('*').length == 0) {
                $(".modal-konf").append(html);
            }
            $.fancybox.open($(".modal-konf").html());
            $(".phone").mask("+7 (999) 999-99-99");
        }
    });
    return false;
});

$(document).on('click', '#send_decided_on_a_choice', function() {
    $('#form_decided_on_a_choice').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
            message: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 10
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        gtag('event', 'ostavit_zayavky_glavnaya', {'category': 'clickbutton'});
        ym(56708566, 'reachGoal', 'ostavit_zayavky_glavnaya');
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) {
            $('#form_decided_on_a_choice').find(".text3").html(html);
        }, 'html');
    })
});

$(document).on('click', '#send_leave_a_request', function() {
    $('#form_leave_a_request').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {},
                    emailAddress: {}
                }
            },
            message: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 10
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) {
            $('#form_leave_a_request').prepend(html);
        }, 'html');
    })
});

$(document).on('click', '#send_order_call', function() {
    $('#form_order_call').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        gtag('event', 'obratnyi_zvonok', {'category': 'clickbutton'});
        ym(56708566, 'reachGoal', 'obratnyi_zvonok');
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) {
            $('#form_order_call').prepend(html);
        }, 'html');
    })
});

$(document).on('click', '#send_booking', function() {
    $('#form_booking').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        gtag('event', 'forma_zabronirovat_dom_bronirovanie', {'category': 'clickbutton'});
        ym(56708566, 'reachGoal', 'forma_zabronirovat_dom_bronirovanie');
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) {
            $('#form_booking').prepend(html);
        }, 'html');
        /*$('.modal-booking-content').hide();
        $('.fancybox-container').hide();*/
        $('#form_booking').hide();
        $('.modal-booking-content').append('<div class="modal-booking-content_thx">Спасибо! Ваш заказ оформлен!</div>');
    })
});

$(document).ready(function () {

    $('.about-slider').owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        autoplay: false,
        smartSpeed: 500,
        center: false,
        autoplayTimeout: 6000,
        dots: true,
        responsive: {
            0: {
                items: 1
            },
            456: {
                items: 2
            },
            710: {
                items: 3
            },
            1050: {
                items: 4
            }
        }
    });

    $('.main-slider').owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        autoplay: false,
        smartSpeed: 2000,
        center: true,
        autoplayTimeout: 6000,
        dots: true,
        responsive: {
            0: {
                items: 1
            }
        }
    });


    var owlh = $('.main-slider');
    $('#mainSlideNext').click(function () {
        owlh.trigger('next.owl.carousel');
    });
    $('#mainSlidePrev').click(function () {
        owlh.trigger('prev.owl.carousel');
    });

});

$(".phone").mask("+7 (999) 999-99-99");

var burger = false;

$(".hamburger").click(function () {
    if (burger) {
        $(".hamburger").removeClass("is-active");
        $(".navigation-content ul").hide();
        burger = false;
    } else {
        $(".hamburger").addClass("is-active");
        $(".navigation-content ul").show();
        burger = true;
    }
});

$(document).ready(function () {
    $('body').append('<a href="#" id="go-top" title="Вверх"><?xml version="1.0" encoding="iso-8859-1"?> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 476.737 476.737" style="enable-background:new 0 0 476.737 476.737;" xml:space="preserve" width="40px" height="40px"> <g> <g> <g> <path d="M238.369,0C106.726,0,0,106.726,0,238.369c0,131.675,106.726,238.369,238.369,238.369 c131.675,0,238.369-106.694,238.369-238.369C476.737,106.726,370.043,0,238.369,0z M352.722,289.221 c-6.198,6.198-16.273,6.198-22.47,0l-91.883-91.883l-91.883,91.883c-6.198,6.198-16.273,6.198-22.47,0 c-6.198-6.166-6.198-16.273,0-22.47L227.086,163.68c3.115-3.115,7.183-4.64,11.283-4.64s8.168,1.526,11.283,4.64L352.722,266.75 C358.92,272.948,358.92,282.991,352.722,289.221z" fill="#4c63c4"/> </g> </g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg></a>');
});

$(function () {
    $.fn.scrollToTop = function () {
        $(this).hide().removeAttr("href");
        if ($(window).scrollTop() >= "250") $(this).fadeIn("slow")
        var scrollDiv = $(this);
        $(window).scroll(function () {
            if ($(window).scrollTop() <= "250") $(scrollDiv).fadeOut("slow")
            else $(scrollDiv).fadeIn("slow")
        });
        $(this).click(function () {
            $("html, body").animate({scrollTop: 0}, "slow")
        })
    }
});

$(function () {
    $("#go-top").scrollToTop();
});

$(function () {
    $('.navigation ul li a').each(function () {
        var location = window.location.href;
        var link = this.href;
        if(location == link) {
            $(this).parent().addClass('active');
        }
    });
});

$(function () {
    $('.footer .line1 .grid2 ul li a').each(function () {
        var location = window.location.href;
        var link = this.href;
        if(location == link) {
            $(this).parent().addClass('active');
        }
    });
});
//инициализируем календарь
$(document).ready(function () {
    $('.dates').daterangepicker({
         "locale": {
        "format": "MM/DD/YYYY",
        "separator": " - ",
        "applyLabel": "Применить",
        "cancelLabel": "Отмена",
        "fromLabel": "От",
        "toLabel": "До",
        "customRangeLabel": "Свой",
        "daysOfWeek": [
            "Вс",
            "Пн",
            "Вт",
            "Ср",
            "Чт",
            "Пт",
            "Сб"
        ],
        "monthNames": [
            "Январь",
            "Февраль",
            "Март",
            "Апрель",
            "Май",
            "Июнь",
            "Июль",
            "Август",
            "Сентябрь",
            "Октябрь",
            "Ноябрь",
            "Декабрь"
        ],
        "firstDay": 1
    },
        opens: 'left'
    }, function(start, end, label) {
        $("input[name='start_date']").val(start.format('YYYY-MM-DD'));
        $("input[name='end_date']").val(end.format('YYYY-MM-DD'));
        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    });
});

//цели
$(document).ready(function() {
    $('.header .grid3 .phone').click(function() {
        gtag('event', 'klickphone_verh', {'category': 'kontakt'});
        ym(56708566, 'reachGoal', 'klickphone_verh'); 
    });
    $('.header .grid3 .modal-zvonok-link').click(function() {
        gtag('event', 'zakaz_zvonka_verh', {'category': 'clickbutton'});
        ym(56708566, 'reachGoal', 'zakaz_zvonka_verh');
    });
    $('.gallery-content .link').click(function() {
        gtag('event', 'Pokazat_eshe', {'category': 'clickbutton'});
        ym(56708566, 'reachGoal', 'Pokazat_eshe');
    });
    $('.footer .line1 .grid3 .phone').click(function() {
        gtag('event', 'klickphone_niz', {'category': 'kontakt'});
        ym(56708566, 'reachGoal', 'klickphone_niz');
    });
    $('.footer .line1 .grid4 .modal-zvonok-link').click(function() {
        gtag('event', 'zakaz_zvonka_niz', {'category': 'clickbutton'});
        ym(56708566, 'reachGoal', 'zakaz_zvonka_niz');
    });

});

// console.log(booked_dates);
//уведомляем, что коттедж забронирован, при вызове формы
$(document).ready(function () {
    var id_cottages = $('.cottage_booked span').text();
    $('.cottage_booked').empty();
    id_cottages = id_cottages.substring(0, id_cottages.length - 1);
    id_cottages = id_cottages.split(',');
    var obj = booked_dates;
    if(obj != '') {

        obj.forEach(function(item, i, arr) {
          item.forEach(function(item, i, arr) {
              
            if(id_cottages.indexOf(item.cottage_id) != -1) {
                var start_date = new Date(item.start_date*1000);
                var end_date = new Date(item.end_date*1000);
                var options = {
                    year: 'numeric',
                    month: 'long',
                    day: 'numeric',
                    weekday: 'long',
                    };
                /*console.log(start_date);
                console.log(end_date);*/
                $('#cottage_booked_'+item.cottage_id).append('<p>Коттедж забронирован с ' + start_date.toLocaleString("ru", options) + ' по ' + end_date.toLocaleString("ru", options) + '</p>');

            }

          });
        });
    }else {
        $(".cottage_booked.cottages_theme-grey_round-border").hide();
    }
});
//слайдер коттеджей
$(document).ready(function () {
     
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        centerMode: false,
        centerPadding: '0px',
        focusOnSelect: true,
        arrows: false,
        autoplay: true,
        autoplaySpeed: 3000,
        responsive: [
            {
                breakpoint: 768
                , settings: {
                    slidesToShow: 2

                }
            }
          ]
    });

    // new tour gallery
    $('.tour-gallery__for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        asNavFor: '.tour-gallery__nav',
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    fade: false
                }
            }
          ]
    });
    $('.tour-gallery__nav').slick({
        vertical: true,
        verticalSwiping: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.tour-gallery__for',
        dots: false,
        centerMode: true,
        centerPadding: '0px',
        focusOnSelect: true,
        arrows: false,
        autoplay: true,
        autoplaySpeed: 5000,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    vertical: true,
                    verticalSwiping: true,
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 700,
                settings: {
                    vertical: false,
                    verticalSwiping: false,
                    slidesToShow: 3
                }
            }
          ]
    });
});
//калькуляция общей суммы на фронте
$(document).ready(function () {
 $('.nutrition').change(function() {
    var price = $(this).parent().parent().next().find('.cottages__total-price').data('total');
    var start_date =  Date.parse($("input[name='start_date']").val())/1000;
    var end_date = Date.parse($("input[name='end_date']").val())/1000;
    var total_time = parseInt(end_date - start_date)/86400;
    var number_of_person = $(this).parent().prev('.form-group').find("input[name='number_of_person']").val();
    var nutrition = $(this).find("option:selected").val();
    var total_price = ((parseInt(price) + parseInt(nutrition)) * parseInt(number_of_person)) * total_time;
    $(this).parent().parent().next().find('.cottages__total-price').html('<span style="font-size: 22px; color:#845A42;">Итого: </span>' + total_price + ' &#8381');
 });
});

//кнопки "свернуть"/"развернуть"

$( ".cottages__characteristics .cottages__button-toggle" ).click(function() {
    if($(this).hasClass('active')) {
        $('.cottages__characteristics').css({'grid-template-rows':'1fr'});
        $('.cottages__characteristics_item').css({'display':'none'});
        $('.cottages__characteristics_title').css({'text-align':'center'});
        $(this).removeClass('active');
        $(this).html('Развернуть');
    } else {
        $('.cottages__characteristics').css({'grid-template-rows':'repeat(6, 1fr)','grid-template-columns':'1fr 1fr'});
        $('.cottages__characteristics_item').css({'display':'grid'});
        $('.cottages__characteristics_title').css({'text-align':'left'});
        $(this).addClass('active');
        $(this).html('Свернуть');
    }
});

$( ".cottages__description .cottages__button-toggle" ).click(function() {
    if($(this).hasClass('active')) {
        $('.cottages__description').children(':not(.cottage__description_title)').not('button').css({'display':'none'});
        $('.cottage__description_title').css({'text-align':'center','margin-bottom':'0'});
        $(this).removeClass('active');
        $(this).html('Развернуть');
    } else {
        $('.cottages__description').children().css({'display':'grid'});
        $('.cottage__description_title').css({'text-align':'left','margin-bottom':'1em'});
        $(this).addClass('active');
        $(this).html('Свернуть');
    }
});

//алькуляция при изменении диапазона дат и кол-ва человек

$(document).ready(function () {
   
    var start_date =  Date.parse($("input[name='start_date']").val())/1000;
    var end_date = Date.parse($("input[name='end_date']").val())/1000;

    if (isNaN(start_date) && isNaN(end_date)) {
        $('.cottages__total-price').css({'visibility':'hidden'});
    }

    $('.dates').change(function() {
        var price = $(this).parent().parent().next().find('.cottages__total-price').data('total');
        var start_date =  Date.parse($("input[name='start_date']").val())/1000;
        var end_date = Date.parse($("input[name='end_date']").val())/1000;
        var total_time = parseInt(end_date - start_date)/86400;
        var number_of_person = $(this).parent().next('.form-group').find("input[name='number_of_person']").val();
        var nutrition = $(this).parent().next().next().find("option:selected").val();
        var total_price = ((parseInt(price) + parseInt(nutrition)) * parseInt(number_of_person)) * total_time;
        $(this).parent().parent().next().find('.cottages__total-price').html('<span style="font-size: 22px; color:#845A42;">Итого: </span>' + total_price + ' &#8381').css({'visibility':'visible'});
    });

    $('.number_of_person').keyup(function() {
        var price = $(this).parent().parent().next().find('.cottages__total-price').data('total');
        var start_date =  Date.parse($("input[name='start_date']").val())/1000;
        var end_date = Date.parse($("input[name='end_date']").val())/1000;
        var total_time = parseInt(end_date - start_date)/86400;
        var number_of_person = $(this).val();
        var nutrition = $(this).parent().next().find("option:selected").val();
        var total_price = ((parseInt(price) + parseInt(nutrition)) * parseInt(number_of_person)) * total_time;
        $(this).parent().parent().next().find('.cottages__total-price').html('<span style="font-size: 22px; color:#845A42;">Итого: </span>' + total_price + ' &#8381');
    });

});

//ввод только цифр в инпут
$(document).ready(function() {
	$('[name=number_of_person]').bind("change keyup input click", function() {
		if (this.value.match(/[^0-9]/g)) {
			this.value = this.value.replace(/[^0-9]/g, '');
		}
	});
});

