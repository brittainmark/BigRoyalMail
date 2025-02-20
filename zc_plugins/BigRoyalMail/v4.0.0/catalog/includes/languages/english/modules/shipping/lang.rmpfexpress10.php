<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

$define = [
    'MODULE_SHIPPING_RMPFEXPRESS10_TEXT_TITLE' => 'Royal Mail <strong style ="color:#025299">Parcel Force</strong> <span style="font-weight: normal; font-style: italic">&quot;express 10&quot;</span>',
    'MODULE_SHIPPING_RMPFEXPRESS10_TEXT_WAY' => 'Great Britain and Northern Ireland only',
    'MODULE_SHIPPING_RMPFEXPRESS10_INVALID_ZONE' => 'GB &amp; Northern Ireland only for this service',
    'MODULE_SHIPPING_RMPFEXPRESS10_UNDEFINED_RATE' => 'The shipping rate cannot be determined at this time',
    'MODULE_SHIPPING_RMPFEXPRESS10_TEXT_UNDERMINTOTAL' => 'The Parcel Force <span style="font-weight: normal; font-style: italic">&quot;express 10&quot;</span> service is only available for orders over &pound;',
    'MODULE_SHIPPING_RMPFEXPRESS10_TEXT_OVERMAXTOTAL' => 'The Parcel Force <span style="font-weight: normal; font-style: italic">&quot;express 10&quot;</span> service is only available for orders under &pound;',
    'MODULE_SHIPPING_RMPFEXPRESS10_TEXT_DESCRIPTION' => 'Royal Mail Parcel Force <span style="font-weight: normal; font-style: italic">&quot;express 10&quot;</span> Rates. Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') .'</span>',
    'MODULE_SHIPPING_RMPFEXPRESS10_ICON' => 'shipping_pf.jpg',
];

return $define;
