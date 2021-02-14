<div class="modal-booking-content">
    <div class="text1">Забронировать коттедж</div>
    <form method="post" id="form_booking" action="/cottages/cottages/send_booking">
    <div class="form-group">
        <input type="text" class="form-control modal-zvonok-content" name="email" placeholder="email">
    </div>
    <div class="form-group">
        <input type="text" class="form-control modal-zvonok-content" name="name" placeholder="Имя">
    </div>
    <div class="form-group">
        <input type="tel" class="form-control modal-zvonok-content phone" name="tel" placeholder="Телефон">
    </div>
    <input type="hidden" name="start_date" value="<?=$start_date?>">
    <input type="hidden" name="end_date" value="<?=$end_date?>">
    <input type="hidden" name="number_of_person" value="<?=$number_of_person?>">
    <input type="hidden" name="nutrition" value="<?=$nutrition?>">
    <input type="hidden" name="total_price" value="<?=$total_price?>">
    <input type="hidden" name="cottage_id" value="<?=$id_cottage?>">
    <button <?echo($booking != '') ? 'disabled' : ''?> type="submit" id="send_booking">Отправить</button>
    <div class="text2">Нажимая на кнопку, вы даете согласие на обработку своих <br>персональных данных и
        соглашаетесь с <a href="javascript:void(0);" class="konf">Политикой конфиденциальности</a></div>
    </form>
    <div style="    
    text-align: center;
    margin-top: 10px;
    color: #ff0000;"><?=$booking?></div>
</div>
