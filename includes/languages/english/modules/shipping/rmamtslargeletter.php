<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

define('MODULE_SHIPPING_RMAMTSLARGELETTER_TEXT_TITLE', 'Royal Mail <strong>International Tracked &amp; Signed</strong> <span style="font-weight: normal; font-style: italic">&quot;Large Letter&quot;</span>');
define('MODULE_SHIPPING_RMAMTSLARGELETTER_TEXT_WAY', '<strong>International Tracked &amp; Signed</strong> delivery to %1$s : %2$s.<br />3+ days to Western Europe,<br />7+ days to rest of world.<br />Tracking can be provided.');
define('MODULE_SHIPPING_RMAMTSLARGELETTER_INVALID_ZONE', 'Not available for this destination.');
define('MODULE_SHIPPING_RMAMTSLARGELETTER_UNDEFINED_RATE', 'The shipping rate cannot be determined at this time');
define('MODULE_SHIPPING_RMAMTSLARGELETTER_TEXT_UNDERMINTOTAL', '<strong>International Tracked &amp; Signed</strong> delivery is only available for orders over &pound;');
define('MODULE_SHIPPING_RMAMTSLARGELETTER_TEXT_OVERMAXTOTAL', '<strong>International Tracked &amp; Signed</strong> delivery is only available for orders under &pound;');
define('MODULE_SHIPPING_RMAMTSLARGELETTER_TEXT_DESCRIPTION', 'Royal Mail International Tracked &amp; Signed <span style="font-weight: normal; font-style: italic">&quot;Large Letter&quot;</span> Rates.  Weights in '.constant('TEXT_PRODUCT_WEIGHT_UNIT').'. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') . '</span>');
define('MODULE_SHIPPING_RMAMTSLARGELETTER_ICON','shipping_ukrm.jpg');