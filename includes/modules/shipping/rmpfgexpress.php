<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmpfgexpress {
	var $code, $title, $description, $enabled, $num_zones ;


	// class constructor
	function rmpfgexpress() {

		global $order, $total_weight;

		$this->version = '3.2.0';
		$this->code = 'rmpfgexpress';
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
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '450', 'Sort order of display.', '6', '0', now())");


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
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 4 Channel Islands', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_1', '0.5:49.95, 1:52.25, 1.5:54.55, 2:56.85, 2.5:59.15, 3:61.4, 3.5:63.65, 4:65.9, 4.5:68.15, 5:70.4, 5.5:72.9, 6:75.4, 6.5:77.9, 7:80.4, 7.5:82.9, 8:85.4, 8.5:87.9, 9:90.4, 9.5:92.9, 10:95.4, 10.5:97.4, 11:99.4, 11.5:101.4, 12:103.4, 12.5:105.4, 13:107.4, 13.5:109.4, 14:111.4, 14.5:113.4, 15:115.4, .5+:2.2', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 5 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'IE', 'two character ISO country codes for Zone 5 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_2')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 5 Republic of Ireland', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_2', '0.5:45.6, 1:47.88, 1.5:50.16, 2:52.44, 2.5:54.72, 3:57.9, 3.5:61.08, 4:64.26, 4.5:67.44, 5:70.62, 5.5:72.18, 6:73.74, 6.5:75.3, 7:76.86, 7.5:78.42, 8:79.98, 8.5:81.54, 9:83.1, 9.5:84.66, 10:86.22, 10.5:88.5, 11:90.78, 11.5:93.06, 12:95.34, 12.5:97.62, 13:99.9, 13.5:102.18, 14:104.46, 14.5:106.74, 15:109.02, .5+:1.62', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 6 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'BE, NL, LU', 'two character ISO country codes for Zone 6 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_3')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 6 Belgium, Netherlands, Luxembourg', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_3', '0.5:41.34, 1:44.88, 1.5:48.42, 2:51.96, 2.5:55.5, 3:58.38, 3.5:61.26, 4:64.14, 4.5:67.02, 5:69.9, 5.5:71.82, 6:73.74, 6.5:75.66, 7:77.58, 7.5:79.5, 8:81.42, 8.5:83.34, 9:85.26, 9.5:87.18, 10:89.1, 10.5:91.02, 11:92.94, 11.5:94.86, 12:96.78, 12.5:98.7, 13:100.62, 13.5:102.54, 14:104.46, 14.5:106.38, 15:108.3, .5+:1.62', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_4')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 7 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_4', 'FR, DE, DK, MC', 'two character ISO country codes for Zone 7 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_4')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 7 France, Germany, Denmark', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_4', '0.5:42.42, 1:45.72, 1.5:49.02, 2:52.32, 2.5:55.62, 3:59.52, 3.5:63.42, 4:67.32, 4.5:71.22, 5:75.12, 5.5:78, 6:80.88, 6.5:83.76, 7:86.64, 7.5:89.52, 8:92.4, 8.5:95.28, 9:98.16, 9.5:101.04, 10:103.92, 10.5:106.2, 11:108.48, 11.5:110.76, 12:113.04, 12.5:115.32, 13:117.6, 13.5:119.88, 14:122.16, 14.5:124.44, 15:126.72, .5+:1.92', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_5')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 8 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_5', 'IT, ES, PT, GR', 'two character ISO country codes for Zone 8 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_5')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 8 Italy, Spain, Portugal, Greece', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_5', '0.5:45.66, 1:49.2, 1.5:52.74, 2:56.28, 2.5:59.82, 3:62.7, 3.5:65.58, 4:68.46, 4.5:71.34, 5:74.22, 5.5:77.1, 6:79.98, 6.5:82.86, 7:85.74, 7.5:88.62, 8:91.5, 8.5:94.38, 9:97.26, 9.5:100.14, 10:103.02, 10.5:105.9, 11:108.78, 11.5:111.66, 12:114.54, 12.5:117.42, 13:120.3, 13.5:123.18, 14:126.06, 14.5:128.94, 15:131.82, .5+:2.58', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_6')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 9 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_6', 'AL, AD, AM, BY, BA, CV, FO, GE, GI, GL, IS, LI, MK, MD, ME, NO, RU, SM, RS, CH, TR, UA, VA, AL, AT, BG, HR, CY, CZ, EE, FI, HU, LV, LT, MT, PL, RO, SK, SI, SE', 'two character ISO country codes for Zone 9 EU ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_6')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 9 Europe', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_6', '0.5:49.92, 1:54.3, 1.5:58.68, 2:63.06, 2.5:67.44, 3:74.34, 3.5:81.24, 4:88.14, 4.5:95.04, 5:101.94, 5.5:106.38, 6:110.82, 6.5:115.26, 7:119.7, 7.5:124.14, 8:128.58, 8.5:133.02, 9:137.46, 9.5:141.9, 10:146.34, 10.5:149.88, 11:153.42, 11.5:156.96, 12:160.5, 12.5:164.04, 13:167.58, 13.5:171.12, 14:174.66, 14.5:178.2, 15:181.74, .5+:3.54', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_7')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 10 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_7', 'US, UM, CA', 'two character ISO country codes for Zone 10 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_7')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 10 USA, Canada', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_7', '0.5:49.99, 1:54.69, 1.5:59.39, 2:64.09, 2.5:68.79, 3:72.54, 3.5:76.29, 4:80.04, 4.5:83.79, 5:87.54, 5.5:91.49, 6:95.44, 6.5:99.39, 7:103.34, 7.5:107.29, 8:111.24, 8.5:115.19, 9:119.14, 9.5:123.09, 10:127.04, 10.5:130.03, 11:133.02, 11.5:136.01, 12:139, 12.5:141.99, 13:144.98, 13.5:147.97, 14:150.96, 14.5:153.95, 15:156.94, .5+:2.95', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_8')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 11 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_8', 'AS, AU, BN, KH, CN, CX, CC, CK, FJ, PF, GU, HK, ID, JP, KI, KP, KR, LA, MO, MY, MH, FM, MN, MM, NR, NC, NZ, NU, NF, MP, PG, PH, PN, WS, SG, SB, TW, TH, TL, TK, TO, TV, VU, VN, WF', 'two character ISO country codes for Zone 11 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_8')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 11 Far East, Australasia', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_8', '0.5:60.6, 1:66.8, 1.5:73, 2:79.2, 2.5:85.4, 3:90.75, 3.5:96.1, 4:101.45, 4.5:106.8, 5:112.15, 5.5:116.56, 6:120.97, 6.5:125.38, 7:129.79, 7.5:134.2, 8:138.61, 8.5:143.02, 9:147.43, 9.5:151.84, 10:156.25, 10.5:161.05, 11:165.85, 11.5:170.65, 12:175.45, 12.5:180.25, 13:185.05, 13.5:189.85, 14:194.65, 14.5:199.45, 15:204.25, .5+:4.75', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_9')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 12 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_9', 'AF, DZ, AO, AI, AG, AR, AW, AZ, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BR, BF, BI, CM, KY, CF, TD, CL, CO, KM, CG, CR, CI, CU, DJ, DM, DO, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GT, GN, GW, GY, HT, HN, IN, IR, IQ, IL, JM, JO, KZ, KE, KW, KG, LB, LS, LR, LY, MG, MW, MV, ML, MQ, MR, MU, MX, MS, MA, MZ, NA, NP, AN, NI, NE, NG, OM, PK, PA, PY, PE, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SZ, SY, TJ, TZ, TG, TT, TN, TM, TC, UG, AE, UY, UZ, VE, VG, VI, YE, ZM, ZW', 'two character ISO country codes for Zone 12 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_9')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 12 Rest of World', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_9', '0.5:69, 1:77.24, 1.5:85.48, 2:93.72, 2.5:101.96, 3:109.58, 3.5:117.2, 4:124.82, 4.5:132.44, 5:140.06, 5.5:145.93, 6:151.8, 6.5:157.67, 7:163.54, 7.5:169.41, 8:175.28, 8.5:181.15, 9:187.02, 9.5:192.89, 10:198.76, 10.5:204.99, 11:211.22, 11.5:217.45, 12:223.68, 12.5:229.91, 13:236.14, 13.5:242.37, 14:248.6, 14.5:254.83, 15:261.06, .5+:6.33', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_INSURE')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates', 'MODULE_SHIPPING_" . $module . "_ZONES_INSURE', '200:0, 300:1.2, 100+:4.5', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");
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
