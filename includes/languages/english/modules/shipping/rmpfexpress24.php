<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

define('MODULE_SHIPPING_RMPFEXPRESS24_TEXT_TITLE', 'Royal Mail <b style ="color:#025299">Parcel Force</b> <span style="font-weight: normal; font-style: italic">&quot;express 24&quot;</span>');
define('MODULE_SHIPPING_RMPFEXPRESS24_TEXT_WAY', 'Great Britain and Northern Ireland only');
define('MODULE_SHIPPING_RMPFEXPRESS24_INVALID_ZONE', 'GB &amp; Northern Ireland only for this service');
define('MODULE_SHIPPING_RMPFEXPRESS24_UNDEFINED_RATE', 'The shipping rate cannot be determined at this time');
define('MODULE_SHIPPING_RMPFEXPRESS24_TEXT_UNDERMINTOTAL', 'The Parcel Force <span style="font-weight: normal; font-style: italic">&quot;express 24&quot;</span> service is only available for orders over &pound;');
define('MODULE_SHIPPING_RMPFEXPRESS24_TEXT_OVERMAXTOTAL', 'The Parcel Force <span style="font-weight: normal; font-style: italic">&quot;express 24&quot;</span> service is only available for orders under &pound;');
define('MODULE_SHIPPING_RMPFEXPRESS24_TEXT_DESCRIPTION', 'Royal Mail Parcel Force <span style="font-weight: normal; font-style: italic">&quot;express 24&quot;</span> Rates. Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') .'</span>');
define('MODULE_SHIPPING_RMPFEXPRESS24_ICON','shipping_pf.jpg');
