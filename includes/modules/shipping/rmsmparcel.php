<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmsmparcel {
	var $code, $title, $description, $enabled, $num_zones, $valid_country ;


	// class constructor
	function rmsmparcel() {

		global $order, $total_weight;
		$this->version = '3.2.2';
		$this->code = 'rmsmparcel';
		// CUSTOMIZE THIS SETTING FOR THE NUMBER OF ZONES NEEDED
		//Currently Europe and the rest of the world
		$this->num_zones = 2;
		require(DIR_FS_CATALOG.DIR_WS_MODULES."shipping/BigRoyalMail/main.php");
		return ;
	}

	// class methods
	function quote($method = '') {

		global $order, $shipping_weight, $shipping_num_boxes, $currency, $db;
		$postage_check=30;
		require(DIR_FS_CATALOG.DIR_WS_MODULES."shipping/BigRoyalMail/quote.php");
		if (@constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' && $error > 0) {
			return ;
		}
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
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '300', 'Sort order of display.', '6', '0', now())");


		if(!defined('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '20.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('European Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1', '0', 'The amount it costs you to package the items for European Surface Mail delivery.', '6', '1', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('&quot;Rest of World&quot; Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_2', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Surface Mail delivery.', '6', '2', now())");

		}


		// European Rates

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined European Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'AL, AD, AM, AT, AZ, BY, BE, BG, HR, CY, CZ, DK, EE, ES, FO, FI, FR, GE, DE, GI, GR, GL, HU, IS, IT, KZ, KG, LV, LI, LT, LU, ME, MK, MT, MD, MC, NL, NO, PL, PT, RO, RS, RU, SM, SK, SI, SE, CH, TJ, TR, TM, UA, UZ, VA', 'Two character ISO country codes for Europe.', '6', '1', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('European rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_1', '0.1:2.8, 0.25:3.65, 0.5:5.1, 0.75:6.55, 0.1:8, 0.125:9.45, 1.5:10.9, 1.75:12.35, 2:13.8', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '1', 'zen_cfg_textarea(', now())");

			// Rest of world Rates
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined Rest of the World Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'AE, AF, AG, AI, AN, AO, AQ, AR, AS, AU, AW, AX, BA, BB, BD, BF, BH, BI, BJ, BM, BN, BO, BR, BS, BT, BV, BW, BZ, CA, CC, CF, CG, CI, CK, CL, CM, CN, CO, CR, CU, CV, CX, DJ, DM, DO, DZ, EC, EG, EH, ER, ET, FJ, FK, FM, GA, GD, GF, GH, GM, GN, GP, GQ, GS, GT, GU, GW, GY, HK, HM, HN, HT, ID, IE, IL, IM, IN, IO, IQ, IR, JM, JO, JP, KE, KH, KI, KM, KN, KP, KR, KW, KY, LA, LB, LC, LK, LR, LS, LY, MA, MG, MH, ML, MM, MN, MO, MP, MQ, MR, MS, MU, MV, MW, MX, MY, MZ, NA, NC, NE, NF, NG, NI, NP, NR, NU, NZ, OM, PA, PE, PF, PG, PH, PK, PM, PN, PR, PW, PY, QA, RE, RW, SA, SB, SC, SD, SG, SH, SJ, SL, SN, SO, SR, ST, SV, SY, SZ, TC, TD, TF, TG, TH, TK, TL, TN, TO, TT, TV, TW, TZ, UG, UM, US, UY, VC, VE, VG, VI, VN, VU, WF, WS, YE, YT, ZA, ZM, ZW', 'Two character ISO country codes for Rest of the world.', '6', '1', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_2', '0.1:2.8, 0.25:3.65, 0.5:5.1, 0.75:6.55, 0.1:8, 0.125:9.45, 1.5:10.9, 1.75:12.35, 2:13.8', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '1', 'zen_cfg_textarea(', now())");

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
		$module=strtoupper($this->code);

		$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ('" . implode("', '", $this->keys()) . "') AND configuration_key NOT IN ( 'MODULE_SHIPPING_RM_EXPIRES', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE') AND configuration_key NOT LIKE 'MODULE_SHIPPING_" . $module . "_ZONES%'");
	}

	function keys() {

		$module=strtoupper($this->code);

		$keys = array('MODULE_SHIPPING_RM_EXPIRES',
				'MODULE_SHIPPING_' . $module . '_STATUS',
				'MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS',
				'MODULE_SHIPPING_' . $module . '_TAX_CLASS',
				'MODULE_SHIPPING_' . $module . '_SORT_ORDER',
				'MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE',
				'MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE');

		for ($i=1; $i<=$this->num_zones; $i++) {
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_' . $i;
		}


		return $keys;
	}
}
?>
