<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Cottages extends MX_Controller {

    var $module_name	= "cottages";

    function __construct()
    {
        parent::__construct();
        $this->load->library('common/main_lib');
        $this->load->model('cottages_model');
        $this->settings = Modules::run('settings/settings/get_all_settings');
    }

    //вывод всех статей в разделе статьи или вывод одной статьи
    function view($url = "cottages"){
        if ($url == "cottages") {
            $this->main_lib->check_isset_page($url, 'pages');
            $data = $this->main_lib->get_meta_data($url, 'pages');
        }else {
            $this->main_lib->check_isset_page($url, 'cottages');
            $data = $this->main_lib->get_meta_data($url, 'cottages');
        }
        
        $data["content"] = $this->get_cottage($url);
        $this->main_lib->render_main_page($data);
    }

    //вывод сгенерированного содержания страницы для общего шаблона по url
    function get_cottage($url){
        //$result = $this->cottages_model->get_cottage($url);
        $result = array();


        /*$result['options'] = $this->db->where('cottage_id', $result['id'])->get('cottages_data')->result_array();
        foreach ($result['options'] as $key => $value)
        {
            $result[$value['name']] = $value['content'];
        }*/
        //$result['cottages'] = $this->db->get('cottages')->result_array();
        $result['cottages'] = $this->cottages_model->get_cottage($url);
        //получаем даты забронированных коттеджей из базы
        $single_cottage_booked_dates = count($result['cottages']);
        for($i=0; $i<$single_cottage_booked_dates; $i++) {
        	$result['cottages'][$i];
        	$result['booked_dates'][] = $this->cottages_model->get_cottage_date($result['cottages'][$i]['id']);
        }


        $result += Modules::run('settings/get_settings');
		
        //проверяем не задан ли шаблон для этой страницы

        $data = $this->load->view("site/cottages_full.tpl",  $result,  true);
        return $data;
    }

    function get_cottage_form()
    {

        //$this->session->keep_flashdata('forms');
        /*$data["captcha"] = $this->_captcha_is_on();*/
        $data['id_cottage'] = $_POST['id'];
        $data['number_of_person'] = $_POST['number_of_person'];
        $data['nutrition'] = $_POST['nutrition'];
        $data['start_date'] = $_POST['start_date'];
        $data['end_date'] = $_POST['end_date'];
        $data['total_price'] = $_POST['total_price'];
        $is_ajax = $this->input->is_ajax_request();

        $result = $this->cottages_model->get_cottage_date($_POST['id']);
        //print_r($result);
        //проверяем пересекаются ли выбранные даты с уже сохраненными в базу
        $flag = false;
        $booked = count($result);
        //var_dump($booked);
        for($i=0; $i<$booked; $i++) {
					$result[$i]['start_date'];
        	$result[$i]['end_date'];
/*        	 var_dump($result[$i]['start_date']);
        	 var_dump($result[$i]['end_date']);
        	 var_dump($data['start_date']);
        	 var_dump($data['end_date']);*/
        	if($data['start_date'] >= $result[$i]['start_date'] && $result[$i]['end_date'] >= $data['end_date']) {

        		$flag = true;
        		//echo "true";

        	} else {
        		//echo "false";
        	}
        	if($data['start_date'] <= $result[$i]['start_date'] && $result[$i]['end_date'] <= $data['end_date']) {

        		$flag = true;
        		//echo "true";
        	}else {
						//echo "false";
        		
        	}
        	if($data['start_date'] < $result[$i]['start_date'] && $result[$i]['end_date'] > $data['end_date'] && $data['end_date'] > $result[$i]['start_date']) {

        		$flag = true;
      			//echo "true";
        	}else {
        		//echo "false";

        	}
        	if($data['start_date'] > $result[$i]['start_date'] && $result[$i]['end_date'] < $data['end_date'] && $result[$i]['end_date'] > $data['start_date']) {

        		$flag = true;
        		//echo "true";
        	} else {
						//echo "false";

        	}

        }

        if($flag == true) {
        	$data['booking'] = "Данные даты уже заняты, выберете другие дни";
        } else {
        	$data['booking'] = '';
        }

        if($is_ajax) {
            $this->parser->parse("forms_get_booking.tpl", $data);
        }
        else{
            show_404();
        }
    }


    function send_booking()
    {
        $is_ajax = $this->input->is_ajax_request();
        if ($is_ajax) {
            $post = $this->input->post();
            $post = $this->security->xss_clean($post);
/*            if ($this->_captcha_is_on() == 1) {
                if ($this->_check_captcha($post) == false) {
                    exit();
                }
            }*/
            $fields = array();
            (isset($post['name'])) ? $fields['name'] = $post['name'] : $fields['name'] = '';
            (isset($post['tel'])) ? $fields['tel'] = $post['tel'] : $fields['tel'] = '';
            (isset($post['number_of_person'])) ? $fields['number_of_person'] = $post['number_of_person'] : $fields['number_of_person'] = '';
            (isset($post['total_price'])) ? $fields['total_price'] = $post['total_price'] : $fields['total_price'] = '';
            (isset($post['nutrition'])) ? $fields['nutrition'] = $post['nutrition'] : $fields['nutrition'] = '';
            (isset($post['email'])) ? $fields['email'] = $post['email'] : $fields['email'] = '';
            (isset($post['cottage_id'])) ? $fields['cottage_id'] = $post['cottage_id'] : $fields['cottage_id'] = '';
            (isset($post['start_date'])) ? $fields['start_date'] = $post['start_date'] : $fields['start_date'] = '';
            (isset($post['end_date'])) ? $fields['end_date'] = $post['end_date'] : $fields['end_date'] = '';


            $fields['ip'] = $this->input->ip_address();

            $to_base = array(
                'num_of_person' => $fields['number_of_person'] ,
                'nutrition' => $fields['nutrition'],
                'tel' => $fields['tel'],
                'name' => $fields['name'],
                'email' => $fields['email'],
                'total_price' => $fields['total_price'],
                'start_date' => $fields['start_date'],
                'end_date' => $fields['end_date'],
                'cottage_id' => $fields['cottage_id'],
/*                'date' => date('Y-m-d H:i:s'),
                'ip' => $fields['ip']*/
            );
            $this->db->insert('booking', $to_base);
            $id = $this->db->insert_id();
           if ($this->_send_mail() == '1') {
                $this->_form_mail($id);
            }
            $this->_final($id);
        }
        else{
            show_404();
        }
    }
/*
    public function check_availability()
    {
       
        $data['aviable'] = $this->cottages_model->get_cottage_date($data['id_cottage'], );.
    }*/

    function _form_mail($id)
    {

        $query_arr = $this->db->select('*')->from('booking')->where('id', $id)->limit(1)->get()->row_array();
        $query_arr['form_name'] = $this->db->select('name')->from('cottages')->where('id', $query_arr['cottage_id'])->limit(1)->get()->row_array()['name'];
        $theme = "Заявка: ".$query_arr['id'];
        $message = "";
        $message .= "Форма заявки: ".$query_arr['form_name']."<br><br>";
        $message .= "Имя: ".$query_arr['name']."<br>";
        if($query_arr['tel'] != ''){
            $message .= "Телефон: ".$query_arr['tel']."<br>";
        }
        if($query_arr['email'] != ''){
            $message .= "Адресс: ".$query_arr['email']."<br>";
        }
        if($query_arr['total_price'] != ''){
            $message .= "Итоговая стоимость: ".$query_arr['total_price']."<br>";
        }
        if($query_arr['nutrition'] != ''){
            $message .= "Форма питания: ".$query_arr['nutrition']."<br>";
        }
        if($query_arr['num_of_person'] != ''){
            $message .= "Кол-во человек: ".$query_arr['num_of_person']."<br>";
        }
        if($query_arr['start_date'] != ''){
            $message .= "Дата заезда: ".date("Y-m-d", $query_arr['start_date'])."<br>";
        }
        if($query_arr['end_date'] != ''){
            $message .= "Дата отбытия: ".date("Y-m-d", $query_arr['end_date'])."<br>";
        }
        
        //все данные для отправки берем из бд-настройки
        $data = $this->settings;
        //$sitename = $this->main_lib->url_translit($data['sitename']);
        $sitename = '=?UTF-8?B?'.base64_encode($data['sitename']).'?=';

        $email_sender = $data['email_sender'];
        $email_orders = $data['email_order'];

        $email_orders = explode(',',$email_orders);

        foreach($email_orders as $email_order)
        {
            $email_order = trim($email_order);
            mail($email_order, $theme, $message, "From: ".$sitename." <".$email_sender.">\nContent-Type: text/html;\n charset=utf-8\nX-Priority: 0");

        }
    }

        //функция проверки отправки писем на почту
    function _send_mail(){
        //проверяем включена ли каптча в настройках сайта
        $data = $this->settings;
        return $data['send_mail'];
    }

}