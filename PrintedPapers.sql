# 
# Update for Big royal Mail postage rates valid from 2 October for latest rates visit  http://www.royalmail.com  
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
UPDATE configuration SET configuration_value = "0.25:7.55,0.5:9.45,0.75:10.65,1:11.85,1.5:12.85,2:14.35,2.25:15.75,2.5:17.15,2.75:18.55,3:19.95,3.25:21.35,3.5:22.75,3.75:24.15,4:25.55,4.25:26.95,4.5:28.35,4.75:29.75,5:31.15" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1" ;

#  Airmail Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:7.7,0.5:9.75,0.75:11,1:12.15,1.5:13.35,2:14.85,2.25:16.25,2.5:17.65,2.75:19.05,3:20.45,3.25:21.85,3.5:23.25,3.75:24.65,4:26.05,4.25:27.45,4.5:28.85,4.75:30.25,5:31.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2" ;

#  Airmail Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:8.4,0.5:10.35,0.75:11.75,1:13.15,1.25:14.3,1.5:15.45,2:16.45,2.25:17.85,2.5:19.25,2.75:20.65,3:22.05,3.25:23.45,3.5:24.85,3.75:26.25,4:27.65,4.25:29.05,4.5:30.45,4.75:31.85,5:33.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3" ;

# Airmail Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:10,0.25:11.35,0.5:15.45,0.75:18.2,1:21,1.25:23.4,1.5:25.65,2:26.85,2.25:28.75,2.5:30.65,2.75:32.55,3:34.45,3.25:36.35,3.5:38.25,3.75:40.15,4:42.05,4.25:43.95,4.5:45.85,4.75:47.75,5:49.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4" ;

# Airmail Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:11.3,0.25:12.25,0.5:17,0.75:20.1,1:23.35,1.25:26.35,1.5:29.45,2:31.15,2.25:33.5,2.5:35.85,2.75:38.2,3:40.55,3.25:42.9,3.5:45.25,3.75:47.6,4:49.95,4.25:52.3,4.5:54.65,4.75:57,5:59.35" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_5" ;

# Airmail Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:11.35,0.25:12.95,0.5:18.6,0.75:21.35,1:25,1.25:28.45,1.5:31.2,2:32.45,2.25:35.05,2.5:37.65,2.75:40.25,3:42.85,3.25:45.45,3.5:48.05,3.75:50.65,4:53.25,4.25:55.85,4.5:58.45,4.75:61.05,5:63.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_6" ;

# Airmail Europe zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:12.5,0.5:13.8,0.75:14.85,1:15.8,1.25:16.35,1.5:16.45,2:16.6,2.25:18,2.5:19.4,2.75:20.8,3:22.2,3.25:23.6,3.5:25,3.75:26.4,4:27.8,4.25:29.2,4.5:30.6,4.75:32,5:33.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1" ;

# Airmail Europe zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:12.65,0.5:14.2,0.75:15.2,1:16.1,1.25:16.4,1.5:16.65,2:17.1,2.25:18.5,2.5:19.9,2.75:21.3,3:22.7,3.25:24.1,3.5:25.5,3.75:26.9,4:28.3,4.25:29.7,4.5:31.1,4.75:32.5,5:33.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2" ;

# Airmail Europe zone 3 Signed For 
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.45,0.75:16.6,1:17.75,1.25:18.4,1.5:19,2:19.3,2.25:20.7,2.5:22.1,2.75:23.5,3:24.9,3.25:26.3,3.5:27.7,3.75:29.1,4:30.5,4.25:31.9,4.5:33.3,4.75:34.7,5:36.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3" ;

# Airmail Rest of World Zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.1:16.1,0.25:16.45,0.5:20.35,0.75:22.75,1:25.4,1.25:27.4,1.5:28.8,2:29.25,2.25:31.15,2.5:33.05,2.75:34.95,3:36.85,3.25:38.75,3.5:40.65,3.75:42.55,4:44.45,4.25:46.35,4.5:48.25,4.75:50.15,5:52.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4" ;

# Airmail Rest of World Zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.1:17.25,0.25:17.6,0.5:22.1,0.75:24.9,1:28.05,1.25:30.5,1.5:33,2:34.05,2.25:36.4,2.5:38.75,2.75:41.1,3:43.45,3.25:45.8,3.5:48.15,3.75:50.5,4:52.85,4.25:55.2,4.5:57.55,4.75:59.9,5:62.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_5" ;

# International Tracked Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:10.95,0.5:12.15,0.75:13.05,1:13.65,2:13.9,2.25:15.3,2.5:16.7,2.75:18.1,3:19.5,3.25:20.9,3.5:22.3,3.75:23.7,4:25.1,4.25:26.5,4.5:27.9,4.75:29.3,5:30.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1" ;

# International Tracked Europe zone 2
UPDATE configuration SET configuration_value = "0.25:11.25,0.5:12.45,0.75:13.4,1:14.05,1.5:14.45,2:15.85,2.25:17.25,2.5:18.65,2.75:20.05,3:21.45,3.25:22.85,3.5:24.25,3.75:25.65,4:27.05,4.25:28.45,4.5:29.85,4.75:31.25,5:32.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2" ;

# International Tracked Europe zone 3
UPDATE configuration SET configuration_value = "0.25:12.05,0.5:13.65,0.75:14.5,1:15.2,1.25:15.95,1.5:16.75,2:17.45,2.25:18.85,2.5:20.25,2.75:21.65,3:23.05,3.25:24.45,3.5:25.85,3.75:27.25,4:28.65,4.25:30.05,4.5:31.45,4.75:32.85,5:34.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3" ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = "0.25:13.85,0.5:17.9,0.75:20.35,1:23,1.25:24.95,1.5:26.35,2:27.45,2.25:29.35,2.5:31.25,2.75:33.15,3:35.05,3.25:36.95,3.5:38.85,3.75:40.75,4:42.65,4.25:44.55,4.5:46.45,4.75:48.35,5:50.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4" ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = "0.25:15.2,0.5:19.8,0.75:22.6,1:25.55,1.25:28.35,1.5:30.85,2:32.55,2.25:34.9,2.5:37.25,2.75:39.6,3:41.95,3.25:44.3,3.5:46.65,3.75:49,4:51.35,4.25:53.7,4.5:56.05,4.75:58.4,5:60.75" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_5" ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = "0.25:15.65,0.5:19.85,0.75:22.45,1:25.15,2:28.95,2.25:31.55,2.5:34.15,2.75:36.75,3:39.35,3.25:41.95,3.5:44.55,3.75:47.15,4:49.75,4.25:52.35,4.5:54.95,4.75:57.55,5:60.15" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_6" ;

# Postage Rates 
#  International Tracked and Signed Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:12.5,0.5:13.8,0.75:14.85,1:15.8,1.25:16.35,1.5:16.45,2:16.6,2.25:18,2.5:19.4,2.75:20.8,3:22.2,3.25:23.6,3.5:25,3.75:26.4,4:27.8,4.25:29.2,4.5:30.6,4.75:32,5:33.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1" ;

#  International Tracked and Signed Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:12.65,0.5:14.2,0.75:15.2,1:16.1,1.25:16.4,1.5:16.65,2:17.1,2.25:18.5,2.5:19.9,2.75:21.3,3:22.7,3.25:24.1,3.5:25.5,3.75:26.9,4:28.3,4.25:29.7,4.5:31.1,4.75:32.5,5:33.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2" ;

#  International Tracked and Signed Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.45,0.75:16.6,1:17.75,1.25:18.4,1.5:19,2:19.3,2.25:20.7,2.5:22.1,2.75:23.5,3:24.9,3.25:26.3,3.5:27.7,3.75:29.1,4:30.5,4.25:31.9,4.5:33.3,4.75:34.7,5:36.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3" ;

# International Tracked and Signed Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:16.1,0.25:16.45,0.5:20.35,0.75:22.75,1:25.4,1.25:27.4,1.5:28.8,2:29.25,2.25:31.15,2.5:33.05,2.75:34.95,3:36.85,3.25:38.75,3.5:40.65,3.75:42.55,4:44.45,4.25:46.35,4.5:48.25,4.75:50.15,5:52.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4" ;

# International Tracked and Signed Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:17.25,0.25:17.6,0.5:22.1,0.75:24.9,1:28.05,1.25:30.5,1.5:33,2:34.05,2.25:36.4,2.5:38.75,2.75:41.1,3:43.45,3.25:45.8,3.5:48.15,3.75:50.5,4:52.85,4.25:55.2,4.5:57.55,4.75:59.9,5:62.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_5" ;

# International Tracked and Signed Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:16.75,0.25:18.35,0.5:23.75,0.75:25.75,1:29.4,1.25:32.85,1.5:35.6,2:36.1,2.25:38.7,2.5:41.3,2.75:43.9,3:46.5,3.25:49.1,3.5:51.7,3.75:54.3,4:56.9,4.25:59.5,4.5:62.1,4.75:64.7,5:67.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_6" ;

# Surface mail Europe 
UPDATE configuration SET configuration_value = "0.1:6.75, 0.25:6.75, 0.5:9.4, 0.75:10.6, 1:11.8, 1.25:12.8, 1.5:12.8, 1.75:14.3, 2:14.3, 2.25:15.95, 2.5:17.6, 2.75:19.25, 3:20.9, 3.25:22.55, 3.5:24.2, 3.75:25.85, 4:27.5, 4.25:29.15, 4.5:30.8, 4.75:32.45, 5:34.1" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1" ;

# Surface World Zones 1/2/3 
UPDATE configuration SET configuration_value = "0.1:6.75, 0.25:6.75, 0.5:9.4, 0.75:10.6, 1:11.8, 1.25:12.8, 1.5:12.8, 1.75:14.3, 2:14.3, 2.25:15.95, 2.5:17.6, 2.75:19.25, 3:20.9, 3.25:22.55, 3.5:24.2, 3.75:25.85, 4:27.5, 4.25:29.15, 4.5:30.8, 4.75:32.45, 5:34.1" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2" ;
