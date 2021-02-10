<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmpfgvalue {
	var $code, $title, $description, $enabled, $num_zones ;


	// class constructor
	function __construct() {

		global $order, $total_weight;

		$this->version = '3.4.1';
		$this->code = 'rmpfgvalue';
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
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '410', 'Sort order of display.', '6', '0', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attribute Exact Match', 'MODULE_SHIPPING_" . $module . "_ATTRIBUTE_MATCH', 'False', 'Used to only display this shipping method if the attribute shipping is exact match', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");


		$handling_test = $db->Execute("SELECT configuration_key FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ( 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_ZONES_HANDLING' ) " );

		if(!$handling_test->RecordCount()){

			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . (strtoupper($this->code)) . '_TEXT_TITLE' ) . " delivery.', '6', '0', now())");

		}



		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 4 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'JE, GG', 'Two character ISO country codes for Zone 4 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_1')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 4 Channel Islands\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1\', \'0.5:9.78, 1:11.04, 1.5:12.3, 2:13.56, 2.5:14.52, 3:15.48, 3.5:16.44, 4:17.4, 4.5:18.36, 5:19.32, 5.5:19.74, 6:20.16, 6.5:20.58, 7:21, 7.5:21.42, 8:21.84, 8.5:22.26, 9:22.68, 9.5:23.1, 10:23.52, 10.5:23.82, 11:24.12, 11.5:24.42, 12:24.72, 12.5:25.02, 13:25.32, 13.5:25.62, 14:25.92, 14.5:26.22, 15:26.52, .5+:0.300000000000001\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 5 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'IE', 'Two character ISO country codes for Zone 5 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_2')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 5 Republic of Ireland\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_2\', \'0.5:16.86, 1:19.32, 1.5:21.78, 2:24.24, 2.5:26.7, 3:29.16, 3.5:31.62, 4:34.08, 4.5:36.54, 5:39, 5.5:40.08, 6:41.16, 6.5:42.24, 7:43.32, 7.5:44.4, 8:45.48, 8.5:46.56, 9:47.64, 9.5:48.72, 10:49.8, 10.5:50.52, 11:51.24, 11.5:51.96, 12:52.68, 12.5:53.4, 13:54.12, 13.5:54.84, 14:55.56, 14.5:56.28, 15:57, .5+:0.72\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 6 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'BE, NL, LU', 'Two character ISO country codes for Zone 6 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_3')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 6 Belgium, Netherlands, Luxembourg\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_3\', \'0.5:22.68, 1:25.02, 1.5:27.36, 2:29.7, 2.5:31.92, 3:34.14, 3.5:36.36, 4:38.58, 4.5:40.8, 5:43.02, 5.5:44.04, 6:45.06, 6.5:46.08, 7:47.1, 7.5:48.12, 8:49.14, 8.5:50.16, 9:51.18, 9.5:52.2, 10:53.22, 10.5:53.94, 11:54.66, 11.5:55.38, 12:56.1, 12.5:56.82, 13:57.54, 13.5:58.26, 14:58.98, 14.5:59.7, 15:60.42, .5+:0.719999999999999\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_4')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 7 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_4', 'FR, DE, DK, MC', 'Two character ISO country codes for Zone 7 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_4')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 7 France, Germany, Denmark\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_4\', \'0.5:20.58, 1:21.24, 1.5:21.9, 2:22.56, 2.5:25.14, 3:27.72, 3.5:30.3, 4:32.88, 4.5:35.46, 5:38.04, 5.5:40.08, 6:42.12, 6.5:44.16, 7:46.2, 7.5:48.24, 8:50.28, 8.5:52.32, 9:54.36, 9.5:56.4, 10:58.44, 10.5:59.04, 11:59.64, 11.5:60.24, 12:60.84, 12.5:61.44, 13:62.04, 13.5:62.64, 14:63.24, 14.5:63.84, 15:64.44, .5+:0.66\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_5')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 8 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_5', 'IT, ES, PT, GR', 'Two character ISO country codes for Zone 8 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_5')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 8 Italy, Spain, Portugal, Greece\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_5\', \'0.5:25.92, 1:28.26, 1.5:30.6, 2:32.94, 2.5:34.98, 3:37.02, 3.5:39.06, 4:41.1, 4.5:43.14, 5:45.18, 5.5:46.8, 6:48.42, 6.5:50.04, 7:51.66, 7.5:53.28, 8:54.9, 8.5:56.52, 9:58.14, 9.5:59.76, 10:61.38, 10.5:62.1, 11:62.82, 11.5:63.54, 12:64.26, 12.5:64.98, 13:65.7, 13.5:66.42, 14:67.14, 14.5:67.86, 15:68.58, .5+:0.719999999999999\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_6')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 9 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_6', 'AL, AD, AM, BY, BA, CV, FO, GE, GI, GL, IS, LI, MK, MD, ME, NO, RU, SM, RS, CH, TR, UA, VA, AL, AT, BG, HR, CY, CZ, EE, FI, HU, LV, LT, MT, PL, RO, SK, SI, SE', 'Two character ISO country codes for Zone 9 EU ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_6')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 9 Europe\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_6\', \'0.5:27.1, 1:30.4, 1.5:33.7, 2:37, 2.5:39.7, 3:42.4, 3.5:45.1, 4:47.8, 4.5:50.5, 5:53.2, 5.5:55.45, 6:57.7, 6.5:59.95, 7:62.2, 7.5:64.45, 8:66.7, 8.5:68.95, 9:71.2, 9.5:73.45, 10:75.7, 10.5:76.95, 11:78.2, 11.5:79.45, 12:80.7, 12.5:81.95, 13:83.2, 13.5:84.45, 14:85.7, 14.5:86.95, 15:88.2, .5+:1.25\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_7')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 10 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_7', 'US, UM, CA', 'Two character ISO country codes for Zone 10 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_7')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 10 USA, Canada\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_7\', \'0.5:27.7, 1:30.25, 1.5:32.8, 2:35.35, 2.5:41.8, 3:48.25, 3.5:54.7, 4:61.15, 4.5:67.6, 5:74.05, 5.5:77.75, 6:81.45, 6.5:85.15, 7:88.85, 7.5:92.55, 8:96.25, 8.5:99.95, 9:103.65, 9.5:107.35, 10:111.05, 10.5:113.45, 11:115.85, 11.5:118.25, 12:120.65, 12.5:123.05, 13:125.45, 13.5:127.85, 14:130.25, 14.5:132.65, 15:135.05, .5+:2.35\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_8')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 11 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_8', 'AS, AU, BN, KH, CN, CX, CC, CK, FJ, PF, GU, HK, ID, JP, KI, KP, KR, LA, MO, MY, MH, FM, MN, MM, NR, NC, NZ, NU, NF, MP, PG, PH, PN, WS, SG, SB, TW, TH, TL, TK, TO, TV, VU, VN, WF', 'Two character ISO country codes for Zone 11 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_8')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 11 Far East, Australasia\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_8\', \'0.5:34.55, 1:40.8, 1.5:47.05, 2:53.3, 2.5:59.4, 3:65.5, 3.5:71.6, 4:77.7, 4.5:83.8, 5:89.9, 5.5:94.45, 6:99, 6.5:103.55, 7:108.1, 7.5:112.65, 8:117.2, 8.5:121.75, 9:126.3, 9.5:130.85, 10:135.4, 10.5:138.75, 11:142.1, 11.5:145.45, 12:148.8, 12.5:152.15, 13:155.5, 13.5:158.85, 14:162.2, 14.5:165.55, 15:168.9, .5+:3.4.199999999999\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_9')) {
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 12 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_9', 'AF, DZ, AO, AI, AG, AR, AW, AZ, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BR, BF, BI, CM, KY, CF, TD, CL, CO, KM, CG, CR, CI, CU, DJ, DM, DO, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GT, GN, GW, GY, HT, HN, IN, IR, IQ, IL, JM, JO, KZ, KE, KW, KG, LB, LS, LR, LY, MG, MW, MV, ML, MQ, MR, MU, MX, MS, MA, MZ, NA, NP, AN, NI, NE, NG, OM, PK, PA, PY, PE, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SZ, SY, TJ, TZ, TG, TT, TN, TM, TC, UG, AE, UY, UZ, VE, VG, VI, YE, ZM, ZW', 'Two character ISO country codes for Zone 12 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_9')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'Shipping rates to Zone 12 Rest of World\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_9\', \'0.5:35.75, 1:42.9, 1.5:50.05, 2:57.2, 2.5:64.35, 3:71.5, 3.5:78.65, 4:85.8, 4.5:92.95, 5:100.1, 5.5:106.6, 6:113.1, 6.5:119.6, 7:126.1, 7.5:132.6, 8:139.1, 8.5:145.6, 9:152.1, 9.5:158.6, 10:165.1, 10.5:169.55, 11:174, 11.5:178.45, 12:182.9, 12.5:187.35, 13:191.8, 13.5:196.25, 14:200.7, 14.5:205.15, 15:209.6, .5+:4.5\', \'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
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
				'MODULE_SHIPPING_' . $module . '_ZONES_INSURE',
				'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING');


		for ($i=1; $i<=$this->num_zones; $i++) {
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
		}

		return $keys;
	}
}
?>
