/* 
 * Update for Big royal Mail postage rates valid from 4 April 2013 for latest rates visit http://www.royalmail.com 
 * 
 * This update puts in the rates for printed papers 5 kg. Again it will not differentiate between printed papers
 * and other types of post so do not use this unless you know you are shipping printed papers.
 * Additionally you must have installed the full package before applying this update as it only changes the rates.
 * 
 * Assumes weights in Kg costs in GBP.
 * 
 * created by Mark Brittain. 
 * 
 * Donations via paypal to info@inner-light.co.uk
 * 
 * N.B. I do not guarantee to update this every year please check the rates with royal mail.
 */

/* Postage Rates 
*  Airmail Europe */
UPDATE configuration SET configuration_value = '0.1:3, 0.25:3.5, 0.5:4.95, 0.75:6.4, 1:7.85, 1.25:9.3, 1.5:10.75, 1.75:12.2, 2:13.65, 2.25:15.1, 2.5:16.55, 2.75:18, 3:19.45, 3.25:20.9, 3.5:22.35, 3.75:23.8, 4:25.25, 4.25:26.7, 4.5:28.15, 4.75:29.6, 5:31.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:3.5, 0.25:4.5, 0.5:7.2, 0.75:9.9, 1:12.6, 1.25:15.3, 1.5:18, 1.75:20.7, 2:23.4, 2.25:26.1, 2.5:28.8, 2.75:31.5, 3:34.2, 3.25:36.9, 3.5:39.6, 3.75:42.3, 4:45, 4.25:47.7, 4.5:50.4, 4.75:53.1, 5:55.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:3.5, 0.25:4.7, 0.5:7.55, 0.75:10.4, 1:13.25, 1.25:16.1, 1.5:18.95, 1.75:21.8, 2:24.65, 2.25:27.5, 2.5:30.35, 2.75:33.2, 3:36.05, 3.25:38.9, 3.5:41.75, 3.75:44.6, 4:47.45, 4.25:50.3, 4.5:53.15, 4.75:56, 5:58.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.25:8.8, 0.5:10.25, 0.75:11.7, 1:13.15, 1.25:14.6, 1.5:16.05, 1.75:17.5, 2:18.95, 2.25:20.4, 2.5:21.85, 2.75:23.3, 3:24.75, 3.25:26.2, 3.5:27.65, 3.75:29.1, 4:30.55, 4.25:32, 4.5:33.45, 4.75:34.9, 5:36.35' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.8, 0.5:12.5, 0.75:15.2, 1:17.9, 1.25:20.6, 1.5:23.3, 1.75:26, 2:28.7, 2.25:31.4, 2.5:34.1, 2.75:36.8, 3:39.5, 3.25:42.2, 3.5:44.9, 3.75:47.6, 4:50.3, 4.25:53, 4.5:55.7, 4.75:58.4, 5:61.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:10, 0.5:12.85, 0.75:15.7, 1:18.55, 1.25:21.4, 1.5:24.25, 1.75:27.1, 2:29.95, 2.25:32.8, 2.5:35.65, 2.75:38.5, 3:41.35, 3.25:44.2, 3.5:47.05, 3.75:49.9, 4:52.75, 4.25:55.6, 4.5:58.45, 4.75:61.3, 5:64.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.25:8.8, 0.5:10.25, 0.75:11.7, 1:13.15, 1.25:14.6, 1.5:16.05, 1.75:17.5, 2:18.95, 2.25:20.4, 2.5:21.85, 2.75:23.3, 3:24.75, 3.25:26.2, 3.5:27.65, 3.75:29.1, 4:30.55, 4.25:32, 4.5:33.45, 4.75:34.9, 5:36.35' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.8, 0.5:12.5, 0.75:15.2, 1:17.9, 1.25:20.6, 1.5:23.3, 1.75:26, 2:28.7, 2.25:31.4, 2.5:34.1, 2.75:36.8, 3:39.5, 3.25:42.2, 3.5:44.9, 3.75:47.6, 4:50.3, 4.25:53, 4.5:55.7, 4.75:58.4, 5:61.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:10, 0.5:12.85, 0.75:15.7, 1:18.55, 1.25:21.4, 1.5:24.25, 1.75:27.1, 2:29.95, 2.25:32.8, 2.5:35.65, 2.75:38.5, 3:41.35, 3.25:44.2, 3.5:47.05, 3.75:49.9, 4:52.75, 4.25:55.6, 4.5:58.45, 4.75:61.3, 5:64.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.01:2.6, 0.025:3.25, 0.05:4.85, 0.075:6.45, 0.1:8.05, 0.125:9.65, 0.15:11.25, 0.175:12.85, 0.2:14.45, 0.225:16.05, 0.25:17.65, 0.275:19.25, 0.3:20.85, 0.325:22.45, 0.35:24.05, 0.375:25.65, 0.4:27.25, 0.425:28.85, 0.45:30.45, 0.475:32.05, 0.5:33.65' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Europe Signed for */
UPDATE configuration SET configuration_value = '0.01:7.9, 0.025:8.55, 0.05:10.15, 0.075:11.75, 0.1:13.35, 0.125:14.95, 0.15:16.55, 0.175:18.15, 0.2:19.75, 0.225:21.35, 0.25:22.95, 0.275:24.55, 0.3:26.15, 0.325:27.75, 0.35:29.35, 0.375:30.95, 0.4:32.55, 0.425:34.15, 0.45:35.75, 0.475:37.35, 0.5:38.95' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.01:2.6, 0.025:3.25, 0.05:4.85, 0.075:6.45, 0.1:8.05, 0.125:9.65, 0.15:11.25, 0.175:12.85, 0.2:14.45, 0.225:16.05, 0.25:17.65, 0.275:19.25, 0.3:20.85, 0.325:22.45, 0.35:24.05, 0.375:25.65, 0.4:27.25, 0.425:28.85, 0.45:30.45, 0.475:32.05, 0.5:33.65' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;

/* Surface mail Rest of World Signed for */
UPDATE configuration SET configuration_value = '0.01:7.9, 0.025:8.55, 0.05:10.15, 0.075:11.75, 0.1:13.35, 0.125:14.95, 0.15:16.55, 0.175:18.15, 0.2:19.75, 0.225:21.35, 0.25:22.95, 0.275:24.55, 0.3:26.15, 0.325:27.75, 0.35:29.35, 0.375:30.95, 0.4:32.55, 0.425:34.15, 0.45:35.75, 0.475:37.35, 0.5:38.95' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_ZONES_COST0_2' ;

/* Airsure Europe */
UPDATE configuration SET configuration_value = '0.1:8, 0.25:8.5, 0.5:9.95, 0.75:11.4, 1:12.85, 1.25:14.3, 1.5:15.75, 1.75:17.2, 2:18.65, 2.25:20.1, 2.5:21.55, 2.75:23, 3:24.45, 3.25:25.9, 3.5:27.35, 3.75:28.8, 4:30.25, 4.25:31.7, 4.5:33.15, 4.75:34.6, 5:36.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_COST0_1' ;

/* Airsure Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.5, 0.25:9.5, 0.5:12.2, 0.75:14.9, 1:17.6, 1.25:20.3, 1.5:23, 1.75:25.7, 2:28.4, 2.25:31.1, 2.5:33.8, 2.75:36.5, 3:39.2, 3.25:41.9, 3.5:44.6, 3.75:47.3, 4:50, 4.25:52.7, 4.5:55.4, 4.75:58.1, 5:60.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_COST0_2' ;

/* Airsure Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:8.5, 0.25:9.7, 0.5:12.55, 0.75:15.4, 1:18.25, 1.25:21.1, 1.5:23.95, 1.75:26.8, 2:29.65, 2.25:32.5, 2.5:35.35, 2.75:38.2, 3:41.05, 3.25:43.9, 3.5:46.75, 3.75:49.6, 4:52.45, 4.25:55.3, 4.5:58.15, 4.75:61, 5:63.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_COST0_3' ;
