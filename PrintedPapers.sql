/* 
 * Update for Big royal Mail postage rates valid from 30 April 2012 for latest rates visit http://www.royalmail.com 
 * 
 * This update puts in the rates for printed papers up to 5 kg. Again it will not differentiate between printed papers
 * and other types of post so do not use this unless you know you are shipping printed papers.
 * Additionally you must have installed the full package before applying this update as it only changes the rates.
 * 
 *   To run this update 
 * 1) Login to your zen cart admin
 * 2) Use Tools>Install SQL Patches
 * 3) Copy the contents of PrintedPapers.sql and paste into the text window
 *    or 
 *    User the Browse button to load PrintedPapers.sql into zen cart.
 * 
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
*  Airmail Europe 
*/
UPDATE configuration SET configuration_value = '0.1:2.7, 0.15:2.93, 0.2:3.16, 0.25:3.39, 0.3:3.62, 0.4:4.22, 0.5:4.82, 0.6:5.42, 0.7:6.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:6.62, 0.9:7.22, 1:7.82, 1.1:8.42, 1.2:9.02, 1.3:9.62, 1.4:10.22, 1.5:10.82, 1.6:11.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:12.02, 1.8:12.62, 1.9:13.22, 2:13.82, 2.1:14.42, 2.2:15.02, 2.3:15.62, 2.4:16.22, 2.5:16.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:17.42, 2.7:18.02, 2.8:18.62, 2.9:19.22, 3:19.82, 3.1:20.42, 3.2:21.02, 3.3:21.62, 3.4:22.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:22.82, 3.6:23.42, 3.7:24.02, 3.8:24.62, 3.9:25.22, 4:25.82, 4.1:26.42, 4.2:27.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:27.62, 4.4:28.22, 4.5:28.82, 4.6:29.42, 4.7:30.02, 4.8:30.62, 4.9:31.22, 5:31.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:3.3, 0.15:3.86, 0.2:4.42, 0.25:4.98, 0.3:5.54, 0.4:6.76, 0.5:7.98, 0.6:9.2, 0.7:10.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:11.64, 0.9:12.86, 1:14.08, 1.1:15.3, 1.2:16.52, 1.3:17.74, 1.4:18.96, 1.5:20.18, 1.6:21.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:22.62, 1.8:23.84, 1.9:25.06, 2:26.28, 2.1:27.5, 2.2:28.72, 2.3:29.94, 2.4:31.16, 2.5:32.38' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:33.6, 2.7:34.82, 2.8:36.04, 2.9:37.26, 3:38.48, 3.1:39.7, 3.2:40.92, 3.3:42.14, 3.4:43.36' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:44.58, 3.6:45.8, 3.7:47.02, 3.8:48.24, 3.9:49.46, 4:50.68, 4.1:51.9, 4.2:53.12' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:54.34, 4.4:55.56, 4.5:56.78, 4.6:58, 4.7:59.22, 4.8:60.44, 4.9:61.66, 5:62.88' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:3.3, 0.15:3.9, 0.2:4.5, 0.25:5.1, 0.3:5.7, 0.4:6.98, 0.5:8.26, 0.6:9.54, 0.7:10.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.8:12.1, 0.9:13.38, 1:14.66, 1.1:15.94, 1.2:17.22, 1.3:18.5, 1.4:19.78, 1.5:21.06, 1.6:22.34' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1.7:23.62, 1.8:24.9, 1.9:26.18, 2:27.46, 2.1:28.74, 2.2:30.02, 2.3:31.3, 2.4:32.58, 2.5:33.86' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '2.6:35.14, 2.7:36.42, 2.8:37.7, 2.9:38.98, 3:40.26, 3.1:41.54, 3.2:42.82, 3.3:44.1, 3.4:45.38' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '3.5:46.66, 3.6:47.94, 3.7:49.22, 3.8:50.5, 3.9:51.78, 4:53.06, 4.1:54.34, 4.2:55.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '4.3:56.9, 4.4:58.18, 4.5:59.46, 4.6:60.74, 4.7:62.02, 4.8:63.3, 4.9:64.58, 5:65.86' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:7.85, 0.15:8.08, 0.2:8.31, 0.25:8.54, 0.3:8.77, 0.4:9.37, 0.5:9.97, 0.6:10.57, 0.7:11.17' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:11.77, 0.9:12.37, 1:12.97, 1.1:13.57, 1.2:14.17, 1.3:14.77, 1.4:15.37, 1.5:15.97, 1.6:16.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:17.17, 1.8:17.77, 1.9:18.37, 2:18.97, 2.1:19.57, 2.2:20.17, 2.3:20.77, 2.4:21.37, 2.5:21.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:22.57, 2.7:23.17, 2.8:23.77, 2.9:24.37, 3:24.97, 3.1:25.57, 3.2:26.17, 3.3:26.77, 3.4:27.37' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:27.97, 3.6:28.57, 3.7:29.17, 3.8:29.77, 3.9:30.37, 4:30.97, 4.1:31.57, 4.2:32.17' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:32.77, 4.4:33.37, 4.5:33.97, 4.6:34.57, 4.7:35.17, 4.8:35.77, 4.9:36.37, 5:36.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.45, 0.15:9.01, 0.2:9.57, 0.25:10.13, 0.3:10.69, 0.4:11.91, 0.5:13.13, 0.6:14.35, 0.7:15.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:16.79, 0.9:18.01, 1:19.23, 1.1:20.45, 1.2:21.67, 1.3:22.89, 1.4:24.11, 1.5:25.33, 1.6:26.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:27.77, 1.8:28.99, 1.9:30.21, 2:31.43, 2.1:32.65, 2.2:33.87, 2.3:35.09, 2.4:36.31, 2.5:37.53' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:38.75, 2.7:39.97, 2.8:41.19, 2.9:42.41, 3:43.63, 3.1:44.85, 3.2:46.07, 3.3:47.29, 3.4:48.51' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:49.73, 3.6:50.95, 3.7:52.17, 3.8:53.39, 3.9:54.61, 4:55.83, 4.1:57.05, 4.2:58.27' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:59.49, 4.4:60.71, 4.5:61.93, 4.6:63.15, 4.7:64.37, 4.8:65.59, 4.9:66.81, 5:68.03' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.45, 0.15:9.05, 0.2:9.65, 0.25:10.25, 0.3:10.85, 0.4:12.13, 0.5:13.41, 0.6:14.69, 0.7:15.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.8:17.25, 0.9:18.53, 1:19.81, 1.1:21.09, 1.2:22.37, 1.3:23.65, 1.4:24.93, 1.5:26.21, 1.6:27.49' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1.7:28.77, 1.8:30.05, 1.9:31.33, 2:32.61, 2.1:33.89, 2.2:35.17, 2.3:36.45, 2.4:37.73, 2.5:39.01' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '2.6:40.29, 2.7:41.57, 2.8:42.85, 2.9:44.13, 3:45.41, 3.1:46.69, 3.2:47.97, 3.3:49.25, 3.4:50.53' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '3.5:51.81, 3.6:53.09, 3.7:54.37, 3.8:55.65, 3.9:56.93, 4:58.21, 4.1:59.49, 4.2:60.77' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '4.3:62.05, 4.4:63.33, 4.5:64.61, 4.6:65.89, 4.7:67.17, 4.8:68.45, 4.9:69.73, 5:71.01' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:7.85, 0.15:8.08, 0.2:8.31, 0.25:8.54, 0.3:8.77, 0.4:9.37, 0.5:9.97, 0.6:10.57, 0.7:11.17' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:11.77, 0.9:12.37, 1:12.97, 1.1:13.57, 1.2:14.17, 1.3:14.77, 1.4:15.37, 1.5:15.97, 1.6:16.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:17.17, 1.8:17.77, 1.9:18.37, 2:18.97, 2.1:19.57, 2.2:20.17, 2.3:20.77, 2.4:21.37, 2.5:21.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:22.57, 2.7:23.17, 2.8:23.77, 2.9:24.37, 3:24.97, 3.1:25.57, 3.2:26.17, 3.3:26.77, 3.4:27.37' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:27.97, 3.6:28.57, 3.7:29.17, 3.8:29.77, 3.9:30.37, 4:30.97, 4.1:31.57, 4.2:32.17' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:32.77, 4.4:33.37, 4.5:33.97, 4.6:34.57, 4.7:35.17, 4.8:35.77, 4.9:36.37, 5:36.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.45, 0.15:9.01, 0.2:9.57, 0.25:10.13, 0.3:10.69, 0.4:11.91, 0.5:13.13, 0.6:14.35, 0.7:15.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:16.79, 0.9:18.01, 1:19.23, 1.1:20.45, 1.2:21.67, 1.3:22.89, 1.4:24.11, 1.5:25.33, 1.6:26.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:27.77, 1.8:28.99, 1.9:30.21, 2:31.43, 2.1:32.65, 2.2:33.87, 2.3:35.09, 2.4:36.31, 2.5:37.53' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:38.75, 2.7:39.97, 2.8:41.19, 2.9:42.41, 3:43.63, 3.1:44.85, 3.2:46.07, 3.3:47.29, 3.4:48.51' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:49.73, 3.6:50.95, 3.7:52.17, 3.8:53.39, 3.9:54.61, 4:55.83, 4.1:57.05, 4.2:58.27' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:59.49, 4.4:60.71, 4.5:61.93, 4.6:63.15, 4.7:64.37, 4.8:65.59, 4.9:66.81, 5:68.03' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.45, 0.15:9.05, 0.2:9.65, 0.25:10.25, 0.3:10.85, 0.4:12.13, 0.5:13.41, 0.6:14.69, 0.7:15.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.8:17.25, 0.9:18.53, 1:19.81, 1.1:21.09, 1.2:22.37, 1.3:23.65, 1.4:24.93, 1.5:26.21, 1.6:27.49' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1.7:28.77, 1.8:30.05, 1.9:31.33, 2:32.61, 2.1:33.89, 2.2:35.17, 2.3:36.45, 2.4:37.73, 2.5:39.01' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '2.6:40.29, 2.7:41.57, 2.8:42.85, 2.9:44.13, 3:45.41, 3.1:46.69, 3.2:47.97, 3.3:49.25, 3.4:50.53' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '3.5:51.81, 3.6:53.09, 3.7:54.37, 3.8:55.65, 3.9:56.93, 4:58.21, 4.1:59.49, 4.2:60.77' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '4.3:62.05, 4.4:63.33, 4.5:64.61, 4.6:65.89, 4.7:67.17, 4.8:68.45, 4.9:69.73, 5:71.01' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_3' ;

/* Airmail Europe Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:10.45, 0.15:10.68, 0.2:10.91, 0.25:11.14, 0.3:11.37, 0.4:11.97, 0.5:12.57, 0.6:13.17, 0.7:13.77' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:14.37, 0.9:14.97, 1:15.57, 1.1:16.17, 1.2:16.77, 1.3:17.37, 1.4:17.97, 1.5:18.57, 1.6:19.17' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:19.77, 1.8:20.37, 1.9:20.97, 2:21.57, 2.1:22.17, 2.2:22.77, 2.3:23.37, 2.4:23.97, 2.5:24.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:25.17, 2.7:25.77, 2.8:26.37, 2.9:26.97, 3:27.57, 3.1:28.17, 3.2:28.77, 3.3:29.37, 3.4:29.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:30.57, 3.6:31.17, 3.7:31.77, 3.8:32.37, 3.9:32.97, 4:33.57, 4.1:34.17, 4.2:34.77' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:35.37, 4.4:35.97, 4.5:36.57, 4.6:37.17, 4.7:37.77, 4.8:38.37, 4.9:38.97, 5:39.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Airmail Rest of World Zone 1 Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:11.05, 0.15:11.61, 0.2:12.17, 0.25:12.73, 0.3:13.29, 0.4:14.51, 0.5:15.73, 0.6:16.95, 0.7:18.17' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:19.39, 0.9:20.61, 1:21.83, 1.1:23.05, 1.2:24.27, 1.3:25.49, 1.4:26.71, 1.5:27.93, 1.6:29.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:30.37, 1.8:31.59, 1.9:32.81, 2:34.03, 2.1:35.25, 2.2:36.47, 2.3:37.69, 2.4:38.91, 2.5:40.13' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:41.35, 2.7:42.57, 2.8:43.79, 2.9:45.01, 3:46.23, 3.1:47.45, 3.2:48.67, 3.3:49.89, 3.4:51.11' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:52.33, 3.6:53.55, 3.7:54.77, 3.8:55.99, 3.9:57.21, 4:58.43, 4.1:59.65, 4.2:60.87' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:62.09, 4.4:63.31, 4.5:64.53, 4.6:65.75, 4.7:66.97, 4.8:68.19, 4.9:69.41, 5:70.63' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_2' ;

/* Airmail Rest of World Zone 2 Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:11.05, 0.15:11.65, 0.2:12.25, 0.25:12.85, 0.3:13.45, 0.4:14.73, 0.5:16.01, 0.6:17.29, 0.7:18.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.8:19.85, 0.9:21.13, 1:22.41, 1.1:23.69, 1.2:24.97, 1.3:26.25, 1.4:27.53, 1.5:28.81, 1.6:30.09' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1.7:31.37, 1.8:32.65, 1.9:33.93, 2:35.21, 2.1:36.49, 2.2:37.77, 2.3:39.05, 2.4:40.33, 2.5:41.61' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '2.6:42.89, 2.7:44.17, 2.8:45.45, 2.9:46.73, 3:48.01, 3.1:49.29, 3.2:50.57, 3.3:51.85, 3.4:53.13' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '3.5:54.41, 3.6:55.69, 3.7:56.97, 3.8:58.25, 3.9:59.53, 4:60.81, 4.1:62.09, 4.2:63.37' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '4.3:64.65, 4.4:65.93, 4.5:67.21, 4.6:68.49, 4.7:69.77, 4.8:71.05, 4.9:72.33, 5:73.61' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:2.2, 0.15:2.54, 0.2:2.88, 0.25:3.22, 0.3:3.56, 0.4:4.21, 0.5:4.86, 0.6:5.51, 0.7:6.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:6.81, 0.9:7.46, 1:8.11, 1.1:8.76, 1.2:9.41, 1.3:10.06, 1.4:10.71, 1.5:11.36, 1.6:12.01' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:12.66, 1.8:13.31, 1.9:13.96, 2:14.61, 2.1:15.26, 2.2:15.91, 2.3:16.56, 2.4:17.21, 2.5:17.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:18.51, 2.7:19.16, 2.8:19.81, 2.9:20.46, 3:21.11, 3.1:21.76, 3.2:22.41, 3.3:23.06, 3.4:23.71' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:24.36, 3.6:25.01, 3.7:25.66, 3.8:26.31, 3.9:26.96, 4:27.61, 4.1:28.26, 4.2:28.91' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:29.56, 4.4:30.21, 4.5:30.86, 4.6:31.51, 4.7:32.16, 4.8:32.81, 4.9:33.46, 5:34.11' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_1' ;

/* Surface mail Europe Signed for */
UPDATE configuration SET configuration_value = '0.1:7.35, 0.15:7.69, 0.2:8.03, 0.25:8.37, 0.3:8.71, 0.4:9.36, 0.5:10.01, 0.6:10.66, 0.7:11.31' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:11.96, 0.9:12.61, 1:13.26, 1.1:13.91, 1.2:14.56, 1.3:15.21, 1.4:15.86, 1.5:16.51, 1.6:17.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:17.81, 1.8:18.46, 1.9:19.11, 2:19.76, 2.1:20.41, 2.2:21.06, 2.3:21.71, 2.4:22.36, 2.5:23.01' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:23.66, 2.7:24.31, 2.8:24.96, 2.9:25.61, 3:26.26, 3.1:26.91, 3.2:27.56, 3.3:28.21, 3.4:28.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:29.51, 3.6:30.16, 3.7:30.81, 3.8:31.46, 3.9:32.11, 4:32.76, 4.1:33.41, 4.2:34.06' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:34.71, 4.4:35.36, 4.5:36.01, 4.6:36.66, 4.7:37.31, 4.8:37.96, 4.9:38.61, 5:39.26' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_1' ;

/* Surface mail Europe Signed for Insurance to £500 */
UPDATE configuration SET configuration_value = '0.1:9.95, 0.15:10.29, 0.2:10.63, 0.25:10.97, 0.3:11.31, 0.4:11.96, 0.5:12.61, 0.6:13.26, 0.7:13.91' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:14.56, 0.9:15.21, 1:15.86, 1.1:16.51, 1.2:17.16, 1.3:17.81, 1.4:18.46, 1.5:19.11, 1.6:19.76' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:20.41, 1.8:21.06, 1.9:21.71, 2:22.36, 2.1:23.01, 2.2:23.66, 2.3:24.31, 2.4:24.96, 2.5:25.61' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:26.26, 2.7:26.91, 2.8:27.56, 2.9:28.21, 3:28.86, 3.1:29.51, 3.2:30.16, 3.3:30.81, 3.4:31.46' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:32.11, 3.6:32.76, 3.7:33.41, 3.8:34.06, 3.9:34.71, 4:35.36, 4.1:36.01, 4.2:36.66' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:37.31, 4.4:37.96, 4.5:38.61, 4.6:39.26, 4.7:39.91, 4.8:40.56, 4.9:41.21, 5:41.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:2.2, 0.15:2.54, 0.2:2.88, 0.25:3.22, 0.3:3.56, 0.4:4.21, 0.5:4.86, 0.6:5.51, 0.7:6.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:6.81, 0.9:7.46, 1:8.11, 1.1:8.76, 1.2:9.41, 1.3:10.06, 1.4:10.71, 1.5:11.36, 1.6:12.01' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:12.66, 1.8:13.31, 1.9:13.96, 2:14.61, 2.1:15.26, 2.2:15.91, 2.3:16.56, 2.4:17.21, 2.5:17.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:18.51, 2.7:19.16, 2.8:19.81, 2.9:20.46, 3:21.11, 3.1:21.76, 3.2:22.41, 3.3:23.06, 3.4:23.71' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:24.36, 3.6:25.01, 3.7:25.66, 3.8:26.31, 3.9:26.96, 4:27.61, 4.1:28.26, 4.2:28.91' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:29.56, 4.4:30.21, 4.5:30.86, 4.6:31.51, 4.7:32.16, 4.8:32.81, 4.9:33.46, 5:34.11' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for */
UPDATE configuration SET configuration_value = '0.1:7.35, 0.15:7.69, 0.2:8.03, 0.25:8.37, 0.3:8.71, 0.4:9.36, 0.5:10.01, 0.6:10.66, 0.7:11.31' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:11.96, 0.9:12.61, 1:13.26, 1.1:13.91, 1.2:14.56, 1.3:15.21, 1.4:15.86, 1.5:16.51, 1.6:17.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:17.81, 1.8:18.46, 1.9:19.11, 2:19.76, 2.1:20.41, 2.2:21.06, 2.3:21.71, 2.4:22.36, 2.5:23.01' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:23.66, 2.7:24.31, 2.8:24.96, 2.9:25.61, 3:26.26, 3.1:26.91, 3.2:27.56, 3.3:28.21, 3.4:28.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:29.51, 3.6:30.16, 3.7:30.81, 3.8:31.46, 3.9:32.11, 4:32.76, 4.1:33.41, 4.2:34.06' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:34.71, 4.4:35.36, 4.5:36.01, 4.6:36.66, 4.7:37.31, 4.8:37.96, 4.9:38.61, 5:39.26' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for Insurance to £500 */
UPDATE configuration SET configuration_value = '0.1:9.95, 0.15:10.29, 0.2:10.63, 0.25:10.97, 0.3:11.31, 0.4:11.96, 0.5:12.61, 0.6:13.26, 0.7:13.91' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:14.56, 0.9:15.21, 1:15.86, 1.1:16.51, 1.2:17.16, 1.3:17.81, 1.4:18.46, 1.5:19.11, 1.6:19.76' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:20.41, 1.8:21.06, 1.9:21.71, 2:22.36, 2.1:23.01, 2.2:23.66, 2.3:24.31, 2.4:24.96, 2.5:25.61' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:26.26, 2.7:26.91, 2.8:27.56, 2.9:28.21, 3:28.86, 3.1:29.51, 3.2:30.16, 3.3:30.81, 3.4:31.46' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:32.11, 3.6:32.76, 3.7:33.41, 3.8:34.06, 3.9:34.71, 4:35.36, 4.1:36.01, 4.2:36.66' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:37.31, 4.4:37.96, 4.5:38.61, 4.6:39.26, 4.7:39.91, 4.8:40.56, 4.9:41.21, 5:41.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_2' ;

/* Airsure Europe */
UPDATE configuration SET configuration_value = '0.1:7.7, 0.15:7.93, 0.2:8.16, 0.25:8.39, 0.3:8.62, 0.4:9.22, 0.5:9.82, 0.6:10.42, 0.7:11.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:11.62, 0.9:12.22, 1:12.82, 1.1:13.42, 1.2:14.02, 1.3:14.62, 1.4:15.22, 1.5:15.82, 1.6:16.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:17.02, 1.8:17.62, 1.9:18.22, 2:18.82, 2.1:19.42, 2.2:20.02, 2.3:20.62, 2.4:21.22, 2.5:21.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:22.42, 2.7:23.02, 2.8:23.62, 2.9:24.22, 3:24.82, 3.1:25.42, 3.2:26.02, 3.3:26.62, 3.4:27.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:27.82, 3.6:28.42, 3.7:29.02, 3.8:29.62, 3.9:30.22, 4:30.82, 4.1:31.42, 4.2:32.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:32.62, 4.4:33.22, 4.5:33.82, 4.6:34.42, 4.7:35.02, 4.8:35.62, 4.9:36.22, 5:36.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_1' ;

/* Airsure Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.15:8.86, 0.2:9.42, 0.25:9.98, 0.3:10.54, 0.4:11.76, 0.5:12.98, 0.6:14.2, 0.7:15.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:16.64, 0.9:17.86, 1:19.08, 1.1:20.3, 1.2:21.52, 1.3:22.74, 1.4:23.96, 1.5:25.18, 1.6:26.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:27.62, 1.8:28.84, 1.9:30.06, 2:31.28, 2.1:32.5, 2.2:33.72, 2.3:34.94, 2.4:36.16, 2.5:37.38' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:38.6, 2.7:39.82, 2.8:41.04, 2.9:42.26, 3:43.48, 3.1:44.7, 3.2:45.92, 3.3:47.14, 3.4:48.36' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:49.58, 3.6:50.8, 3.7:52.02, 3.8:53.24, 3.9:54.46, 4:55.68, 4.1:56.9, 4.2:58.12' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:59.34, 4.4:60.56, 4.5:61.78, 4.6:63, 4.7:64.22, 4.8:65.44, 4.9:66.66, 5:67.88' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_2' ;

/* Airsure Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.15:8.9, 0.2:9.5, 0.25:10.1, 0.3:10.7, 0.4:11.98, 0.5:13.26, 0.6:14.54, 0.7:15.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.8:17.1, 0.9:18.38, 1:19.66, 1.1:20.94, 1.2:22.22, 1.3:23.5, 1.4:24.78, 1.5:26.06, 1.6:27.34' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1.7:28.62, 1.8:29.9, 1.9:31.18, 2:32.46, 2.1:33.74, 2.2:35.02, 2.3:36.3, 2.4:37.58, 2.5:38.86' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '2.6:40.14, 2.7:41.42, 2.8:42.7, 2.9:43.98, 3:45.26, 3.1:46.54, 3.2:47.82, 3.3:49.1, 3.4:50.38' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '3.5:51.66, 3.6:52.94, 3.7:54.22, 3.8:55.5, 3.9:56.78, 4:58.06, 4.1:59.34, 4.2:60.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '4.3:61.9, 4.4:63.18, 4.5:64.46, 4.6:65.74, 4.7:67.02, 4.8:68.3, 4.9:69.58, 5:70.86' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_3' ;

/* Airsure Europe insurance up to £500 */
UPDATE configuration SET configuration_value = '0.1:10.3, 0.15:10.53, 0.2:10.76, 0.25:10.99, 0.3:11.22, 0.4:11.82, 0.5:12.42, 0.6:13.02, 0.7:13.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.8:14.22, 0.9:14.82, 1:15.42, 1.1:16.02, 1.2:16.62, 1.3:17.22, 1.4:17.82, 1.5:18.42, 1.6:19.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1.7:19.62, 1.8:20.22, 1.9:20.82, 2:21.42, 2.1:22.02, 2.2:22.62, 2.3:23.22, 2.4:23.82, 2.5:24.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '2.6:25.02, 2.7:25.62, 2.8:26.22, 2.9:26.82, 3:27.42, 3.1:28.02, 3.2:28.62, 3.3:29.22, 3.4:29.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '3.5:30.42, 3.6:31.02, 3.7:31.62, 3.8:32.22, 3.9:32.82, 4:33.42, 4.1:34.02, 4.2:34.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '4.3:35.22, 4.4:35.82, 4.5:36.42, 4.6:37.02, 4.7:37.62, 4.8:38.22, 4.9:38.82, 5:39.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_1' ;

/* Airsure Rest of World Zone 1 insurance up to £500 */
UPDATE configuration SET configuration_value = '0.1:10.9, 0.15:11.46, 0.2:12.02, 0.25:12.58, 0.3:13.14, 0.4:14.36, 0.5:15.58, 0.6:16.8, 0.7:18.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.8:19.24, 0.9:20.46, 1:21.68, 1.1:22.9, 1.2:24.12, 1.3:25.34, 1.4:26.56, 1.5:27.78, 1.6:29' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1.7:30.22, 1.8:31.44, 1.9:32.66, 2:33.88, 2.1:35.1, 2.2:36.32, 2.3:37.54, 2.4:38.76, 2.5:39.98' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '2.6:41.2, 2.7:42.42, 2.8:43.64, 2.9:44.86, 3:46.08, 3.1:47.3, 3.2:48.52, 3.3:49.74, 3.4:50.96' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '3.5:52.18, 3.6:53.4, 3.7:54.62, 3.8:55.84, 3.9:57.06, 4:58.28, 4.1:59.5, 4.2:60.72' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '4.3:61.94, 4.4:63.16, 4.5:64.38, 4.6:65.6, 4.7:66.82, 4.8:68.04, 4.9:69.26, 5:70.48' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_2' ;

/* Airsure Rest of World Zone 2 insurance up to £500 */
UPDATE configuration SET configuration_value = '0.1:10.9, 0.15:11.5, 0.2:12.1, 0.25:12.7, 0.3:13.3, 0.4:14.58, 0.5:15.86, 0.6:17.14, 0.7:18.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.8:19.7, 0.9:20.98, 1:22.26, 1.1:23.54, 1.2:24.82, 1.3:26.1, 1.4:27.38, 1.5:28.66, 1.6:29.94' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1.7:31.22, 1.8:32.5, 1.9:33.78, 2:35.06, 2.1:36.34, 2.2:37.62, 2.3:38.9, 2.4:40.18, 2.5:41.46' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '2.6:42.74, 2.7:44.02, 2.8:45.3, 2.9:46.58, 3:47.86, 3.1:49.14, 3.2:50.42, 3.3:51.7, 3.4:52.98' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '3.5:54.26, 3.6:55.54, 3.7:56.82, 3.8:58.1, 3.9:59.38, 4:60.66, 4.1:61.94, 4.2:63.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '4.3:64.5, 4.4:65.78, 4.5:67.06, 4.6:68.34, 4.7:69.62, 4.8:70.9, 4.9:72.18, 5:73.46' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_3' ;
