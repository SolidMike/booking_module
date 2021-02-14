/**
 * @copyright 2015 MSCMS
 * @author http://polyakov.co.ua <zhenya_polyakov@mail.ru>
 * @cms http://mscms.com.ua <dev@mscms.com.ua>
 */
//======================================== Выбор даты публикации datepicker
$(function(){
    $('.form_datetime').datetimepicker({
        language:  'ru',
        format: "yyyy-mm-dd hh:mm:ss",
        minuteStep: 10,
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    }).on('changeDate', function(e) {
        // Revalidate the date field
        $('.form-horizontal').bootstrapValidator('revalidateField', 'edited');
    });
});
//======================================== Валидация полей при редактировании и создании страниц
$(document).ready(function() {
    $('[data-rel="tooltip"]').tooltip({
        delay: {show: 900, hide: 100}
    });
    $('.form-horizontal').bootstrapValidator({
        framework: 'bootstrap',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        excluded: [':disabled'],
        fields: {
            name: {
                validators: {
                    notEmpty: {
                    },
                    stringLength: {
                        min: 2,
                        max: 300
                    }
                }
            },
            edited: {
                feedbackIcons: 'false',
                validators: {

                    date: {
                        message: 'Выберете дату с помощью календаря',
                        format: 'YYYY-MM-DD HH:MM:SS'
                    }
                }
            },
            meta_url: {
                validators: {
                    notEmpty: {
                    },
                    regexp: {
                        regexp: /^[a-z0-9_-]{3,130}$/
                    },
                    remote: {
                        message: 'Введенный URL уже используется на сайте!',
                        url: '/admin/page/checkname',
                        data: {
                            type: 'url',
                            id: $("#inputID").val()
                        },
                        type: 'POST'
                    },
                    stringLength: {
                        min: 3,
                        max: 130
                    }
                }
            }
        }
    });
});

//========================================== Изменение видимости(отображения) раздела
$(function(){
    $(".onchange :checkbox").change(function(){
        var page_id = $(this).val();
        $.post('/admin/page/change_status/' + page_id, {}, function(data) {
            //alert('/admin/page/change_status/' + page_id);
        }).fail(function() {
            CMSApi.showMessage('danger', 'Возникли ошибки на сервере');
        });
    });
});


