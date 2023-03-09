# 
# Update for Big royal Mail postage rates valid from 4 April 2022 for latest rates visit  http://www.royalmail.com  
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
UPDATE configuration SET configuration_value = "0.25:5.85,0.5:7.5,0.75:8.7,1:9.9,1.5:10.9,2:12.4,2.25:13.8,2.5:15.2,2.75:16.6,3:18,3.25:19.4,3.5:20.8,3.75:22.2,4:23.6,4.25:25,4.5:26.4,4.75:27.8,5:29.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1" ;

#  Airmail Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:5.95,0.5:7.8,0.75:9.05,1:10.2,1.5:11.4,2:12.9,2.25:14.3,2.5:15.7,2.75:17.1,3:18.5,3.25:19.9,3.5:21.3,3.75:22.7,4:24.1,4.25:25.5,4.5:26.9,4.75:28.3,5:29.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2" ;

#  Airmail Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:6.3,0.5:8.2,0.75:9.55,1:10.9,1.25:11.95,1.5:13.05,2:14.05,2.25:15.45,2.5:16.85,2.75:18.25,3:19.65,3.25:21.05,3.5:22.45,3.75:23.85,4:25.25,4.25:26.65,4.5:28.05,4.75:29.45,5:30.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3" ;

# Airmail Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:7.15,0.25:8.3,0.5:12.1,0.75:14.85,1:17.65,1.25:19.85,1.5:22.1,2:23.3,2.25:25.2,2.5:27.1,2.75:29,3:30.9,3.25:32.8,3.5:34.7,3.75:36.6,4:38.5,4.25:40.4,4.5:42.3,4.75:44.2,5:46.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4" ;

# Airmail Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:8.35,0.25:9.9,0.5:14.5,0.75:17.6,1:20.85,1.25:23.75,1.5:26.85,2:28.55,2.25:30.9,2.5:33.25,2.75:35.6,3:37.95,3.25:40.3,3.5:42.65,3.75:45,4:47.35,4.25:49.7,4.5:52.05,4.75:54.4,5:56.75" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_5" ;

# Airmail Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:9.35,0.25:10.95,0.5:16.6,0.75:19.35,1:23,1.25:26.45,1.5:29.2,2:30.45,2.25:33.05,2.5:35.65,2.75:38.25,3:40.85,3.25:43.45,3.5:46.05,3.75:48.65,4:51.25,4.25:53.85,4.5:56.45,4.75:59.05,5:61.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_6" ;

# Airmail Europe zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:10.8,0.5:12.2,0.75:13.3,1:14.3,1.25:14.85,1.5:15,2:15.15,2.25:16.55,2.5:17.95,2.75:19.35,3:20.75,3.25:22.15,3.5:23.55,3.75:24.95,4:26.35,4.25:27.75,4.5:29.15,4.75:30.55,5:31.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1" ;

# Airmail Europe zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:10.95,0.5:12.6,0.75:13.65,1:14.6,1.25:14.95,1.5:15.2,2:15.65,2.25:17.05,2.5:18.45,2.75:19.85,3:21.25,3.25:22.65,3.5:24.05,3.75:25.45,4:26.85,4.25:28.25,4.5:29.65,4.75:31.05,5:32.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2" ;

# Airmail Europe zone 3 Signed For 
UPDATE configuration SET configuration_value = "0.25:11.5,0.5:13,0.75:14.15,1:15.3,1.25:15.9,1.5:16.5,2:16.8,2.25:18.2,2.5:19.6,2.75:21,3:22.4,3.25:23.8,3.5:25.2,3.75:26.6,4:28,4.25:29.4,4.5:30.8,4.75:32.2,5:33.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3" ;

# Airmail Rest of World Zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.1:12.5,0.25:13.45,0.5:17.1,0.75:19.5,1:22.15,1.25:24,1.5:25.4,2:25.85,2.25:27.75,2.5:29.65,2.75:31.55,3:33.45,3.25:35.35,3.5:37.25,3.75:39.15,4:41.05,4.25:42.95,4.5:44.85,4.75:46.75,5:48.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4" ;

# Airmail Rest of World Zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.1:13.55,0.25:14.9,0.5:19.3,0.75:22.1,1:25.25,1.25:27.65,1.5:30.15,2:31.2,2.25:33.55,2.5:35.9,2.75:38.25,3:40.6,3.25:42.95,3.5:45.3,3.75:47.65,4:50,4.25:52.35,4.5:54.7,4.75:57.05,5:59.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_5" ;

# International Tracked Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:9.9,0.5:11.15,0.75:12.15,1:13.1,2:14,2.25:15.4,2.5:16.8,2.75:18.2,3:19.6,3.25:21,3.5:22.4,3.75:23.8,4:25.2,4.25:26.6,4.5:28,4.75:29.4,5:30.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1" ;

# International Tracked Europe zone 2
UPDATE configuration SET configuration_value = "0.25:9.95,0.5:11.2,0.75:12.25,1:13.2,1.5:14,2:14.65,2.25:16.05,2.5:17.45,2.75:18.85,3:20.25,3.25:21.65,3.5:23.05,3.75:24.45,4:25.85,4.25:27.25,4.5:28.65,4.75:30.05,5:31.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2" ;

# International Tracked Europe zone 3
UPDATE configuration SET configuration_value = "0.25:10.2,0.5:11.6,0.75:12.75,1:13.9,1.25:14.5,1.5:15.3,2:15.8,2.25:17.2,2.5:18.6,2.75:20,3:21.4,3.25:22.8,3.5:24.2,3.75:25.6,4:27,4.25:28.4,4.5:29.8,4.75:31.2,5:32.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3" ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = "0.1:11.25,0.25:12.2,0.5:15.85,0.75:18.25,1:20.9,1.25:22.75,1.5:24.15,2:25.15,2.25:27.05,2.5:28.95,2.75:30.85,3:32.75,3.25:34.65,3.5:36.55,3.75:38.45,4:40.35,4.25:42.25,4.5:44.15,4.75:46.05,5:47.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4" ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = "0.1:12.3,0.25:13.65,0.5:18.05,0.75:20.85,1:24,1.25:26.4,1.5:28.9,2:30.5,2.25:32.85,2.5:35.2,2.75:37.55,3:39.9,3.25:42.25,3.5:44.6,3.75:46.95,4:49.3,4.25:51.65,4.5:54,4.75:56.35,5:58.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_5" ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = "0.1:12.15,0.25:13.45,0.5:18.1,0.75:20.85,1:24.4,2:27.6,2.25:30.2,2.5:32.8,2.75:35.4,3:38,3.25:40.6,3.5:43.2,3.75:45.8,4:48.4,4.25:51,4.5:53.6,4.75:56.2,5:58.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_6" ;

# Postage Rates 
#  International Tracked and Signed Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:10.8,0.5:12.2,0.75:13.3,1:14.3,1.25:14.85,1.5:15,2:15.15,2.25:16.55,2.5:17.95,2.75:19.35,3:20.75,3.25:22.15,3.5:23.55,3.75:24.95,4:26.35,4.25:27.75,4.5:29.15,4.75:30.55,5:31.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1" ;

#  International Tracked and Signed Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:10.95,0.5:12.6,0.75:13.65,1:14.6,1.25:14.95,1.5:15.2,2:15.65,2.25:17.05,2.5:18.45,2.75:19.85,3:21.25,3.25:22.65,3.5:24.05,3.75:25.45,4:26.85,4.25:28.25,4.5:29.65,4.75:31.05,5:32.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2" ;

#  International Tracked and Signed Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:11.5,0.5:13,0.75:14.15,1:15.3,1.25:15.9,1.5:16.5,2:16.8,2.25:18.2,2.5:19.6,2.75:21,3:22.4,3.25:23.8,3.5:25.2,3.75:26.6,4:28,4.25:29.4,4.5:30.8,4.75:32.2,5:33.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3" ;

# International Tracked and Signed Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:12.5,0.25:13.45,0.5:17.1,0.75:19.5,1:22.15,1.25:24,1.5:25.4,2:25.85,2.25:27.75,2.5:29.65,2.75:31.55,3:33.45,3.25:35.35,3.5:37.25,3.75:39.15,4:41.05,4.25:42.95,4.5:44.85,4.75:46.75,5:48.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4" ;

# International Tracked and Signed Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:13.55,0.25:14.9,0.5:19.3,0.75:22.1,1:25.25,1.25:27.65,1.5:30.15,2:31.2,2.25:33.55,2.5:35.9,2.75:38.25,3:40.6,3.25:42.95,3.5:45.3,3.75:47.65,4:50,4.25:52.35,4.5:54.7,4.75:57.05,5:59.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_5" ;

# International Tracked and Signed Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:14.35,0.25:15.95,0.5:21.35,0.75:23.35,1:27,1.25:30.45,1.5:33.2,2:33.7,2.25:36.3,2.5:38.9,2.75:41.5,3:44.1,3.25:46.7,3.5:49.3,3.75:51.9,4:54.5,4.25:57.1,4.5:59.7,4.75:62.3,5:64.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_6" ;

# Surface mail Europe Zones 1/2/3 
UPDATE configuration SET configuration_value = "0.1:5.05, 0.25:5.4, 0.5:7.75, 0.75:9.05, 1:10.45, 1.25:11.6, 1.5:12.85, 1.75:14.25, 2:14.25, 2.25:15.75, 2.5:17.25, 2.75:18.75, 3:20.25, 3.25:21.75, 3.5:23.25, 3.75:24.75, 4:26.25, 4.25:27.75, 4.5:29.25, 4.75:30.75, 5:32.25" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1" ;

# Surface World Zones 1/2/3 
UPDATE configuration SET configuration_value = "0.1:5.05, 0.25:5.4, 0.5:7.75, 0.75:9.05, 1:10.45, 1.25:11.6, 1.5:12.85, 1.75:14.25, 2:14.25, 2.25:15.75, 2.5:17.25, 2.75:18.75, 3:20.25, 3.25:21.75, 3.5:23.25, 3.75:24.75, 4:26.25, 4.25:27.75, 4.5:29.25, 4.75:30.75, 5:32.25" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2" ;
