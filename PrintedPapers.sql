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
UPDATE configuration SET configuration_value = '0.1:4.15, 0.25:4.45, 0.5:6.2, 0.75:7.45, 1:8.65, 1.25:9.75, 1.5:10.9, 1.75:11.7, 2:12.1, 2.25:13.25, 2.5:14.4, 2.75:15.55, 3:16.7, 3.25:17.85, 3.5:19, 3.75:20.15, 4:21.3, 4.25:22.45, 4.5:23.6, 4.75:24.75, 5:25.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:4.85, 0.25:5.55, 0.5:8.5, 0.75:10.95, 1:13.35, 1.25:14.8, 1.5:16.3, 1.75:17.5, 2:18.3, 2.25:20, 2.5:21.7, 2.75:23.4, 3:25.1, 3.25:26.8, 3.5:28.5, 3.75:30.2, 4:31.9, 4.25:33.6, 4.5:35.3, 4.75:37, 5:38.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:5.25, 0.25:6.05, 0.5:9.2, 0.75:11.65, 1:14.1, 1.25:15.75, 1.5:17.55, 1.75:19, 2:20.05, 2.25:21.95, 2.5:23.85, 2.75:25.75, 3:27.65, 3.25:29.55, 3.5:31.45, 3.75:33.35, 4:35.25, 4.25:37.15, 4.5:39.05, 4.75:40.95, 5:42.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.95, 0.25:9.05, 0.5:10.55, 0.75:11.6, 1:12.55, 1.25:13.5, 1.5:14.45, 1.75:15.05, 2:15.25, 2.25:16.45, 2.5:17.65, 2.75:18.85, 3:20.05, 3.25:21.25, 3.5:22.45, 3.75:23.65, 4:24.85, 4.25:26.05, 4.5:27.25, 4.75:28.45, 5:29.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:9.65, 0.25:10.15, 0.5:12.95, 0.75:15.15, 1:17.35, 1.25:18.5, 1.5:19.7, 1.75:20.6, 2:21.1, 2.25:22.7, 2.5:24.3, 2.75:25.9, 3:27.5, 3.25:29.1, 3.5:30.7, 3.75:32.3, 4:33.9, 4.25:35.5, 4.5:37.1, 4.75:38.7, 5:40.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:9.9, 0.25:10.5, 0.5:13.45, 0.75:15.8, 1:18.15, 1.25:19.6, 1.5:21.1, 1.75:22.25, 2:23, 2.25:24.8, 2.5:26.6, 2.75:28.4, 3:30.2, 3.25:32, 3.5:33.8, 3.75:35.6, 4:37.4, 4.25:39.2, 4.5:41, 4.75:42.8, 5:44.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '0.1:10.74, 0.25:10.86, 0.5:12.66, 0.75:13.92, 1:15.06, 1.25:16.2, 1.5:17.34, 1.75:18.06, 2:18.3, 2.25:19.74, 2.5:21.18, 2.75:22.62, 3:24.06, 3.25:25.5, 3.5:26.94, 3.75:28.38, 4:29.82, 4.25:31.26, 4.5:32.7, 4.75:34.14, 5:35.58' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked Europe */
UPDATE configuration SET configuration_value = '0.1:8.95, 0.25:9.05, 0.5:10.55, 0.75:11.6, 1:12.55, 1.25:13.5, 1.5:14.45, 1.75:15.05, 2:15.25, 2.25:16.45, 2.5:17.65, 2.75:18.85, 3:20.05, 3.25:21.25, 3.5:22.45, 3.75:23.65, 4:24.85, 4.25:26.05, 4.5:27.25, 4.75:28.45, 5:29.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:9.65, 0.25:10.15, 0.5:12.95, 0.75:15.15, 1:17.35, 1.25:18.5, 1.5:19.7, 1.75:20.6, 2:21.1, 2.25:22.7, 2.5:24.3, 2.75:25.9, 3:27.5, 3.25:29.1, 3.5:30.7, 3.75:32.3, 4:33.9, 4.25:35.5, 4.5:37.1, 4.75:38.7, 5:40.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9.9, 0.25:10.5, 0.5:13.45, 0.75:15.8, 1:18.15, 1.25:19.6, 1.5:21.1, 1.75:22.25, 2:23, 2.25:24.8, 2.5:26.6, 2.75:28.4, 3:30.2, 3.25:32, 3.5:33.8, 3.75:35.6, 4:37.4, 4.25:39.2, 4.5:41, 4.75:42.8, 5:44.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:8.95, 0.25:9.05, 0.5:10.55, 0.75:11.6, 1:12.55, 1.25:13.5, 1.5:14.45, 1.75:15.05, 2:15.25, 2.25:16.45, 2.5:17.65, 2.75:18.85, 3:20.05, 3.25:21.25, 3.5:22.45, 3.75:23.65, 4:24.85, 4.25:26.05, 4.5:27.25, 4.75:28.45, 5:29.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:9.65, 0.25:10.15, 0.5:12.95, 0.75:15.15, 1:17.35, 1.25:18.5, 1.5:19.7, 1.75:20.6, 2:21.1, 2.25:22.7, 2.5:24.3, 2.75:25.9, 3:27.5, 3.25:29.1, 3.5:30.7, 3.75:32.3, 4:33.9, 4.25:35.5, 4.5:37.1, 4.75:38.7, 5:40.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9.9, 0.25:10.5, 0.5:13.45, 0.75:15.8, 1:18.15, 1.25:19.6, 1.5:21.1, 1.75:22.25, 2:23, 2.25:24.8, 2.5:26.6, 2.75:28.4, 3:30.2, 3.25:32, 3.5:33.8, 3.75:35.6, 4:37.4, 4.25:39.2, 4.5:41, 4.75:42.8, 5:44.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:3.9, 0.25:4.2, 0.5:6.1, 0.75:7.15, 1:8.55, 1.25:9.8, 1.5:10.85, 1.75:11.65, 2:12.05, 2.25:13.2, 2.5:14.35, 2.75:15.5, 3:16.65, 3.25:17.8, 3.5:18.95, 3.75:20.1, 4:21.25, 4.25:22.4, 4.5:23.55, 4.75:24.7, 5:25.85' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:3.9, 0.25:4.2, 0.5:6.1, 0.75:7.15, 1:8.55, 1.25:9.8, 1.5:10.85, 1.75:11.65, 2:12.05, 2.25:13.2, 2.5:14.35, 2.75:15.5, 3:16.65, 3.25:17.8, 3.5:18.95, 3.75:20.1, 4:21.25, 4.25:22.4, 4.5:23.55, 4.75:24.7, 5:25.85' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;
