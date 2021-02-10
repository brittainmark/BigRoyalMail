<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

define('MODULE_SHIPPING_RMAMLETTERSF_TEXT_TITLE', 'Royal Mail <span style="color:red; font-weight:bold">International Signed </span><span style="font-weight: normal; font-style: italic">&quot;Letter&quot;</span>');
define('MODULE_SHIPPING_RMAMLETTERSF_TEXT_WAY', 'Royal Mail International Signed to %1$s : %2$s.<br />4+ days to Western Europe,<br />8+ days to rest of world.<br />Parcel requires a signature.');
define('MODULE_SHIPPING_RMAMLETTERSF_INVALID_ZONE', 'Overseas Only');
define('MODULE_SHIPPING_RMAMLETTERSF_UNDEFINED_RATE', 'The shipping rate cannot be determined at this time');
define('MODULE_SHIPPING_RMAMLETTERSF_TEXT_EXCLUDED', 'International Signed shipping is not currently available to ');
define('MODULE_SHIPPING_RMAMLETTERSF_TEXT_UNDERMINTOTAL', 'International Signed &quot;Letter&quot; delivery is only available for orders over &pound;');
define('MODULE_SHIPPING_RMAMLETTERSF_TEXT_OVERMAXTOTAL', 'International Signed &quot;Letter&quot; delivery is only available for orders under &pound;');
define('MODULE_SHIPPING_RMAMLETTERSF_TEXT_DESCRIPTION', 'RM International Signed &quot;Letter&quot; Rates.  Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') . '</span>');
define('MODULE_SHIPPING_RMAMLETTERSF_ICON','shipping_ukrm.jpg');