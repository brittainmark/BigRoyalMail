<?php
/*
 *Big Royal Mail Main code for all uk, Parcel force and air mail delivery methods
 */
$module = strtoupper($this->code);
$this->title = ( (defined('IS_ADMIN_FLAG') && IS_ADMIN_FLAG == true) ? @constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE'). ' <b style="color:#ff4000">ver. '.$this->version.'</b>' : constant('MODULE_SHIPPING_' . $module . '_TEXT_TITLE') );
$this->description = @constant('MODULE_SHIPPING_' . $module . '_TEXT_DESCRIPTION');
$this->sort_order = @constant('MODULE_SHIPPING_' . $module . '_SORT_ORDER');
$this->icon = @constant('MODULE_SHIPPING_' . $module . '_ICON');
if (zen_not_null($this->icon)) $this->icon = (( defined('DIR_WS_ICONS') ? DIR_WS_ICONS : 'images/icons/' ) .  @constant('MODULE_SHIPPING_' . $module . '_ICON'));
$this->tax_class = @constant('MODULE_SHIPPING_' . $module . '_TAX_CLASS');
$this->enabled = ((@constant('MODULE_SHIPPING_' . $module . '_STATUS') == 'True') ? true : false);
