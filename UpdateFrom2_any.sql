/* 
 * If you are upgrading FROM any 2.x.x release
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
 * Delete the Expires dates as all modules now use the same one
 */

DELETE FROM configuration WHERE configuration_key = 'MODULE_SHIPPING_RMAM_EXPIRES';
DELETE FROM configuration WHERE configuration_key = 'MODULE_SHIPPING_RMSM_EXPIRES';

/* 
 * Delete the old insured parcel shipping configuration entries
 */
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSTDPARCELS100_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSTDPARCELS250_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSTDPARCELS500_%";
/*
 *add configuration expires date if not exist else update.
 */  
SET @expires = 0;
SELECT (@expires:=configuration_value) FROM configuration WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) 
		VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2013-04-29 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2012-04-02 00:00:01 or 2012-04-02<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())
ON DUPLICATE KEY UPDATE configuration_value =FROM_UNIXTIME(@expires,"%Y-%m-%d %H:%i:%s"), configuration_description = 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2012-04-02 00:00:01 or 2012-04-02<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.' ;


/*
 * Delete the extra costs as single cost for UK postage 
 */

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST3_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST3_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST3_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST3_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST3_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST4_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST5_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST3_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST4_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST3_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST4_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST3_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST4_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COST3_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COST3_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COST1_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COST2_1";
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COST3_1";

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COUNTRIES_EXCLUDE";
DELETE FROM configuration  WHERE configuration_group_id = 6 AND configuration_key = "MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COUNTRIES_EXCLUDE";


/*
 * Rename the keys for consistance now all "MODULE_SHIPPING_RM [delivery][Signfor][Insurance]"
 */
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_HANDLING_1';

UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 Handling Fee' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_HANDLING_2';
UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_2';

UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 Handling Fee' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_HANDLING_2';
UPDATE configuration SET configuration_title = 'Royal Mail defined World Zones 1 Countries', configuration_value = 'BR, CA, HK, MY, US', configuration_description = 'two character ISO country codes for World Zone 1. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COUNTRIES_2';

UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 Handling Fee' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET500_ZONES_HANDLING_2';
UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET500_ZONES_COST0_2';

UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 Handling Fee' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_HANDLING_2';
UPDATE configuration SET configuration_title = 'Royal Mail defined World Zones 1 Countries', configuration_value = 'BR, CA, HK, MY, US', configuration_description = 'two character ISO country codes for World Zone 1. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COUNTRIES_2';


UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST1_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST2_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST3_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST4_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST5_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_2', configuration_title =  '&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST0_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (2)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST1_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (3)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST2_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (4)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST3_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (5)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST4_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (6)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COST5_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_2', configuration_title = '&quot;Rest of World&quot; Zone 1 Handling Fee' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_HANDLING_2';

UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST1_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST2_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST3_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST4_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST5_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_2', configuration_title = '&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST0_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (2)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST1_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (3)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST2_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (4)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST3_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (5)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST4_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_2', configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (6)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COST5_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_2', configuration_title = '&quot;Rest of World&quot; Zone 1 Handling Fee' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_HANDLING_2';

UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST1_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST2_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST3_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST4_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST5_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_2', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST0_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST1_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST2_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST3_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST4_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COST5_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_HANDLING_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_HANDLING_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COUNTRIES_EXCLUDE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF_ZONES_COUNTRIES_EXCLUDE';

UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_HIDE_SHIPPING_ERRORS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_HIDE_SHIPPING_ERRORS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_MAX_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_MAX_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_MIN_ORDERVALUE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_SORT_ORDER' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_SORT_ORDER';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_STATUS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_STATUS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_TAX_CLASS' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_TAX_CLASS';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_1', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST0_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST1_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST2_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST3_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST4_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST5_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COUNTRIES_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COUNTRIES_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_HANDLING_1' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_HANDLING_1';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_2', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST0_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST1_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST2_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST3_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST4_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COST5_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_HANDLING_2' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_HANDLING_2';
UPDATE configuration SET configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COUNTRIES_EXCLUDE' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_ZONES_COUNTRIES_EXCLUDE';

/*
 * Update the remaining descriptions
 */
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STPACKET_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_1';
UPDATE configuration SET configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.', set_function = 'zen_cfg_textarea(' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST0_1';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (2)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (3)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (4)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (5)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (6)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (2)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (3)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (4)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (5)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (6)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (2)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (3)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (4)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (5)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_2';
UPDATE configuration SET configuration_description = '&quot;Rest of World&quot; Zone 1 Rates cont''d (6)' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_2';
UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_2';
UPDATE configuration SET configuration_title = '&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', configuration_description = 'Example: 0.1:1.14 means weights less than or equal to 0.1 Kg would cost &pound;1.14.' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_2';

/*
 * Set minimum order values
 */
UPDATE configuration SET configuration_value = 500.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = 1000.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = 500.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = 1000.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_MIN_ORDERVALUE';


/*
 * Insert the extra zones for airmail
 */
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined World Zones 2 Countries', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COUNTRIES_3', 'AU, NZ, SG', 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined World Zones 2 Countries', configuration_value = 'AU, NZ, SG', configuration_description = 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now(); 
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 Handling Fee', configuration_value =  '0', configuration_description = 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', configuration_group_id = '6', sort_order = '1', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_3', '0.1:8.3, 0.15:8.9, 0.2:9.5', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', configuration_value = '0.1:8.3, 0.15:8.9, 0.2:9.5', configuration_description = 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_3', '0.25:10.1, 0.3:10.7, 0.4:11.98', '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.25:10.1, 0.3:10.7, 0.4:11.98', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_3', '0.5:13.26, 0.6:14.54, 0.7:15.82, 0.8:17.1', '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.5:13.26, 0.6:14.54, 0.7:15.82, 0.8:17.1', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_3', '0.9:18.38, 1:19.66, 1.1:20.94, 1.2:22.22', '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.9:18.38, 1:19.66, 1.1:20.94, 1.2:22.22', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_3', '1.3:23.5, 1.4:24.78, 1.5:26.06, 1.6:27.34', '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.3:23.5, 1.4:24.78, 1.5:26.06, 1.6:27.34', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_3', '1.7:28.62, 1.8:29.9, 1.9:31.18, 2:32.46', '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.7:28.62, 1.8:29.9, 1.9:31.18, 2:32.46', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined World Zones 2 Countries', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COUNTRIES_3', 'AU, NZ, SG', 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined World Zones 2 Countries', configuration_value = 'AU, NZ, SG', configuration_description = 'two character ISO country codes for the Rest of the World. <span style=\"font-style: italic\">(note that Airsure&reg; is only for a limited range of 24 countries, some of which are defined as territories such as Corsica being under France !)</span>', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 Handling Fee', configuration_value = '0', configuration_description = 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', configuration_group_id = '6', sort_order = '2', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_3', '0.1:10.8, 0.15:11.4, 0.2:12', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', configuration_value = '0.1:10.8, 0.15:11.4, 0.2:12', configuration_description = 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_3', '0.25:12.6, 0.3:13.2, 0.4:14.48', '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.25:12.6, 0.3:13.2, 0.4:14.48', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now(); 
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_3', '0.5:15.76, 0.6:17.04, 0.7:18.32, 0.8:19.6', '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.5:15.76, 0.6:17.04, 0.7:18.32, 0.8:19.6', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_3', '0.9:20.88, 1:22.16, 1.1:23.44, 1.2:24.72', '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.9:20.88, 1:22.16, 1.1:23.44, 1.2:24.72', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_3', '1.3:26, 1.4:27.28, 1.5:28.56, 1.6:29.84', '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.3:26, 1.4:27.28, 1.5:28.56, 1.6:29.84', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_3', '1.7:31.12, 1.8:32.4, 1.9:33.68, 2:34.96', '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.7:31.12, 1.8:32.4, 1.9:33.68, 2:34.96', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COUNTRIES_2', 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, US, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', 'two character ISO country codes for Zone 1.', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', configuration_value = 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, US, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', configuration_description = 'two character ISO country codes for Zone 1.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 Handling Fee', configuration_value = '0', configuration_description = 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COUNTRIES_3', 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', 'two character ISO country codes for Zone 2.', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', configuration_value = 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', configuration_description = 'two character ISO country codes for Zone 2.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_3', '0.1:3.3, 0.15:3.9, 0.2:4.5', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', configuration_value = '0.1:3.3, 0.15:3.9, 0.2:4.5', configuration_description = 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_3', '0.25:5.1, 0.3:5.7, 0.4:6.98', '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.25:5.1, 0.3:5.7, 0.4:6.98', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_3', '0.5:8.26, 0.6:9.54, 0.7:10.82, 0.8:12.1', '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.5:8.26, 0.6:9.54, 0.7:10.82, 0.8:12.1', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_3', '0.9:13.38, 1:14.66, 1.1:15.94, 1.2:17.22', '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.9:13.38, 1:14.66, 1.1:15.94, 1.2:17.22', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_3', '1.3:18.5, 1.4:19.78, 1.5:21.06, 1.6:22.34', '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.3:18.5, 1.4:19.78, 1.5:21.06, 1.6:22.34', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_3', '1.7:23.62, 1.8:24.9, 1.9:26.18, 2:27.46', '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.7:23.62, 1.8:24.9, 1.9:26.18, 2:27.46', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COUNTRIES_2', 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, US, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', 'two character ISO country codes for Zone 1.', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', configuration_value = 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, US, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', configuration_description = 'two character ISO country codes for Zone 1.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 Handling Fee', configuration_value = '0', configuration_description = 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COUNTRIES_3', 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', 'two character ISO country codes for Zone 2.', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', configuration_value = 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', configuration_description = 'two character ISO country codes for Zone 2.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_3', '0.1:8.45, 0.15:9.05, 0.2:9.65', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', configuration_value = '0.1:8.45, 0.15:9.05, 0.2:9.65', configuration_description = 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_3', '0.25:10.25, 0.3:10.85, 0.4:12.13', '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.25:10.25, 0.3:10.85, 0.4:12.13', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_3', '0.5:13.41, 0.6:14.69, 0.7:15.97, 0.8:17.25', '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.5:13.41, 0.6:14.69, 0.7:15.97, 0.8:17.25', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_3', '0.9:18.53, 1:19.81, 1.1:21.09, 1.2:22.37', '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.9:18.53, 1:19.81, 1.1:21.09, 1.2:22.37', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_3', '1.3:23.65, 1.4:24.93, 1.5:26.21, 1.6:27.49', '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.3:23.65, 1.4:24.93, 1.5:26.21, 1.6:27.49', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_3', '1.7:28.77, 1.8:30.05, 1.9:31.33, 2:32.61', '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.7:28.77, 1.8:30.05, 1.9:31.33, 2:32.61', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COUNTRIES_2', 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, US, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', 'two character ISO country codes for Zone 1.', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined &quot;Rest of World&quot; Zone 1 Countries', configuration_value = 'AX, AF, DZ, AO, AI, AQ, AG, AR, AW, BS, BH, BD, BB, BZ, BJ, BM, BT, BO, BW, BV, BR, BN, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, CU, DJ, DM, DO, TL, EC, EG, SV, GQ, ER, ET, FK, GF, GA, GM, GH, GD, GP, GU, GT, GN, GW, GY, HT, HM, HN, HK, IN, ID, IR, IQ, IE, IL, JM, JP, JO, KE, KP, KR, KW, LB, LS, LR, LY, MG, MW, MY, MV, ML, MH, MQ, MR, MU, YT, MX, FM, MN, MS, MA, MZ, MM, NA, NP, AN, NI, NE, NG, MP, OM, PK, PA, PY, PE, PH, PR, QA, RE, RW, KN, LC, VC, ST, SA, SN, SC, SL, SO, ZA, GS, LK, SH, PM, SD, SR, SJ, SZ, SY, TW, TZ, TH, TG, TT, TN, TC, UG, AE, US, UM, UY, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW', configuration_description = 'two character ISO country codes for Zone 1.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 Handling Fee', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_3', '0', 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', '6', '2', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 Handling Fee', configuration_value = '0', configuration_description = 'The amount it costs you to package the items for &quot;Rest of World&quot; Air Mail Zone 2 delivery.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COUNTRIES_3', 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', 'two character ISO country codes for Zone 2.', '6', '1', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = 'Royal Mail defined &quot;Rest of World&quot; Zone 2 Countries', configuration_value = 'AU, IO, CX, CC, CK, FJ, PF, TF, KI, MO, NR, NC, NZ, NU, NF, PW, PG, LA, PN, SG, SB, TK, TO, TV, WS, AS', configuration_description = 'two character ISO country codes for Zone 2.', configuration_group_id = '6', sort_order = '1', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_3', '0.1:16.2, 0.15:16.8, 0.2:17.4', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', configuration_value = '0.1:16.2, 0.15:16.8, 0.2:17.4', configuration_description = 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_3', '0.25:18, 0.3:18.6, 0.4:19.88', '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.25:18, 0.3:18.6, 0.4:19.88', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (2):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_3', '0.5:21.16, 0.6:22.44, 0.7:23.72, 0.8:25', '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.5:21.16, 0.6:22.44, 0.7:23.72, 0.8:25', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (3):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_3', '0.9:26.28, 1:27.56, 1.1:28.84, 1.2:30.12', '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '0.9:26.28, 1:27.56, 1.1:28.84, 1.2:30.12', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (4):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_3', '1.3:31.4, 1.4:32.68, 1.5:33.96, 1.6:35.24', '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.3:31.4, 1.4:32.68, 1.5:33.96, 1.6:35.24', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (5):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
	VALUES ('', 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_3', '1.7:36.52, 1.8:37.8, 1.9:39.08, 2:40.36', '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', '6', '2', 'zen_cfg_textarea(', now())
ON DUPLICATE KEY UPDATE configuration_title = '', configuration_value = '1.7:36.52, 1.8:37.8, 1.9:39.08, 2:40.36', configuration_description = '&quot;Rest of World&quot; Zone 2 Rates cont''d (6):', configuration_group_id = '6', sort_order = '2', set_function = 'zen_cfg_textarea(', date_added = now();

		
/*
 * UPDATE the sort order for all modules
 */

UPDATE configuration SET configuration_value = '10' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '20' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '30' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '40' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '50' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '60' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STPACKET_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '70' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '80' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '90' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '100' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '110' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '120' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '130' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '170' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '190' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '200' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '210' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '220' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '230' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '300' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '310' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '320' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '330' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '340' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '350' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '360' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '370' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_SORT_ORDER' ;
