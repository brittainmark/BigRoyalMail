<?php

/*
 * GPL released as part of the big_royalmail_v3 package
 * see CREDITS.txt for the contributors and support forum.
 */

class rmamparcelsf extends ZenShipping
{
    /**
     * $num_zones is the number of zones for shipping calculation
     * @var int
     */
    protected int $num_zones;


    // class constructor
    public function __construct()
    {
        $this->code = 'rmamparcelsf';
        $this->num_zones = 5;
        require __DIR__ . '/BigRoyalMail/main.php';
        return;
    }

    // class methods
    public function quote($method = ''): array
    {

        $postage_check = [
            20,
            30,
        ];
        require __DIR__ . '/BigRoyalMail/quote.php';
        if (constant('MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS') === 'True' && $error > 0) {
            return [];
        }
        return $this->quotes;
    }

    public function check()
    {
        global $db;
        if (! isset($this->_check)) {
            $check_query = $db->Execute('SELECT configuration_value FROM ' . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_" . strtoupper($this->code) . "_STATUS'");
            $this->_check = $check_query->RecordCount();
        }
        return $this->_check;
    }

    public function install(): void
    {
        global $db;
        $module = strtoupper($this->code);
        $this->remove();
        // General values
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable this shipping option', 'MODULE_SHIPPING_" . $module . "_STATUS', 'False', 'If you need to adjust your shipping rates, you can use this option to disable it in your shop, instead of re-installing', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Hide Invalid Shipping', 'MODULE_SHIPPING_" . $module . "_HIDE_SHIPPING_ERRORS', 'False', 'Hide this shipping service if it is not valid (either due to exceeding the maximum weight or the min &amp; max order values).', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_" . $module . "_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_" . $module . "_SORT_ORDER', '330', 'Sort order of display.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attribute Exact Match', 'MODULE_SHIPPING_" . $module . "_ATTRIBUTE_MATCH', 'False', 'Used to only display this shipping method if the attribute shipping is exact match', '6', '0', 'zen_cfg_select_option([\'True\', \'False\'], ', now())");
        // Value range
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Minimum Order Value', 'MODULE_SHIPPING_" . $module . "_MIN_ORDERVALUE', '0.00', 'Minimum order value in &pound; GBP for this shipping option.<br />Set to 0 for no minimum order value.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Maximum Order Value', 'MODULE_SHIPPING_" . $module . "_MAX_ORDERVALUE', '250.00', 'Maximum order value in &pound; GBP for this shipping option.<br />Set to -1 if there is no Maximum', '6', '0', now())");
        // Handling fees
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Europe Zone 1 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_1', '0', 'The amount it costs you to package the items for Europe Zone 1 delivery.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Europe Zone 2 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_2', '0', 'The amount it costs you to package the items for Europe Zone 2 delivery.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Europe Zone 3 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for Europe Zone 3 delivery.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('World Zone 1 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_4', '0', 'The amount it costs you to package the items for World Zone 1 delivery.', '6', '0', now())");
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('World Zone 2 Handling Fee', 'MODULE_SHIPPING_" . $module . "_ZONES_HANDLING_5', '0', 'The amount it costs you to package the items for World Zone 2 delivery.', '6', '0', now())");
        // Countries
        // Europe Countries Zone 1
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail Europe Zones 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_1', 'DE, DK, FR, IE, MC', 'Two character ISO country codes for Europe Zones 1 destinations.', '6', '0', 'zen_cfg_textarea(', now())");
        // Europe Countries Zone 2
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail Europe Zones 2 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_2', 'AT, BE, BG, CY, CZ, EE, ES, FI, GR, HR, HU, IT, LT, LU, LV, MT, NL, PL, PT, RO, SE, SI, SK', 'Two character ISO country codes for Europe Zones 2 destinations.', '6', '0', 'zen_cfg_textarea(', now())");
        // Europe Countries Zone 3
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail Europe Zones 3 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_3', 'AD, AL, AM, AZ, BA, BY, CH, FO, GE, GI, GL, IS, KG, LI, MD, ME, MK, NO, RS, RU, SM, SZ, TJ, TM, TR, UA, UZ, VA, XK', 'Two character ISO country codes for Europe Zones 3 destinations.', '6', '0', 'zen_cfg_textarea(', now())");
        // WORLDWIDE Countries zone 1
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail World Zones 1 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_4', 'AE, AF, AG, AI, AO, AQ, AR, AW, AX, BB, BD, BF, BH, BI, BJ, BM, BN, BO, BQ, BR, BS, BT, BV, BW, BZ, CA, CF, CG, CI, CL, CM, CN, CO, CR, CU, CV, DJ, DM, DO, DZ, EC, EG, EH, ER, ET, FK, FM, GA, GD, GF, GH, GM, GN, GP, GQ, GS, GT, GU, GW, GY, HK, HM, HN, HT, ID, IL, IN, IQ, IR, JM, JO, JP, KE, KH, KM, KN, KP, KR, KW, KY, KZ, LB, LC, LK, LR, LS, LY, MA, MG, MH, ML, MM, MN, MP, MQ, MR, MS, MU, MV, MW, MX, MY, MZ, NA, NE, NG, NI, NP, OM, PA, PE, PH, PK, PM, PR, PW, PY, QA, RE, RW, SA, SC, SD, SH, SJ, SL, SN, SO, SR, SS, ST, SV, SX, SY, TC, TD, TG, TH, TL, TN, TT, TW, TZ, UG, UY, VC, VE, VG, VI, VN, VU, WF, YE, YT, ZA, ZM, ZW', 'Two character ISO country codes for World Zones 1 destinations.', '6', '0', 'zen_cfg_textarea(', now())");
        // WORLDWIDE Countries zone 2
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Royal Mail World Zones 2 Countries', 'MODULE_SHIPPING_" . $module . "_ZONES_COUNTRIES_5', 'AU, CX, CC, CK, FJ, IO, KI, MO, NC, NF, NR, NU, NZ, PF, PG, LA, PN, SG, SB, TF, TK, TO, TV, WS, AS', 'Two character ISO country codes for World Zones 2 destinations.', '6', '0', 'zen_cfg_textarea(', now())");
        // Rates
        require __DIR__ . '/BigRoyalMail/rates.php';
        $rateName = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_';
        // Europe Zone Zone 1
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Europe Zone 1 rates', '" . $rateName . '1' . "', '" . $rates[$rateName . '1'] . "', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now())");
        // Europe Zone 2
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Europe Zone 2 rates', '" . $rateName . '2' . "', '" . $rates[$rateName . '2'] . "', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now())");
        // Europe Zone 3
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Europe Zone 3 rates', '" . $rateName . '3' . "', '" . $rates[$rateName . '3'] . "', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now())");
        // World Zone 1
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('World Zone 1 rates', '" . $rateName . '4' . "', '" . $rates[$rateName . '4'] . "', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now())");
        // World Zone 2
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('World Zone 2 rates', '" . $rateName . '5' . "', '" . $rates[$rateName . '5'] . "', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now())");
        // Insurance
        $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Insurance rates', 'MODULE_SHIPPING_" . $module . "_INSURANCE', '50:0,250:2.5', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now())");

        // Expires date
        $db->Execute("REPLACE INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '" . $rateExpires . "', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2013-04-30 00:00:01 or 2013-04-30<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())");

    }

    public function keys(): array
    {
        $module = strtoupper($this->code);
        $keys = [
            'MODULE_SHIPPING_' . $module . '_STATUS',
            'MODULE_SHIPPING_' . $module . '_HIDE_SHIPPING_ERRORS',
            'MODULE_SHIPPING_' . $module . '_ATTRIBUTE_MATCH',
            'MODULE_SHIPPING_' . $module . '_TAX_CLASS',
            'MODULE_SHIPPING_' . $module . '_SORT_ORDER',
            'MODULE_SHIPPING_' . $module . '_MIN_ORDERVALUE',
            'MODULE_SHIPPING_' . $module . '_MAX_ORDERVALUE',
            'MODULE_SHIPPING_' . $module . '_INSURANCE',
        ];
        for ($i = 1; $i <= $this->num_zones; $i++) {
            $keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COUNTRIES_' . $i;
            $keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_COST0_' . $i;
            $keys[] = 'MODULE_SHIPPING_' . $module . '_ZONES_HANDLING_' . $i;
        }
        return $keys;
    }
}
