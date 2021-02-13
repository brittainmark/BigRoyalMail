<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmpfgpriority {
	var $code, $title, $description, $enabled, $num_zones ;


	// class constructor
	function __construct() {

		global $order, $total_weight;

		$this->version = '3.5.1';
		$this->code = 'rmpfgpriority';
		$this->num_zones = 9;
		require(DIR_FS_CATALOG.DIR_WS_MODULES.'shipping/BigRoyalMail/main.php');

	}

	// class methods
	function quote($method = '') {
		global $order, $shipping_weight, $shipping_num_boxes, $currency, $db;
		$postage_check = array(40);
		require(DIR_FS_CATALOG.DIR_WS_MODULES.'shipping/BigRoyalMail/quote.php');
		if (@constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' && $error > 0) {
			return ;
		}
		return $this->quotes;
	}

	function check() {
		global $db;
		if (!isset($this->_check)) {
			$check_query = $db->Execute('select configuration_value from ' . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_STATUS'");
			$this->_check = $check_query->RecordCount();
		}
		return $this->_check;
	}

	function install() {
		global $db;

		$module = strtoupper($this->code);

		$this->remove();

		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order values).', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '430', 'Sort order of display.', '6', '0', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attribute Exact Match', 'MODULE_SHIPPING_" . $module . "_ATTRIBUTE_MATCH', 'False', 'Used to only display this shipping method if the attribute shipping is exact match', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");


		$handling_test = $db->Execute("SELECT configuration_key FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ( 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_ZONES_HANDLING' ) " );

		if(!$handling_test->RecordCount()){

			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '2500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . (strtoupper($this->code)) . '_TEXT_TITLE' ) . " delivery.', '6', '0', now())");

		}



		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 4 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'JE, GG', 'Two character ISO country codes for Zone 4 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_1')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 4 Channel Islands\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1\', \'0.5:30, 1:31.32, 1.5:32.64, 2:33.96, 2.5:34.98, 3:36, 3.5:37.02, 4:38.04, 4.5:39.06, 5:40.08, 5.5:40.5, 6:40.92, 6.5:41.34, 7:41.76, 7.5:42.18, 8:42.6, 8.5:43.02, 9:43.44, 9.5:43.86, 10:44.28, 10.5:44.76, 11:45.24, 11.5:45.72, 12:46.2, 12.5:46.68, 13:47.16, 13.5:47.64, 14:48.12, 14.5:48.6, 15:49.08, .5+:0.3\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 5 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'IE', 'Two character ISO country codes for Zone 5 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_2')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 5 Republic of Ireland\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_2\', \'0.5:30.78, 1:33.36, 1.5:35.94, 2:38.52, 2.5:41.1, 3:43.68, 3.5:46.26, 4:48.84, 4.5:51.42, 5:54, 5.5:55.14, 6:56.28, 6.5:57.42, 7:58.56, 7.5:59.7, 8:60.84, 8.5:61.98, 9:63.12, 9.5:64.26, 10:65.4, 10.5:66.18, 11:66.96, 11.5:67.74, 12:68.52, 12.5:69.3, 13:70.08, 13.5:70.86, 14:71.64, 14.5:72.42, 15:73.2, .5+:0.78\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 6 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'BE, NL, LU', 'Two character ISO country codes for Zone 6 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_3')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 6 Belgium, Netherlands, Luxembourg\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_3\', \'0.5:34.2, 1:36.54, 1.5:38.88, 2:41.22, 2.5:43.5, 3:45.78, 3.5:48.06, 4:50.34, 4.5:52.62, 5:54.9, 5.5:55.92, 6:56.94, 6.5:57.96, 7:58.98, 7.5:60, 8:61.02, 8.5:62.04, 9:63.06, 9.5:64.08, 10:65.1, 10.5:66.6, 11:68.1, 11.5:69.6, 12:71.1, 12.5:72.6, 13:74.1, 13.5:75.6, 14:77.1, 14.5:78.6, 15:80.1, .5+:0.72\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_4')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 7 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_4', 'FR, DE, DK, MC', 'Two character ISO country codes for Zone 7 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_4')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 7 France, Germany, Denmark\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_4\', \'0.5:35.82, 1:37.8, 1.5:39.78, 2:41.76, 2.5:43.92, 3:46.08, 3.5:48.24, 4:50.4, 4.5:52.56, 5:54.72, 5.5:56.28, 6:57.84, 6.5:59.4, 7:60.96, 7.5:62.52, 8:64.08, 8.5:65.64, 9:67.2, 9.5:68.76, 10:70.32, 10.5:71.82, 11:73.32, 11.5:74.82, 12:76.32, 12.5:77.82, 13:79.32, 13.5:80.82, 14:82.32, 14.5:83.82, 15:85.32, .5+:0.66\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_5')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 8 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_5', 'IT, ES, PT, GR', 'Two character ISO country codes for Zone 8 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_5')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 8 Italy, Spain, Portugal, Greece\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_5\', \'0.5:38.94, 1:41.1, 1.5:43.26, 2:45.42, 2.5:47.76, 3:50.1, 3.5:52.44, 4:54.78, 4.5:57.12, 5:59.46, 5.5:61.38, 6:63.3, 6.5:65.22, 7:67.14, 7.5:69.06, 8:70.98, 8.5:72.9, 9:74.82, 9.5:76.74, 10:78.66, 10.5:80.88, 11:83.1, 11.5:85.32, 12:87.54, 12.5:89.76, 13:91.98, 13.5:94.2, 14:96.42, 14.5:98.64, 15:100.86, .5+:0.72\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_6')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 9 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_6', 'AL, AD, AM, BY, BA, CV, FO, GE, GI, GL, IS, LI, MK, MD, ME, NO, RU, SM, RS, CH, TR, UA, VA, AL, AT, BG, HR, CY, CZ, EE, FI, HU, LV, LT, MT, PL, RO, SK, SI, SE', 'Two character ISO country codes for Zone 9 EU ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_6')){
		  $db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 9 Europe\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_6\', \'0.5:42.18, 1:45.42, 1.5:48.66, 2:51.9, 2.5:54.66, 3:57.42, 3.5:60.18, 4:62.94, 4.5:65.7, 5:68.46, 5.5:70.8, 6:73.14, 6.5:75.48, 7:77.82, 7.5:80.16, 8:82.5, 8.5:84.84, 9:87.18, 9.5:89.52, 10:91.86, 10.5:93.12, 11:94.38, 11.5:95.64, 12:96.9, 12.5:98.16, 13:99.42, 13.5:100.68, 14:101.94, 14.5:103.2, 15:104.46, .5+:1.26\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_7')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 10 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_7', 'US, UM, CA', 'Two character ISO country codes for Zone 10 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_7')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 10 USA, Canada\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_7\', \'0.5:44.8, 1:47.35, 1.5:49.9, 2:52.45, 2.5:58.95, 3:65.45, 3.5:71.95, 4:78.45, 4.5:84.95, 5:91.45, 5.5:95.2, 6:98.95, 6.5:102.7, 7:106.45, 7.5:110.2, 8:113.95, 8.5:117.7, 9:121.45, 9.5:125.2, 10:128.95, 10.5:131.35, 11:133.75, 11.5:136.15, 12:138.55, 12.5:140.95, 13:143.35, 13.5:145.75, 14:148.15, 14.5:150.55, 15:152.95, .5+:2.4\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_8')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 11 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_8', 'AS, AU, BN, KH, CN, CX, CC, CK, FJ, PF, GU, HK, ID, JP, KI, KP, KR, LA, MO, MY, MH, FM, MN, MM, NR, NC, NZ, NU, NF, MP, PG, PH, PN, WS, SG, SB, TW, TH, TL, TK, TO, TV, VU, VN, WF', 'Two character ISO country codes for Zone 11 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_8')){
		  $db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 11 Far East, Australasia\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_8\', \'0.5:47.5, 1:53.5, 1.5:59.5, 2:65.5, 2.5:71.5, 3:77.5, 3.5:83.5, 4:89.5, 4.5:95.5, 5:101.5, 5.5:106.05, 6:110.6, 6.5:115.15, 7:119.7, 7.5:124.25, 8:128.8, 8.5:133.35, 9:137.9, 9.5:142.45, 10:147, 10.5:150.45, 11:153.9, 11.5:157.35, 12:160.8, 12.5:164.25, 13:167.7, 13.5:171.15, 14:174.6, 14.5:178.05, 15:181.5, .5+:3.35\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_9')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 12 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_9', 'AF, DZ, AO, AI, AG, AR, AW, AZ, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BR, BF, BI, CM, KY, CF, TD, CL, CO, KM, CG, CR, CI, CU, DJ, DM, DO, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GT, GN, GW, GY, HT, HN, IN, IR, IQ, IL, JM, JO, KZ, KE, KW, KG, LB, LS, LR, LY, MG, MW, MV, ML, MQ, MR, MU, MX, MS, MA, MZ, NA, NP, AN, NI, NE, NG, OM, PK, PA, PY, PE, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SZ, SY, TJ, TZ, TG, TT, TN, TM, TC, UG, AE, UY, UZ, VE, VG, VI, YE, ZM, ZW', 'Two character ISO country codes for Zone 12 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_9')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 12 Rest of World\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_9\', \'0.5:60.15, 1:67.1, 1.5:74.05, 2:81, 2.5:87.9, 3:94.8, 3.5:101.7, 4:108.6, 4.5:115.5, 5:122.4, 5.5:128.6, 6:134.8, 6.5:141, 7:147.2, 7.5:153.4, 8:159.6, 8.5:165.8, 9:172, 9.5:178.2, 10:184.4, 10.5:188.85, 11:193.3, 11.5:197.75, 12:202.2, 12.5:206.65, 13:211.1, 13.5:215.55, 14:220, 14.5:224.45, 15:228.9, .5+:4.5\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_INSURE')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Insurance rates\', \'MODULE_SHIPPING_' . $module . '_ZONES_INSURE\', \'100:0, 200:1.8, 100+:4.8\', \'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		/*
		 * Add the expires date if it does not exist
		*/
		if(!defined('MODULE_SHIPPING_RM_EXPIRES')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2021-03-22 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2015-03-30 00:00:01 or 2013-04-29<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
		}
	}

	function remove() {
		global $db;
		$module = strtoupper($this->code);

		$db->Execute('DELETE FROM ' . TABLE_CONFIGURATION . " WHERE configuration_key IN ('" . implode("', '", $this->keys()) . "') AND configuration_key NOT IN ('MODULE_SHIPPING_RM_EXPIRES', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE') AND configuration_key NOT LIKE 'MODULE_SHIPPING_" . $module . "_ZONES%'");

	}

	function keys() {

		$module = strtoupper($this->code);

		$keys = array('MODULE_SHIPPING_RM_EXPIRES',
				'MODULE_SHIPPING_' . $module . '_STATUS',
				'MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS',
				'MODULE_SHIPPING_' . $module . '_ATTRIBUTE_MATCH',
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
