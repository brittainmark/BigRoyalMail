<?php

/*
 * GPL released as part of the big_royalmail_v3 package
 * see CREDITS.txt for the contributors and support forum.
 */
class rmt48smlparcelsf
{

    /**
     * $_check is used to check the configuration key set up
     * @var int
     */
    protected $_check;
    /**
     * $code determines the internal 'code' name used to designate "this" shipping module
     *
     * @var string
     */
    public $code;
    /**
     * $description is a soft name for this shipping method
     * @var string 
     */
    public $description;
    /**
     * $enabled determines whether this module shows or not... during checkout.
     * @var boolean
     */
    public $enabled;
    /**
     * $icon is the file name containing the Shipping method icon
     * @var string
     */
    public $icon;
    /**
     * $num_zones is the number of zones for shipping calculation
     * @var int
     */
    protected $num_zones;
    /** 
     * $quotes is an array containing all the quote information for this shipping module
     * @var array
     */
    public $quotes;
    /**
     * $sort_order is the order priority of this shipping module when displayed
     * @var int
     */
    public $sort_order;
    /**
     * $tax_basis is used to indicate if tax is based on shipping, billing or store address.
     * @var string
     */
    public $tax_basis;
    /**
     * $tax_class is the  Tax class to be applied to the shipping cost
     * @var string
     */
    public $tax_class;
    /**
     * $title is the displayed name for this shipping method
     * @var string
     */
    public $title;
    /**
     * $version is the version of this shipping method
     * @var string
     */
    protected $version;

    // class constructor
    function __construct()
    {
        require DIR_FS_CATALOG . DIR_WS_MODULES . 'shipping/BigRoyalMail/rVersion.php';
        $this->version = '3.9.1 rates: ' . $rVersion;
        $this->code = 'rmt48smlparcelsf';
        $this->num_zones = 1;
        require DIR_FS_CATALOG . DIR_WS_MODULES . 'shipping/BigRoyalMail/main.php';
    }

    // class methods
    function quote($method = '')
    {
        
        $postage_check = [
            20
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
            $check_query = $db->Execute("SELECT configuration_value from " . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . (strtoupper($this->code)) . "_STATUS'");
            $this->_check = $check_query->RecordCount();
        }
        return $this->_check;
    }

    function install()
    {
        global $db;
        $module = strtoupper($this->code);
        // Remove old installation
        $this->remove();
        // General settings
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order values).', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '232', 'Sort order of display.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attribute Exact Match', 'MODULE_SHIPPING_" . $module . "_ATTRIBUTE_MATCH', 'False', 'Used to only display this shipping method if the attribute shipping is exact match', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        // Min Max order value
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '150.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
        // Handling
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING', '0', 'The amount it costs you to package the items for delivery.', '6', '0', now())");
        // Countries
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Zone 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'GB', 'Two character ISO country codes for Great Britain and Northern Ireland ', '6', '0', now())");
        // Rates
        require DIR_FS_CATALOG . DIR_WS_MODULES . 'shipping/BigRoyalMail/rates.php';
        $rateName = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1';
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Shipping rates to GB &amp; Northern Ireland', '" . $rateName . "', '" . $rates[$rateName] . "', 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', '6', '0', 'zen_cfg_textarea(', now())");
        // Expires date
        $db->Execute("REPLACE INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '" . $rateExpires . "', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-30 00:00:01 or 2013-04-30<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");
    }

    function remove()
    {
        global $db;
        $module = strtoupper($this->code);
        $db->Execute('DELETE FROM ' . TABLE_CONFIGURATION . " WHERE configuration_key LIKE 'MODULE\_SHIPPING\_" . $module . "\_%'");
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
            'MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE',
            'MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE',
            'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING',
            'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_1',
            'MODULE_SHIPPING_' . $module . '_ZONES_COST0_1'
        ];
        return $keys;
    }
}
