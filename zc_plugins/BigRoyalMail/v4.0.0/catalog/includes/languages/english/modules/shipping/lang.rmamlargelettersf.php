<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

$define = [
    'MODULE_SHIPPING_RMAMLARGELETTERSF_TEXT_TITLE' => 'Royal Mail <span style="color:red; font-weight:bold">International Signed </span><span style="font-weight: normal; font-style: italic">&quot;Large Letter&quot;</span>',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_TEXT_WAY' => 'Royal Mail International Signed to %1$s : %2$s.<br />4+ days to Western Europe,<br />8+ days to rest of world.<br />Parcel requires a signature.',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_INVALID_ZONE' => 'Overseas Only',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_UNDEFINED_RATE' => 'The shipping rate cannot be determined at this time',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_TEXT_EXCLUDED' => 'International Signed shipping is not currently available to ',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_TEXT_UNDERMINTOTAL' => 'International Signed &quot;Large Letter&quot; delivery is only available for orders over &pound;',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_TEXT_OVERMAXTOTAL' => 'International Signed &quot;Large Letter&quot; delivery is only available for orders under &pound;',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_TEXT_DESCRIPTION' => 'RM International Signed &quot;Large Letter&quot; Rates.  Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') . '</span>',
    'MODULE_SHIPPING_RMAMLARGELETTERSF_ICON' => 'shipping_ukrm.jpg',
];

return $define;
