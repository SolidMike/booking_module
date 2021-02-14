<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Cottages_lib {

    function __construct()
    {
        $this->CI = get_instance();
        $this->CI->load->module('auth')->check_access(); //проверка доступа
    }

    //список категорий для списка страниц
    function get_categories($cat = null){
        $active0 = '';
        $active1 = '';
        if(!isset($cat)){
            $active0 = "active";
        }
        elseif($cat == 0){
            $active1 = "active";
        }
        $html = '<div class="col-sm-12 padding-0 btn-group-vertical">
                <a href="/admin/cottages/index/" class="btn btn-link text-left '.$active0.'">Все категории</a>
                <a href="/admin/cottages/cottages_list/0" class="btn btn-link text-left '.$active1.'">Без категорий</a>
                </div>
                <p>&nbsp;</p>';
        $query = $this->CI->db->get('category');
        $html .= '<div class="col-sm-12 padding-0 btn-group-vertical" >';
        foreach ($query->result_array() as $cats)
        {
            ($cat == $cats['id']) ? $active = "active" : $active = '';
            $html .= '<a href="/admin/cottages/cottages_list/'.$cats["id"].'" style="text-align:left;" class="btn btn-link text-overflow '.$active.'" >';
            $html .= $cats['name'];
            $html .= "</a>";
        }
        $html .= '</div>';
        return $html;
    }

    //создание древовидного каталога
    function get_select_categories($active_id = 0)
    {
        $query = $this->CI->db->get('category');
        if($query->num_rows() > 0)
        {
            $cats = array();
            foreach ($query->result_array() as $cat)
            {
                $cats[$cat['parent_id']][] = $cat;
            }

            function create_tree ($cats, $active_id, $parent_id, $level=0)
            {
                if(is_array($cats) and  isset($cats[$parent_id]))
                {
                    $tree = '';
                    foreach($cats[$parent_id] as $cat)
                    {
                        ($active_id == $cat['id']) ? $selected = " selected='selected' " : $selected = '';
                        $padding = " style=\"padding-left:".($level*10)."px;\" ";
                        $tree .= "<option".$padding."value='".$cat['id']."'".$selected.">";
                        for($i = 1; $i<=$level ;$i++){
                            $tree .= "-";
                        }
                        $tree .= "&nbsp;".$cat['name'];
                        $tree .= "</option>";
                        $tree .=  create_tree ($cats, $active_id, $cat['id'], $level+1);
                    }
                }
                else
                {
                    return null;
                }
                return $tree;
            }
            $html = '<select class="form-control categoryselect" name="cat_id">';
            $html .= '<option value="0" selected="selected">&nbsp;Без категории</option>';
            $html .= create_tree ($cats, $active_id, 0);
            $html .= "</select>";
            return $html;
        }
        else
        {
            $html = '<select class="form-control categoryselect" name="cat_id">';
            $html .= '<option value="0" selected="selected">&nbsp;Без категории</option>';
            $html .= "</select>";
            return $html;
        }

    }

}