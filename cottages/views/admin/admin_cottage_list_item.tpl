<tr>
    <td>
        <div class="checkbox-del">
            <input type="checkbox" name="ids[<?=$item["id"];?>]" value="<?=$item["id"];?>"  id="checkbox-<?=$item["id"];?>"><label for="checkbox-<?=$item["id"];?>"></label>
        </div>
    </td>
    <td ><?= $item["id"]; ?></td>
    <td class="col-sm-7">
        <i class="fa fa-file-text-o"></i>&nbsp;
        <a href="/admin/cottages/edit/<?= $item["id"]; ?>" data-rel="tooltip" data-placement="top" data-original-title="Редактировать страницу" title="<?=$item["name"]?>"><?php echo mb_substr($item["name"], 0, 80); ?></a>
    </td>
    <td class="share_alt col-sm-6">
        <div class="o_h">
            <a href="/cottages/<?=$item["meta_url"]?>" target="_blank" class="f_l tooltips" data-rel="tooltip" data-placement="top" title="<?php echo base_url()."cottages/"; echo $item["meta_url"]; ?>"><?php echo mb_substr($item["meta_url"], 0, 40); ?></a>
        </div>
    </td>
    <td class="col-sm-1 col-sm-offset-1 text-center">
        <div class="onchange">
            <input class="checkbox-slide" type="checkbox" id="checkboxs-<?=$item["id"];?>"  value="<?=$item["id"];?>" <?php echo ($item['post_status'] == '1') ? 'checked="checked"' : ''; ?> /><label for="checkboxs-<?=$item["id"];?>"></label>
        </div>
    </td>
</tr>