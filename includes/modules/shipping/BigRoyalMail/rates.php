<?php
/*
 * This file contains the default expiry date and rates for BigRoyal Mail.
 * It is used in the install function to get the initial rates for the specific method.
 * This method saves changing all the files in shipping each time there is an update to the shipping rates.
 * 
 * Version : 3.9.0 - 20240401 - BrittainMark
 */
        $rateExpires = '2025-04-01 00:00:01';
        $rates = [
            'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' => '0.1:1.35',
            'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' => '0.1:0.85',
            'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' => '0.1:3.05',
            'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' => '0.1:2.55',
            'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1' => '2:6.69,10:8.39,20:12.49',
            'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1' => '2:5.89,10:7.39,20:10.99',
            'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1' => '2:8.09,10:9.79,20:13.89',
            'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1' => '2:7.29,10:8.79,20:12.39',
            'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1' => '0.1:2.1, 0.25:2.9, 0.5:3.5, 0.75:3.5',
            'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1' => '0.1:3.8, 0.25:4.6, 0.5:5.2, 0.75:5.2',
            'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1' => '0.1:1.55, 0.25:2.1, 0.5:2.5, 0.75:2.7',
            'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1' => '0.1:3.25, 0.25:3.8, 0.5:4.2, 0.75:4.4',
            'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_COST0_1' => '2:4.59',
            'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_COST0_1' => '2:3.69',
            'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1' => '1:5.39, 2:5.99',
            'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1' => '1:4.69, 2:5.09',
            'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_1' => '0.1:2.5',
            'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_2' => '0.1:2.5',
            'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_3' => '0.1:2.5',
            'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_4' => '0.1:2.5',
            'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_1' => '0.1:3.25,0.25:5.45,0.5:6.55, 0.75:7.65',
            'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_2' => '0.1:4.2,0.25:7.05,0.5:9.55, 0.75:12.5',
            'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_3' => '0.1:4.2,0.25:8.25,0.5:11.6, 0.75:15.7',
            'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_4' => '0.1:4.2,0.25:7.2,0.5:9.9, 0.75:13',
            'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_1' => '0.1:8.15',
            'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_2' => '0.1:8.15',
            'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_3' => '0.1:8.15',
            'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_4' => '0.1:8.15',
            'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_1' => '0.1:9.65,0.25:10.9,0.5:11.7, 0.75:12.15',
            'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_2' => '0.1:10.65,0.25:12.3,0.5:14.3, 0.75:16.35',
            'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_3' => '0.1:10.8,0.25:13.5,0.5:16.3, 0.75:19.35',
            'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_4' => '0.1:10.75,0.25:12.5,0.5:14.65, 0.75:16.85',
            'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_1' => '0.1:7.9',
            'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_2' => '0.1:7.9',
            'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_3' => '0.1:7.9',
            'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_4' => '0.1:7.9',
            'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_1' => '0.1:9.5,0.25:10.5,0.5:11.6,0.75:12.05',
            'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_2' => '0.1:10.55,0.25:12.15,0.5:14.2,0.75:16.25',
            'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_3' => '0.1:10.6,0.25:13.35,0.5:16.15,0.75:19.25',
            'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_4' => '0.1:10.6,0.25:12.4,0.5:14.5,0.75:16.7',
            'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_1' => '0.1:8.15',
            'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_2' => '0.1:8.15',
            'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_3' => '0.1:8.15',
            'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_1' => '0.1:9.65,0.25:10.9,0.5:11.7,0.75:12.15',
            'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_2' => '0.1:10.65,0.25:12.3,0.5:14.3,0.75:16.35',
            'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_3' => '0.1:10.8,0.25:13.5,0.5:16.3,0.75:19.35',
            'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' => '0.25:8.3,0.5:10.4,0.75:11.7,1:13.05,1.5:14.15,2:15.8',
            'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' => '0.25:8.45,0.5:10.75,0.75:12.1,1:13.35,1.5:14.7,2:16.35',
            'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' => '0.25:9.25,0.5:11.4,0.75:12.95,1:14.45,1.25:15.75,1.5:17,2:18.5',
            'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4' => '0.1:11,0.25:12.5,0.5:17,0.75:20,1:23.1,1.25:25.75,1.5:28.2,2:29.55',
            'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_5' => '0.1:12.45,0.25:13.5,0.5:18.7,0.75:22.1,1:25.7,1.25:29,1.5:32.4,2:34.25',
            'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_6' => '0.1:12.5,0.25:14.25,0.5:20.45,0.75:23.5,1:27.5,1.25:31.3,1.5:34.3,2:35.7',
            'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' => '0.25:13.75,0.5:15.2,0.75:16.35,1:17.4,1.25:18,1.5:18.1,2:18.25',
            'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' => '0.25:13.9,0.5:15.6,0.75:16.7,1:17.7,1.25:18.05,1.5:18.3,2:18.8',
            'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' => '0.25:15.3,0.5:17,0.75:18.25,1:19.55,1.25:20.25,1.5:20.9,2:21.4',
            'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4' => '0.1:17.7,0.25:18.1,0.5:22.4,0.75:25,1:27.95,1.25:30.15,1.5:31.7,2:32.2',
            'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_5' => '0.1:19,0.25:19.35,0.5:24.3,0.75:27.4,1:30.85,1.25:33.55,1.5:36.3,2:37.45',
            'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' => '0.25:12.05,0.5:13.35,0.75:14.35,1:15,2:15.5',
            'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' => '0.25:12.4,0.5:13.7,0.75:14.75,1:15.45,1.5:15.9,2:17.45',
            'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' => '0.25:13.25,0.5:15,0.75:15.95,1:16.7,1.25:17.55,1.5:18.45,2:19.2',
            'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4' => '0.25:15.25,0.5:19.7,0.75:22.4,1:25.3,1.25:27.45,1.5:29,2:30.2',
            'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_5' => '0.25:16.7,0.5:21.8,0.75:24.85,1:28.1,1.25:31.2,1.5:33.95,2:35.8',
            'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_6' => '0.25:17.2,0.5:21.85,0.75:24.7,1:27.65,2:31.85',
            'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' => '0.25:13.75,0.5:15.2,0.75:16.35,1:17.4,1.25:18,1.5:18.1,2:18.25',
            'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' => '0.25:13.9,0.5:15.6,0.75:16.7,1:17.7,1.25:18.05,1.5:18.3,2:18.8',
            'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' => '0.25:15.3,0.5:17,0.75:18.25,1:19.55,1.25:20.25,1.5:20.9,2:21.4',
            'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4' => '0.1:17.7,0.25:18.1,0.5:22.4,0.75:25,1:27.95,1.25:30.15,1.5:31.7,2:32.2',
            'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_5' => '0.1:19,0.25:19.35,0.5:24.3,0.75:27.4,1:30.85,1.25:33.55,1.5:36.3,2:37.45',
            'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_6' => '0.1:18.45,0.25:20.2,0.5:26.15,0.75:28.35,1:32.35,1.25:36.15,1.5:39.15,2:39.7',
            'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_COST0_1' => '5:27.45,10:30.45,20:33.95,30:37.95',
            'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_COST0_1' => '5:13.45,10:16.45,20:19.95,30:23.95',
            'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_COST0_1' => '5:12.95,10:14.95,20:17.95,30:20.95',
            'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_COST0_1' => '5:57.45,10:65.45,20:73.95,30:87.95',
            'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_COST0_1' => '5:17.45,10:20.45,20:23.95,30:27.95',
            'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' => '0.25:7.45,0.5:10.35,0.75:11.65,1:13,1.5:14.3,2:16.2',
            'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' => '0.25:7.45,0.5:10.35,0.75:11.65,1:13,1.5:14.3,2:16.2',
            'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' => '0.1:7.95, 0.5:8.95, 1:9.95, 2:12.75, 10:17.75, 20:21.75',
            'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_COST0_1' => '0.1:12.54, 0.5:13.74, 1:14.94, 2:18.3, 10:24.3, 20:29.1',
            'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' => '0.1:29.95, 0.5:34.95, 1:39.95, 2:49.95',
            'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_COST0_1' => '0.1:32.95, 0.5:37.95, 1:42.95, 2:52.95',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' => '0.5:57.93, 1:60.74, 1.5:63.55, 2:66.36, 2.5:69.17, 3:71.97, 3.5:74.78, 4:77.59, 4.5:80.4, 5:83.21, 5.5:86.28, 6:89.36, 6.5:92.43, 7:95.51, 7.5:98.58, 8:101.65, 8.5:104.73, 9:107.8, 9.5:110.88, 10:113.95',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' => '0.5:50.82, 1:53.49, 1.5:56.16, 2:58.83, 2.5:62.77, 3:66.72, 3.5:70.66, 4:74.6, 4.5:78.55, 5:82.49, 5.5:84.33, 6:86.18, 6.5:88.02, 7:89.87, 7.5:91.71, 8:93.56, 8.5:95.4, 9:97.24, 9.5:99.09, 10:100.93',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' => '0.5:46.11, 1:50.43, 1.5:54.76, 2:59.08, 2.5:62.65, 3:66.21, 3.5:69.77, 4:73.33, 4.5:76.89, 5:80.45, 5.5:82.68, 6:84.91, 6.5:87.13, 7:89.36, 7.5:91.58, 8:93.81, 8.5:96.04, 9:98.26, 9.5:100.49, 10:102.71',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' => '0.5:47.45, 1:51.26, 1.5:55.08, 2:58.89, 2.5:63.35, 3:67.8, 3.5:72.25, 4:76.7, 4.5:81.15, 5:85.61, 5.5:88.98, 6:92.35, 6.5:95.72, 7:99.09, 7.5:102.46, 8:105.83, 8.5:109.2, 9:112.57, 9.5:115.94, 10:119.31',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' => '0.5:50.94, 1:55.01, 1.5:59.08, 2:63.15, 2.5:66.46, 3:69.77, 3.5:73.08, 4:76.38, 4.5:79.69, 5:83, 5.5:86.31, 6:89.61, 6.5:92.92, 7:96.23, 7.5:99.53, 8:102.84, 8.5:106.15, 9:109.46, 9.5:112.76, 10:116.07',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' => '0.5:55.65, 1:60.61, 1.5:65.57, 2:70.53, 2.5:78.48, 3:86.43, 3.5:94.38, 4:102.33, 4.5:110.28, 5:118.23, 5.5:123.57, 6:128.92, 6.5:134.26, 7:139.6, 7.5:144.94, 8:150.29, 8.5:155.63, 9:160.97, 9.5:166.31, 10:171.66',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' => '0.5:57.93, 1:63.44, 1.5:68.95, 2:74.47, 2.5:78.86, 3:83.26, 3.5:87.66, 4:92.06, 4.5:96.46, 5:100.86, 5.5:105.52, 6:110.19, 6.5:114.85, 7:119.52, 7.5:124.18, 8:128.84, 8.5:133.51, 9:138.17, 9.5:142.84, 10:147.5',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' => '0.5:70.23, 1:77.49, 1.5:84.75, 2:92.01, 2.5:98.37, 3:104.73, 3.5:111.09, 4:117.45, 4.5:123.81, 5:130.17, 5.5:135.36, 6:140.56, 6.5:145.75, 7:150.94, 7.5:156.14, 8:161.33, 8.5:166.53, 9:171.72, 9.5:176.91, 10:182.11',
            'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' => '0.5:80.19, 1:89.84, 1.5:99.48, 2:109.13, 2.5:118.03, 3:126.94, 3.5:135.84, 4:144.74, 4.5:153.65, 5:162.55, 5.5:169.55, 6:176.54, 6.5:183.54, 7:190.54, 7.5:197.53, 8:204.53, 8.5:211.52, 9:218.52, 9.5:225.51, 10:232.51',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1' => '0.5:25, 1:26, 1.5:27, 2:28, 2.5:29, 3:31.22, 3.5:33.43, 4:35.65, 4.5:37.86, 5:40.08, 5.5:40.5, 6:40.92, 6.5:41.34, 7:41.76, 7.5:42.18, 8:42.6, 8.5:43.02, 9:43.44, 9.5:43.86, 10:44.28',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_2' => '0.5:26, 1:27, 1.5:28, 2:29, 2.5:30, 3:34.8, 3.5:39.6, 4:44.4, 4.5:49.2, 5:54, 5.5:55.14, 6:56.28, 6.5:57.42, 7:58.56, 7.5:59.7, 8:60.84, 8.5:61.98, 9:63.12, 9.5:64.26, 10:65.4',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_3' => '0.5:26, 1:27, 1.5:28, 2:29, 2.5:30, 3:34.98, 3.5:39.96, 4:44.94, 4.5:49.92, 5:54.9, 5.5:55.92, 6:56.94, 6.5:57.96, 7:58.98, 7.5:60, 8:61.02, 8.5:62.04, 9:63.06, 9.5:64.08, 10:65.1',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_4' => '0.5:30, 1:31, 1.5:32, 2:33, 2.5:34, 3:38.14, 3.5:42.29, 4:46.43, 4.5:50.58, 5:54.72, 5.5:56.28, 6:57.84, 6.5:59.4, 7:60.96, 7.5:62.52, 8:64.08, 8.5:65.64, 9:67.2, 9.5:68.76, 10:70.32',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_5' => '0.5:38, 1:39, 1.5:40, 2:41, 2.5:42, 3:45.49, 3.5:48.98, 4:52.48, 4.5:55.97, 5:59.46, 5.5:61.38, 6:63.3, 6.5:65.22, 7:67.14, 7.5:69.06, 8:70.98, 8.5:72.9, 9:74.82, 9.5:76.74, 10:78.66',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_6' => '0.5:42.18, 1:45.4, 1.5:46.9, 2:48.4, 2.5:50, 3:53.69, 3.5:57.38, 4:61.08, 4.5:64.77, 5:68.46, 5.5:70.8, 6:73.14, 6.5:75.48, 7:77.82, 7.5:80.16, 8:82.5, 8.5:84.84, 9:87.18, 9.5:89.52, 10:91.86',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_7' => '0.5:44.8, 1:47.35, 1.5:49.35, 2:51.35, 2.5:53, 3:60.69, 3.5:68.38, 4:76.07, 4.5:83.76, 5:91.45, 5.5:95.2, 6:98.95, 6.5:102.7, 7:106.45, 7.5:110.2, 8:113.95, 8.5:117.7, 9:121.45, 9.5:125.2, 10:128.95',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_8' => '0.5:47.5, 1:53.5, 1.5:57.5, 2:61.5, 2.5:65, 3:72.3, 3.5:79.6, 4:86.9, 4.5:94.2, 5:101.5, 5.5:106.05, 6:110.6, 6.5:115.15, 7:119.7, 7.5:124.25, 8:128.8, 8.5:133.35, 9:137.9, 9.5:142.45, 10:147',
            'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_9' => '0.5:60.15, 1:67.1, 1.5:74.05, 2:81, 2.5:87.9, 3:94.8, 3.5:101.7, 4:108.6, 4.5:115.5, 5:122.4, 5.5:128.6, 6:134.8, 6.5:141, 7:147.2, 7.5:153.4, 8:159.6, 8.5:165.8, 9:172, 9.5:178.2, 10:184.4',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1' => '0.5:9.8, 1:11.04, 1.5:12.3, 2:13.56, 2.5:14.52, 3:15.48, 3.5:16.44, 4:17.4, 4.5:18.36, 5:19.32, 5.5:19.74, 6:20.16, 6.5:20.58, 7:21, 7.5:21.42, 8:21.84, 8.5:22.26, 9:22.68, 9.5:23.1, 10:23.52',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_2' => '0.5:16.85, 1:19.35, 1.5:21.85, 2:24.35, 2.5:25, 3:27.8, 3.5:30.6, 4:33.4, 4.5:36.2, 5:39, 5.5:40.08, 6:41.16, 6.5:42.24, 7:43.32, 7.5:44.4, 8:45.48, 8.5:46.56, 9:47.64, 9.5:48.72, 10:49.8',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_3' => '0.5:22.68, 1:24, 1.5:25, 2:26, 2.5:27, 3:30.2, 3.5:33.41, 4:36.61, 4.5:39.82, 5:43.02, 5.5:44.04, 6:45.06, 6.5:46.08, 7:47.1, 7.5:48.12, 8:49.14, 8.5:50.16, 9:51.18, 9.5:52.2, 10:53.22',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_4' => '0.5:20.58, 1:21.24, 1.5:21.9, 2:22.56, 2.5:25.14, 3:27.72, 3.5:30.3, 4:32.88, 4.5:35.46, 5:38.04, 5.5:40.08, 6:42.12, 6.5:44.16, 7:46.2, 7.5:48.24, 8:50.28, 8.5:52.32, 9:54.36, 9.5:56.4, 10:58.44',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_5' => '0.5:25.92, 1:28.26, 1.5:30.6, 2:32.94, 2.5:34.98, 3:37.02, 3.5:39.06, 4:41.1, 4.5:43.14, 5:45.18, 5.5:46.8, 6:48.42, 6.5:50.04, 7:51.66, 7.5:53.28, 8:54.9, 8.5:56.52, 9:58.14, 9.5:59.76, 10:61.38',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_6' => '0.5:27.12, 1:30.42, 1.5:33.72, 2:37.02, 2.5:39.72, 3:42.42, 3.5:45.12, 4:47.82, 4.5:50.52, 5:53.22, 5.5:55.5, 6:57.78, 6.5:60.06, 7:62.34, 7.5:64.62, 8:66.9, 8.5:69.18, 9:71.46, 9.5:73.74, 10:76.02',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_7' => '0.5:27.7, 1:30.25, 1.5:32.8, 2:35.35, 2.5:41.8, 3:48.25, 3.5:54.7, 4:61.15, 4.5:67.6, 5:74.05, 5.5:77.75, 6:81.45, 6.5:85.15, 7:88.85, 7.5:92.55, 8:96.25, 8.5:99.95, 9:103.65, 9.5:107.35, 10:111.05',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_8' => '0.5:34.55, 1:40.8, 1.5:47.05, 2:53.3, 2.5:59.4, 3:65.5, 3.5:71.6, 4:77.7, 4.5:83.8, 5:89.9, 5.5:94.45, 6:99, 6.5:103.55, 7:108.1, 7.5:112.65, 8:117.2, 8.5:121.75, 9:126.3, 9.5:130.85, 10:135.4',
            'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_9' => '0.5:35.75, 1:42.9, 1.5:50.05, 2:57.2, 2.5:60, 3:68.02, 3.5:76.04, 4:84.06, 4.5:92.08, 5:100.1, 5.5:106.6, 6:113.1, 6.5:119.6, 7:126.1, 7.5:132.6, 8:139.1, 8.5:145.6, 9:152.1, 9.5:158.6, 10:165.1',
            'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1' => '0.5:24.7, 1:27.25, 1.5:29.8, 2:32.35, 2.5:38.8, 3:45.25, 3.5:51.7, 4:58.15, 4.5:64.6, 5:71.05, 5.5:74.75, 6:78.45, 6.5:82.15, 7:85.85, 7.5:89.55, 8:93.25, 8.5:96.95, 9:100.65, 9.5:104.35, 10:108.05',
            'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_2' => '0.5:31.85, 1:38.1, 1.5:44.35, 2:50.6, 2.5:56.7, 3:62.8, 3.5:68.9, 4:75, 4.5:81.1, 5:87.2, 5.5:91.75, 6:96.3, 6.5:100.85, 7:105.4, 7.5:109.95, 8:114.5, 8.5:119.05, 9:123.6, 9.5:128.15, 10:132.7',
            'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_3' => '0.5:33.35, 1:40.5, 1.5:47.65, 2:54.8, 2.5:59.7, 3:67.3, 3.5:74.9, 4:82.5, 4.5:90.1, 5:97.7, 5.5:104.2, 6:110.7, 6.5:117.2, 7:123.7, 7.5:130.2, 8:136.7, 8.5:143.2, 9:149.7, 9.5:156.2, 10:162.7',
            'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_COST0_1' => '2:16.68, 5:17.7, 10:21.12',
            'MODULE_SHIPPING_RMT24LARGELETTER_ZONES_COST0_1' => '0.75:3.5',
            'MODULE_SHIPPING_RMT24LARGELETTERSF_ZONES_COST0_1' => '0.75:5.2',
            'MODULE_SHIPPING_RMT48LARGELETTER_ZONES_COST0_1' => '0.75:2.7',
            'MODULE_SHIPPING_RMT48LARGELETTERSF_ZONES_COST0_1' => '0.75:4.4',
            'MODULE_SHIPPING_RMT24SMLPARCEL_ZONES_COST0_1' => '2:4.79',
            'MODULE_SHIPPING_RMT48SMLPARCEL_ZONES_COST0_1' => '2:3.89',
            'MODULE_SHIPPING_RMT24SMLPARCELSF_ZONES_COST0_1' => '2:6.19',
            'MODULE_SHIPPING_RMT48SMLPARCELSF_ZONES_COST0_1' => '2:5.29',
            'MODULE_SHIPPING_RMT24MEDPARCEL_ZONES_COST0_1' => '2:7.09,10:8.79,20:12.89',
            'MODULE_SHIPPING_RMT48MEDPARCEL_ZONES_COST0_1' => '2:6.29,10:7.79,20:11.39',
            'MODULE_SHIPPING_RMT24MEDPARCELSF_ZONES_COST0_1' => '2:8.49,10:10.19,20:14.29',
            'MODULE_SHIPPING_RMT48MEDPARCELSF_ZONES_COST0_1' => '2:7.69,10:9.19,20:12.79',
        ];
