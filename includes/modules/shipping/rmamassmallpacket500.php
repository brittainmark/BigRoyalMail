<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmamassmallpacket500 {
	var $code, $title, $description, $enabled, $num_zones, $valid_country ;


	// class constructor
	function rmamassmallpacket500() {

		global $order, $total_weight;

		$this->version = '3.1.0';
		$this->code = 'rmamassmallpacket500';
		$module = strtoupper($this->code);
		$this->title = ( (defined('IS_ADMIN_FLAG') && IS_ADMIN_FLAG == true) ? @constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE'). ' <b style="color:#ff4000">ver. '.$this->version.'</b>' : constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') );
		$this->description = @constant('MODULE_SHIPPING_' . $module . '_TEXT_DESCRIPTION');
		$this->sort_order = @constant('MODULE_SHIPPING_' . $module . '_SORT_ORDER');
		$this->icon = @constant('MODULE_SHIPPING_' . $module . '_ICON');
		if (zen_not_null($this->icon)) $this->icon = (( defined('DIR_WS_ICONS') ? DIR_WS_ICONS : 'images/icons/' ) .  @constant('MODULE_SHIPPING_' . $module . '_ICON'));
		$this->tax_class = @constant('MODULE_SHIPPING_' . $module . '_TAX_CLASS');
		$this->enabled = ((@constant('MODULE_SHIPPING_' . $module . '_STATUS') == 'True') ? true : false);

		// CUSTOMIZE THIS SETTING FOR THE NUMBER OF ZONES NEEDED
		//Currently Europe and the rest of the world
		$this->num_zones = 3;
		$this->valid_country = False;

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
			$dest_country_code = $order->delivery['country']['iso_code_2'];
			$dest_country_title = $order->delivery['country']['title'];
			$dest_zone = 0;


			for ($i=1; $i<=$this->num_zones; $i++) {
				//ensure the zone is defined
				if(defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i)){
					$countries_table = constant('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i);
					$country_zones = preg_split("/,/", preg_replace('/\s*/','',$countries_table) );
					if (in_array($dest_country_code, $country_zones)) {
						//found the destination
						$dest_zone = $i;
						break;
					}
				}
			}


			if ($dest_zone == 0) {
				// ship to country is invalid for this service
				$this->enabled = false;
				return ;
			} else {

				$this->enabled = false;  // enabled set to true if valid shipping weight found

				$zones_cost = @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $dest_zone)
				. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST1_' . $dest_zone)
				. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST2_' . $dest_zone)
				. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST3_' . $dest_zone)
				. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST4_' . $dest_zone)
				. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST5_' . $dest_zone);

				$zones_table = preg_split("/[:,]/" , preg_replace('/\s*/','',$zones_cost) );

				$size = sizeof($zones_table);
				for ($i=0; $i<$size; $i+=2) {
					if ($total_weight <= $zones_table[$i]) {
						$this->enabled = true;
						break;
					}
				} // end of looping through

				$this->valid_country = true;
				return ;

			} // end of valid country

		} // end of if hide invalid shipping methods is set

	}

	// class methods
	function quote($method = '') {
		global $order, $shipping_weight, $shipping_num_boxes, $currency;

		$currencies = new currencies();

		$dest_country_code = $order->delivery['country']['iso_code_2'];
		$dest_country_title = $order->delivery['country']['title'];
		$dest_zone = 0;
		$error = false;
		$module = strtoupper($this->code);

		for ($i=1; $i<=$this->num_zones; $i++) {
			//ensure the zone is defined
			if(defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i)){
				$countries_table = constant('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i);
				$country_zones = preg_split("/,/", preg_replace('/\s*/','',$countries_table) );
				if (in_array($dest_country_code, $country_zones)) {
					//found contry
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
		if ($dest_zone == 0) {
			$error = true;
		} else {
			$shipping = -1;

			//12 FEB 04 MBeedell	'glue' together the rates from the 10 cost data entry boxes

			$zones_cost = @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $dest_zone)
			. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST1_' . $dest_zone)
			. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST2_' . $dest_zone)
			. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST3_' . $dest_zone)
			. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST4_' . $dest_zone)
			. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST5_' . $dest_zone);

			$zones_table = preg_split("/[:,]/" , preg_replace('/\s*/','',$zones_cost) );
			$size = sizeof($zones_table);
			for ($i=0; $i<$size; $i+=2) {
				if ($shipping_weight <= $zones_table[$i]) {
					$shipping = $zones_table[$i+1];
					//12 Feb 04 MBeedell - correctly format the total weight... if the weight exceeds the max
					//  weight, then it is divided down over a number of separate packages - so the weight could end
					//  up being a long fraction.

					$sw_text = number_format($shipping_weight, 3, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']). ' ' . TEXT_PRODUCT_WEIGHT_UNIT;

					$shipping_method = sprintf(@constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY'),$dest_country_title,$sw_text);


					if ($shipping_num_boxes > 1) {

						// PC corrected shipping_num_boxes
						$sw_text = number_format($shipping_num_boxes, 0, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']);

						$shipping_method .=  ' in ' . $sw_text . ' boxes ';

					}
					break;
				}
			}

			if ($shipping == -1) {
				if(@constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True') {
					$this->enabled = false;
					return ;
				}
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
			if(@constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True') {
				$this->enabled = false;
				return ;
			}
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
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '370', 'Sort order of display.', '6', '0', now())");


		$handling_test = $db->Execute("SELECT configuration_key FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ( 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_ZONES_HANDLING_1' ) " );

		if(!$handling_test->RecordCount()){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '20.01', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Europe Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . (strtoupper($this->code)) . '_TEXT_TITLE' ) . " delivery to Europe.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Rest of World Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_2', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . (strtoupper($this->code)) . '_TEXT_TITLE' ) . " delivery Worldwide.', '6', '0', now())");

		}
		if(!defined("MODULE_SHIPPING_".$module."_ZONES_HANDLING_3")){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_".$module."_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())");
		}
		// European Rates

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')){


			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail defined European Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'AD, AT, BE, CH, DE, DK, EE, ES, FI, FO, FR, IE, IS, LI, LU, MC, NL, PT, SE', 'two character ISO country codes for European Airsure&reg; destinations. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '0', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('European rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_1', '0.1:10.6, 0.25:11.1', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST1_1', '0.5:12.55, 0.75:14', 'European Rates cont\'d (2):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST2_1', '1:15.45, 1.25:16.9', 'European Rates cont\'d (3):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST3_1', '1.5:18.35', 'European Rates cont\'d (4):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST4_1', '1.75:19.8', 'European Rates cont\'d (5):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST5_1', '2:21.25', 'European Rates cont\'d (6):', '6', '1', 'zen_cfg_textarea(', now())");
					
				
			// WORLDWIDE RATES zone 1

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail defined World Zones 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'BR, CA, HK, MY, US', 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '1', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_2', '0.1:11.5, 0.25:12.5', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST1_2', '0.5:15.2, 0.75:17.9', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (2):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST2_2', '1:20.6, 1.25:23.3', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (3):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST3_2', '1.5:26', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (4):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST4_2', '1.75:28.7', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (5):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST5_2', '2:31.4', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (6):', '6', '2', 'zen_cfg_textarea(', now())");
			}

		// WORLDWIDE RATES zone 2
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail defined World Zones 2 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'AU, NZ, SG', 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '1', 'zen_cfg_textarea(', now())");

				
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_3', '0.1:11.5, 0.25:12.7', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST1_3', '0.5:15.55,0.75:18.4', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (2):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST2_3', '1:21.25, 1.25:24.1', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (3):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST3_3', '1.5:26.95', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (4):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST4_3', '1.75:29.8', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (5):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST5_3', '2:32.65', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (6):', '6', '2', 'zen_cfg_textarea(', now())");
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
				'MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE',
				'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1', 
				'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2', 
				'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3');

		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_1';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST1_1';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST2_1';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST3_1';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST4_1';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST5_1';

		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_2';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_2';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST1_2';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST2_2';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST3_2';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST4_2';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST5_2';

		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_3';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_3';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST1_3';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST2_3';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST3_3';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST4_3';
		$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST5_3';


		return $keys;
	}
}
?>
