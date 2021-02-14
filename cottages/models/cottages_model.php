<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cottages_model extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }

    //выбираем все категории сортируем по position
    public function get_all_cottages() {
        $this->db->order_by('created', 'DESC');
        $query = $this->db->get('cottages');

        if ($query->num_rows() > 0) {
            $categories = $query->result_array();
            return $categories;
        }
        return FALSE;
    }

    //функция возвращает все страницы по id каталога
    function get_cottages($num, $offset, $cat = null){
        $this->db->select('*');
        if ($cat != null){
            $this->db->where('cat_id', $cat);
        }
        $this->db->order_by("cottages.id", "ASC");
        $query = $this->db->get("cottages", $num, $offset);
        $result = $query->result_array();
        return $result;
    }

    //функция возвращает все данные страницы page
    function get_cottage($url){
        //$this->db->where('meta_url', $url);

        if ($url != "cottages") {
            $this->db->where("meta_url", $url);
        }

        $query = $this->db->get('cottages');
        $result = $query->result_array();
        foreach($result as $key => $one_result)
        {
            $result[$key]['slides'] = $this->get_cottage_slides($one_result['id']);
        }
        return $result;
    }

    function get_cottage_slides($id) {
        $this->db->where('cottage_id', $id);
        return $this->db->get('cottages_slider')->result_array();
    }

        function get_cottage_date($id) {
            $this->db->select('start_date');
            $this->db->select('end_date');
            $this->db->select('cottage_id');
            return $this->db->get_where('booking', array('cottage_id' => $id))->result_array();
    }

       /* public function get_cottages_booking($id)
        {
            $this->db-select('*');
            return $this->db->get_where('booking', array('cottage_id' => $id))->result_array();
        }*/

}


