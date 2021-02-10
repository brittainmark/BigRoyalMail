#  
# If you are upgrading FROM any 2.x.x release
# Login to your zen cart admin AND use Tools>Install SQL Patches
# Copy the contents of this file AND paste into the text window
# or 
# User the Browse button to load the file into zencart.
# 
# If you do not want to change the the sort order remove the last UPDATE section "UPDATE the sort order for all modules"
# 
# 
# Also the expiry date will become invalid.
#

# 
# Delete the Expires dates as all modules now use the same one
#

DELETE FROM configuration WHERE configuration_key = 'MODULE_SHIPPING_RMAM_EXPIRES';
DELETE FROM configuration WHERE configuration_key = 'MODULE_SHIPPING_RMSM_EXPIRES';

#  
# Delete the old insured parcel shipping configuration entries
#
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSTDPARCELS100_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSTDPARCELS250_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSTDPARCELS500_%';
# 
# Delete the surface mail signed for
#
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSMSMALLPACKETISF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSMSMALLPACKETISF500_';
# 
#add configuration expires date if not exist else update.
#  
SET @expires = 0;
SELECT (@expires:=configuration_value) FROM configuration WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) 
		VALUES ('Royal Mail Rates Expiry Date', 'MODULE_SHIPPING_RM_EXPIRES', '2013-04-29 00:00:01', 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2012-04-02 00:00:01 or 2012-04-02<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.', '6', '0', now())
ON DUPLICATE KEY UPDATE configuration_value = FROM_UNIXTIME(@expires,'%Y-%m-%d %H:%i:%s'), configuration_description = 'The Date the current Royal Mail postage rates expire.<br />Format YYYY-MM-DD HH:MM:SS<br />e.g. 2012-04-02 00:00:01 or 2012-04-02<br />It is not necessary to put in the time.<br /> Set this to remind you to update the shipping costs.' ;


# 
# Delete the extra costs as single cost for UK postage 
#

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST3_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST3_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST3_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST3_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST3_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST4_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST5_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST3_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY_ZONES_COST4_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST3_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY1000_ZONES_COST4_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST3_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY2500_ZONES_COST4_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM_ZONES_COST3_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM1000_ZONES_COST3_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COST1_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COST2_1';
DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_SPECIALDELIVERY9AM2500_ZONES_COST3_1';

DELETE FROM configuration WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET_ZONES_COUNTRIES_EXCLUDE';
DELETE FROM configuration  WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMISFSMALLPACKET500_ZONES_COUNTRIES_EXCLUDE';


# 
# Rename the keys for consistance now all "MODULE_SHIPPING_RM [delivery][Signfor][Insurance]"
#
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

# 
# Update the remaining descriptions
#
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

# 
# Set minimum order values
#
UPDATE configuration SET configuration_value = 500.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = 1000.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = 500.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = 1000.01 WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_MIN_ORDERVALUE';


# 
# UPDATE the sort order for all modules
#

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