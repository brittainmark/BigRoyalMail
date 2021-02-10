/* 
 * If you are upgrading FROM any 3.0.x release
 * Login to your zen cart admin AND use Tools>Install SQL Patches
 * Copy the contents of this file AND paste into the text window
 * or 
 * User the Browse button to load the file into zencart.
 * 
 * If you do not want to change the the sort order remove the last UPDATE section "UPDATE the sort order for all modules"
 * 
 * 
 * Also the expiry date will become invalid.
 */

/* 
 * Delete the old packet shipping configuration entries
 */
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STPACKET_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STPACKETSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDPACKET_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDPACKETSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSTDPARCELS_%";


		
/*
 * UPDATE the sort order for all modules
 */

UPDATE configuration SET configuration_value = '10' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '20' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '30' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '40' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '50' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '60' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '70' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '80' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '90' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '100' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '110' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '120' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '130' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '140' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '150' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '160' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '170' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '190' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_SORT_ORDER' ;
