/* 
 * Update for Big royal Mail postage rates valid from 31 March 2014 for latest rates visit http://www.royalmail.com 
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
UPDATE configuration SET configuration_value = '0.1:3.2, 0.25:3.7, 0.5:5.15, 0.75:6.6, 1:8.05, 1.25:9.5, 1.5:10.95, 1.75:12.4, 2:13.85, 2.25:15.3, 2.5:16.75, 2.75:18.2, 3:19.65, 3.25:21.1, 3.5:22.55, 3.75:24, 4:25.45, 4.25:26.9, 4.5:28.35, 4.75:29.8, 5:31.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:3.8, 0.25:4.75, 0.5:7.45, 0.75:10.15, 1:12.85, 1.25:15.55, 1.5:18.25, 1.75:20.95, 2:23.65, 2.25:26.35, 2.5:29.05, 2.75:31.75, 3:34.45, 3.25:37.15, 3.5:39.85, 3.75:42.55, 4:45.25, 4.25:47.95, 4.5:50.65, 4.75:53.35, 5:56.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:4, 0.25:5.05, 0.5:7.9, 0.75:10.75, 1:13.6, 1.25:16.45, 1.5:19.3, 1.75:22.15, 2:25, 2.25:27.85, 2.5:30.7, 2.75:33.55, 3:36.4, 3.25:39.25, 3.5:42.1, 3.75:44.95, 4:47.8, 4.25:50.65, 4.5:53.5, 4.75:56.35, 5:59.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.6, 1:13.05, 1.25:14.5, 1.5:15.95, 1.75:17.4, 2:18.85, 2.25:20.3, 2.5:21.75, 2.75:23.2, 3:24.65, 3.25:26.1, 3.5:27.55, 3.75:29, 4:30.45, 4.25:31.9, 4.5:33.35, 4.75:34.8, 5:36.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:15.15, 1:17.85, 1.25:20.55, 1.5:23.25, 1.75:25.95, 2:28.65, 2.25:31.35, 2.5:34.05, 2.75:36.75, 3:39.45, 3.25:42.15, 3.5:44.85, 3.75:47.55, 4:50.25, 4.25:52.95, 4.5:55.65, 4.75:58.35, 5:61.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.75, 1:18.6, 1.25:21.45, 1.5:24.3, 1.75:27.15, 2:30, 2.25:32.85, 2.5:35.7, 2.75:38.55, 3:41.4, 3.25:44.25, 3.5:47.1, 3.75:49.95, 4:52.8, 4.25:55.65, 4.5:58.5, 4.75:61.35, 5:64.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.01:2.8, 0.025:3.65, 0.05:5.1, 0.075:6.55, 0.1:8, 0.125:9.45, 0.15:10.9, 0.175:12.35, 0.2:13.8, 0.225:15.25, 0.25:16.7, 0.275:18.15, 0.3:19.6, 0.325:21.05, 0.35:22.5, 0.375:23.95, 0.4:25.4, 0.425:26.85, 0.45:28.3, 0.475:29.75, 0.5:31.2' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.01:2.8, 0.025:3.65, 0.05:5.1, 0.075:6.55, 0.1:8, 0.125:9.45, 0.15:10.9, 0.175:12.35, 0.2:13.8, 0.225:15.25, 0.25:16.7, 0.275:18.15, 0.3:19.6, 0.325:21.05, 0.35:22.5, 0.375:23.95, 0.4:25.4, 0.425:26.85, 0.45:28.3, 0.475:29.75, 0.5:31.2' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '1.75:9.84, 2:10.44, 2.25:12.18, 2.5:13.92, 2.75:15.66, 3:17.4, 3.25:19.14, 3.5:20.88, 3.75:22.62, 4:24.36, 4.25:26.1, 4.5:27.84, 4.75:29.58, 5:31.32, 0:33.06, 0:34.8, 0:36.54, 0:38.28, 0:40.02, 0:41.76, 0:43.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked Europe */
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.6, 1:13.05, 1.25:14.5, 1.5:15.95, 1.75:17.4, 2:18.85, 2.25:20.3, 2.5:21.75, 2.75:23.2, 3:24.65, 3.25:26.1, 3.5:27.55, 3.75:29, 4:30.45, 4.25:31.9, 4.5:33.35, 4.75:34.8, 5:36.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:15.15, 1:17.85, 1.25:20.55, 1.5:23.25, 1.75:25.95, 2:28.65, 2.25:31.35, 2.5:34.05, 2.75:36.75, 3:39.45, 3.25:42.15, 3.5:44.85, 3.75:47.55, 4:50.25, 4.25:52.95, 4.5:55.65, 4.75:58.35, 5:61.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.75, 1:18.6, 1.25:21.45, 1.5:24.3, 1.75:27.15, 2:30, 2.25:32.85, 2.5:35.7, 2.75:38.55, 3:41.4, 3.25:44.25, 3.5:47.1, 3.75:49.95, 4:52.8, 4.25:55.65, 4.5:58.5, 4.75:61.35, 5:64.2' where configuration_key = 'module_shipping_rmamtparcel_zones_cost0_3' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.6, 1:13.05, 1.25:14.5, 1.5:15.95, 1.75:17.4, 2:18.85, 2.25:20.3, 2.5:21.75, 2.75:23.2, 3:24.65, 3.25:26.1, 3.5:27.55, 3.75:29, 4:30.45, 4.25:31.9, 4.5:33.35, 4.75:34.8, 5:36.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:15.15, 1:17.85, 1.25:20.55, 1.5:23.25, 1.75:25.95, 2:28.65, 2.25:31.35, 2.5:34.05, 2.75:36.75, 3:39.45, 3.25:42.15, 3.5:44.85, 3.75:47.55, 4:50.25, 4.25:52.95, 4.5:55.65, 4.75:58.35, 5:61.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.75, 1:18.6, 1.25:21.45, 1.5:24.3, 1.75:27.15, 2:30, 2.25:32.85, 2.5:35.7, 2.75:38.55, 3:41.4, 3.25:44.25, 3.5:47.1, 3.75:49.95, 4:52.8, 4.25:55.65, 4.5:58.5, 4.75:61.35, 5:64.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;
