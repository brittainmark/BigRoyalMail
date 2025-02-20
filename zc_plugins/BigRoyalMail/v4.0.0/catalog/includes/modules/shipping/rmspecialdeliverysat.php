<?php

/*
 * GPL released as part of the big_royalmail_v3 package
 * see CREDITS.txt for the contributors and support forum.
 */
class rmspecialdeliverysat extends ZenShipping
{

    /**
     * $num_zones is the number of zones for shipping calculation
     * @var int
     */
    protected $num_zones;
    /**
     * $version is the version of this shipping method
     * @var string
     */
    protected $version;

    // class constructor
    function __construct()
    {
        require DIR_FS_CATALOG . DIR_WS_MODULES . 'shipping/BigRoyalMail/rVersion.php';
        $this->version = '3.9.0 rates: ' . $rVersion;
        $this->code = 'rmspecialdeliverysat';
        $this->num_zones = 1;
        require DIR_FS_CATALOG . DIR_WS_MODULES . 'shipping/BigRoyalMail/main.php';
        if ($this->enabled == true) {
            // Check time and date
            if (constant('MODULE_SHIPPING_' . $module . '_DISPLAY_DAYS') != 7) {
                $day = date("w");
                if ($day != 6) {
                    $day = 5 - $day;
                }
                $day = $day - constant('MODULE_SHIPPING_' . $module . '_DISPLAY_DAYS');
                $checkDate = strtotime(date('y-m-d', strtotime($day . " days")) . " " . constant('MODULE_SHIPPING_' . $module . '_FRIDAY_CUTOFF'));
                $this->enabled = $checkDate < time();
            }
        }
    }

    // class methods
    function quote($method = '')
    {
        
        $postage_check = [
            40
        ];
        require DIR_FS_CATALOG . DIR_WS_MODULES . 'shipping/BigRoyalMail/quote.php';
        if (constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') === 'True' && $error > 0) {
            return;
        }
        return $this->quotes;
    }

    function check()
    {
        global $db;
        if (! isset($this->_check)) {
            $check_query = $db->Execute('select configuration_value from ' . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_STATUS'");
            $this->_check = $check_query->RecordCount();
        }
        return $this->_check;
    }

    function install()
    {
        global $db;
        $module = strtoupper($this->code);
        $this->remove();
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order values).', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '180', 'Sort order of display.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attribute Exact Match', 'MODULE_SHIPPING_" . $module . "_ATTRIBUTE_MATCH', 'False', 'Used to only display this shipping method if the attribute shipping is exact match', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        // Saturday Delivery Options
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Friday Cutoff', 'MODULE_SHIPPING_" . $module . "_FRIDAY_CUTOFF', '12:00', 'Cutoff time for last delivery hh:mm.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Display for ? days before', 'MODULE_SHIPPING_" . $module . "_DISPLAY_DAYS', '7', 'Enter number of days before cutoff to display Saturday delivery. 7 = always display', '6', '0', now())");
        // Min Max order value
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '2500.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
        // Handling
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', '0', 'The amount it costs you to package the items for delivery.', '6', '0', now())");
        // Countries
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'GB', 'Two character ISO country codes for Great Britain and Northern Ireland ', '6', '0', now())");
        // Rates
        require DIR_FS_CATALOG . DIR_WS_MODULES . 'shipping/BigRoyalMail/rates.php';
        $rateName = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1';
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to GB &amp; Northern Ireland', '" . $rateName . "', '" . $rates[$rateName] . "', 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', '6', '0', 'zen_cfg_textarea(', now())");
        // Insurance
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates to GB &amp; Northern Ireland', 'MODULE_SHIPPING_" . $module . "_INSURANCE', '500:0,1000:1.2,2500:3.6', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");
        // Expires date
        $db->Execute("REPLACE INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '" . $rateExpires . "', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-30 00:00:01 or 2013-04-30<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
    }

    function keys()
    {
        $module = strtoupper($this->code);

        $keys = [
            'MODULE_SHIPPING_RM_EXPIRES',
            'MODULE_SHIPPING_' . $module . '_STATUS',
            'MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS',
            'MODULE_SHIPPING_' . $module . '_ATTRIBUTE_MATCH',
            'MODULE_SHIPPING_' . $module . '_TAX_CLASS',
            'MODULE_SHIPPING_' . $module . '_SORT_ORDER',
            'MODULE_SHIPPING_' . $module . '_FRIDAY_CUTOFF',
            'MODULE_SHIPPING_' . $module . '_DISPLAY_DAYS',
            'MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE',
            'MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE',
            'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING',
            'MODULE_SHIPPING_' . $module . '_INSURANCE'
        ];
        $keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1';
        $keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1';
        return $keys;
    }
}