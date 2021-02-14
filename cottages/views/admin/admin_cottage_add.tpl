<?php
if ($this->session->userdata('catalog_id')){
$redirect = "/admin/cottages/cottages_list/".$this->session->userdata('catalog_id');
}
else{
$redirect = "/admin/cottages";
}
?>
<form class="form-horizontal p-t-20" action="/admin/cottages/save/true" method="post" role="form">
    <div class="panel panel-default">
        <div class="panel-heading panel-crud">
            <div class="row">
                <div class="panel-title col-sm-12">
                    <h3 class="col-sm-4 text-primary">Создание страницы</h3>
                    <div id="options-content" class="col-sm-8 text-right">
                        <a href="<?=$redirect?>" class="panel-href" title="Вернутся">
                            <i class="fa fa-long-arrow-left"></i> Вернутся
                        </a>
                        <button type="submit"  class="btn btn-success btn-sm" title="Сохранить и выйти">
                            <i class="fa fa-check"></i> Сохранить
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#content" data-toggle="tab" aria-expanded="false">Страница</a></li>
                <li class=""><a href="#parameters" data-toggle="tab" aria-expanded="true">Свойства</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="content">
                    <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">Имя</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputName" name="name" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputParent" class="col-sm-2 control-label">Категория</label>
                        <div class="col-sm-8">
                            <?=$cat_id?>
                        </div>
                    </div>
                   <!--  
                    <div class="form-group">
                        <label for="created" class="col-sm-2 control-label">Дата публикации</label>
                        <div class="col-sm-8">
                            <div class="input-group date form_datetime">
                                <input class="form-control" size="16" type="text" id="created" name="created" value="<?=$today?>" >
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                    </div>
                     --><!-- 
                    <div class="form-group">
                        <label for="Img" class="col-sm-2 control-label">Изображение</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="Img" name="image">
                        </div>
                        <div class="col-sm-2">
                            <span class="btn btn-small col-sm-12 pull-right file-button">
                                <i class="fa fa-picture-o"></i>
                                <span>Изображение</span>
                                <input type="file" id="upload_image" name="userfile" onchange="CMSApi.ajax_file_upload('cottages', 'Img', 'input_image'); return false;" multiple>
                            </span>
                        </div>
                    </div> -->

                        <!-- <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <div class="extra_description_on_label">
                                    (можно загружать сразу несколько изображений)
                                </div>
                            </label>
                            <div class="col-sm-8 cottages_image_array image_array">
                                <?php if (is_array(isset($arr_images))) : ?>
                                    <?php foreach($arr_images as $one_image_elements) : ?>
                                        <div class="col-sm-4 text-center">
                                            <div class="col-sm-12 height-150">
                                                <img onclick="CMSApi.show_image(this)" src="<?=$one_image_elements['url']?>" class="img-thumbnail img_thumbnail_dynamic_module">
                                            </div>
                                            <div class="col-sm-12">
                                                <input type="text" class="form-control" name="arr_images[]" value="<?=$one_image_elements['url']?>">
                                            </div>
                                            <div class="col-sm-12">
                                                <button type="button" class="btn btn-danger btn-sm btn_arr_image_delete" title="Удалить">
                                                    <i class="fa fa-trash"></i> Удалить
                                                </button>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </div>
                            <div class="col-sm-2">
                                <span class="btn btn-info btn-small col-sm-12 pull-right file-button add_dynamic_module_arr_image">
                                    <i class="fa fa-plus"></i>
                                    <span>Загрузить изображение</span>
                                    <input type="file" class="files_arr_image" name="cottage_files[]" onchange="CMSApi.ajax_file_upload_for_array_image('cottages');" multiple>
                                </span>
                            </div>
                        </div>
                         -->

                    <div class="form-group">
                        <label for="textContent" class="col-sm-2 control-label">Содержание <i class="fa fa-info-circle href" data-rel="tooltip" data-toggle="tooltip" data-placement="top" title="Кнопка 'Разрыв страницы' - позволяет вывести краткое содержание текста в разделе."></i></label>
                        <div class="col-sm-8">
                            <textarea class="form-control texteditor" rows="5" id="textContent" name="content"></textarea>
                        </div>
                      <!--   <div class="col-sm-2">
                          <img onclick="CMSApi.show_image(this)" src="/themes/admin/images/no_photo.jpg" id="input_image" class="img-thumbnail">
                      </div> -->
                    </div>
                    <div class="form-group">
                        <label for="short_content" class="col-sm-2 control-label">Краткое описание</label>
                        <div class="col-sm-8">
                            <textarea class="form-control texteditor" rows="5" id="short_content" name="short_content"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="animals" class="col-sm-2 control-label">Животные</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="animals" name="animals"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="house_type" class="col-sm-2 control-label">Тип дома</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="house_type" name="house_type"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="sleeping_places" class="col-sm-2 control-label">Спальные места</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="sleeping_places" name="sleeping_places"></textarea>
                        </div>
                    </div>

                   <div class="form-group">
                        <label for="total_area" class="col-sm-2 control-label">Общая площадь</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="total_area" name="total_area"></textarea>
                        </div>
                    </div>

                     <div class="form-group">
                        <label for="price" class="col-sm-2 control-label">Стоимость</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="price" name="price"></textarea>
                        </div>
                    </div>

                     <div class="form-group">
                        <label for="breakfast_price" class="col-sm-2 control-label">Стоимость "Завтрака"</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="breakfast_price" name="breakfast_price"></textarea>
                        </div>
                    </div>

                     <div class="form-group">
                        <label for="half_board_price" class="col-sm-2 control-label">Стоимость "Полупансион"</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="half_board_price" name="half_board_price"></textarea>
                        </div>
                    </div>

                     <div class="form-group">
                        <label for="all_inclusive_price" class="col-sm-2 control-label">Стоимость "Все включено"</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="all_inclusive_price" name="all_inclusive_price"></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="floors" class="col-sm-2 control-label">Этажи</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="floors" name="floors"></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="repair" class="col-sm-2 control-label">Ремонт</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="repair" name="repair"></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="toilets" class="col-sm-2 control-label">Число с/у</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="toilets" name="toilets"></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="wifi" class="col-sm-2 control-label">WiFi</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="wifi" name="wifi"></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="cleaning" class="col-sm-2 control-label">Уборка</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="5" id="cleaning" name="cleaning"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="textTemplate" class="col-sm-2 control-label">Шаблон</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="textTemplate" name="template" >
                        </div>
                        <div class="col-sm-2">
                            <p class="text-right"> по умолчанию cottages_full.tpl</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Опубликованно</label>
                        <div class="col-sm-8">
                            <div class="radio col-sm-1">
                                <label>
                                    <input type="radio" name="post_status" id="optionsRadios2" value="1" checked="">
                                    Да
                                </label>
                            </div>
                            <div class="radio col-sm-1">
                                <label>
                                    <input type="radio" name="post_status" id="optionsRadios1" value="0" >
                                    Нет
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="parameters">
                    <div class="form-group">
                        <label for="meta_url" class="col-sm-2 control-label">URL</label>
                        <div class="col-sm-8">
                            <input type="text" maxlength="130" class="form-control" id="meta_url" name="meta_url">
                        </div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-small col-sm-12 pull-right" onclick="CMSApi.urlTranslit('inputName', 'meta_url'); return false;"><i class="fa fa-refresh"></i> Автозаполнение</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputMH1" class="col-sm-2 control-label">H1</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputMH1" name="meta_h1" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputMTitle" class="col-sm-2 control-label">Meta Title</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputMtitle" name="meta_title" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="textMDescription" class="col-sm-2 control-label">Meta Description</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" id="textMDescription" name="meta_description" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="textMKeywords" class="col-sm-2 control-label">Meta Keywords</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" id="textMKeywords" name="meta_keywords"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" value="" name="id" id="inputID">
        </div>
    </div>
</form>