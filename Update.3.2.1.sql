/*
 * Clear configuration file of Insured surface mail signe for enries
 * Add in Air mail signed for Euroup EU
 * 
 * to run this script
 * 
 * 1) Login to your zen cart admin
 * 2) Use Tools>Install SQL Patches
 * 3) Copy the contents of Update3.2.1.sql and paste into the text window
 *    or 
 *    User the Browse button to load RemoveSurface.sql into zen cart.
 */

DELETE FROM configuration WHERE configuration_key like "MODULE_SHIPPING_RMSMPARCELSF";

INSERT ignore INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added)
SELECT 'Royal Mail defined European EU Countries', 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COUNTRIES_4', 'AL, AD, AM, AT', 'two character ISO country codes for Europe.', '6', '1', 'zen_cfg_textarea(', now()
FROM configuration WHERE configuration_key  = "MODULE_SHIPPING_RMAMPARCELS_ZONES_COUNTRIES_1";

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
SELECT 'Insurance rates ', 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4', '500:0,1000:1,2500:3', 'example: 200:1.2 means values less than or equal to £200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now()
FROM configuration WHERE configuration_key  = "MODULE_SHIPPING_RMAMPARCELS_ZONES_COUNTRIES_1";
