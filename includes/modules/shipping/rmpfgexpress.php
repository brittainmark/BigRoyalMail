<?php
/*
GPL released as part of the big_royalmail_v3 package
see CREDITS.txt for the contributors and support forum.
*/
class rmpfgexpress {
	var $code, $title, $description, $enabled, $num_zones ;
	// class constructor
	function __construct() {
		global $order, $total_weight;
		$this->version = '3.6.0';
		$this->code = 'rmpfgexpress';
		$this->num_zones = 9;
		require(DIR_FS_CATALOG.DIR_WS_MODULES.'shipping/BigRoyalMail/main.php');
	}
	// class methods
	function quote($method = '') {
		global $order, $shipping_weight, $shipping_num_boxes, $currency, $db;
		$postage_check = array(40);
		require(DIR_FS_CATALOG.DIR_WS_MODULES.'shipping/BigRoyalMail/quote.php');
		if (constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' && $error > 0) {
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
		//Remove old installation
		$this->remove();
		// General settings
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order values).', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '450', 'Sort order of display.', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attribute Exact Match', 'MODULE_SHIPPING_" . $module . "_ATTRIBUTE_MATCH', 'False', 'Used to only display this shipping method if the attribute shipping is exact match', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		// Min Max order value
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '2500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
		// Handling
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', '0', 'The amount it costs you to package the items for delivery.', '6', '0', now())");
		// Countries
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 4 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'JE, GG', 'Two character ISO country codes for Zone 4 ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 5 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'IE', 'Two character ISO country codes for Zone 5 ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 6 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'BE, NL, LU', 'Two character ISO country codes for Zone 6 ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 7 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_4', 'FR, DE, DK, MC', 'Two character ISO country codes for Zone 7 ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 8 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_5', 'IT, ES, PT, GR', 'Two character ISO country codes for Zone 8 ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 9 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_6', 'AL, AD, AM, BY, BA, CV, FO, GE, GI, GL, IS, LI, MK, MD, ME, NO, RU, SM, RS, CH, TR, UA, VA, AL, AT, BG, HR, CY, CZ, EE, FI, HU, LV, LT, MT, PL, RO, SK, SI, SE', 'Two character ISO country codes for Zone 9 EU ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 10 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_7', 'US, UM, CA', 'Two character ISO country codes for Zone 10 ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 11 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_8', 'AS, AU, BN, KH, CN, CX, CC, CK, FJ, PF, GU, HK, ID, JP, KI, KP, KR, LA, MO, MY, MH, FM, MN, MM, NR, NC, NZ, NU, NF, MP, PG, PH, PN, WS, SG, SB, TW, TH, TL, TK, TO, TV, VU, VN, WF', 'Two character ISO country codes for Zone 11 ', '6', '0', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 12 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_9', 'AF, DZ, AO, AI, AG, AR, AW, AZ, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BR, BF, BI, CM, KY, CF, TD, CL, CO, KM, CG, CR, CI, CU, DJ, DM, DO, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GT, GN, GW, GY, HT, HN, IN, IR, IQ, IL, JM, JO, KZ, KE, KW, KG, LB, LS, LR, LY, MG, MW, MV, ML, MQ, MR, MU, MX, MS, MA, MZ, NA, NP, AN, NI, NE, NG, OM, PK, PA, PY, PE, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SZ, SY, TJ, TZ, TG, TT, TN, TM, TC, UG, AE, UY, UZ, VE, VG, VI, YE, ZM, ZW', 'Two character ISO country codes for Zone 12 ', '6', '0', now())");
		// Rates
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 4 Channel Islands', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_1', '0.5:54.65, 1:57.3, 1.5:59.95, 2:62.6, 2.5:65.25, 3:67.9, 3.5:70.55, 4:73.2, 4.5:75.85, 5:78.5, 5.5:81.4, 6:84.3, 6.5:87.2, 7:90.1, 7.5:93, 8:95.9, 8.5:98.8, 9:101.7, 9.5:104.6, 10:107.5, 10.5:109.75, 11:112, 11.5:114.25, 12:116.5, 12.5:118.75, 13:121, 13.5:123.25, 14:125.5, 14.5:127.75, 15:130, .5+:2.45', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 5 Republic of Ireland', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_2', '0.5:47.94, 1:50.46, 1.5:52.98, 2:55.5, 2.5:59.22, 3:62.94, 3.5:66.66, 4:70.38, 4.5:74.1, 5:77.82, 5.5:79.56, 6:81.3, 6.5:83.04, 7:84.78, 7.5:86.52, 8:88.26, 8.5:90, 9:91.74, 9.5:93.48, 10:95.22, 10.5:97.56, 11:99.9, 11.5:102.24, 12:104.58, 12.5:106.92, 13:109.26, 13.5:111.6, 14:113.94, 14.5:116.28, 15:118.62, .5+:1.74', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 6 Belgium, Netherlands, Luxembourg', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_3', '0.5:43.5, 1:47.58, 1.5:51.66, 2:55.74, 2.5:59.1, 3:62.46, 3.5:65.82, 4:69.18, 4.5:72.54, 5:75.9, 5.5:78, 6:80.1, 6.5:82.2, 7:84.3, 7.5:86.4, 8:88.5, 8.5:90.6, 9:92.7, 9.5:94.8, 10:96.9, 10.5:98.82, 11:100.74, 11.5:102.66, 12:104.58, 12.5:106.5, 13:108.42, 13.5:110.34, 14:112.26, 14.5:114.18, 15:116.1, .5+:1.74', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 7 France, Germany, Denmark', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_4', '0.5:44.76, 1:48.36, 1.5:51.96, 2:55.56, 2.5:59.76, 3:63.96, 3.5:68.16, 4:72.36, 4.5:76.56, 5:80.76, 5.5:83.94, 6:87.12, 6.5:90.3, 7:93.48, 7.5:96.66, 8:99.84, 8.5:103.02, 9:106.2, 9.5:109.38, 10:112.56, 10.5:115.02, 11:117.48, 11.5:119.94, 12:122.4, 12.5:124.86, 13:127.32, 13.5:129.78, 14:132.24, 14.5:134.7, 15:137.16, .5+:2.04', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 8 Italy, Spain, Portugal, Greece', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_5', '0.5:48.06, 1:51.9, 1.5:55.74, 2:59.58, 2.5:62.7, 3:65.82, 3.5:68.94, 4:72.06, 4.5:75.18, 5:78.3, 5.5:81.42, 6:84.54, 6.5:87.66, 7:90.78, 7.5:93.9, 8:97.02, 8.5:100.14, 9:103.26, 9.5:106.38, 10:109.5, 10.5:112.56, 11:115.62, 11.5:118.68, 12:121.74, 12.5:124.8, 13:127.86, 13.5:130.92, 14:133.98, 14.5:137.04, 15:140.1, .5+:2.76', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 9  Europe', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_6', '0.5:52.5, 1:57.18, 1.5:61.86, 2:66.54, 2.5:74.04, 3:81.54, 3.5:89.04, 4:96.54, 4.5:104.04, 5:111.54, 5.5:116.58, 6:121.62, 6.5:126.66, 7:131.7, 7.5:136.74, 8:141.78, 8.5:146.82, 9:151.86, 9.5:156.9, 10:161.94, 10.5:165.3, 11:168.66, 11.5:172.02, 12:175.38, 12.5:178.74, 13:182.1, 13.5:185.46, 14:188.82, 14.5:192.18, 15:195.54, .5+:3.72', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 10 USA, Canada', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_7', '0.5:54.65, 1:59.85, 1.5:65.05, 2:70.25, 2.5:74.4, 3:78.55, 3.5:82.7, 4:86.85, 4.5:91, 5:95.15, 5.5:99.55, 6:103.95, 6.5:108.35, 7:112.75, 7.5:117.15, 8:121.55, 8.5:125.95, 9:130.35, 9.5:134.75, 10:139.15, 10.5:142.55, 11:145.95, 11.5:149.35, 12:152.75, 12.5:156.15, 13:159.55, 13.5:162.95, 14:166.35, 14.5:169.75, 15:173.15, .5+:3.35', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 11 Far East, Australasia', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_8', '0.5:66.25, 1:73.1, 1.5:79.95, 2:86.8, 2.5:92.8, 3:98.8, 3.5:104.8, 4:110.8, 4.5:116.8, 5:122.8, 5.5:127.7, 6:132.6, 6.5:137.5, 7:142.4, 7.5:147.3, 8:152.2, 8.5:157.1, 9:162, 9.5:166.9, 10:171.8, 10.5:177.15, 11:182.5, 11.5:187.85, 12:193.2, 12.5:198.55, 13:203.9, 13.5:209.25, 14:214.6, 14.5:219.95, 15:225.3, .5+:5.25', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 12 Rest of World', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_9', '0.5:75.65, 1:84.75, 1.5:93.85, 2:102.95, 2.5:111.35, 3:119.75, 3.5:128.15, 4:136.55, 4.5:144.95, 5:153.35, 5.5:159.95, 6:166.55, 6.5:173.15, 7:179.75, 7.5:186.35, 8:192.95, 8.5:199.55, 9:206.15, 9.5:212.75, 10:219.35, 10.5:226.2, 11:233.05, 11.5:239.9, 12:246.75, 12.5:253.6, 13:260.45, 13.5:267.3, 14:274.15, 14.5:281, 15:287.85, .5+:7.05', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		// Insurance
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates', 'MODULE_SHIPPING_" . $module . "_INSURANCE', '200:0, 300:1.8, 100+:4.8', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");
		// Expires date
		$db->Execute("REPLACE INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2023-04-03 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-30 00:00:01 or 2013-04-30<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
	}
	function remove() {
	    global $db;
	    $module = strtoupper($this->code);
	    $db->Execute('DELETE FROM ' . TABLE_CONFIGURATION . " WHERE configuration_key LIKE 'MODULE\_SHIPPING\_" . $module . "\_%'");
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
				'MODULE_SHIPPING_' . $module . '_INSURANCE');
		for ($i=1; $i<=$this->num_zones; $i++) {
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
		}
		return $keys;
	}
}