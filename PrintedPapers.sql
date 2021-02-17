# 
# Update for Big royal Mail postage rates valid from 1 January 2021 for latest rates visit http://www.royalmail.com 
# 
# This update puts in the rates for printed papers 5 kg. Again it will not differentiate between printed papers
# and other types of post so do not use this unless you know you are shipping printed papers.
# Additionally you must have installed the full package before applying this update as it only changes the rates.
# 
# Assumes weights in Kg costs in GBP.
# 
# created by Mark Brittain. 
# 
# Donations via paypal to info@inner-light.co.uk
# 
# N.B. I do not guarantee to update this every year please check the rates with royal mail.
 

# Postage Rates 
#  Airmail Europe 
UPDATE configuration SET configuration_value = '0.1:5.8, 0.25:5.95, 0.5:7.8, 0.75:9.05, 1:10.2, 1.25:11.05, 1.5:12.1, 1.75:13, 2:0, 2.25:1.4, 2.5:2.8, 2.75:4.2, 3:5.6, 3.25:7, 3.5:8.4, 3.75:9.8, 4:11.2, 4.25:12.6, 4.5:14, 4.75:15.4, 5:16.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

# Airmail Rest of World  Zone 1
UPDATE configuration SET configuration_value = '0.1:7.15, 0.25:8.3, 0.5:12.1, 0.75:14.85, 1:17.65, 1.25:19.85, 1.5:22.1, 1.75:23.3, 2:0, 2.25:1.9, 2.5:3.8, 2.75:5.7, 3:7.6, 3.25:9.5, 3.5:11.4, 3.75:13.3, 4:15.2, 4.25:17.1, 4.5:19, 4.75:20.9, 5:22.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

# Airmail Rest of World  Zone 2
UPDATE configuration SET configuration_value = '0.1:8.35, 0.25:9.9, 0.5:14.5, 0.75:17.6, 1:20.85, 1.25:23.75, 1.5:26.85, 1.75:28.55, 2:0, 2.25:2.35, 2.5:4.7, 2.75:7.05, 3:9.4, 3.25:11.75, 3.5:14.1, 3.75:16.45, 4:18.8, 4.25:21.15, 4.5:23.5, 4.75:25.85, 5:28.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

# Airmail Rest of World  Zone 3
UPDATE configuration SET configuration_value = '0.1:9.35, 0.25:10.95, 0.5:16.6, 0.75:19.35, 1:23, 1.25:26.45, 1.5:29.2, 1.75:30.45, 2:0, 2.25:2.6, 2.5:5.2, 2.75:7.8, 3:10.4, 3.25:13, 3.5:15.6, 3.75:18.2, 4:20.8, 4.25:23.4, 4.5:26, 4.75:28.6, 5:31.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4' ;

# Airmail Europe Signed For 
UPDATE configuration SET configuration_value = '0.1:10.5, 0.25:10.65, 0.5:12.1, 0.75:13.15, 1:14.4, 1.25:14.5, 1.5:12.05, 1.75:15.25, 2:0, 2.25:1.4, 2.5:2.8, 2.75:4.2, 3:5.6, 3.25:7, 3.5:8.4, 3.75:9.8, 4:11.2, 4.25:12.6, 4.5:14, 4.75:15.4, 5:16.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

# Airmail Rest of World Zone 1 Signed For 
UPDATE configuration SET configuration_value = '0.1:12, 0.25:12.95, 0.5:16.6, 0.75:19, 1:21.65, 1.25:23.5, 1.5:24.9, 1.75:25.35, 2:0, 2.25:1.9, 2.5:3.8, 2.75:5.7, 3:7.6, 3.25:9.5, 3.5:11.4, 3.75:13.3, 4:15.2, 4.25:17.1, 4.5:19, 4.75:20.9, 5:22.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

# Airmail Rest of World Zone 2 Signed For 
UPDATE configuration SET configuration_value = '0.1:13.05, 0.25:14.4, 0.5:18.8, 0.75:21.6, 1:24.75, 1.25:27.15, 1.5:29.65, 1.75:30.7, 2:0, 2.25:2.35, 2.5:4.7, 2.75:7.05, 3:9.4, 3.25:11.75, 3.5:14.1, 3.75:16.45, 4:18.8, 4.25:21.15, 4.5:23.5, 4.75:25.85, 5:28.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

# International Tracked Europe 
UPDATE configuration SET configuration_value = '0.1:10.1, 0.25:10.25, 0.5:11.7, 0.75:12.75, 1:13.7, 1.25:14.1, 1.5:14.85, 1.75:15.25, 2:0, 2.25:1.4, 2.5:2.8, 2.75:4.2, 3:5.6, 3.25:7, 3.5:8.4, 3.75:9.8, 4:11.2, 4.25:12.6, 4.5:14, 4.75:15.4, 5:16.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = '0.1:11.75, 0.25:12.7, 0.5:16.35, 0.75:18.75, 1:21.4, 1.25:23.25, 1.5:24.65, 1.75:25.65, 2:0, 2.25:1.9, 2.5:3.8, 2.75:5.7, 3:7.6, 3.25:9.5, 3.5:11.4, 3.75:13.3, 4:15.2, 4.25:17.1, 4.5:19, 4.75:20.9, 5:22.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = '0.1:12.8, 0.25:14.15, 0.5:18.55, 0.75:21.35, 1:24.5, 1.25:26.9, 1.5:29.4, 1.75:31, 2:0, 2.25:2.35, 2.5:4.7, 2.75:7.05, 3:9.4, 3.25:11.75, 3.5:14.1, 3.75:16.45, 4:18.8, 4.25:21.15, 4.5:23.5, 4.75:25.85, 5:28.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = '0.1:11.85, 0.25:13.45, 0.5:18.1, 0.75:20.85, 1:24.5, 1.25:27.95, 1.5:30.7, 1.75:31.95, 2:0, 2.25:2.6, 2.5:5.2, 2.75:7.8, 3:10.4, 3.25:13, 3.5:15.6, 3.75:18.2, 4:20.8, 4.25:23.4, 4.5:26, 4.75:28.6, 5:31.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4' ;

# International Tracked and Signed Europe
UPDATE configuration SET configuration_value = '0.1:10.5, 0.25:10.65, 0.5:12.1, 0.75:13.15, 1:14.1, 1.25:14.5, 1.5:15.05, 1.75:15.25, 2:0, 2.25:1.4, 2.5:2.8, 2.75:4.2, 3:5.6, 3.25:7, 3.5:8.4, 3.75:9.8, 4:11.2, 4.25:12.6, 4.5:14, 4.75:15.4, 5:16.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = '0.1:12, 0.25:12.95, 0.5:16.6, 0.75:19, 1:21.65, 1.25:23.5, 1.5:24.9, 1.75:25.35, 2:0, 2.25:1.9, 2.5:3.8, 2.75:5.7, 3:7.6, 3.25:9.5, 3.5:11.4, 3.75:13.3, 4:15.2, 4.25:17.1, 4.5:19, 4.75:20.9, 5:22.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = '0.1:13.05, 0.25:14.4, 0.5:18.8, 0.75:21.6, 1:24.75, 1.25:27.15, 1.5:29.65, 1.75:30.7, 2:0, 2.25:2.35, 2.5:4.7, 2.75:7.05, 3:9.4, 3.25:11.75, 3.5:14.1, 3.75:16.45, 4:18.8, 4.25:21.15, 4.5:23.5, 4.75:25.85, 5:28.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = '0.1:13.85, 0.25:15.45, 0.5:20.85, 0.75:22.85, 1:26.5, 1.25:29.95, 1.5:32.7, 1.75:33.2, 2:0, 2.25:2.6, 2.5:5.2, 2.75:7.8, 3:10.4, 3.25:13, 3.5:15.6, 3.75:18.2, 4:20.8, 4.25:23.4, 4.5:26, 4.75:28.6, 5:31.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4' ;

# Surface mail Europe 
UPDATE configuration SET configuration_value = '0.1:4.85, 0.25:5.2, 0.5:7.45, 0.75:8.7, 1:9.5, 1.25:10.55, 1.5:11.65, 1.75:12.8, 2:12.95, 2.25:14.3, 2.5:15.65, 2.75:17, 3:18.35, 3.25:19.7, 3.5:21.05, 3.75:22.4, 4:23.75, 4.25:25.1, 4.5:26.45, 4.75:27.8, 5:29.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

# Surface mail Rest of World 
UPDATE configuration SET configuration_value = '0.1:4.85, 0.25:5.2, 0.5:7.45, 0.75:8.7, 1:9.5, 1.25:10.55, 1.5:11.65, 1.75:12.8, 2:12.95, 2.25:14.3, 2.5:15.65, 2.75:17, 3:18.35, 3.25:19.7, 3.5:21.05, 3.75:22.4, 4:23.75, 4.25:25.1, 4.5:26.45, 4.75:27.8, 5:29.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;
