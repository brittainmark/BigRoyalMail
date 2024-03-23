#  
# If you are upgrading FROM any 3.2.x release
# Login to your zen cart admin AND use Tools>Install SQL Patches
# Copy the contents of this file AND paste into the text window
# or 
# User the Browse button to load the file into zencart.
# 
#



		
# 
# UPDATE the sort order for all Airmail Modules
#
UPDATE configuration SET configuration_value = '315' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMPARCELRM2NDLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '330' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMPARCELSFRM2NDLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '355' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMTPARCELRM2NDLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '360' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCELRM2NDLETTER_SORT_ORDER' ;
UPDATE configuration SET configuration_value = '370' WHERE configuration_group_id = 6 AND configuration_key = 'MODULE_SHIPPING_RMAMTSPARCELRM2NDLETTER_SORT_ORDER' ;

# 
# Add the attribute match parameter for all existing installed modules
#
##NEXT_X_ROWS_AS_ONE_COMMAND:2
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) 
SELECT 'Attribute Exact Match', CONCAT( LEFT( configuration_key , LOCATE( '_STATUS', configuration_key)), 'ATTRIBUTE_MATCH' ), 'False', 'Used to only display this shipping method if the attribute shipping is and exact match', '6', '0', "zen_cfg_select_option(['True', 'False']), ", now() FROM configuration WHERE configuration_key LIKE 'MODULE_SHIPPING_RM%_STATUS';