<?php
/*

GPL released as part of the big_royalmail_v3.2 package

see CREDITS.txt for the contributors and support forum.

*/

define('MODULE_SHIPPING_RMAMPARCELSF_TEXT_TITLE', 'Royal Mail Airmail <span style="color:red; font-weight:bold">International</span> <span style="color: #555555; font-weight:bold">Signed For</span> <span style="font-weight: normal; font-style: italic">&quot;Small Parcel&quot;</span>');
define('MODULE_SHIPPING_RMAMPARCELSF_TEXT_WAY', 'Airmail Express delivery to %1$s : %2$s.<br />4+ days to Western Europe,<br />8+ days to rest of world.<br />Parcel requires a signature.');
define('MODULE_SHIPPING_RMAMPARCELSF_INVALID_ZONE', 'Overseas Only');
define('MODULE_SHIPPING_RMAMPARCELSF_UNDEFINED_RATE', 'The shipping rate cannot be determined at this time');
define('MODULE_SHIPPING_RMAMPARCELSF_TEXT_EXCLUDED', 'Airmail shipping is not currently available to ');
define('MODULE_SHIPPING_RMAMPARCELSF_TEXT_UNDERMINTOTAL', 'International Signed For &quot;Small Parcel&quot; delivery is only available for orders over &pound;');
define('MODULE_SHIPPING_RMAMPARCELSF_TEXT_OVERMAXTOTAL', 'International Signed For &quot;Small Parcel&quot; delivery is only available for orders under &pound;');
define('MODULE_SHIPPING_RMAMPARCELSF_ICON','shipping_ukamisf.gif');
define('MODULE_SHIPPING_RMAMPARCELSF_TEXT_DESCRIPTION', 'RM International Signed For &quot;Small Parcel&quot; Rates.  Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . MODULE_SHIPPING_RM_EXPIRES . '</span>');