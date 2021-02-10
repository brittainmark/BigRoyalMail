/* 
 * Update for Big royal Mail postage rates valid from 23 March 2020 for latest rates visit http://www.royalmail.com 
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
UPDATE configuration SET configuration_value = '0.1:5.11, 0.25:5.35, 0.5:7.25, 0.75:8.47, 1:9.53, 1.25:10.38, 1.5:11.39, 1.75:12.11, 2:12.52, 2.25:13.73, 2.5:14.94, 2.75:16.15, 3:17.36, 3.25:18.57, 3.5:19.78, 3.75:20.99, 4:22.2, 4.25:23.41, 4.5:24.62, 4.75:25.83, 5:27.04' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:5.8, 0.25:6.63, 0.5:10.06, 0.75:12.23, 1:14.49, 1.25:16.35, 1.5:18.01, 1.75:18.38, 2:19.22, 2.25:21.01, 2.5:22.8, 2.75:24.59, 3:26.38, 3.25:28.17, 3.5:29.96, 3.75:31.75, 4:33.54, 4.25:35.33, 4.5:37.12, 4.75:38.91, 5:40.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:6.24, 0.25:7.18, 0.5:10.83, 0.75:13.02, 1:15.28, 1.25:17.4, 1.5:19.39, 1.75:19.95, 2:21.05, 2.25:23.05, 2.5:25.05, 2.75:27.05, 3:29.05, 3.25:31.05, 3.5:33.05, 3.75:35.05, 4:37.05, 4.25:39.05, 4.5:41.05, 4.75:43.05, 5:45.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Rest of World  Zone 3*/
UPDATE configuration SET configuration_value = '0.1:8.38, 0.25:9.84, 0.5:15.18, 0.75:17.73, 1:21.18, 1.25:24.33, 1.5:26.98, 1.75:28.15, 2:29.71, 2.25:32.24, 2.5:34.77, 2.75:37.3, 3:39.83, 3.25:42.36, 3.5:44.89, 3.75:47.42, 4:49.95, 4.25:52.48, 4.5:55.01, 4.75:57.54, 5:60.07' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:9.86, 0.25:9.9, 0.5:11.55, 0.75:12.57, 1:13.43, 1.25:13.83, 1.5:14.54, 1.75:14.81, 2:15.02, 2.25:16.28, 2.5:17.54, 2.75:18.8, 3:20.06, 3.25:21.32, 3.5:22.58, 3.75:23.84, 4:25.1, 4.25:26.36, 4.5:27.62, 4.75:28.88, 5:30.14' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:10.65, 0.25:11.28, 0.5:14.56, 0.75:16.38, 1:18.49, 1.25:20, 1.5:20.81, 1.75:20.98, 2:21.27, 2.25:22.95, 2.5:24.63, 2.75:26.31, 3:27.99, 3.25:29.67, 3.5:31.35, 3.75:33.03, 4:34.71, 4.25:36.39, 4.5:38.07, 4.75:39.75, 5:41.43' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:10.94, 0.25:11.68, 0.5:15.13, 0.75:17.02, 1:19.18, 1.25:20.8, 1.5:22.18, 1.75:22.65, 2:23.2, 2.25:25.09, 2.5:26.98, 2.75:28.87, 3:30.76, 3.25:32.65, 3.5:34.54, 3.75:36.43, 4:38.32, 4.25:40.21, 4.5:42.1, 4.75:43.99, 5:45.88' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '0.1:11.83, 0.25:11.88, 0.5:13.86, 0.75:15.08, 1:16.12, 1.25:16.6, 1.5:17.45, 1.75:17.77, 2:18.03, 2.25:19.54, 2.5:21.05, 2.75:22.56, 3:24.07, 3.25:25.58, 3.5:27.09, 3.75:28.6, 4:30.11, 4.25:31.62, 4.5:33.13, 4.75:34.64, 5:36.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked Europe */
UPDATE configuration SET configuration_value = '0.1:9.86, 0.25:9.9, 0.5:11.55, 0.75:12.57, 1:13.43, 1.25:13.83, 1.5:14.54, 1.75:14.81, 2:15.02, 2.25:16.28, 2.5:17.54, 2.75:18.8, 3:20.06, 3.25:21.32, 3.5:22.58, 3.75:23.84, 4:25.1, 4.25:26.36, 4.5:27.62, 4.75:28.88, 5:30.14' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:10.65, 0.25:11.28, 0.5:14.56, 0.75:16.38, 1:18.49, 1.25:20, 1.5:20.81, 1.75:20.98, 2:21.27, 2.25:22.95, 2.5:24.63, 2.75:26.31, 3:27.99, 3.25:29.67, 3.5:31.35, 3.75:33.03, 4:34.71, 4.25:36.39, 4.5:38.07, 4.75:39.75, 5:41.43' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:10.94, 0.25:11.68, 0.5:15.13, 0.75:17.02, 1:19.18, 1.25:20.8, 1.5:22.19, 1.75:22.65, 2:23.2, 2.25:25.09, 2.5:26.98, 2.75:28.87, 3:30.76, 3.25:32.65, 3.5:34.54, 3.75:36.43, 4:38.32, 4.25:40.21, 4.5:42.1, 4.75:43.99, 5:45.88' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

/* International Tracked Rest of World Zone 3 */
UPDATE configuration SET configuration_value = '0.1:11.03, 0.25:12.34, 0.5:16.68, 0.75:19.23, 1:22.68, 1.25:25.83, 1.5:28.48, 1.75:29.65, 2:31.21, 2.25:33.74, 2.5:36.27, 2.75:38.8, 3:41.33, 3.25:43.86, 3.5:46.39, 3.75:48.92, 4:51.45, 4.25:53.98, 4.5:56.51, 4.75:59.04, 5:61.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:9.86, 0.25:9.9, 0.5:11.55, 0.75:12.57, 1:13.43, 1.25:13.83, 1.5:14.54, 1.75:14.81, 2:15.02, 2.25:16.28, 2.5:17.54, 2.75:18.8, 3:20.06, 3.25:21.32, 3.5:22.58, 3.75:23.84, 4:25.1, 4.25:26.36, 4.5:27.62, 4.75:28.88, 5:30.14' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:10.65, 0.25:11.28, 0.5:14.56, 0.75:16.38, 1:18.49, 1.25:20, 1.5:20.81, 1.75:20.98, 2:21.27, 2.25:22.95, 2.5:24.63, 2.75:26.31, 3:27.99, 3.25:29.67, 3.5:31.35, 3.75:33.03, 4:34.71, 4.25:36.39, 4.5:38.07, 4.75:39.75, 5:41.43' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:10.94, 0.25:11.68, 0.5:15.13, 0.75:17.02, 1:19.18, 1.25:20.8, 1.5:22.19, 1.75:22.65, 2:23.2, 2.25:25.09, 2.5:26.98, 2.75:28.87, 3:30.76, 3.25:32.65, 3.5:34.54, 3.75:36.43, 4:38.32, 4.25:40.21, 4.5:42.1, 4.75:43.99, 5:45.88' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

/* International Tracked Rest of World Zone 3 */
UPDATE configuration SET configuration_value = '0.1:12.88, 0.25:14.34, 0.5:18.68, 0.75:21.23, 1:24.68, 1.25:27.83, 1.5:30.48, 1.75:31.65, 2:33.21, 2.25:35.74, 2.5:38.27, 2.75:40.8, 3:43.33, 3.25:45.86, 3.5:48.39, 3.75:50.92, 4:53.45, 4.25:55.98, 4.5:58.51, 4.75:61.04, 5:63.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:4.57, 0.25:4.89, 0.5:7.04, 0.75:8.22, 1:9.51, 1.25:10.53, 1.5:11.66, 1.75:12.52, 2:12.95, 2.25:14.16, 2.5:15.37, 2.75:16.58, 3:17.79, 3.25:19, 3.5:20.21, 3.75:21.42, 4:22.63, 4.25:23.84, 4.5:25.05, 4.75:26.26, 5:27.47' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:4.57, 0.25:4.89, 0.5:7.04, 0.75:8.22, 1:9.51, 1.25:10.53, 1.5:11.66, 1.75:12.52, 2:12.95, 2.25:14.16, 2.5:15.37, 2.75:16.58, 3:17.79, 3.25:19, 3.5:20.21, 3.75:21.42, 4:22.63, 4.25:23.84, 4.5:25.05, 4.75:26.26, 5:27.47' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;
