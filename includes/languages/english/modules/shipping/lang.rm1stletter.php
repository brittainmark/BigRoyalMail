<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

$define = [
    'MODULE_SHIPPING_RM1STLETTER_TEXT_TITLE' => 'Royal Mail 1<sup>st</sup> Class <span style="font-weight: normal; font-style: italic">&quot;Letter&quot;</span>',
    'MODULE_SHIPPING_RM1STLETTER_TEXT_DESCRIPTION' => 'Royal Mail First Class &quot;Letter&quot; Rates.  Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') .'</span>',
    'MODULE_SHIPPING_RM1STLETTER_TEXT_WAY' => 'Great Britain and Northern Ireland only',
    'MODULE_SHIPPING_RM1STLETTER_INVALID_ZONE' => 'GB &amp; Northern Ireland only for this service',
    'MODULE_SHIPPING_RM1STLETTER_UNDEFINED_RATE' => 'The shipping rate cannot be determined at this time',
    'MODULE_SHIPPING_RM1STLETTER_TEXT_UNDERMINTOTAL' => 'The 1<sup>st</sup> Class &quot;Letter&quot; service is only available for orders over &pound;',
    'MODULE_SHIPPING_RM1STLETTER_TEXT_OVERMAXTOTAL' => 'The 1<sup>st</sup> Class &quot;Letter&quot; service is only available for orders under &pound;',
    'MODULE_SHIPPING_RM1STLETTER_ICON' => 'shipping_ukrm.jpg',
];

return $define;
