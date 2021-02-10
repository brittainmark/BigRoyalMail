<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmamlettersf {
	var $code, $title, $description, $enabled, $num_zones, $valid_country ;


	// class constructor
	function __construct() {

		global $order, $total_weight;
		$this->version = '3.5.0';
		$this->code = 'rmamlettersf';
		// CUSTOMIZE THIS SETTING FOR THE NUMBER OF ZONES NEEDED
		//Currently Europe and the rest of the world
		$this->num_zones = 4;
		require(DIR_FS_CATALOG.DIR_WS_MODULES.'shipping/BigRoyalMail/main.php');
		return ;
	}

	// class methods
	function quote($method = '') {

		global $order, $shipping_weight, $shipping_num_boxes, $currency, $db;
		$postage_check = array(0);
		require(DIR_FS_CATALOG.DIR_WS_MODULES.'shipping/BigRoyalMail/quote.php');
		if (@constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') == 'True' && $error > 0) {
			return ;
		}
		return $this->quotes;
	}

	function check() {
		global $db;

		if (!isset($this->_check)) {
			$check_query = $db->Execute('select configuration_value from ' . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . strtoupper($this->code) . "_STATUS'");
			$this->_check = $check_query->RecordCount();
		}
		return $this->_check;
	}

	function install() {
		global $db;

		$module=strtoupper($this->code);

		$this->remove();

		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order VALUES).', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '320', 'Sort order of display.', '6', '0', now())");
		$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attribute Exact Match', 'MODULE_SHIPPING_" . $module . "_ATTRIBUTE_MATCH', 'False', 'Used to only display this shipping method if the attribute shipping is exact match', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");


		if(!defined('MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE')){

			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('European Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1', '0', 'The amount it costs you to package the items for European Air Mail delivery.', '6', '0', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_2', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 1 delivery.', '6', '0', now())");

		}
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_3')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '0', now())");
		}

		// European Rates

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined European Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'AL, AD, AM, AT, AZ, BY, BE, BA, BG, HR, CY, CZ, DK, EE, ES, FO, FI, FR, GE, DE, GI, GR, GL, HU, IS, IT, KZ, KG, LV, LI, LT, LU, ME, MK, MT, MD, MC, NL, NO, PL, PT, RO, RS, RU, SM, SK, SI, SE, CH, TJ, TR, TM, UA, UZ, VA', 'Two character ISO country codes for Europe.', '6', '0', 'zen_cfg_textarea(', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'European non EU rates from GB &amp; Northern Ireland\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1\', \'0.01:6.85, 0.02:6.85, 0.1:6.85\', \'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}


		// Rest of World Zone 1 RATES
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_2')){

			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', 'Two character ISO country codes for Zone 1.', '6', '0', 'zen_cfg_textarea(', now())");
		}
		// to cope with old royal mail version
		if(!defined('MODULE_SHIPPING_' . $module . '_0_2' )){
		    $db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_2\', \'0.01:6.85, 0.02:6.85, 0.1:7.85\', \'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		// Rest of World Zone 2 RATES
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', 'Two character ISO country codes for Zone 2.', '6', '0', 'zen_cfg_textarea(', now())");
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . ' (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES (\'&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland\', \'MODULE_SHIPPING_' . $module . '_ZONES_COST0_3\', \'0.01:6.85, 0.02:6.85, 0.1:7.85\', \'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.\', \'6\', \'0\', \'zen_cfg_textarea(\', now())');
		}

		/*
		 * Add insureance rates
		*/
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_INSURE')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates', 'MODULE_SHIPPING_" . $module . "_ZONES_INSURE', '50:0, 250:2.5', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");
		}


		/*
		 * Add the expires date if it does not exist
		*/
		if(!defined('MODULE_SHIPPING_RM_EXPIRES')){
			$db->Execute('INSERT INTO ' . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2021-03-22 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-30 00:00:01 or 2013-04-30<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
		}

	}

	function remove() {
		global $db;
		$module=strtoupper($this->code);

		$db->Execute('DELETE FROM ' . TABLE_CONFIGURATION . " WHERE configuration_key IN ('" . implode("', '", $this->keys()) . "') AND configuration_key NOT IN ( 'MODULE_SHIPPING_RM_EXPIRES', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE') AND configuration_key NOT LIKE 'MODULE_SHIPPING_" . $module . "_ZONES%'");
	}

	function keys() {

		$module=strtoupper($this->code);

		$keys = array('MODULE_SHIPPING_RM_EXPIRES',
				'MODULE_SHIPPING_' . $module . '_STATUS',
				'MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS',
				'MODULE_SHIPPING_' . $module . '_ATTRIBUTE_MATCH',
				'MODULE_SHIPPING_' . $module . '_TAX_CLASS',
				'MODULE_SHIPPING_' . $module . '_SORT_ORDER',
				'MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE',
				'MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE',
				'MODULE_SHIPPING_' . $module . '_ZONES_INSURE');

		for ($i=1; $i<=$this->num_zones; $i++) {
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_' . $i;
		}

		return $keys;
	}
}
?>
