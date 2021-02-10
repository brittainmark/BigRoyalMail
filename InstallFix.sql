/*
 * Fix to correct missing cost caused by code error
 * Inserts costs for RMAMPARCEL,RMAMPARCELSF,RMAMTEUPARCEL, and RMAMTSPARCEL.
 */  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value,  configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES  ('European rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1', '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.5, 1.25:13.55, 1.5:14.95, 1.75:15.45, 2:16.65', 'Example: 0.1:1.19  means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now());
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2', '0.1:4.2, 0.25:5.1, 0.5:7.8, 0.75:10.4, 1:13.05, 1.25:14.65, 1.5:16.35, 1.75:18.05, 2:19.75', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3', '0.1:4.55, 0.25:5.55, 0.5:8.55, 0.75:11.25, 1:14, 1.25:15.8, 1.5:17.7, 1.75:19.6, 2:21.5', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('European rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1', '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.5, 1.25:13.55, 1.5:14.95, 1.75:15.45, 2:16.65', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2', '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.55, 1.5:20.15, 1.75:21.15, 2:22.75', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3', '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:19.65, 1.5:21.55, 1.75:22.65, 2:24.45', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('European EU rates from gb &amp; northern ireland', 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1', '0.1:9.84, 0.25:10.44, 0.5:12.18, 0.75:13.32, 1:15, 1.25:16.26, 1.5:17.94, 1.75:18.54, 2:19.98', 'Example: 0.1:1.19 means weights less than or equal to 0.1 kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('European rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1', '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.5, 1.25:13.55, 1.5:14.95, 1.75:15.45, 2:16.65', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 1 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2', '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.55, 1.5:20.15, 1.75:21.15, 2:22.75', 'Example: 0.1:1.19 means weights less than or equal to 0.1 Kg would cost &pound;1.19.', '6', '0', 'zen_cfg_textarea(', now());  
INSERT IGNORE INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('&quot;Rest of World&quot; Zone 2 rates from GB &amp; Northern Ireland', 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3', '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:19.65, 1.5:21.55, 1.75:22.65, 2:24.45', 'Example: 0.1:1.58 means weights less than or equal to 0.1 Kg would cost &pound;1.58.', '6', '0', 'zen_cfg_textarea(', now());  