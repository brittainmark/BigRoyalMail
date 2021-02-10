<?php
/*

GPL released as part of the big_royalmail_v3 package

see CREDITS.txt for the contributors and support forum.

*/



class rmamasparcel {
	var $code, $title, $description, $enabled, $num_zones, $valid_country ;


	// class constructor
	function rmamasparcel() {

		global $order, $total_weight;

		$this->version = '3.2.0';
		$this->code = 'rmamasparcel';
		// CUSTOMIZE THIS SETTING FOR THE NUMBER OF ZONES NEEDED
		//Currently Europe and the rest of the world
		$this->num_zones = 3;
		require(DIR_FS_CATALOG.DIR_WS_MODULES."shipping/BigRoyalMail/main.php");
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
			$check_query = $db->Execute("SELECT configuration_value from " . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . strtoupper($this->code) . "_STATUS'");
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
		$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '320', 'Sort order of display.', '6', '0', now())");


		$handling_test = $db->Execute("SELECT configuration_key FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ( 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1' ) " );

		if(!$handling_test->RecordCount()){

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Europe Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE' ) . " delivery to Europe.', '6', '0', now())");
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Rest of World Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_2', '0', 'The amount it costs you to package the items for ".@constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE' ) . " delivery Worldwide.', '6', '0', now())");

		}
		if(!defined("MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_3")){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())");
		}
		// European Rates

		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1')){


			$db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail defined European Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'AD, AT, BE, CH, DE, DK, EE, ES, FI, FO, FR, IE, IS, LI, LU, MC, NL, PT, SE', 'two character ISO country codes for European Airsure&reg; destinations. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '0', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('European rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_1', '0.1:8, 0.25:8.5, 0.5:9.95, 0.75:11.4, 1:12.85, 1.25:14.3, 1.5:15.75, 1.75:17.2, 2:18.65', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '1', 'zen_cfg_textarea(', now())");



			// WORLDWIDE RATES zone 1

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail defined World Zones 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'BR, CA, HK, MY, US', 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '1', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_2', '0.1:8.9, 0.25:9.9, 0.5:12.6, 0.75:15.3, 1:18, 1.25:20.7, 1.5:23.4, 1.75:26.1, 2:28.8', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())");

		}

		// WORLDWIDE RATES zone 2
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_3')){
			$db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail defined World Zones 2 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'AU, NZ, SG', 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '1', 'zen_cfg_textarea(', now())");

			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_".$module."_ZONES_COST0_3', '0.1:8.9, 0.25:10.1, 0.5:12.95, 0.75:15.8, 1:18.65, 1.25:21.5, 1.5:24.35, 1.75:27.2, 2:30.05', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())");

		}

		/*
		 * Put in the insurance rates
		*/
		if(!defined('MODULE_SHIPPING_' . $module . '_ZONES_INSURE'))
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates', 'MODULE_SHIPPING_" . $module . "_ZONES_INSURE', '50:0, 500:2.6', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");


		/*
		 * Add the expires date if it does not exist
		*/
		if(!defined('MODULE_SHIPPING_RM_EXPIRES')){
			$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2013-04-29 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-29 00:00:01 or 2013-04-29<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
		}
	}

	function remove() {
		global $db;
		$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key IN ('" . implode("', '", $this->keys()) . "') AND configuration_key NOT IN ('MODULE_SHIPPING_RM_EXPIRES', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE') AND configuration_key NOT LIKE 'MODULE_SHIPPING_" . $module . "_ZONES%'");
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
				'MODULE_SHIPPING_' . $module . '_ZONES_INSURE');

		for ($i=1; $i<=$this->num_zones; $i++) {
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_'. $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
			$keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
		}

		return $keys;
	}
}
?>
