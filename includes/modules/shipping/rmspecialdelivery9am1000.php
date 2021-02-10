<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmspecialdelivery9am1000 {
	var $code, $title, $description, $enabled, $num_zones ;


	// class constructor
	function rmspecialdelivery9am1000() {

		global $order, $total_weight;

		$this->version = '3.0.0';
		$this->code = 'rmspecialdelivery9am1000';
		$module = strtoupper($this->code);
		$this->title = ( (defined('IS_ADMIN_FLAG') && IS_ADMIN_FLAG == true) ? @constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE'). ' <b style="color:#ff4000">ver. '.$this->version.'</b>' : constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') );
		$this->description = @constant('MODULE_SHIPPING_' . $module . '_TEXT_DESCRIPTION');
		$this->sort_order = @constant('MODULE_SHIPPING_' . $module . '_SORT_ORDER');
		$this->icon = (( defined('DIR_WS_ICONS') ? DIR_WS_ICONS : 'images/icons/' ) .  @constant('MODULE_SHIPPING_' . $module . '_ICON'));
		$this->tax_class = @constant('MODULE_SHIPPING_' . $module . '_TAX_CLASS');
		$this->enabled = ((@constant('MODULE_SHIPPING_' . $module . '_STATUS') == 'True') ? true : false);

		// CUSTOMIZE THIS SETTING FOR THE NUMBER OF ZONES NEEDED
		$this->num_zones = 1;


		// inspired by Jim Barrington (JollyJim)

		if (isset($order) && @constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' ){

			switch (isset($order->info['subtotal'])){

				case true:
					if ($order->info['subtotal'] < @constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){
						$this->enabled = false;
						return ;
					} elseif (@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE') != -1 && $order->info['subtotal'] > @constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE')){
						$this->enabled = false;
						return ;
					}
					break;

				case false:
					if ($order->info['total'] < @constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){
						$this->enabled = false;
						return ;
					} elseif (@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE') != -1 && $order->info['total'] > @constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE')){
						$this->enabled = false;
						return ;
					}
					break;

			} // end of switch on subtotal


			// check that it is a valid country being shipped to.
			$dest_country = $order->delivery['country']['iso_code_2'];
			$dest_zone = 0;

			for ($i=1; $i<=$this->num_zones; $i++) {
				$countries_table = constant('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i);
				$country_zones = preg_split("/,/", preg_replace('/\s*/','',$countries_table) );
				if (in_array($dest_country, $country_zones)) {
					$dest_zone = $i;
					break;
				}
			}

			// ship to country is invalid for this service
			if ($dest_zone == 0) {
				$this->enabled = false;
				return ;
			} else {

				$this->enabled = false;  // enabled set to true if valid shipping weight found

				$zones_cost = constant('MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $dest_zone);

				$zones_table = preg_split("/[:,]/" , preg_replace('/\s*/','',$zones_cost) );

				$size = sizeof($zones_table);
				for ($i=0; $i<$size; $i+=2) {
					if ($total_weight <= $zones_table[$i]) {
						$this->enabled = true;
						break;
					}
				} // end of looping through

				return ;

			} // end of valid country

		} // end of if hide invalid shipping methods is set

	}

	// class methods
	function quote($method = '') {
		global $order, $shipping_weight, $shipping_num_boxes, $currency;

		$currencies = new currencies();

		$dest_country = $order->delivery['country']['iso_code_2'];
		$dest_zone = 0;
		$error = false;
		$module = strtoupper($this->code);

		for ($i=1; $i<=$this->num_zones; $i++) {
			$countries_table = constant('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i);
			$country_zones = preg_split("/,/", preg_replace('/\s*/','',$countries_table) );
			if (in_array($dest_country, $country_zones)) {
				$dest_zone = $i;
				break;
			}
		}
		//12 FEB 04 MBeedell	NO specified country (or *) then use this zone for all shipping rates
		if ($dest_zone == 0) {
			for ($i=1; $i<=$this->num_zones; $i++) {
				$countries_table = constant('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i);
				if ($countries_table == '' or $countries_table == '*') {
					$dest_zone = $i;
					break;
				}
			}
		}
		if ($dest_zone == 0) {
			$error = true;
		} else {
			$shipping = -1;

			//12 FEB 04 MBeedell	'glue' together the rates from the 10 cost data entry boxes

			$zones_cost = constant('MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $dest_zone);

			$zones_table = preg_split("/[:,]/" , preg_replace('/\s*/','',$zones_cost) );
			$size = sizeof($zones_table);
			for ($i=0; $i<$size; $i+=2) {
				if ($shipping_weight <= $zones_table[$i]) {
					$shipping = $zones_table[$i+1];
					//12 Feb 04 MBeedell - correctly format the total weight... if the weight exceeds the max
					//  weight, then it is divided down over a number of separate packages - so the weight could end
					//  up being a long fraction.

					$sw_text = number_format($shipping_weight, 3, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']);


					//$shipping_method = @constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY') . ' ' . $dest_country . ' : ' . $sw_text . ' ' . constant('MODULE_SHIPPING_' . $module . '_TEXT_UNITS');
					//$shipping_method = @constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY') . ' : ' . $sw_text . ' ' . constant('MODULE_SHIPPING_' . $module . '_TEXT_UNITS');
					$shipping_method = sprintf(@constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY'),$sw_text);


					if ($shipping_num_boxes > 1) {

						// PC corrected shipping_num_boxes
						$sw_text = number_format($shipping_num_boxes, 0, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']);

						$shipping_method = $shipping_method . ' in ' . $sw_text . ' boxes ';

					}
					break;
				}
			}

			if ($shipping == -1) {
				$shipping_cost = 0;
				$shipping_method = @constant('MODULE_SHIPPING_' . $module . '_UNDEFINED_RATE');
				//$shipping_method = $zones_cost; 	   //12 FEB 04 MBeedell	useful for debug-print out the rates list!
			} else {
				$shipping_cost = ($shipping * $shipping_num_boxes) + constant('MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_' . $dest_zone);
			}
		}

		$this->quotes = array('id' => $this->code,
						'module' => @constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') ,
						'methods' => array(array('id' => $this->code,
						'title' => $shipping_method,
						'cost' => $shipping_cost)));

		if ($this->tax_class > 0) {
			$this->quotes['tax'] = zen_get_tax_rate($this->tax_class, $order->delivery['country']['id'], $order->delivery['zone_id']);
		}

		if (zen_not_null($this->icon)) $this->quotes['icon'] = zen_image($this->icon, $this->title);


		switch(isset($order->info['subtotal'])){

			case true:
				if ($order->info['subtotal'] < @constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){
					$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_UNDERMINTOTAL') . number_format(@constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE'),2)  ;
					return $this->quotes;
				} elseif(@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE') != -1 && $order->info['subtotal'] > @constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE')){
					$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_OVERMAXTOTAL') . number_format(@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE'),2)  ;
					return $this->quotes;
				}
				break;

			case false:
				if ($order->info['total'] < @constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){
					$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_UNDERMINTOTAL') . number_format(@constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE'),2)  ;
					return $this->quotes;
				}elseif(@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE') != -1 && $order->info['total'] > @constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE')){
					$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_OVERMAXTOTAL') . number_format(@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE'),2)  ;
					return $this->quotes;
				}
				break;

		}

		if ($shipping == -1) {
			$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_UNDEFINED_RATE');
		}

		if ($error == true) $this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_INVALID_ZONE');


		return $this->quotes;
	}

	function check() {
		global $db;
		if (!isset($this->_check)) {
			$check_query = $db->Execute("SELECT configuration_value from " . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_STATUS'");
			$this->_check = $check_query->RecordCount();
		}
		return $this->_check;
	}

	function install() {
		global $db;

		$module = strtoupper($this->code);
		
		$this->remove();

		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order values).', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '210', 'Sort order of display.', '6', '0', now())");


		$handling_test = $db->Execute("SELECT configuration_key FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ( 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_ZONES_HANDLING_1' ) " );

		if(!$handling_test->RecordCount()){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '500.01', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '1000.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . (strtoupper($this->code)) . '_TEXT_TITLE' ) . " delivery.', '6', '0', now())");

		}


		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'GB', 'two character ISO country codes for Great Britain and Northern Ireland ', '6', '0', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_1')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to GB &amp; Northern Ireland', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_1', '0.1:21.9, 0.5:24, 1:25.65, 2:29.95', 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', '6', '0', 'zen_cfg_textarea(', now())");
		}
		/*
		 * Add the expires date if it does not exist
		*/
		if(!defined('MODULE_SHIPPING_RM_EXPIRES')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2013-04-29 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-29 00:00:01 or 2013-04-29<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
		}
	}

	function remove() {
		global $db;
		$module = strtoupper($this->code);
		
		$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ('" . implode("', '", $this->keys()) . "') AND configuration_key NOT IN ('MODULE_SHIPPING_RM_EXPIRES','MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE') AND configuration_key NOT LIKE 'MODULE_SHIPPING_" . $module . "_ZONES%'");
	}

	function keys() {
		
		$module = strtoupper($this->code);
		
		$keys = array('MODULE_SHIPPING_RM_EXPIRES',
				'MODULE_SHIPPING_' . $module . '_STATUS', 
				'MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS', 
				'MODULE_SHIPPING_' . $module . '_TAX_CLASS', 
				'MODULE_SHIPPING_' . $module . '_SORT_ORDER', 
				'MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE', 
				'MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE');

		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_1';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1';

		return $keys;
	}
}
?>
