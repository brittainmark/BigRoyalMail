<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

$define = [
    'MODULE_SHIPPING_RMAMTSLETTER_TEXT_TITLE' => 'Royal Mail <strong>International Tracked &amp; Signed</strong> <span style="font-weight: normal; font-style: italic">&quot;Letter&quot;</span>',
    'MODULE_SHIPPING_RMAMTSLETTER_TEXT_WAY' => '<strong>International Tracked &amp; Signed</strong> delivery to %1$s : %2$s.<br />3+ days to Western Europe,<br />7+ days to rest of world.<br />Tracking can be provided.',
    'MODULE_SHIPPING_RMAMTSLETTER_INVALID_ZONE' => 'Not available for this destination.',
    'MODULE_SHIPPING_RMAMTSLETTER_UNDEFINED_RATE' => 'The shipping rate cannot be determined at this time',
    'MODULE_SHIPPING_RMAMTSLETTER_TEXT_UNDERMINTOTAL' => '<strong>International Tracked &amp; Signed</strong> delivery is only available for orders over &pound;',
    'MODULE_SHIPPING_RMAMTSLETTER_TEXT_OVERMAXTOTAL' => '<strong>International Tracked &amp; Signed</strong> delivery is only available for orders under &pound;',
    'MODULE_SHIPPING_RMAMTSLETTER_TEXT_DESCRIPTION' => 'Royal Mail International Tracked &amp; Signed <span style="font-weight: normal; font-style: italic">&quot;Letter&quot;</span> Rates.  Weights in '.constant('TEXT_PRODUCT_WEIGHT_UNIT').'. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') . '</span>',
    'MODULE_SHIPPING_RMAMTSLETTER_ICON' => 'shipping_ukrm.jpg',
];

return $define;
