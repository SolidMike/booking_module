/**
 * @copyright 2015 MSCMS
 * @author http://polyakov.co.ua <zhenya_polyakov@mail.ru>
 * @cms http://mscms.com.ua <dev@mscms.com.ua>
 */
//========================================== uploader
$(function() {

    //========================================== uploader delete
    $('.remove-option').live('click', function () {
        var page_id = $('#inputID').val();
        var option_id = $(this).closest('tr').find('input[name^="option_id[]"]').val();
        //var option_name = $(this).closest('tr').find('input[name^="option_name[]"]').val();

        var element = this;
        if (option_id) {
            var formData = {
                option_id: option_id,
                //option_name: option_name,
                cottage_id: cottage_id
            };
            $.ajax({
                url: '/admin/cottages/delete_cottage_option',
                type: 'POST',
                data: formData,
                success: function (respons) {
                    $(element).closest('tr').fadeOut("slow").delay(500).queue(function(){$(element).closest('tr').remove();});
                    var obj = jQuery.parseJSON(respons);
                    if(obj.sucess == 'true'){
                        CMSApi.showMessage('warning', "Данные удалены из бд и сервера!");
                    }
                    else if(obj.sucess == 'false'){
                        CMSApi.showMessage('danger', "Данные НЕ удалены из бд и сервера!");
                    }
                },
                error: function () {
                    CMSApi.showMessage('danger', "Данные НЕ удалены из бд и сервера!");
                }
            });
            return true;
        }

    });

    //========================================== uploader save
    $('.save-option').live('click', function () {
        var cottages_id = $('#inputID').val();
        var option_id = $(this).closest('tr').find('input[name^="option_id[]"]').val();
        var option_name = $(this).closest('tr').find('input[name^="option_name[]"]').val();
        var option_header = $(this).closest('tr').find('input[name^="option_header[]"]').val();
        var option_content = $(this).closest('tr').find('textarea[name^="option_content[]"]').val();


        var element = this;
        if (!option_id) {
            var formData = {
                option_id: '',
                cottage_id: cottage_id,
                option_name: option_name,
                option_header: option_header,
                option_content: option_content
            };
            $.ajax({
                url: '/admin/cottages/save_cottage_option',
                type: 'POST',
                data: formData,
                success: function (respons) {
                    var obj = jQuery.parseJSON(respons);
                    $(element).closest('tr').prepend("<input type='hidden' name='option_id[]' value='"+obj[0]['option_id']+"' >");
                    $(element).before( "<button class='btn btn-sm btn-link save-option'><i class='glyphicon glyphicon-refresh'></i> Обновить</button>" );
                    $(element).before( "<button class='btn btn-sm btn-link remove-option'><i class='glyphicon glyphicon-remove'></i> Удалить</button>" );
                    $(element).remove();
                    CMSApi.showMessage('info', "Данные добавленны в бд!");
                },
                error: function (response) {
                    CMSApi.showMessage('danger', "Данные в бд не добавленны!");
                }
            });
            return false;
        }
        else if (option_id) {
            var formData = {
                option_id: option_id,
                cottage_id: cottage_id,
                option_name: option_name,
                option_header: option_header,
                option_content: option_content
            };
            $.ajax({
                url: '/admin/cottages/save_cottage_option',
                type: 'POST',
                data: formData,
                success: function () {
                    CMSApi.showMessage('info', "Данные в бд обновленны!");
                },
                error: function () {
                    CMSApi.showMessage('danger', "Данные в бд не обновленны!");
                }
            });
            return false;
        }
    });
    //========================================== upload file
    //$('#upload_file').live('change', AjaxFileUpload);
    $('.add_option').live('click', function () {
        var formData = new FormData($(".form-horizontal")[0]);
        //выводим товар в таблицу
        $('.files').prepend("" +
            "<tr class='template-upload'>" +
            "<input type='hidden' name='option_id[]' value=''>" +
            "<td><input class='form-control input-sm' type='text' name='option_name[]' value=''></td>" +
            "<td><input class='form-control input-sm' name='option_header[]'></td>" +
            "<td><textarea class='form-control input-sm' name='option_content[]'></textarea></td>" +
            "<td class='col-sm-2'>" +
            "<div class='btn-group-vertical' role='group' >" +
            "<button class='btn btn-sm btn-link save-option'>" +
            "<i class='glyphicon glyphicon-ok-circle'></i> Сохранить" +
            "</button>" +
                //"<button class='btn btn-sm btn-link download-image'>" +
                //"<i class='glyphicon glyphicon-download-alt'></i> Скачать" +
                //"</button>" +
            "</div>" +
            "</td>" +
            "</tr>");
    });
});

//========================================== uploader AjaxFileUpload
function AjaxFileUpload() {
    var formData = new FormData($(".form-horizontal")[0]);

    $.ajax({
        url: '/gallery/gallery_uploader/do_upload',
        type: 'POST',
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function (response) {
            var obj = jQuery.parseJSON(response);
            CMSApi.showMessage('info', "Файл "+obj['files'][0]['name']+" загружен на сервер!");

            //выводим товар в таблицу
            $('.files').prepend("" +
            "<tr class='template-upload'>" +
            "<input type='hidden' name='image_thumb_url[]' value='"+obj['files'][0]['thumbnailUrl']+"'>" +
            "<input type='hidden' name='image_url[]' value='"+obj['files'][0]['url']+"'>" +
            "<td><span class='preview'><img onclick=\'CMSApi.show_image(this)\'  class='img-thumbnail' src='"+obj['files'][0]['url']+"' alt='' title='' /></span></td>" +
            "<td><p class='name'>"+obj['files'][0]['url']+"</p></td>" +
            "<td><input class='form-control input-sm' name='image_title[]'></td>" +
            "<td><input class='form-control input-sm' name='image_alt[]'></td>" +
            "<td><input class='form-control input-sm' name='image_position[]'></td>" +
            "<td class='col-sm-2'>" +
            "<div class='btn-group-vertical' role='group' >" +
            "<button class='btn btn-sm btn-link save-image'>" +
            "<i class='glyphicon glyphicon-ok-circle'></i> Сохранить" +
            "</button>" +
            //"<button class='btn btn-sm btn-link download-image'>" +
            //"<i class='glyphicon glyphicon-download-alt'></i> Скачать" +
            //"</button>" +
            "</div>" +
            "</td>" +
            "</tr>");
        }
    });
    return true;
};