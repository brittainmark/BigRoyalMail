<?php
/*

GPL released as part of the big_royalmail_v3.3 package

see CREDITS.txt for the contributors and support forum.

*/

$define = [
    'MODULE_SHIPPING_RMSMPARCEL_TEXT_TITLE' => 'Royal Mail International Economy <span style="font-weight: normal; font-style: italic">&quot;Small Parcel&quot;</span>',
    'MODULE_SHIPPING_RMSMPARCEL_TEXT_DESCRIPTION' => 'Royal Mail International Economy <span style="font-weight: normal; font-style: italic">&quot;Small Parcel&quot;</span> Rates.  Weights in ' . TEXT_PRODUCT_WEIGHT_UNIT . '. <span style="font-style: italic">Rates valid until ' . (defined('MODULE_SHIPPING_RM_EXPIRES')?MODULE_SHIPPING_RM_EXPIRES:'Unset') . '</span>',
    'MODULE_SHIPPING_RMSMPARCEL_TEXT_WAY' => 'Surface Mail to %1$s : %2$s.<br /> Western Europe: up to 2 weeks from date of posting<br /> North America: up to 6 weeks from date of posting<br /> Australasia: up to 12 weeks from date of posting.',
    'MODULE_SHIPPING_RMSMPARCEL_INVALID_ZONE' => 'Overseas Only',
    'MODULE_SHIPPING_RMSMPARCEL_UNDEFINED_RATE' => 'The shipping rate cannot be determined at this time',
    'MODULE_SHIPPING_RMSMPARCEL_TEXT_EXCLUDED' => 'International Economy shipping is not currently available to ',
    'MODULE_SHIPPING_RMSMPARCEL_TEXT_UNDERMINTOTAL' => 'International Economy <span style="font-weight: normal; font-style: italic">&quot;Small Parcel&quot;</span> delivery is only available for orders over &pound;',
    'MODULE_SHIPPING_RMSMPARCEL_TEXT_OVERMAXTOTAL' => 'International Economy <span style="font-weight: normal; font-style: italic">&quot;Small Parcel&quot;</span> delivery is only available for orders under &pound;',
    'MODULE_SHIPPING_RMSMPARCEL_ICON' => 'shipping_ukrm.jpg',
];

return $define;
