<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends MX_Controller {

	var $module_name	= "cottages";

    function __construct()
    {
        parent::__construct();
        $this->load->helper('text');
        $this->load->library('admin/admin_lib');
        $this->load->model('cottages_model');
        $this->load->library('cottages/cottages_lib');
    }

    function index()
    {
        //Пагинация
        $this->load->library('pagination');
        $config = array();
        $config["base_url"] = base_url().'admin/cottages/index/';
        $config['total_rows'] = $this->db->count_all('cottages');
        $config["per_page"] = $this->config->item('pagination', 'admin_config');
        $config["uri_segment"] = 4;
        $uri_segment = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
        $this->pagination->initialize($config);
        $data['links'] = $this->pagination->create_links();

        $data['categories'] = $this->cottages_lib->get_categories();
        $tree = $this->cottages_model->get_cottages($config["per_page"], $uri_segment);
        $data["pageTreeHTML"] = $this->renderPageList($tree);

        $tpl['content'] = $this->load->view("admin/admin_cottage_list.tpl", $data, true);
        $this->admin_lib->render_admin_page($tpl);
    }

    function cottage_list($cat = null)
    {
        //Пагинация
        $this->load->library('pagination');
        $config = array();
        $config["base_url"] = base_url().'admin/cottages/cottages_list/'.$cat.'/';
        $config['total_rows'] = $this->db->where('cat_id', $cat)->get('cottages')->num_rows();
        $config["per_page"] = $this->config->item('pagination', 'admin_config');
        $config["uri_segment"] = 5;
        $uri_segment = ($this->uri->segment(5)) ? $this->uri->segment(5) : 0;
        $this->pagination->initialize($config);
        $data['links'] = $this->pagination->create_links();

        $data['categories'] = $this->cottages_lib->get_categories($cat);
        //добаляем в сессии номер каталога для автоматического распознавания при добавлении статьи
        $this->session->set_userdata('catalog_id', $cat);
        $tree = $this->page_model->get_pages($config["per_page"], $uri_segment, $cat);
        $data["pageTreeHTML"] = $this->renderPageList($tree);

        $tpl['content'] = $this->load->view("admin/admin_cottage_list.tpl", $data, true);
        $this->admin_lib->render_admin_page($tpl);
    }

    //рендер всех каталогов по шаблону
    private function renderPageList($tree) {
        $html = '';

        foreach ($tree as $item) {
            $html .= '<div>';
            $html .= $this->load->view('admin/admin_cottage_list_item.tpl', array('item' => $item), true);
            $html .= '</div>';
        }
        return $html;
    }

    //добавляем данные
    function add()
    {
        if ($this->session->userdata('catalog_id')){
            $cat = $this->session->userdata('catalog_id');
        }
        else{
            $cat = "";
        }
        $data['cat_id'] = $this->cottages_lib->get_select_categories($cat);
        $tpl['content'] = $this->load->view("admin/admin_cottage_add.tpl", $data, true);
        $this->admin_lib->render_admin_page($tpl);
    }

    //удаляем данные
    function delete($id = null)
    {
        if($id != ""){
            $this->db->where('id', $id);
            $this->db->delete('cottages');
            $this->admin_lib->set_admin_alerts('alert_warning', 'Страница удалена ID#'.$id.'', 'admin/cottages');
        }
        elseif ($this->input->post()) {
            $post = $this->input->post();
            $data['ids'] = $post['ids'];
            $count = 0;
            foreach($data['ids'] as $key => $value){
                $this->db->where('id', $value);
                $this->db->delete('cottages');
                $this->db->where('cottage_id', $value);
                $this->db->delete('cottages_slider');
                $this->db->where('cottage_id', $value);
                $this->db->delete('booking');
                $count++;
            }
            $this->admin_lib->set_admin_alerts('alert_warning', 'Страницы удалены '.$count.' шт.');
        }
        else {
            $this->admin_lib->set_admin_alerts('alert_danger', 'Ошибка страница не удалена');
        }
    }

    //редактируем данные
    function edit($id)
    {
        $this->db->where("id", $id);
        $query = $this->db->get('cottages');

        

        $query_arr = $query->row_array();
        $data = $query_arr;
        $data['today'] = date('Y-m-d H:i:s');
        $data['cat_id'] = $this->cottages_lib->get_select_categories($query_arr['cat_id']);
        $data['options'] = $this->db->where('cottage_id', $id)->get('cottages_data')->result_array();
        $data['arr_images'] = $this->db->where('cottage_id', $id)->get('cottages_slider')->result_array();

        $data['booking'] = $this->db->where('cottage_id', $id)->get('booking')->result_array();

        $tpl['content'] = $this->load->view("admin/admin_cottage_edit.tpl", $data, true);
        $this->admin_lib->render_admin_page($tpl);
    }

    //сохраняем данные
    function save($new = false)
    {
        if ($this->input->post())
        {
            $post = $this->input->post();
            $id = $this->input->post('id');
            $data['name'] = htmlspecialchars($post['name']);
            $data['cat_id'] = $post['cat_id'];
            $data['content'] = $post['content'];
            $data['short_content'] = $post['short_content'];
            //$data['image'] = $post['image'];
            $data['template'] = $post['template'];
            $data['animals'] = $post['animals'];
            $data['house_type'] = $post['house_type'];
            $data['sleeping_places'] = $post['sleeping_places'];
            $data['total_area'] = $post['total_area'];
            $data['price'] = $post['price'];
            $data['breakfast_price'] = $post['breakfast_price'];
            $data['half_board_price'] = $post['half_board_price'];
            $data['all_inclusive_price'] = $post['all_inclusive_price'];
            $data['floors'] = $post['floors'];
            $data['repair'] = $post['repair'];
            $data['toilets'] = $post['toilets'];
            $data['wifi'] = $post['wifi'];
            $data['cleaning'] = $post['cleaning'];

            (!isset($post['created']) || $post['created'] == "") ? $data['created'] = date('Y-m-d H:i:s') : $data['created'] = $post['created'];
            (!isset($post['edited']) || $post['edited'] == "") ? $data['edited'] = date('Y-m-d H:i:s') : $data['edited'] = $post['edited'];
            ($post['meta_url'] == "") ? $data['meta_url'] = $this->admin_lib->url_translit($post['name']) : $data['meta_url'] = $post['meta_url'];

            $data['meta_title'] = htmlspecialchars($post['meta_title']);
            //$data['meta_h1'] = htmlspecialchars($post['meta_h1']);
            $data['meta_h1'] = $post['meta_h1'];
            $data['meta_description'] = htmlspecialchars($post['meta_description']);
            $data['meta_keywords'] = htmlspecialchars($post['meta_keywords']);
            $data['post_status'] = htmlspecialchars($post['post_status']);

            if($new == true){
                //$data['edited'] = date('Y-m-d H:i:s');
                $this->db->insert('cottages', $data);
            }
            else{
                //$data['edited'] = $post['edited'];
                $this->db->where("id", $id);
                $this->db->update('cottages', $data);
            }

            $data_image = [];
            $data_image['cottage_id'] = $post['id'];

            if (isset($post['arr_images']))
            {
                $data_image['url'] = $post['arr_images'];

                $this->db->where("cottage_id", $data_image['cottage_id']);
                $this->db->delete('cottages_slider');


                foreach ($data_image['url'] as $url) {
                    $this->db->insert('cottages_slider', [
                        "cottage_id"=>$data_image['cottage_id'],
                        "url"=>$url
                    ]);
                }
            }
            else
            {
                $this->db->where("cottage_id", $data_image['cottage_id']);
                $this->db->delete('cottages_slider');
            }


            if ($this->session->userdata('catalog_id')){
                $redirect = "admin/cottages/cottages_list/".$this->session->userdata('catalog_id');
            }
            else{
                $redirect = "admin/cottages";
            }
            $this->admin_lib->set_admin_alerts('alert_success', 'Страница сохранена: '.$data['name'].' ', $redirect);
        }
        else
        {
            $this->admin_lib->set_admin_alerts('alert_danger', 'Страница не сохранена', 'admin/page'); 
        }
    }

    //методом post проверяет наличие URL в базе данных и возвращает TRUE или FALSE
    function checkname(){
        $isAvailable = true;
        if ($this->input->post()) {
            $post = $this->input->post();
            switch ($post['type']) {
                case 'url':
                    $url = $post['meta_url'];
                    $id = $post["id"];
                    $query = $this->db->where('id !=', $id)->where("meta_url", $url)->get('cottages');
                    if ($query->num_rows() == 0) {
                        $isAvailable = true;
                    } elseif ($query->num_rows() > 0) {
                        $isAvailable = false;
                    }
                    break;
                case 'name':
                default:
                    $name = $post['name'];
                    $isAvailable = true; // or false
                    break;
            }
        }
        // возвращаем true or false для валидации
        echo json_encode(array(
            'valid' => $isAvailable,
        ));
    }

    //изменяем методом ajax видимость страницы
    function change_status($id){
        if ($id != "") {
            $query = $this->db->get_where('cottages', array('id' => $id));
            $result = $query->row_array();
            if($result['post_status'] == '1'){
                $data['post_status'] = '0';
            }
            elseif($result['post_status'] == '0'){
                $data['post_status'] = '1';
            }
            $this->db->where("id", $id);
            $this->db->update('cottages', $data);
        }
    }

    public function delete_cottage_option()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $id = $this->input->post('option_id');
            $data['cottage_id'] = $post['cottage_id'];

            $this->db->where("id", $id);
            $this->db->delete('cottages_data');
            if (!$this->db->affected_rows()) {
                $success = 'false';
            } else {
                $success = 'true';
            }

            if (IS_AJAX) {
                $info = new StdClass;
                $info->sucess = $success;
                echo json_encode(array($info));
            }
        }
        else
        {

        }
    }

    //сохраняем данные
    public function save_cottage_option()
    {
        if ($this->input->post()) {
            $post = $this->input->post();
            $id = $this->input->post('option_id');
            $data['cottage_id'] = $post['cottage_id'];
            $data['header'] = htmlspecialchars($post['option_header']);
            ($post['option_name'] == "") ? $data['name'] = $this->admin_lib->url_translit($post['option_header']) : $data['name'] = $this->admin_lib->url_translit($post['option_name']);
            $data['content'] = $post['option_content'];


            if ($id != '') {
                $info = new StdClass;
                $info->option_id = $id;
                $info->option_name = $data['name'];

                $this->db->where("id", $id);
                $this->db->update('cottages_data', $data);
                if (IS_AJAX) {
                    //I don't think it matters if this is set but good for error checking in the console/firebug
                    echo json_encode(array($info));
                }
            } else {
                $this->db->insert('cottages_data', $data);
                $info = new StdClass;
                $info->option_id = $this->db->insert_id();
                $info->option_name = $data['name'];

                if (IS_AJAX) {
                    //I don't think it matters if this is set but good for error checking in the console/firebug
                    echo json_encode(array($info));
                }
            }

        } else {
            //$this->admin_lib->set_admin_alerts('alert_warning', '<strong>Системное сообщение</strong> - Запись не добавлена', 'admin/shop_product/product_list');
        }
    }

}
