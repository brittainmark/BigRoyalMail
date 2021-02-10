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

		$this->version = '3.2.2';
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
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 4 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'JE, GG', 'Two character ISO country codes for Zone 4 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_1')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 4 Channel Islands', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_1', '0.5:35.4, 1:36.05, 1.5:36.7, 2:37.35, 2.5:38.1, 3:38.85, 3.5:39.6, 4:40.35, 4.5:41.1, 5:41.85, 5.5:42, 6:42.15, 6.5:42.3, 7:42.45, 7.5:42.6, 8:42.75, 8.5:42.9, 9:43.05, 9.5:43.2, 10:43.35, 10.5:43.5, 11:43.65, 11.5:43.8, 12:43.95, 12.5:44.1, 13:44.25, 13.5:44.4, 14:44.55, 14.5:44.7, 15:44.85, .5+:0.15', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 5 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'IE', 'Two character ISO country codes for Zone 5 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_2')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 5 Republic of Ireland', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_2', '0.5:36.42, 1:37.08, 1.5:37.74, 2:38.4, 2.5:40.02, 3:41.64, 3.5:43.26, 4:44.88, 4.5:46.5, 5:48.12, 5.5:49.44, 6:50.76, 6.5:52.08, 7:53.4, 7.5:54.72, 8:56.04, 8.5:57.36, 9:58.68, 9.5:60, 10:61.32, 10.5:62.64, 11:63.96, 11.5:65.28, 12:66.6, 12.5:67.92, 13:69.24, 13.5:70.56, 14:71.88, 14.5:73.2, 15:74.52, .5+:1.32', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 6 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'BE, NL, LU', 'Two character ISO country codes for Zone 6 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_3')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 6 Belgium, Netherlands, Luxembourg', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_3', '0.5:32.28, 1:33.9, 1.5:35.52, 2:37.14, 2.5:38.82, 3:40.5, 3.5:42.18, 4:43.86, 4.5:45.54, 5:47.22, 5.5:48.48, 6:49.74, 6.5:51, 7:52.26, 7.5:53.52, 8:54.78, 8.5:56.04, 9:57.3, 9.5:58.56, 10:59.82, 10.5:61.08, 11:62.34, 11.5:63.6, 12:64.86, 12.5:66.12, 13:67.38, 13.5:68.64, 14:69.9, 14.5:71.16, 15:72.42, .5+:1.26', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_4')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 7 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_4', 'FR, DE, DK, MC', 'Two character ISO country codes for Zone 7 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_4')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 7 France, Germany, Denmark', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_4', '0.5:35.46, 1:37.38, 1.5:39.3, 2:41.22, 2.5:43.14, 3:45.06, 3.5:46.98, 4:48.9, 4.5:50.82, 5:52.74, 5.5:54.06, 6:55.38, 6.5:56.7, 7:58.02, 7.5:59.34, 8:60.66, 8.5:61.98, 9:63.3, 9.5:64.62, 10:65.94, 10.5:67.26, 11:68.58, 11.5:69.9, 12:71.22, 12.5:72.54, 13:73.86, 13.5:75.18, 14:76.5, 14.5:77.82, 15:79.14, .5+:1.32', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_5')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 8 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_5', 'IT, ES, PT, GR', 'Two character ISO country codes for Zone 8 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_5')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 8 Italy, Spain, Portugal, Greece', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_5', '0.5:38.52, 1:40.44, 1.5:42.36, 2:44.28, 2.5:46.56, 3:48.84, 3.5:51.12, 4:53.4, 4.5:55.68, 5:57.96, 5.5:59.88, 6:61.8, 6.5:63.72, 7:65.64, 7.5:67.56, 8:69.48, 8.5:71.4, 9:73.32, 9.5:75.24, 10:77.16, 10.5:79.08, 11:81, 11.5:82.92, 12:84.84, 12.5:86.76, 13:88.68, 13.5:90.6, 14:92.52, 14.5:94.44, 15:96.36, .5+:1.92', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_6')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 9 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_6', 'AL, AD, AM, BY, BA, CV, FO, GE, GI, GL, IS, LI, MK, MD, ME, NO, RU, SM, RS, CH, TR, UA, VA, AL, AT, BG, HR, CY, CZ, EE, FI, HU, LV, LT, MT, PL, RO, SK, SI, SE', 'Two character ISO country codes for Zone 9 EU ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_6')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 9 Europe', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_6', '0.5:44.16, 1:46.68, 1.5:49.2, 2:51.72, 2.5:54, 3:56.28, 3.5:58.56, 4:60.84, 4.5:63.12, 5:65.4, 5.5:66.78, 6:68.16, 6.5:69.54, 7:70.92, 7.5:72.3, 8:73.68, 8.5:75.06, 9:76.44, 9.5:77.82, 10:79.2, 10.5:80.58, 11:81.96, 11.5:83.34, 12:84.72, 12.5:86.1, 13:87.48, 13.5:88.86, 14:90.24, 14.5:91.62, 15:93, .5+:1.38', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_7')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 10 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_7', 'US, UM, CA', 'Two character ISO country codes for Zone 10 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_7')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 10 USA, Canada', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_7', '0.5:46.31, 1:50.65, 1.5:54.99, 2:59.33, 2.5:63.98, 3:68.63, 3.5:73.28, 4:77.93, 4.5:82.58, 5:87.23, 5.5:90.18, 6:93.13, 6.5:96.08, 7:99.03, 7.5:101.98, 8:104.93, 8.5:107.88, 9:110.83, 9.5:113.78, 10:116.73, 10.5:119.68, 11:122.63, 11.5:125.58, 12:128.53, 12.5:131.48, 13:134.43, 13.5:137.38, 14:140.33, 14.5:143.28, 15:146.23, .5+:2.95', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_8')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 11 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_8', 'AS, AU, BN, KH, CN, CX, CC, CK, FJ, PF, GU, HK, ID, JP, KI, KP, KR, LA, MO, MY, MH, FM, MN, MM, NR, NC, NZ, NU, NF, MP, PG, PH, PN, WS, SG, SB, TW, TH, TL, TK, TO, TV, VU, VN, WF', 'Two character ISO country codes for Zone 11 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_8')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 11 Far East, Australasia', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_8', '0.5:54.18, 1:59.13, 1.5:64.08, 2:69.03, 2.5:73.83, 3:78.63, 3.5:83.43, 4:88.23, 4.5:93.03, 5:97.83, 5.5:102.13, 6:106.43, 6.5:110.73, 7:115.03, 7.5:119.33, 8:123.63, 8.5:127.93, 9:132.23, 9.5:136.53, 10:140.83, 10.5:145.13, 11:149.43, 11.5:153.73, 12:158.03, 12.5:162.33, 13:166.63, 13.5:170.93, 14:175.23, 14.5:179.53, 15:183.83, .5+:4.3', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_9')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 12 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_9', 'AF, DZ, AO, AI, AG, AR, AW, AZ, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BR, BF, BI, CM, KY, CF, TD, CL, CO, KM, CG, CR, CI, CU, DJ, DM, DO, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GT, GN, GW, GY, HT, HN, IN, IR, IQ, IL, JM, JO, KZ, KE, KW, KG, LB, LS, LR, LY, MG, MW, MV, ML, MQ, MR, MU, MX, MS, MA, MZ, NA, NP, AN, NI, NE, NG, OM, PK, PA, PY, PE, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SZ, SY, TJ, TZ, TG, TT, TN, TM, TC, UG, AE, UY, UZ, VE, VG, VI, YE, ZM, ZW', 'Two character ISO country codes for Zone 12 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_9')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 12 Rest of World', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_9', '0.5:59.53, 1:66.17, 1.5:72.81, 2:79.45, 2.5:86, 3:92.55, 3.5:99.1, 4:105.65, 4.5:112.2, 5:118.75, 5.5:124.5, 6:130.25, 6.5:136, 7:141.75, 7.5:147.5, 8:153.25, 8.5:159, 9:164.75, 9.5:170.5, 10:176.25, 10.5:182, 11:187.75, 11.5:193.5, 12:199.25, 12.5:205, 13:210.75, 13.5:216.5, 14:222.25, 14.5:228, 15:233.75, .5+:5.75', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_INSURE')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates', 'MODULE_SHIPPING_" . $module . "_ZONES_INSURE', '100:0, 200:1.8, 100+:4.5', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		/*
		 * Add the expires date if it does not exist
		*/
		if(!defined('MODULE_SHIPPING_RM_EXPIRES')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2015-03-30 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2015-03-30 00:00:01 or 2013-04-29<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
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
