<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

$define = [
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_TEXT_TITLE' => 'Royal Mail UK Guaranteed special delivery by <strong>9am</strong>&reg with <strong>Saturday Guatantee</strong>',
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_TEXT_DESCRIPTION' => 'Royal Mail UK Guaranteed special delivery by <strong>9am</strong>&reg with <strong>Saturday Guatantee Rates.  Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') .'</span>',
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_TEXT_WAY' => 'Great Britain &amp; Northern Ireland only',
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_INVALID_ZONE' => 'GB &amp; Northern Ireland only for this service',
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_UNDEFINED_RATE' => 'The shipping rate cannot be determined at this time',
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_TEXT_UNDERMINTOTAL' => 'UK Guaranteed special delivery by <strong>9am</strong>&reg with <strong>Saturday Guatantee is only available for orders over &pound;',
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_TEXT_OVERMAXTOTAL' => 'UK Guaranteed special delivery by <strong>9am</strong>&reg with <strong>Saturday Guatantee is only available for orders under &pound;',
    'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ICON' => 'shipping_sd9am.gif',
];

return $define;
