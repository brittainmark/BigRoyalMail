<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmamsmallpacketsf500 {
	var $code, $title, $description, $enabled, $num_zones, $valid_country ;


	// class constructor
	function rmamsmallpacketsf500() {

		global $order, $total_weight;
		$this->version = '3.1.0';
		$this->code = 'rmamsmallpacketsf500';
		$module=strtoupper($this->code);
		$this->title = ( (defined('IS_ADMIN_FLAG') && IS_ADMIN_FLAG == true) ? @constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE'). ' <b style="color:#ff4000">ver. '.$this->version.'</b>' : constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') );
		$this->description = @constant('MODULE_SHIPPING_' . $module . '_TEXT_DESCRIPTION');
		$this->sort_order = @constant('MODULE_SHIPPING_' . $module . '_SORT_ORDER');
		$this->icon = @constant('MODULE_SHIPPING_' . $module . '_ICON');
		if (zen_not_null($this->icon)) $this->icon = (( defined('DIR_WS_ICONS') ? DIR_WS_ICONS : 'images/icons/' ) .  @constant('MODULE_SHIPPING_' . $module . '_ICON'));
		$this->tax_class = @constant('MODULE_SHIPPING_' . $module . '_TAX_CLASS');
		$this->enabled = ((@constant('MODULE_SHIPPING_' . $module . '_STATUS') == 'True') ? true : false);

		// CUSTOMIZE THIS SETTING FOR THE NUMBER OF ZONES NEEDED
		//Currently Europe and the rest of the world zone1 and zone 2
		$this->num_zones = 3;
		$this->valid_country = False;

		// inspired by Jim Barrington (JollyJim)

		if (isset($order) && @constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' ){

			/*
			 * Check order value is in range
			*/
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

			if ($dest_zone == 0 && @constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True') {
				$this->enabled = false;
				return ;
			}

			$this->enabled = false;
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

		} // end of if hide invalid shipping methods is set
	}

	// class methods
	function quote($method = '') {

		global $order, $shipping_weight, $shipping_num_boxes, $currency;

		$module=strtoupper($this->code);
		$dest_country_code = $order->delivery['country']['iso_code_2'];
		$dest_country_title = $order->delivery['country']['title'];
		$dest_zone = 0;
		$error = false;

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

			

		if ($dest_zone == 0 && constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'False'){
			$this->quotes = array('id' => $this->code,
									'module' => constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') ,
                            		'methods' => array(array('id' => $this->code,
                            		'title' => $shipping_method,
                            		'cost' => $shipping_cost)),
									'error' => constant('MODULE_SHIPPING_' . $module . '_TEXT_EXCLUDED').$order->delivery['country']['title'] ."");
			if (zen_not_null($this->icon)) $this->quotes['icon'] = zen_image($this->icon, $this->title);
			return $this->quotes;
		}

		$currencies = new currencies();

		$dest_country = $order->delivery['country']['iso_code_2'];
		$error = false;

		$shipping = -1;

		//12 FEB 04 MBeedell	'glue' together the rates from the 10 cost data entry boxes

		$zones_cost = @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $dest_zone)
		. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST1_' . $dest_zone)
		. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST2_' . $dest_zone)
		. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST3_' . $dest_zone)
		. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST4_' . $dest_zone)
		. ',' . @constant('MODULE_SHIPPING_' . $module . '_ZONES_COST5_' . $dest_zone);

		$zones_table = preg_split("/[:,]/" , preg_replace('/\s*/', '', $zones_cost) );
		$size = sizeof($zones_table);
		for ($i=0; $i<$size; $i+=2) {
			if ($shipping_weight <= $zones_table[$i] ) {
				$shipping = $zones_table[$i+1];
				//12 Feb 04 MBeedell - correctly format the total weight... if the weight exceeds the max
				//  weight, then it is divided down over a number of separate packages - so the weight could end
				//  up being a long fraction.

				//					$sw_text = number_format($shipping_weight, 3, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']);
				$sw_text = number_format($shipping_weight, 3, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']). ' ' . TEXT_PRODUCT_WEIGHT_UNIT;

				$shipping_method = sprintf(@constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY'),$dest_country_title,$sw_text);

				//					$shipping_method = @constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY') . ' ' . $dest_country . ' : ' . $sw_text . ' ' . constant('MODULE_SHIPPING_' . $module . '_TEXT_UNITS');
				//					$shipping_method = @constant('MODULE_SHIPPING_' . $module . '_TEXT_WAY') . ' : ' . $sw_text . ' ' . constant('MODULE_SHIPPING_' . $module . '_TEXT_UNITS');


				if ($shipping_num_boxes > 1) {

					// PC corrected shipping_num_boxes
					$sw_text = number_format($shipping_num_boxes, 0, $currencies->currencies[DEFAULT_CURRENCY]['decimal_point'], $currencies->currencies[DEFAULT_CURRENCY]['thousands_point']);

					$shipping_method = $shipping_method . ' in ' . $sw_text . ' boxes ';

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
			$shipping_cost = ($shipping * $shipping_num_boxes) + @constant('MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_' . $dest_zone);
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
				if($order->info['subtotal'] < @constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){
					$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_UNDERMINTOTAL') . number_format((float)constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE'),2)  ;
					return $this->quotes;
				}else
				if(constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE') != -1 && $order->info['subtotal'] > @constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE')){
					$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_OVERMAXTOTAL') . number_format((float)constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE'),2)  ;

					return $this->quotes;
				}
				break;

			case false:
				if($order->info['total'] < @constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){
					$this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_TEXT_UNDERMINTOTAL') . number_format(@constant('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE'),2)  ;
					return $this->quotes;
				}else
				if(@constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE') != -1 && $order->info['total'] > @constant('MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE')){
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

		if ($error == true) $this->quotes['error'] = @constant('MODULE_SHIPPING_' . $module . '_INVALID_ZONE') ;

		return $this->quotes;
	}

	function check() {
		global $db;


		if (!isset($this->_check)) {
			$check_query = $db->Execute("select configuration_value from " . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . strtoupper($this->code) . "_STATUS'");
			$this->_check = $check_query->RecordCount();
		}
		return $this->_check;
	}

	function install() {
		global $db;

		$module=strtoupper($this->code);

		$this->remove();

		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order VALUES).', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '360', 'Sort order of display.', '6', '0', now())");


		if(!defined('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '50.01', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('European Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1', '0', 'The amount it costs you to package the items for European Air Mail delivery.', '6', '1', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_2', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Surface Mail delivery.', '6', '2', now())");

		}
		if(!defined("MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_3")){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())");
		}

		// European Rates

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined European Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'AL, AD, AM, AT, AZ, BY, BE, BA, BG, HR, CY, CZ, DK, EE, ES, FO, FI, FR, GE, DE, GI, GR, GL, HU, IS, IT, KZ, KG, LV, LI, LT, LU, ME, MK, MT, MD, MC, NL, NO, PL, PT, RO, RS, RU, SM, SK, SI, SE, CH, TJ, TR, TM, UA, UZ, VA', 'two character ISO country codes for Europe.', '6', '1', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('European rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_1', '0.1:10.9, 0.25:11.4', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST1_1', '0.5:12.85, 0.75:14.3', 'European Rates cont\'d (2):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST2_1', '1:15.75, 1.25:17.2', 'European Rates cont\'d (3):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST3_1', '1.5:18.65', 'European Rates cont\'d (4):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST4_1', '1.75:20.1', 'European Rates cont\'d (5):', '6', '1', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST5_1', '2:21.55', 'European Rates cont\'d (6):', '6', '1', 'zen_cfg_textarea(', now())");
				
		}


		// Rest of World Zone 1 RATES
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, US, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', 'two character ISO country codes for Zone 1.', '6', '1', 'zen_cfg_textarea(', now())");
		}
		// to cope with old royal mail version
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_2' )){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_2', '0.1:11.4, 0.25:12.4', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST1_2', '0.5:15.1, 0.75:17.8', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (2):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST2_2', '1:20.5, 1.25:23.2', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (3):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST3_2', '1.5:25.9', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (4):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST4_2', '1.75:28.6', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (5):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST5_2', '2:31.3', '&quot;Rest of World&quot; Zone 1 Rates cont\'d (6):', '6', '2', 'zen_cfg_textarea(', now())");
				
		}

		// Rest of World Zone 2 RATES
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', 'two character ISO country codes for Zone 2.', '6', '1', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_3', '0.1:11.4, 0.25:12.6', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST1_3', '0.5:15.45, 0.75:18.3', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (2):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST2_3', '1:21.15, 1.25:24', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (3):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST3_3', '1.5:26.85', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (4):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST4_3', '1.75:29.7', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (5):', '6', '2', 'zen_cfg_textarea(', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('', 'MODULE_SHIPPING_".$module."_ZONES_COST5_3', '2:32.55', '&quot;Rest of World&quot; Zone 2 Rates cont\'d (6):', '6', '2', 'zen_cfg_textarea(', now())");
			
		}

		/*
		 * Add the expires date if it does not exist
		*/
		if(!defined('MODULE_SHIPPING_RM_EXPIRES')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2013-04-30 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-30 00:00:01 or 2013-04-30<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
		}

	}

	function remove() {
		global $db;
		$module=strtoupper($this->code);

		$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ('" . implode("', '", $this->keys()) . "') AND configuration_key NOT IN ( 'MODULE_SHIPPING_RM_EXPIRES','MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE') AND configuration_key NOT LIKE 'MODULE_SHIPPING_" . $module . "_ZONES%'");
	}

	function keys() {

		$module=strtoupper($this->code);

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
