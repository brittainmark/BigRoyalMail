/* 
 * Update for Big royal Mail postage rates valid from 30 March 2015 for latest rates visit http://www.royalmail.com 
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
UPDATE configuration SET configuration_value = '0.1:3.45, 0.25:3.95, 0.5:5.5, 0.75:6.85, 1:8.26, 1.25:9.61, 1.5:10.96, 1.75:12.31, 2:13.46, 2.25:14.61, 2.5:15.76, 2.75:16.91, 3:18.06, 3.25:19.21, 3.5:20.36, 3.75:21.51, 4:22.66, 4.25:23.81, 4.5:24.96, 4.75:26.11, 5:27.26' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:4.1, 0.25:5, 0.5:7.7, 0.75:10.3, 1:12.95, 1.25:14.65, 1.5:16.35, 1.75:18.05, 2:19.75, 2.25:21.45, 2.5:23.15, 2.75:24.85, 3:26.55, 3.25:28.25, 3.5:29.95, 3.75:31.65, 4:33.35, 4.25:35.05, 4.5:36.75, 4.75:38.45, 5:40.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:4.45, 0.25:5.45, 0.5:8.45, 0.75:11.15, 1:13.9, 1.25:15.8, 1.5:17.7, 1.75:19.6, 2:21.5, 2.25:23.4, 2.5:25.3, 2.75:27.2, 3:29.1, 3.25:31, 3.5:32.9, 3.75:34.8, 4:36.7, 4.25:38.6, 4.5:40.5, 4.75:42.4, 5:44.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.51, 1.25:13.86, 1.5:15.21, 1.75:15.81, 2:16.96, 2.25:18.11, 2.5:19.26, 2.75:20.41, 3:21.56, 3.25:22.71, 3.5:23.86, 3.75:25.01, 4:26.16, 4.25:27.31, 4.5:28.46, 4.75:29.61, 5:30.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.9, 1.5:20.6, 1.75:21.55, 2:23.25, 2.25:24.95, 2.5:26.65, 2.75:28.35, 3:30.05, 3.25:31.75, 3.5:33.45, 3.75:35.15, 4:36.85, 4.25:38.55, 4.5:40.25, 4.75:41.95, 5:43.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:20.05, 1.5:21.95, 1.75:23.1, 2:25, 2.25:26.9, 2.5:28.8, 2.75:30.7, 3:32.6, 3.25:34.5, 3.5:36.4, 3.75:38.3, 4:40.2, 4.25:42.1, 4.5:44, 4.75:45.9, 5:47.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '0.1:9.84, 0.25:10.44, 0.5:12.18, 0.75:13.32, 1:15.02, 1.25:16.64, 1.5:18.26, 1.75:18.98, 2:20.36, 2.25:21.74, 2.5:23.12, 2.75:24.5, 3:25.88, 3.25:27.26, 3.5:28.64, 3.75:30.02, 4:31.4, 4.25:32.78, 4.5:34.16, 4.75:35.54, 5:36.92' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked Europe */
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.51, 1.25:13.86, 1.5:15.21, 1.75:15.81, 2:16.96, 2.25:18.11, 2.5:19.26, 2.75:20.41, 3:21.56, 3.25:22.71, 3.5:23.86, 3.75:25.01, 4:26.16, 4.25:27.31, 4.5:28.46, 4.75:29.61, 5:30.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.9, 1.5:20.6, 1.75:21.55, 2:23.25, 2.25:24.95, 2.5:26.65, 2.75:28.35, 3:30.05, 3.25:31.75, 3.5:33.45, 3.75:35.15, 4:36.85, 4.25:38.55, 4.5:40.25, 4.75:41.95, 5:43.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:20.05, 1.5:21.95, 1.75:23.1, 2:25, 2.25:26.9, 2.5:28.8, 2.75:30.7, 3:32.6, 3.25:34.5, 3.5:36.4, 3.75:38.3, 4:40.2, 4.25:42.1, 4.5:44, 4.75:45.9, 5:47.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.51, 1.25:13.86, 1.5:15.21, 1.75:15.81, 2:16.96, 2.25:18.11, 2.5:19.26, 2.75:20.41, 3:21.56, 3.25:22.71, 3.5:23.86, 3.75:25.01, 4:26.16, 4.25:27.31, 4.5:28.46, 4.75:29.61, 5:30.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.9, 1.5:20.6, 1.75:21.55, 2:23.25, 2.25:24.95, 2.5:26.65, 2.75:28.35, 3:30.05, 3.25:31.75, 3.5:33.45, 3.75:35.15, 4:36.85, 4.25:38.55, 4.5:40.25, 4.75:41.95, 5:43.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:20.05, 1.5:21.95, 1.75:23.1, 2:25, 2.25:26.9, 2.5:28.8, 2.75:30.7, 3:32.6, 3.25:34.5, 3.5:36.4, 3.75:38.3, 4:40.2, 4.25:42.1, 4.5:44, 4.75:45.9, 5:47.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.01:3.25, 0.025:3.75, 0.05:5.3, 0.075:6.65, 0.1:8.06, 0.125:9.41, 0.15:10.76, 0.175:12.11, 0.2:13.26, 0.225:14.41, 0.25:15.56, 0.275:16.71, 0.3:17.86, 0.325:19.01, 0.35:20.16, 0.375:21.31, 0.4:22.46, 0.425:23.61, 0.45:24.76, 0.475:25.91, 0.5:27.06' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.01:3.25, 0.025:3.75, 0.05:5.3, 0.075:6.65, 0.1:8.06, 0.125:9.41, 0.15:10.76, 0.175:12.11, 0.2:13.26, 0.225:14.41, 0.25:15.56, 0.275:16.71, 0.3:17.86, 0.325:19.01, 0.35:20.16, 0.375:21.31, 0.4:22.46, 0.425:23.61, 0.45:24.76, 0.475:25.91, 0.5:27.06' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;
