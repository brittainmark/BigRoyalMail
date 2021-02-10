<?php
/*
 * Uk Quote methods for Big royal mail Parcel force
*/
// class methods
//function quote($method = '') {


$currencies = new currencies();

$dest_country_code = $order->delivery['country']['iso_code_2'];
$dest_country_title = $order->delivery['country']['title'];
$dest_zone = 0;
$error = 0;
$module = strtoupper($this->code);

for ($i=1; $i<=$this->num_zones; $i++) {
	//ensure the zone is defined
	if(defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i)){

		$countries_table = constant('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i);
		$country_zones = preg_split("/,/", preg_replace('/\s*/', '', $countries_table) );

		if (in_array($dest_country_code, $country_zones)) {
			//found country

			$dest_zone = $i;
			break;
		}
	}
}
//12 FEB 04 MBeedell	NO specified country (or *) then use this zone for all shipping rates
if ($dest_zone == 0) {
	for ($i=1; $i<=$this->num_zones; $i++) {
		if(defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i)){
			$countries_table = constant('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i);
			if ($countries_table == '' or $countries_table == '*') {
				$dest_zone = $i;
				break;
			}
		}
	}
}
$sales_value = isset($sales_value) ? $order->info['subtotal'] : $order->info['total'];
if ($dest_zone == 0) {
	// no destinations

	$error = 1;
} elseif ($sales_value < @constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){
	// order does not have enough value
	$error = 3;
} elseif(@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE') != -1 && $sales_value > @constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE')){
	// order too expensive for method
	$error = 4;
} else {
	//check to see attributes allow this method
	$products_list = '';
	if (is_array($_SESSION['cart']->contents)) {
		foreach(array_keys($_SESSION['cart']->contents) as $products_id) {
			$products_list .= ', ' . zen_get_prid(zen_db_input($products_id));
		}
	}
	$products_list = substr($products_list, 2);
/*
	$products_list = $_SESSION['cart']->get_product_id_list();

*/
	$attribute_postage_select = 'SELECT ifnull(max(pov.products_options_values_sort_order), 0) as postage_attribute
			FROM ' . TABLE_PRODUCTS_OPTIONS_VALUES . ' pov INNER JOIN ' . TABLE_PRODUCTS_ATTRIBUTES . ' pa ON pov.products_options_values_id = pa.options_values_id
			INNER JOIN ' . TABLE_PRODUCTS_OPTIONS . ' po ON po.products_options_id = pa.options_id
			WHERE pa.products_id IN (' . $products_list . ') AND po.products_options_name = \'Minimum Delivery Method:\'';


	$attribute_postage_query = $db->Execute($attribute_postage_select);
	$attribute_postage = $attribute_postage_query->fields['postage_attribute'];
	$postage_max = max($postage_check);
	if ($postage_max < $attribute_postage){
		// attributes prevent postage
		$error=2;

	} else if (@constant('MODULE_SHIPPING_' . $module . '_ATTRIBUTE_MATCH') == 'True' && in_array($attribute_postage,$postage_check) == False ){
		// attributes prevent postage as not exact match
		$error=2;
	} else {

		// Check for insurance
		$insurance = -1;

		$zones_insure = @constant('MODULE_SHIPPING_' . $module . '_ZONES_INSURE');
		// Check we have values
		if($zones_insure <> Null) {
			$zones_table = preg_split("/[:, ]/" , preg_replace('/\s*/', '', $zones_insure) );
			$size = sizeof($zones_table);
			// Check to see if Addition size for last entry
			if ($size > 1) {
				$oversize = strpos($zones_table[$size-2], "+");
				if ($oversize) {
					$size-=2;
					$step=strstr($zones_table[$size], "+", TRUE);
				}
			} else {
				$oversize = false;
			}
			//Calculate the insurance
			for ($i=0; $i<$size; $i+=2) {
				if ($sales_value <= $zones_table[$i]) {
					$insurance = $zones_table[$i+1];
					break;
				}
			}
			if ($insurance == -1 and $oversize) {
				$insurance = $zones_table[$size-1] + ceil(($sales_value - $zones_table[$size-2])/$step)*$zones_table[$size+1];
			} elseif ($insurance ==-1) {
				$insurance=0;
			}
		} else {
			$insurance=0;
		}
		// calculate the shipping rate.

		$shipping = -1;

		//12 FEB 04 MBeedell	'glue' together the rates from the cost data entry boxes
		$zones_cost="";
		for ($i=0;$i<6;$i+=1){
			if (@constant('MODULE_SHIPPING_' . $module . '_ZONES_COST'.$i.'_' . $dest_zone) <> NULL){
				$cost=trim(constant('MODULE_SHIPPING_' . $module . '_ZONES_COST'.$i.'_' . $dest_zone));
				if ($cost <> ""){
					$zones_cost .=", ".$cost;
				}
			}
		}
		$zones_cost = substr($zones_cost, 1);

		$zones_table = preg_split("/[:, ]/" , preg_replace('/\s*/', '', $zones_cost) );
		$size = sizeof($zones_table);
		// Check to see if oversize for shipping weights
		if ($size > 1) {
			$oversize = strpos($zones_table[$size-2], "+");
			if ($oversize) {
				$size-=2;
				$step=strstr($zones_table[$size], "+", TRUE);
			}
		} else {
			$oversize = false;
		}
		for ($i=0; $i<$size; $i+=2) {
			if ($shipping_weight <= $zones_table[$i]) {
				$shipping = $zones_table[$i+1] + $insurance;
				//12 Feb 04 MBeedell - correctly format the total weight... if the weight exceeds the max
				//  weight, then it is divided down over a number of separate packages - so the weight could end
				//  up being a long fraction.

				$sw_text = number_format($shipping_weight, 3, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']). ' ' . TEXT_PRODUCT_WEIGHT_UNIT;

				$shipping_method = sprintf(@constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY'), $dest_country_title, $sw_text);


				if ($shipping_num_boxes > 1) {

					// PC corrected shipping_num_boxes
					$sw_text = number_format($shipping_num_boxes, 0, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']);

					$shipping_method .=  ' in ' . $sw_text . ' boxes ';

				}
				break;
			}
		}

		if ($shipping == -1 and $oversize) {
			// Calculate the additional cost if overmax size
			$shipping=$zones_table[$size-1] + ceil(($shipping_weight - $zones_table[$size-2])/$step)*$zones_table[$size+1] + $insurance;

			$sw_text = number_format($shipping_weight, 3, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']);
			$shipping_method = sprintf(@constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY'), $dest_country_title, $sw_text);

		}

		if ($shipping == -1) {
			//no shipping found
			$error = 5;

		} else {
			//Add on the handling cost (either the destination zone or generic rate)
			$shipping_cost = ($shipping * $shipping_num_boxes) + @constant('MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_' . $dest_zone) +
			@constant('MODULE_SHIPPING_' . $module . '_ZONES_HANDLING');


		}
	}

}

// Prepare the quote information
$this->quotes = array('id' => $this->code,
		'module' => @constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') ,
		'methods' => array(array('id' => $this->code,
				'title' => $shipping_method,
				'cost' => $shipping_cost)));

// Process the error if any
if (@constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' && $error > 0) {
// Hide error so return without method information
	$this->enabled = false;
} elseif ($error > 0) {
	switch ($error) {
		case 1:
			$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_INVALID_ZONE');
			break;
		case 2:
			$this->quotes['error'] = "This shipping method cannot be used for this order";
			break;
		case 3:
			$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_UNDERMINTOTAL') . number_format(@constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE'), 2)  ;
			break;
		case 4:
			$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_OVERMAXTOTAL') . number_format(@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE'), 2)  ;
			break;
		case 5:

			$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_UNDEFINED_RATE');
			$this->quotes['methods']['cost']=0;

	}

}

if ($this->tax_class > 0) {
	// Calculate the tax if necessary
	$this->quotes['tax'] = zen_get_tax_rate($this->tax_class, $order->delivery['country']['id'], $order->delivery['zone_id']);
}
// get the icon if available
if (zen_not_null($this->icon)) $this->quotes['icon'] = zen_image($this->icon, $this->title);
