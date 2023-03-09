<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

define('MODULE_SHIPPING_RMPFGEXPRESS_TEXT_TITLE', 'Royal Mail <b style ="color:#025299">Parcel Force</strong> <span style="font-weight: normal; font-style: italic">&quot;Global Express&quot;</span>');
define('MODULE_SHIPPING_RMPFGEXPRESS_TEXT_WAY', '<strong>Parcel Force Global Express</strong> delivery to %1$s : %2$s.<br />Delivery from next working day to the USA, Canada &amp; Europe.<br /> From two working days to the rest of the world.<br />Tracking can be provided.');
define('MODULE_SHIPPING_RMPFGEXPRESS_INVALID_ZONE', 'Not available for this destination.');
define('MODULE_SHIPPING_RMPFGEXPRESS_UNDEFINED_RATE', 'The shipping rate cannot be determined at this time');
define('MODULE_SHIPPING_RMPFGEXPRESS_TEXT_UNDERMINTOTAL', '<strong>Parcel Force Global Express</strong> delivery is only available for orders over &pound;');
define('MODULE_SHIPPING_RMPFGEXPRESS_TEXT_OVERMAXTOTAL', '<strong>Parcel Force Global Express</strong> delivery is only available for orders under &pound;');
define('MODULE_SHIPPING_RMPFGEXPRESS_ICON','shipping_pf.jpg');
define('MODULE_SHIPPING_RMPFGEXPRESS_TEXT_DESCRIPTION', 'Royal Mail Parcel Force <span style="font-weight: normal; font-style: italic">&quot; Global Express&quot;</span> Rates.  Weights in '.constant('TEXT_PRODUCT_WEIGHT_UNIT').'. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') . '</span>');
