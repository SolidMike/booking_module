<div class="panel panel-default">
    <div class="panel-heading panel-crud">
        <div class="row">
            <div class="panel-title col-lg-12">
                <h3 class="col-lg-2 text-primary">Страницы</h3>
                <div id="options-content" class="col-lg-10 text-right">
                    <a class="btn btn-danger btn-sm" href="/admin/cottages/delete" onclick="CMSApi.deleteFunction('deleteCheckbox', '/admin/cottages'); return false;" title="Удалить" class="add-anchor btn" id="deleteCheckbox" disabled="disabled">
                        <i class="fa fa-trash"></i>
                        Удалить
                    </a>
                    <a class="btn btn-success btn-sm" href="/admin/cottages/add" title="Создать страницу" class="add-anchor btn">
                        <i class="fa fa-plus-circle"></i>
                        Создать
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-striped table-hover ">
                    <thead>
                    <tr>
                        <th >
                            <div class="checkbox-del" id="allCheckbox">
                                <input type="checkbox" id="checkbox"><label for="checkbox"></label>
                            </div>
                        </th>
                        <th >ID</th>
                        <th class="col-sm-7">Название</th>
                        <th class="col-sm-4">URL</th>
                        <th class="col-sm-1" style="word-wrap: normal; word-break: normal;">Отображать</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?=$pageTreeHTML?>
                    </tbody>
                </table>
                <div class="clearfix text-center">
                    <?=$links?>
                </div>
            </div>
        </div>
    </div>
</div>
