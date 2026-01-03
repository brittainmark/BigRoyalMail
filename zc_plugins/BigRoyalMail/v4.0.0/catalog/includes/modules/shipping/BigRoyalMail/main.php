<?php

/*
 * Big Royal Mail Main code for all uk, Parcel force and air mail delivery methods
 */
$module = strtoupper($this->code);
$this->title = ((defined('IS_ADMIN_FLAG') && IS_ADMIN_FLAG === true) ? constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') . ' <strong style="color:#ff4000">ver. ' . $this->version . '</strong>' : constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE'));
$this->description = sprintf(constant('MODULE_SHIPPING_' . $module . '_TEXT_DESCRIPTION'), (defined('MODULE_SHIPPING_RM_EXPIRES') ? MODULE_SHIPPING_RM_EXPIRES : 'Unset'));
$this->sort_order = defined('MODULE_SHIPPING_' . $module . '_SORT_ORDER') ? constant('MODULE_SHIPPING_' . $module . '_SORT_ORDER') : '';
$this->icon = constant('MODULE_SHIPPING_' . $module . '_ICON');
if (zen_not_null($this->icon)) {
    preg_match('#zc_plugins/.*?/catalog#', __DIR__, $m);
    $path = $m[0];
    $this->icon = $path . '/images/icons/' . constant('MODULE_SHIPPING_' . $module . '_ICON');
}
$this->tax_class = defined('MODULE_SHIPPING_' . $module . '_TAX_CLASS') ? constant('MODULE_SHIPPING_' . $module . '_TAX_CLASS') : '';
$this->enabled = defined('MODULE_SHIPPING_' . $module . '_STATUS') ? ((constant('MODULE_SHIPPING_' . $module . '_STATUS') === 'True') ? true : false) : false;

