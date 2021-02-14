<!--Блоки менять местами и/или добавлять новые с оглядкой на main.js. Расположение подвязано к калькуляции и получении данных из инпутов-->
<section class="page-about">
	<div class="page-about-content">
		<?//=Modules::run('breadcrumbs/get_breadcrumbs')?>
		<div style="margin-top: 40px;" class="section_title">
			<h1>Дома</h1>
		</div>
		<?php if ($cottages != array()) : ?>

			<div class="content-text">

				<?php foreach($cottages as $cottage) { ?>

					<section class="cottages">
						<div class="cottages__title"><a href="<?=$cottage['meta_url']?>"><?=$cottage['name']?></a></div>
						<div class="cottages__slider">
							<div class="tour-gallery__for">

								<?for($i=0; $i<count($cottage['slides']); $i++) { ?>

									<div class="img-for-wrapp" style="background-image: url(<?=$cottage['slides'][$i]['url']?>);"></div>

								<? } ?>
							</div>
							<div class="tour-gallery__nav">

								<?for($i=0; $i<count($cottage['slides']); $i++) { ?>

									<div class="one-slide-padding">
										<div class="img-nav-wrapp" style="background-image: url(<?=$cottage['slides'][$i]['url']?>);"></div>
									</div>

								<?php } ?>

							</div>
						</div>
						<div class="cottages__form">
							<div class="cottages__price"><span style="font-size:28px; color: #845A42; font-weight: 600;"><?=$cottage['price']?> &#8381;</span> <span style="font-size:14px; color: #828282; font-weight: 300;">1 чел./сутки</span></div>
							<div class="discount">Скидка 20% в будние дни</div>
							<div class="form_block_wrapper cottages_theme-grey_round-border">
								<div class="form_block_title title">Выберете условия</div>
								<div class="form_block">
									<label for="dates">Даты бронирования:</label>
									<div class="form-group dates-before-elem">
										<input type="text" id="dates" class="form-control dates" name="dates" placeholder="">
									</div>

									<div class="form-group">
										<label for="number_of_person">Количество человек:</label>
										<input type="text" id="number_of_person"  class="form-control number_of_person" name="number_of_person" placeholder="1 ч." value="1"> 
									</div>
									<div class="form-group nutrition-after-element">
										<label for="nutrition">Форма питания:</label>
										<select class="nutrition" id="nutrition" name="nutrition">
											<option class="" value="<?=$cottage['breakfast_price']?>">Завтрак</option>
											<option class="" value="<?=$cottage['half_board_price']?>">Полупансион</option>
											<option class="" value="<?=$cottage['all_inclusive_price']?>">Все включено</option>
										</select>
									</div>

									<input type="hidden" name="start_date" value="">
									<input type="hidden" name="end_date" value="">
								</div>
								<div class="form_block_wrapper__order">
									<div class="cottages__total-price" data-total="<?=$cottage['price']?>"><span>Итого:</span> <?=$cottage['price']?> &#8381;</div>
									<a class="booking_button" href="javascript:void()" data-href="/cottages/cottages/get_cottage_form" data-price="<?=$cottage['price']?>" data-id="<?=$cottage['id']?>">Забронировать дом</a>
								</div>
							</div>	
						</div>
								<div class="cottage_booked cottages_theme-grey_round-border" id="cottage_booked_<?=$cottage['id']?>">
									<span><?=$cottage['id']?>,</span>
								</div>
								<div class="cottages__characteristics cottages_theme-grey_round-border">
									<button class="cottages__button-toggle">Развернуть</button>
									<div class="cottages__characteristics_title title">Характеристики домов</div>
									<div class="cottages__characteristics_item"><div class="key">Тип дома</div><div class="value"><?=$cottage['house_type']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Общая площадь</div><div class="value"><?=$cottage['total_area']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Этажи</div><div class="value"><?=$cottage['floors']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Ремонт</div><div class="value"><?=$cottage['repair']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Количество спальных мест</div><div class="value"><?=$cottage['sleeping_places']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Число санузлов</div><div class="value"><?=$cottage['toilets']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Бесплатный Wi-Fi</div><div class="value"><?=$cottage['wifi']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Размещение в доме домашних животных</div><div class="value"><?=$cottage['animals']?></div></div>
									<div class="cottages__characteristics_item"><div class="key">Ежедневная уборка</div><div class="value"><?=$cottage['cleaning']?></div></div>
								</div>
								<div class="cottages__description cottages_theme-grey_round-border">
									<button class="cottages__button-toggle">Развернуть</button>
									<div class="cottage__description_title title">Описание дома</div>
									<?=$cottage['content']?>
								</div>
					</section>

				<? } ?>

			</div>

		<?php endif; ?>

		<?json_encode($booked_dates);?>
		<script>
			var booked_dates = <?php echo json_encode($booked_dates)?>;
		</script>
	</div>
</section>