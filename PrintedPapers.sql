# 
# Update for Big royal Mail postage rates valid from 2 April 2024 for latest rates visit  http://www.royalmail.com  
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
UPDATE configuration SET configuration_value = "0.25:8.3,0.5:10.4,0.75:11.7,1:13.05,1.5:14.15,2:15.8,2.25:17.35,2.5:18.9,2.75:20.45,3:22,3.25:23.55,3.5:25.1,3.75:26.65,4:28.2,4.25:29.75,4.5:31.3,4.75:32.85,5:34.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1" ;

#  Airmail Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:8.45,0.5:10.75,0.75:12.1,1:13.35,1.5:14.7,2:16.35,2.25:17.9,2.5:19.45,2.75:21,3:22.55,3.25:24.1,3.5:25.65,3.75:27.2,4:28.75,4.25:30.3,4.5:31.85,4.75:33.4,5:34.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2" ;

#  Airmail Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:9.25,0.5:11.4,0.75:12.95,1:14.45,1.25:15.75,1.5:17,2:18.5,2.25:20.05,2.5:21.6,2.75:23.15,3:24.7,3.25:26.25,3.5:27.8,3.75:29.35,4:30.9,4.25:32.45,4.5:34,4.75:35.55,5:37.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3" ;

# Airmail Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:11,0.25:12.5,0.5:17,0.75:20,1:23.1,1.25:25.75,1.5:28.2,2:29.55,2.25:31.65,2.5:33.75,2.75:35.85,3:37.95,3.25:40.05,3.5:42.15,3.75:44.25,4:46.35,4.25:48.45,4.5:50.55,4.75:52.65,5:54.75" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4" ;

# Airmail Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:12.45,0.25:13.5,0.5:18.7,0.75:22.1,1:25.7,1.25:29,1.5:32.4,2:34.25,2.25:36.85,2.5:39.45,2.75:42.05,3:44.65,3.25:47.25,3.5:49.85,3.75:52.45,4:55.05,4.25:57.65,4.5:60.25,4.75:62.85,5:65.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_5" ;

# Airmail Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:12.5,0.25:14.25,0.5:20.45,0.75:23.5,1:27.5,1.25:31.3,1.5:34.3,2:35.7,2.25:38.55,2.5:41.4,2.75:44.25,3:47.1,3.25:49.95,3.5:52.8,3.75:55.65,4:58.5,4.25:61.35,4.5:64.2,4.75:67.05,5:69.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_6" ;

# Airmail Europe zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:13.75,0.5:15.2,0.75:16.35,1:17.4,1.25:18,1.5:18.1,2:18.25,2.25:19.8,2.5:21.35,2.75:22.9,3:24.45,3.25:26,3.5:27.55,3.75:29.1,4:30.65,4.25:32.2,4.5:33.75,4.75:35.3,5:36.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1" ;

# Airmail Europe zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.6,0.75:16.7,1:17.7,1.25:18.05,1.5:18.3,2:18.8,2.25:20.35,2.5:21.9,2.75:23.45,3:25,3.25:26.55,3.5:28.1,3.75:29.65,4:31.2,4.25:32.75,4.5:34.3,4.75:35.85,5:37.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2" ;

# Airmail Europe zone 3 Signed For 
UPDATE configuration SET configuration_value = "0.25:15.3,0.5:17,0.75:18.25,1:19.55,1.25:20.25,1.5:20.9,2:21.4,2.25:22.95,2.5:24.5,2.75:26.05,3:27.6,3.25:29.15,3.5:30.7,3.75:32.25,4:33.8,4.25:35.35,4.5:36.9,4.75:38.45,5:40" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3" ;

# Airmail Rest of World Zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.1:17.7,0.25:18.1,0.5:22.4,0.75:25,1:27.95,1.25:30.15,1.5:31.7,2:32.2,2.25:34.3,2.5:36.4,2.75:38.5,3:40.6,3.25:42.7,3.5:44.8,3.75:46.9,4:49,4.25:51.1,4.5:53.2,4.75:55.3,5:57.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4" ;

# Airmail Rest of World Zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.1:19,0.25:19.35,0.5:24.3,0.75:27.4,1:30.85,1.25:33.55,1.5:36.3,2:37.45,2.25:40.05,2.5:42.65,2.75:45.25,3:47.85,3.25:50.45,3.5:53.05,3.75:55.65,4:58.25,4.25:60.85,4.5:63.45,4.75:66.05,5:68.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_5" ;

# International Tracked Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:12.05,0.5:13.35,0.75:14.35,1:15,2:15.5,2.25:17.05,2.5:18.6,2.75:20.15,3:21.7,3.25:23.25,3.5:24.8,3.75:26.35,4:27.9,4.25:29.45,4.5:31,4.75:32.55,5:34.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1" ;

# International Tracked Europe zone 2
UPDATE configuration SET configuration_value = "0.25:12.4,0.5:13.7,0.75:14.75,1:15.45,1.5:15.9,2:17.45,2.25:19,2.5:20.55,2.75:22.1,3:23.65,3.25:25.2,3.5:26.75,3.75:28.3,4:29.85,4.25:31.4,4.5:32.95,4.75:34.5,5:36.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2" ;

# International Tracked Europe zone 3
UPDATE configuration SET configuration_value = "0.25:13.25,0.5:15,0.75:15.95,1:16.7,1.25:17.55,1.5:18.45,2:19.2,2.25:20.75,2.5:22.3,2.75:23.85,3:25.4,3.25:26.95,3.5:28.5,3.75:30.05,4:31.6,4.25:33.15,4.5:34.7,4.75:36.25,5:37.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3" ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = "0.25:15.25,0.5:19.7,0.75:22.4,1:25.3,1.25:27.45,1.5:29,2:30.2,2.25:32.3,2.5:34.4,2.75:36.5,3:38.6,3.25:40.7,3.5:42.8,3.75:44.9,4:47,4.25:49.1,4.5:51.2,4.75:53.3,5:55.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4" ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = "0.25:16.7,0.5:21.8,0.75:24.85,1:28.1,1.25:31.2,1.5:33.95,2:35.8,2.25:38.4,2.5:41,2.75:43.6,3:46.2,3.25:48.8,3.5:51.4,3.75:54,4:56.6,4.25:59.2,4.5:61.8,4.75:64.4,5:67" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_5" ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = "0.25:17.2,0.5:21.85,0.75:24.7,1:27.65,2:31.85,2.25:34.7,2.5:37.55,2.75:40.4,3:43.25,3.25:46.1,3.5:48.95,3.75:51.8,4:54.65,4.25:57.5,4.5:60.35,4.75:63.2,5:66.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_6" ;

# Postage Rates 
#  International Tracked and Signed Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:13.75,0.5:15.2,0.75:16.35,1:17.4,1.25:18,1.5:18.1,2:18.25,2.25:19.8,2.5:21.35,2.75:22.9,3:24.45,3.25:26,3.5:27.55,3.75:29.1,4:30.65,4.25:32.2,4.5:33.75,4.75:35.3,5:36.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1" ;

#  International Tracked and Signed Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.6,0.75:16.7,1:17.7,1.25:18.05,1.5:18.3,2:18.8,2.25:20.35,2.5:21.9,2.75:23.45,3:25,3.25:26.55,3.5:28.1,3.75:29.65,4:31.2,4.25:32.75,4.5:34.3,4.75:35.85,5:37.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2" ;

#  International Tracked and Signed Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:15.3,0.5:17,0.75:18.25,1:19.55,1.25:20.25,1.5:20.9,2:21.4,2.25:22.95,2.5:24.5,2.75:26.05,3:27.6,3.25:29.15,3.5:30.7,3.75:32.25,4:33.8,4.25:35.35,4.5:36.9,4.75:38.45,5:40" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3" ;

# International Tracked and Signed Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:17.7,0.25:18.1,0.5:22.4,0.75:25,1:27.95,1.25:30.15,1.5:31.7,2:32.2,2.25:34.3,2.5:36.4,2.75:38.5,3:40.6,3.25:42.7,3.5:44.8,3.75:46.9,4:49,4.25:51.1,4.5:53.2,4.75:55.3,5:57.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4" ;

# International Tracked and Signed Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:19,0.25:19.35,0.5:24.3,0.75:27.4,1:30.85,1.25:33.55,1.5:36.3,2:37.45,2.25:40.05,2.5:42.65,2.75:45.25,3:47.85,3.25:50.45,3.5:53.05,3.75:55.65,4:58.25,4.25:60.85,4.5:63.45,4.75:66.05,5:68.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_5" ;

# International Tracked and Signed Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:18.45,0.25:20.2,0.5:26.15,0.75:28.35,1:32.35,1.25:36.15,1.5:39.15,2:39.7,2.25:42.38,2.5:45.06,2.75:47.74,3:50.42,3.25:53.1,3.5:55.78,3.75:58.46,4:61.14,4.25:63.82,4.5:66.5,4.75:69.18,5:71.86" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_6" ;

# Surface mail Europe 
UPDATE configuration SET configuration_value = "0.1:7.45, 0.25:7.45, 0.5:10.35, 0.75:11.65, 1:13, 1.25:14.3, 1.5:14.3, 1.75:16.2, 2:16.2, 2.25:18, 2.5:19.8, 2.75:21.6, 3:23.4, 3.25:25.2, 3.5:27, 3.75:28.8, 4:30.6, 4.25:32.4, 4.5:34.2, 4.75:36, 5:37.8" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1" ;

# Surface World Zones 1/2/3 
UPDATE configuration SET configuration_value = "0.1:7.45, 0.25:7.45, 0.5:10.35, 0.75:11.65, 1:13, 1.25:14.3, 1.5:14.3, 1.75:16.2, 2:16.2, 2.25:18, 2.5:19.8, 2.75:21.6, 3:23.4, 3.25:25.2, 3.5:27, 3.75:28.8, 4:30.6, 4.25:32.4, 4.5:34.2, 4.75:36, 5:37.8" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2" ;
