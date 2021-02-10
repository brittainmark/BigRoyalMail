/* 
 * Update for Big royal Mail postage rates valid from 27 March 2017 for latest rates visit http://www.royalmail.com 
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
UPDATE configuration SET configuration_value = '0.1:3.8, 0.25:4.1, 0.5:5.8, 0.75:7.2, 1:8.6, 1.25:9.85, 1.5:11.1, 1.75:12.3, 2:13.45, 2.25:14.6, 2.5:15.75, 2.75:16.9, 3:18.05, 3.25:19.2, 3.5:20.35, 3.75:21.5, 4:22.65, 4.25:23.8, 4.5:24.95, 4.75:26.1, 5:27.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:4.45, 0.25:5.15, 0.5:8.05, 0.75:10.7, 1:13.3, 1.25:14.9, 1.5:16.5, 1.75:18.1, 2:19.65, 2.25:21.35, 2.5:23.05, 2.75:24.75, 3:26.45, 3.25:28.15, 3.5:29.85, 3.75:31.55, 4:33.25, 4.25:34.95, 4.5:36.65, 4.75:38.35, 5:40.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:4.8, 0.25:5.6, 0.5:8.7, 0.75:11.4, 1:14.05, 1.25:15.85, 1.5:17.75, 1.75:19.6, 2:21.4, 2.25:23.3, 2.5:25.2, 2.75:27.1, 3:29, 3.25:30.9, 3.5:32.8, 3.75:34.7, 4:36.6, 4.25:38.5, 4.5:40.4, 4.75:42.3, 5:44.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.6, 0.25:8.7, 0.5:10.15, 0.75:11.35, 1:12.5, 1.25:13.6, 1.5:14.65, 1.75:15.65, 2:16.6, 2.25:17.8, 2.5:19, 2.75:20.2, 3:21.4, 3.25:22.6, 3.5:23.8, 3.75:25, 4:26.2, 4.25:27.4, 4.5:28.6, 4.75:29.8, 5:31' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:9.25, 0.25:9.75, 0.5:12.5, 0.75:14.9, 1:17.3, 1.25:18.6, 1.5:19.9, 1.75:21.2, 2:22.45, 2.25:24.05, 2.5:25.65, 2.75:27.25, 3:28.85, 3.25:30.45, 3.5:32.05, 3.75:33.65, 4:35.25, 4.25:36.85, 4.5:38.45, 4.75:40.05, 5:41.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:9.45, 0.25:10.05, 0.5:12.95, 0.75:15.55, 1:18.1, 1.25:19.7, 1.5:21.3, 1.75:22.85, 2:24.35, 2.25:26.15, 2.5:27.95, 2.75:29.75, 3:31.55, 3.25:33.35, 3.5:35.15, 3.75:36.95, 4:38.75, 4.25:40.55, 4.5:42.35, 4.75:44.15, 5:45.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '0.1:10.32, 0.25:10.44, 0.5:12.18, 0.75:13.62, 1:15, 1.25:16.32, 1.5:17.58, 1.75:18.78, 2:19.92, 2.25:21.36, 2.5:22.8, 2.75:24.24, 3:25.68, 3.25:27.12, 3.5:28.56, 3.75:30, 4:31.44, 4.25:32.88, 4.5:34.32, 4.75:35.76, 5:37.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked Europe */
UPDATE configuration SET configuration_value = '0.1:8.6, 0.25:8.7, 0.5:10.15, 0.75:11.35, 1:12.5, 1.25:13.6, 1.5:14.65, 1.75:15.65, 2:16.6, 2.25:17.8, 2.5:19, 2.75:20.2, 3:21.4, 3.25:22.6, 3.5:23.8, 3.75:25, 4:26.2, 4.25:27.4, 4.5:28.6, 4.75:29.8, 5:31' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:9.25, 0.25:9.75, 0.5:12.5, 0.75:14.9, 1:17.3, 1.25:18.6, 1.5:19.9, 1.75:21.2, 2:22.45, 2.25:24.05, 2.5:25.65, 2.75:27.25, 3:28.85, 3.25:30.45, 3.5:32.05, 3.75:33.65, 4:35.25, 4.25:36.85, 4.5:38.45, 4.75:40.05, 5:41.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9.45, 0.25:10.05, 0.5:12.95, 0.75:15.55, 1:18.1, 1.25:19.7, 1.5:21.3, 1.75:22.85, 2:24.35, 2.25:26.15, 2.5:27.95, 2.75:29.75, 3:31.55, 3.25:33.35, 3.5:35.15, 3.75:36.95, 4:38.75, 4.25:40.55, 4.5:42.35, 4.75:44.15, 5:45.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:8.6, 0.25:8.7, 0.5:10.15, 0.75:11.35, 1:12.5, 1.25:13.6, 1.5:14.65, 1.75:15.65, 2:16.6, 2.25:17.8, 2.5:19, 2.75:20.2, 3:21.4, 3.25:22.6, 3.5:23.8, 3.75:25, 4:26.2, 4.25:27.4, 4.5:28.6, 4.75:29.8, 5:31' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:9.25, 0.25:9.75, 0.5:12.5, 0.75:14.9, 1:17.3, 1.25:18.6, 1.5:19.9, 1.75:21.2, 2:22.45, 2.25:24.05, 2.5:25.65, 2.75:27.25, 3:28.85, 3.25:30.45, 3.5:32.05, 3.75:33.65, 4:35.25, 4.25:36.85, 4.5:38.45, 4.75:40.05, 5:41.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9.45, 0.25:10.05, 0.5:12.95, 0.75:15.55, 1:18.1, 1.25:19.7, 1.5:21.3, 1.75:22.85, 2:24.35, 2.25:26.15, 2.5:27.95, 2.75:29.75, 3:31.55, 3.25:33.35, 3.5:35.15, 3.75:36.95, 4:38.75, 4.25:40.55, 4.5:42.35, 4.75:44.15, 5:45.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.01:3.55, 0.025:3.85, 0.05:5.7, 0.075:7.1, 0.1:8.5, 0.125:9.75, 0.15:11, 0.175:12.2, 0.2:13.35, 0.225:14.5, 0.25:15.65, 0.275:16.8, 0.3:17.95, 0.325:19.1, 0.35:20.25, 0.375:21.4, 0.4:22.55, 0.425:23.7, 0.45:24.85, 0.475:26, 0.5:27.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.01:3.55, 0.025:3.85, 0.05:5.7, 0.075:7.1, 0.1:8.5, 0.125:9.75, 0.15:11, 0.175:12.2, 0.2:13.35, 0.225:14.5, 0.25:15.65, 0.275:16.8, 0.3:17.95, 0.325:19.1, 0.35:20.25, 0.375:21.4, 0.4:22.55, 0.425:23.7, 0.45:24.85, 0.475:26, 0.5:27.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;