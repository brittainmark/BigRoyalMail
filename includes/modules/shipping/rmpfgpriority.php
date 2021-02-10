<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmpfgpriority {
	var $code, $title, $description, $enabled, $num_zones ;


	// class constructor
	function rmpfgpriority() {

		global $order, $total_weight;

		$this->version = '3.2.0';
		$this->code = 'rmpfgpriority';
		$this->num_zones = 9;
		require(DIR_FS_CATALOG.DIR_WS_MODULES."shipping/BigRoyalMail/main.php");

	}

	// class methods
	function quote($method = '') {
		global $order, $shipping_weight, $shipping_num_boxes, $currency, $db;
		$postage_check=40;
		require(DIR_FS_CATALOG.DIR_WS_MODULES."shipping/BigRoyalMail/quote.php");
		if (@constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' && $error > 0) {
			return ;
		}
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
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '430', 'Sort order of display.', '6', '0', now())");


		$handling_test = $db->Execute("SELECT configuration_key FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ( 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_ZONES_HANDLING' ) " );

		if(!$handling_test->RecordCount()){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '2500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . (strtoupper($this->code)) . '_TEXT_TITLE' ) . " delivery.', '6', '0', now())");

		}



		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 4 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'JE, GG', 'two character ISO country codes for Zone 4 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_1')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 4 Channel Islands', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_1', '0.5:35.4, 1:36.05, 1.5:36.7, 2:37.35, 2.5:38, 3:38.7, 3.5:39.4, 4:40.1, 4.5:40.8, 5:41.5, 5.5:41.6, 6:41.7, 6.5:41.8, 7:41.9, 7.5:42, 8:42.1, 8.5:42.2, 9:42.3, 9.5:42.4, 10:42.5, 10.5:42.9, 11:43.3, 11.5:43.7, 12:44.1, 12.5:44.5, 13:44.9, 13.5:45.3, 14:45.7, 14.5:46.1, 15:46.5, .5+:0.2', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 5 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'IE', 'two character ISO country codes for Zone 5 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_2')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 5 Republic of Ireland', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_2', '0.5:36.42, 1:37.08, 1.5:37.74, 2:38.4, 2.5:39.06, 3:40.62, 3.5:42.18, 4:43.74, 4.5:45.3, 5:46.86, 5.5:48.12, 6:49.38, 6.5:50.64, 7:51.9, 7.5:53.16, 8:54.42, 8.5:55.68, 9:56.94, 9.5:58.2, 10:59.46, 10.5:60.72, 11:61.98, 11.5:63.24, 12:64.5, 12.5:65.76, 13:67.02, 13.5:68.28, 14:69.54, 14.5:70.8, 15:72.06, .5+:0.6', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 6 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'BE, NL, LU', 'two character ISO country codes for Zone 6 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_3')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 6 Belgium, Netherlands, Luxembourg', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_3', '0.5:32.28, 1:33.9, 1.5:35.52, 2:37.14, 2.5:38.76, 3:40.38, 3.5:42, 4:43.62, 4.5:45.24, 5:46.86, 5.5:48.06, 6:49.26, 6.5:50.46, 7:51.66, 7.5:52.86, 8:54.06, 8.5:55.26, 9:56.46, 9.5:57.66, 10:58.86, 10.5:60.48, 11:62.1, 11.5:63.72, 12:65.34, 12.5:66.96, 13:68.58, 13.5:70.2, 14:71.82, 14.5:73.44, 15:75.06, .5+:0.6', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_4')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 7 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_4', 'FR, DE, DK, MC', 'two character ISO country codes for Zone 7 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_4')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 7 France, Germany, Denmark', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_4', '0.5:35.46, 1:37.38, 1.5:39.3, 2:41.22, 2.5:43.14, 3:45, 3.5:46.86, 4:48.72, 4.5:50.58, 5:52.44, 5.5:53.7, 6:54.96, 6.5:56.22, 7:57.48, 7.5:58.74, 8:60, 8.5:61.26, 9:62.52, 9.5:63.78, 10:65.04, 10.5:66.6, 11:68.16, 11.5:69.72, 12:71.28, 12.5:72.84, 13:74.4, 13.5:75.96, 14:77.52, 14.5:79.08, 15:80.64, .5+:0.6', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_5')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 8 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_5', 'IT, ES, PT, GR', 'two character ISO country codes for Zone 8 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_5')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 8 Italy, Spain, Portugal, Greece', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_5', '0.5:38.52, 1:40.44, 1.5:42.36, 2:44.28, 2.5:46.2, 3:48.42, 3.5:50.64, 4:52.86, 4.5:55.08, 5:57.3, 5.5:59.16, 6:61.02, 6.5:62.88, 7:64.74, 7.5:66.6, 8:68.46, 8.5:70.32, 9:72.18, 9.5:74.04, 10:75.9, 10.5:78.06, 11:80.22, 11.5:82.38, 12:84.54, 12.5:86.7, 13:88.86, 13.5:91.02, 14:93.18, 14.5:95.34, 15:97.5, .5+:0.6', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_6')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 9 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_6', 'AL, AD, AM, BY, BA, CV, FO, GE, GI, GL, IS, LI, MK, MD, ME, NO, RU, SM, RS, CH, TR, UA, VA, AL, AT, BG, HR, CY, CZ, EE, FI, HU, LV, LT, MT, PL, RO, SK, SI, SE', 'two character ISO country codes for Zone 9 EU ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_6')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 9 Europe', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_6', '0.5:44.16, 1:46.68, 1.5:49.2, 2:51.72, 2.5:54.24, 3:56.46, 3.5:58.68, 4:60.9, 4.5:63.12, 5:65.34, 5.5:66.66, 6:67.98, 6.5:69.3, 7:70.62, 7.5:71.94, 8:73.26, 8.5:74.58, 9:75.9, 9.5:77.22, 10:78.54, 10.5:80.16, 11:81.78, 11.5:83.4, 12:85.02, 12.5:86.64, 13:88.26, 13.5:89.88, 14:91.5, 14.5:93.12, 15:94.74, .5+:1.08', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_7')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 10 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_7', 'US, UM, CA', 'two character ISO country codes for Zone 10 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_7')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 10 USA, Canada', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_7', '0.5:46.31, 1:50.65, 1.5:54.99, 2:59.33, 2.5:63.67, 3:67.09, 3.5:70.51, 4:73.93, 4.5:77.35, 5:80.77, 5.5:83.52, 6:86.27, 6.5:89.02, 7:91.77, 7.5:94.52, 8:97.27, 8.5:100.02, 9:102.77, 9.5:105.52, 10:108.27, 10.5:109.95, 11:111.63, 11.5:113.31, 12:114.99, 12.5:116.67, 13:118.35, 13.5:120.03, 14:121.71, 14.5:123.39, 15:125.07, .5+:1.89', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_8')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 11 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_8', 'AS, AU, BN, KH, CN, CX, CC, CK, FJ, PF, GU, HK, ID, JP, KI, KP, KR, LA, MO, MY, MH, FM, MN, MM, NR, NC, NZ, NU, NF, MP, PG, PH, PN, WS, SG, SB, TW, TH, TL, TK, TO, TV, VU, VN, WF', 'two character ISO country codes for Zone 11 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_8')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 11 Far East, Australasia', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_8', '0.5:54.18, 1:59.13, 1.5:64.08, 2:69.03, 2.5:73.98, 3:77.65, 3.5:81.32, 4:84.99, 4.5:88.66, 5:92.33, 5.5:96.32, 6:100.31, 6.5:104.3, 7:108.29, 7.5:112.28, 8:116.27, 8.5:120.26, 9:124.25, 9.5:128.24, 10:132.23, 10.5:134.63, 11:137.03, 11.5:139.43, 12:141.83, 12.5:144.23, 13:146.63, 13.5:149.03, 14:151.43, 14.5:153.83, 15:156.23, .5+:3.2', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_9')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 12 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_9', 'AF, DZ, AO, AI, AG, AR, AW, AZ, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BR, BF, BI, CM, KY, CF, TD, CL, CO, KM, CG, CR, CI, CU, DJ, DM, DO, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GT, GN, GW, GY, HT, HN, IN, IR, IQ, IL, JM, JO, KZ, KE, KW, KG, LB, LS, LR, LY, MG, MW, MV, ML, MQ, MR, MU, MX, MS, MA, MZ, NA, NP, AN, NI, NE, NG, OM, PK, PA, PY, PE, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SZ, SY, TJ, TZ, TG, TT, TN, TM, TC, UG, AE, UY, UZ, VE, VG, VI, YE, ZM, ZW', 'two character ISO country codes for Zone 12 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_9')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 12 Rest of World', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_9', '0.5:59.53, 1:66.17, 1.5:72.81, 2:79.45, 2.5:86.09, 3:91.76, 3.5:97.43, 4:103.1, 4.5:108.77, 5:114.44, 5.5:119.54, 6:124.64, 6.5:129.74, 7:134.84, 7.5:139.94, 8:145.04, 8.5:150.14, 9:155.24, 9.5:160.34, 10:165.44, 10.5:169.77, 11:174.1, 11.5:178.43, 12:182.76, 12.5:187.09, 13:191.42, 13.5:195.75, 14:200.08, 14.5:204.41, 15:208.74, .5+:4.48', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_INSURE')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates', 'MODULE_SHIPPING_" . $module . "_ZONES_INSURE', '100:0, 200:1.2, 100+:4.5', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");
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

		$db->Execute("DELETE FROM " . TABLE_CONFIGURATION .
				" WHERE configuration_key IN ('MODULE_SHIPPING_" . $module . "_STATUS', 
				'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 
				'MODULE_SHIPPING_" . $module . "_TAX_CLASS', 
				'MODULE_SHIPPING_" . $module . "_SORT_ORDER', 
				'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', 
				'MODULE_SHIPPING_" . $module . "_ZONES_INSURE')");

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
				'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING', 
				'MODULE_SHIPPING_' . $module . '_ZONES_INSURE');

		for ($i=1; $i<=$this->num_zones; $i++) {
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
		}

		return $keys;
	}
}
?>
