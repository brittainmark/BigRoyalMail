<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmpfgeconomy {
	var $code, $title, $description, $enabled, $num_zones ;


	// class constructor
	function rmpfgeconomy() {

		global $order, $total_weight;

		$this->version = '3.2.2';
		$this->code = 'rmpfgeconomy';
		$this->num_zones = 3;
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
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '420', 'Sort order of display.', '6', '0', now())");


		$handling_test = $db->Execute("SELECT configuration_key FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ( 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_ZONES_HANDLING' ) " );

		if(!$handling_test->RecordCount()){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '0.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . (strtoupper($this->code)) . '_TEXT_TITLE' ) . " delivery.', '6', '0', now())");

		}



		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 10 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'US, UM, CA', 'Two character ISO country codes for Zone 10 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_1')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 10 USA, Canada', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_1', '0.5:24.45, 1:27.7, 1.5:30.95, 2:34.2, 2.5:39.95, 3:45.7, 3.5:51.45, 4:57.2, 4.5:62.95, 5:68.7, 5.5:71, 6:73.3, 6.5:75.6, 7:77.9, 7.5:80.2, 8:82.5, 8.5:84.8, 9:87.1, 9.5:89.4, 10:91.7, 10.5:94, 11:96.3, 11.5:98.6, 12:100.9, 12.5:103.2, 13:105.5, 13.5:107.8, 14:110.1, 14.5:112.4, 15:114.7, .5+:2.3', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 11 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'AS, AU, BN, KH, CN, CX, CC, CK, FJ, PF, GU, HK, ID, JP, KI, KP, KR, LA, MO, MY, MH, FM, MN, MM, NR, NC, NZ, NU, NF, MP, PG, PH, PN, WS, SG, SB, TW, TH, TL, TK, TO, TV, VU, VN, WF', 'Two character ISO country codes for Zone 11 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_2')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 11 Far East, Australasia', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_2', '0.5:31.5, 1:37.3, 1.5:43.1, 2:48.9, 2.5:54.3, 3:59.7, 3.5:65.1, 4:70.5, 4.5:75.9, 5:81.3, 5.5:85.45, 6:89.6, 6.5:93.75, 7:97.9, 7.5:102.05, 8:106.2, 8.5:110.35, 9:114.5, 9.5:118.65, 10:122.8, 10.5:126.95, 11:131.1, 11.5:135.25, 12:139.4, 12.5:143.55, 13:147.7, 13.5:151.85, 14:156, 14.5:160.15, 15:164.3, .5+:4.15', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
		}

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')) {
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 12 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'AF, DZ, AO, AI, AG, AR, AW, AZ, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BR, BF, BI, CM, KY, CF, TD, CL, CO, KM, CG, CR, CI, CU, DJ, DM, DO, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GT, GN, GW, GY, HT, HN, IN, IR, IQ, IL, JM, JO, KZ, KE, KW, KG, LB, LS, LR, LY, MG, MW, MV, ML, MQ, MR, MU, MX, MS, MA, MZ, NA, NP, AN, NI, NE, NG, OM, PK, PA, PY, PE, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SZ, SY, TJ, TZ, TG, TT, TN, TM, TC, UG, AE, UY, UZ, VE, VG, VI, YE, ZM, ZW', 'Two character ISO country codes for Zone 12 ', '6', '0', now())");
		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COST0_3')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to Zone 12 Rest of World', 'MODULE_SHIPPING_" . $module . "_ZONES_COST0_3', '0.5:33, 1:39.5, 1.5:46, 2:52.5, 2.5:59.1, 3:65.7, 3.5:72.3, 4:78.9, 4.5:85.5, 5:92.1, 5.5:97.7, 6:103.3, 6.5:108.9, 7:114.5, 7.5:120.1, 8:125.7, 8.5:131.3, 9:136.9, 9.5:142.5, 10:148.1, 10.5:153.7, 11:159.3, 11.5:164.9, 12:170.5, 12.5:176.1, 13:181.7, 13.5:187.3, 14:192.9, 14.5:198.5, 15:204.1, .5+:5.6', 'example: 0.1:1.14 means weights less than or equal to 0.1 kg would cost &pound;1.14. 1+:1.38 means each additional 1kg costs &pound;1.38.', '6', '0', 'zen_cfg_textarea(', now())");
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
				'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING')");

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
				'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING');


		for ($i=1; $i<=$this->num_zones; $i++) {
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
		}

		return $keys;
	}
}
?>
