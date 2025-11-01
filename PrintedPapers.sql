# 
# Update for Big royal Mail postage rates valid from 7 April 2025 for latest rates visit  http://www.royalmail.com  
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
#  Airmail Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:8.95,0.5:11.25,0.75:12.4,1:13.55,1.5:14.25,2:16.25,2.25:17.9,2.5:19.55,2.75:21.2,3:22.85,3.25:24.5,3.5:26.15,3.75:27.8,4:29.45,4.25:31.1,4.5:32.75,4.75:34.4,5:36.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1" ;

#  Airmail Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:9.7,0.5:12.35,0.75:13.9,1:15.35,1.5:16.9,2:18.8,2.25:20.45,2.5:22.1,2.75:23.75,3:25.4,3.25:27.05,3.5:28.7,3.75:30.35,4:32,4.25:33.65,4.5:35.3,4.75:36.95,5:38.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2" ;

#  Airmail Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:10.65,0.5:13.1,0.75:14.9,1:16.6,1.25:18.1,1.5:19.55,2:21.25,2.25:22.9,2.5:24.55,2.75:26.2,3:27.85,3.25:29.5,3.5:31.15,3.75:32.8,4:34.45,4.25:36.1,4.5:37.75,4.75:39.4,5:41.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3" ;

# Airmail Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:13.05,0.25:14.05,0.5:19.3,0.75:22.7,1:26.2,1.25:29.25,1.5:32,2:33.55,2.25:35.8,2.5:38.05,2.75:40.3,3:42.55,3.25:44.8,3.5:47.05,3.75:49.3,4:51.55,4.25:53.8,4.5:56.05,4.75:58.3,5:60.55" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4" ;

# Airmail Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:14.55,0.25:15.2,0.5:21.2,0.75:25.1,1:29.15,1.25:32.9,1.5:36.75,2:38.85,2.25:41.6,2.5:44.35,2.75:47.1,3:49.85,3.25:52.6,3.5:55.35,3.75:58.1,4:60.85,4.25:63.6,4.5:66.35,4.75:69.1,5:71.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_5" ;

# Airmail Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.25:16.95,0.5:23.85,0.75:26.95,1:30.05,1.5:34.15,2:35.7,2.25:38.7,2.5:41.7,2.75:44.7,3:47.7,3.25:50.7,3.5:53.7,3.75:56.7,4:59.7,4.25:62.7,4.5:65.7,4.75:68.7,5:71.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_6" ;

# Airmail Europe zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:14.25,0.5:15.8,0.75:17,1:18.1,1.25:18.7,1.5:18.8,2:19,2.25:20.65,2.5:22.3,2.75:23.95,3:25.6,3.25:27.25,3.5:28.9,3.75:30.55,4:32.2,4.25:33.85,4.5:35.5,4.75:37.15,5:38.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1" ;

# Airmail Europe zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:14.6,0.5:16.4,0.75:17.55,1:18.6,1.25:18.95,1.5:19.2,2:19.75,2.25:21.4,2.5:23.05,2.75:24.7,3:26.35,3.25:28,3.5:29.65,3.75:31.3,4:32.95,4.25:34.6,4.5:36.25,4.75:37.9,5:39.55" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2" ;

# Airmail Europe zone 3 Signed For 
UPDATE configuration SET configuration_value = "0.25:16.35,0.5:18.2,0.75:19.55,1:20.9,1.25:21.65,1.5:22.35,2:22.9,2.25:24.55,2.5:26.2,2.75:27.85,3:29.5,3.25:31.15,3.5:32.8,3.75:34.45,4:36.1,4.25:37.75,4.5:39.4,4.75:41.05,5:42.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3" ;

# Airmail Rest of World Zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:18.95,0.5:23.5,0.75:26.25,1:29.35,1.25:31.65,1.5:33.3,2:33.8,2.25:36.05,2.5:38.3,2.75:40.55,3:42.8,3.25:45.05,3.5:47.3,3.75:49.55,4:51.8,4.25:54.05,4.5:56.3,4.75:58.55,5:60.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4" ;

# Airmail Rest of World Zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:19.95,0.5:25.5,0.75:28.75,1:32.4,1.25:35.25,1.5:38.1,2:39.3,2.25:42.05,2.5:44.8,2.75:47.55,3:50.3,3.25:53.05,3.5:55.8,3.75:58.55,4:61.3,4.25:64.05,4.5:66.8,4.75:69.55,5:72.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_5" ;

# International Tracked Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:12.4,0.5:13.7,0.75:14.25,1:15,2:15.5,2.25:17.15,2.5:18.8,2.75:20.45,3:22.1,3.25:23.75,3.5:25.4,3.75:27.05,4:28.7,4.25:30.35,4.5:32,4.75:33.65,5:35.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1" ;

# International Tracked Europe zone 2
UPDATE configuration SET configuration_value = "0.25:12.7,0.5:14.05,0.75:15.1,1:15.85,1.5:16.3,2:17.9,2.25:19.55,2.5:21.2,2.75:22.85,3:24.5,3.25:26.15,3.5:27.8,3.75:29.45,4:31.1,4.25:32.75,4.5:34.4,4.75:36.05,5:37.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2" ;

# International Tracked Europe zone 3
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.75,0.75:16.75,1:17.55,1.25:18.45,1.5:19.35,2:20.15,2.25:21.8,2.5:23.45,2.75:25.1,3:26.75,3.25:28.4,3.5:30.05,3.75:31.7,4:33.35,4.25:35,4.5:36.65,4.75:38.3,5:39.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3" ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = "0.25:16,0.5:20.7,0.75:23.5,1:26.55,1.25:28.8,1.5:30.45,2:31.7,2.25:33.95,2.5:36.2,2.75:38.45,3:40.7,3.25:42.95,3.5:45.2,3.75:47.45,4:49.7,4.25:51.95,4.5:54.2,4.75:56.45,5:58.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4" ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = "0.25:17.55,0.5:22.9,0.75:26.1,1:29.5,1.25:32.75,1.5:35.65,2:37.6,2.25:40.35,2.5:43.1,2.75:45.85,3:48.6,3.25:51.35,3.5:54.1,3.75:56.85,4:59.6,4.25:62.35,4.5:65.1,4.75:67.85,5:70.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_5" ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = "0.25:16.85,0.5:21.85,0.75:24.95,1:28.05,2:32.35,2.25:35.35,2.5:38.35,2.75:41.35,3:44.35,3.25:47.35,3.5:50.35,3.75:53.35,4:56.35,4.25:59.35,4.5:62.35,4.75:65.35,5:68.35" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_6" ;

# Postage Rates 
#  International Tracked and Signed Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:14.25,0.5:15.8,0.75:17,1:18.1,1.25:18.7,1.5:18.8,2:19,2.25:20.65,2.5:22.3,2.75:23.95,3:25.6,3.25:27.25,3.5:28.9,3.75:30.55,4:32.2,4.25:33.85,4.5:35.5,4.75:37.15,5:38.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1" ;

#  International Tracked and Signed Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:14.6,0.5:16.4,0.75:17.55,1:18.6,1.25:18.95,1.5:19.2,2:19.75,2.25:21.4,2.5:23.05,2.75:24.7,3:26.35,3.25:28,3.5:29.65,3.75:31.3,4:32.95,4.25:34.6,4.5:36.25,4.75:37.9,5:39.55" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2" ;

#  International Tracked and Signed Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:16.35,0.5:18.2,0.75:19.55,1:20.9,1.25:21.65,1.5:22.35,2:22.9,2.25:24.55,2.5:26.2,2.75:27.85,3:29.5,3.25:31.15,3.5:32.8,3.75:34.45,4:36.1,4.25:37.75,4.5:39.4,4.75:41.05,5:42.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3" ;

# International Tracked and Signed Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.25:18.95,0.5:23.5,0.75:26.25,1:29.35,1.25:31.65,1.5:33.3,2:33.8,2.25:36.05,2.5:38.3,2.75:40.55,3:42.8,3.25:45.05,3.5:47.3,3.75:49.55,4:51.8,4.25:54.05,4.5:56.3,4.75:58.55,5:60.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4" ;

# International Tracked and Signed Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.25:19.95,0.5:25.5,0.75:28.75,1:32.4,1.25:35.25,1.5:38.1,2:39.3,2.25:42.05,2.5:44.8,2.75:47.55,3:50.3,3.25:53.05,3.5:55.8,3.75:58.55,4:61.3,4.25:64.05,4.5:66.8,4.75:69.55,5:72.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_5" ;

# International Tracked and Signed Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:19.5,0.25:20.8,0.5:27.2,0.75:29.5,1:33.2,1.25:38.3,1.5:39.95,2:40.9,2.25:43.9,2.5:46.9,2.75:49.9,3:52.9,3.25:55.9,3.5:58.9,3.75:61.9,4:64.9,4.25:67.9,4.5:70.9,4.75:73.9,5:76.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_6" ;

# Surface mail Europe 
UPDATE configuration SET configuration_value = "0.1:11.45, 0.25:11.45, 0.5:16.4, 0.75:18.35, 1:20.65, 1.25:24.35, 1.5:24.35, 1.75:26.26, 2:26.65, 2.25:28.55, 2.5:30.45, 2.75:32.35, 3:34.25, 3.25:36.15, 3.5:38.05, 3.75:39.95, 4:41.85, 4.25:43.75, 4.5:45.65, 4.75:47.55, 5:49.45" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1" ;

# Surface World Zones 1/2/3 
UPDATE configuration SET configuration_value = "0.1:11.45, 0.25:11.45, 0.5:16.4, 0.75:18.35, 1:20.65, 1.25:24.35, 1.5:24.35, 1.75:26.26, 2:26.65, 2.25:28.55, 2.5:30.45, 2.75:32.35, 3:34.25, 3.25:36.15, 3.5:38.05, 3.75:39.95, 4:41.85, 4.25:43.75, 4.5:45.65, 4.75:47.55, 5:49.45" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2" ;
