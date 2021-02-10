/* 
 * Update for Big royal Mail postage rates valid from 31 March 2014 for latest rates visit http://www.royalmail.com 
 * 
 * Assumes weights in Kg costs in GBP.
 * 
 * created by Mark Brittain. 
 * 
 * Donations via paypal to info@inner-light.co.uk
 * 
 * N.B. I do not guarantee to update this every year please check the rates with royal mail.
 * 
 * ***** update descriptions as descritpions.txt*****
 
*/
SET @Default_Insurance = "20.00";

/* @Signed_Insurance*/
SET @Signed_Insurance = "50.00";

/* @Min_Insurance = Penny more that signed for insurance */
SET @Min_Insurance = "50.01";

/* @Max_Insurance = Penny more that signed for insurance */
SET @Max_Insurance = "2500.00";

/* @Max_Insurance Tracked signed for*/
SET @AS_Insurance = "250.00";

/* @Max_Insurance Parcel force */
SET @PFValue_Insurance = "500.00";

/* @Expires_date = Date you want to be reminded of to update new rates */
SET @Expires_date = "2015-03-29";

/*
 * If you require different handling fees for each separate type of postage please either remove the handling fees section below or replace the @... values with
 * the appropriate fees.
 */
 
/* Handling fee for uk orders */
SET @UKHandling = "0.00"; 

/* Handling fee for European orders */
SET @EuropeHandling = "0.00"; 

/* Handling fee for rest of world Zone 1 orders */
SET @ROWHandling = "0.00"; 

/* Handling fee for rest of world Zone 2 orders */
SET @ROWHandlingZ2 = "0.00"; 

/* Handling fee for Parcel Force orders */
SET @PFHandling = "0.00"; 

/* Handling fee for Parcel Force Global World Wide orders */
SET @PFHandlingGWW = "0.00"; 


/* SET the reminder date */
UPDATE configuration SET configuration_value = @Expires_date WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';

/* UK Postage rates 
*  Minimum and Maximum order values  */
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AMSAT_MAX_ORDERVALUE' ;

/* Postage and Packing Handling Charges */
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_HANDLING_1' ;

/* Postage rates comma separated, format weight:cost e.g. 0.1:0.46, 0.2:1.78 is 100g £0.46, 200g £1.78 (assuming Kg for weight)  
*  First Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.62' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

/* First Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.72' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

/* First Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.93, 0.25:1.24, 0.5:1.65, 0.75:2.38' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1' ;

/* First Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:2.03, 0.25:2.34, 0.5:2.75, 0.75:3.48' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1' ;

/* Second Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.53' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

/* Second Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.63' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

/* Second Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.73, 0.25:1.17, 0.5:1.48, 0.75:2.01' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1' ;

/* Second Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.83, 0.25:2.27, 0.5:2.58, 0.75:3.11' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1' ;

/* First Class Small Parcel */
UPDATE configuration SET configuration_value = '1:3.2, 2:5.45' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_COST0_1' ;

/* Second Class Small Parcel */
UPDATE configuration SET configuration_value = '1:2.8, 2:3.8' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_COST0_1' ;

/* First Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:4.3, 2:6.55' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1' ;

/* Second Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:3.9, 2:4.9' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1' ;

/* First Class Medium Parcel */
UPDATE configuration SET configuration_value = '1:5.65, 2:8.9, 5:15.85, 10:21.9, 20:33.4' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1' ;

/* Second Class  Medium Parcel  */
UPDATE configuration SET configuration_value = '1:5.2, 2:8, 5:13.75, 10:20.25, 20:28.55' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1' ;

/* First Class  Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.75, 2:10, 5:16.95, 10:23, 20:34.5' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1' ;

/* Second Class Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.3, 2:9.1, 5:14.85, 10:21.35, 20:29.65' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1' ;

/* Special Delivery */
UPDATE configuration SET configuration_value = '0.1:6.4, 0.5:7.15, 1:8.45, 2:11, 10:26.6, 20:41.2' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' ;

/* Special Delivery Insurance rates */
UPDATE configuration SET configuration_value = '500:0,1000:1,2500:3' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_INSURE' ;

/* Special Delivery 9am */
UPDATE configuration SET configuration_value = '0.1:18.18, 0.5:20.52, 1:22.26, 2:26.94' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance  */
UPDATE configuration SET configuration_value = '50:0,1000:2.2,2500:5.7' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_INSURE' ;

/* Special Delivery Saturday*/
UPDATE configuration SET configuration_value = '0.1:10.68, 0.5:11.58, 1:13.14, 2:16.20, 10:34.92, 20:52.44' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_COST0_1' ;

/* Special Delivery Saturday Insurance rates */
UPDATE configuration SET configuration_value = '500:0,1000:1.2,2500:3.6' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_INSURE' ;

/* Special Delivery Saturday 9am */
UPDATE configuration SET configuration_value = '0.1:21.18, 0.5:23.52, 1:25.26, 2:29.94' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_COST0_1' ;

/* Special Delivery Saturday 9am Insurance  */
UPDATE configuration SET configuration_value = '50:0,1000:2.2,2500:5.7' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_INSURE' ;

/* Parcel Force Express 48 */
UPDATE configuration SET configuration_value = '2:11.99, 5:12.98, 10:16.4, 15:23.14, 20:28.51, 25:39.64, 30:43.78, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_COST0_1' ;

/* Parcel Force Express 48 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_INSURE' ;

/* Parcel Force Express 24 */
UPDATE configuration SET configuration_value = '2:16.49, 5:17.48, 10:20.9, 15:27.64, 20:33.01, 25:44.14, 30:48.28, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_COST0_1' ;

/* Parcel Force Express 24 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_INSURE' ;

/* Parcel Force Express AM */
UPDATE configuration SET configuration_value = '2:21.49, 5:22.49, 10:25.91, 15:32.64, 20:38.02, 25:49.14, 30:53.28, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_COST0_1' ;

/* Parcel Force Express AM Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_INSURE' ;

/* Parcel Force Express 10 */
UPDATE configuration SET configuration_value = '2:31.49, 5:32.48, 10:35.9, 15:42.64, 20:48.01, 25:59.14, 30:63.28, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_COST0_1' ;

/* Parcel Force Express 10 Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_INSURE' ;

/* Parcel Force Express 9 */
UPDATE configuration SET configuration_value = '2:41.48, 5:42.48, 10:45.9, 15:52.63, 20:58.01, 25:69.13, 30:73.27, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_COST0_1' ;

/* Parcel Force Express 9 Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_INSURE' ;


/* Overseas Mailing 
*  Minimum and Maximum order values  */
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @PFValue_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_MAX_ORDERVALUE' ;


/* Postage and Packing Handling charges */
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_HANDLING' ;


/* Postage Rates 
*  Airmail Europe */
UPDATE configuration SET configuration_value = '0.1:3.2, 0.25:3.7, 0.5:5.15, 0.75:6.6, 1:8.05, 1.25:9.5, 1.5:10.95, 1.75:12.4, 2:13.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:3.8, 0.25:4.75, 0.5:7.45, 0.75:10.15, 1:12.85, 1.25:15.55, 1.5:18.25, 1.75:20.95, 2:23.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:4, 0.25:5.05, 0.5:7.9, 0.75:10.75, 1:13.6, 1.25:16.45, 1.5:19.3, 1.75:22.15, 2:25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.6, 1:13.05, 1.25:14.5, 1.5:15.95, 1.75:17.4, 2:18.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:15.15, 1:17.85, 1.25:20.55, 1.5:23.25, 1.75:25.95, 2:28.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.75, 1:18.6, 1.25:21.45, 1.5:24.3, 1.75:27.15, 2:30' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* Airmail Signed For Insurance */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_INSURE' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '0.1:9.84, 0.25:10.44, 0.5:12.18, 0.75:13.92, 1:15.66, 1.25:17.4, 1.5:19.14, 1.75:20.88, 2:22.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked EU Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,250:3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_INSURE' ;

/* International Tracked Europe non EU*/
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.6, 1:13.05, 1.25:14.5, 1.5:15.95, 1.75:17.4, 2:18.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:15.15, 1:17.85, 1.25:20.55, 1.5:23.25, 1.75:25.95, 2:28.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.75, 1:18.6, 1.25:21.45, 1.5:24.3, 1.75:27.15, 2:30' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

/* International Tracked Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_INSURE' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.6, 1:13.05, 1.25:14.5, 1.5:15.95, 1.75:17.4, 2:18.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:15.15, 1:17.85, 1.25:20.55, 1.5:23.25, 1.75:25.95, 2:28.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.75, 1:18.6, 1.25:21.45, 1.5:24.3, 1.75:27.15, 2:30' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

/* International Tracked and Signed Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_INSURE' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:2.8, 0.25:3.65, 0.5:5.1, 0.75:6.55, 0.1:8, 0.125:9.45, 1.5:10.9, 1.75:12.35, 2:13.8' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:2.8, 0.25:3.65, 0.5:5.1, 0.75:6.55, 0.1:8, 0.125:9.45, 1.5:10.9, 1.75:12.35, 2:13.8' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;


/* Parcel Force Global Express */
UPDATE configuration SET configuration_value = '0.5:51.95, 1:54.35, 1.5:56.75, 2:59.15, 2.5:61.5, 3:63.85, 3.5:66.2, 4:68.55, 4.5:70.9, 5:73.25, 5.5:75.9, 6:78.55, 6.5:81.2, 7:83.85, 7.5:86.5, 8:89.15, 8.5:91.8, 9:94.45, 9.5:97.1, 10:99.75, 10.5:102.4, 11:105.05, 11.5:107.7, 12:110.35, 12.5:113, 13:115.65, 13.5:118.3, 14:120.95, 14.5:123.6, 15:126.25, .5+:2.65' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:47.46, 1:49.86, 1.5:52.26, 2:54.66, 2.5:57.96, 3:61.26, 3.5:64.56, 4:67.86, 4.5:71.16, 5:74.46, 5.5:76.08, 6:77.7, 6.5:79.32, 7:80.94, 7.5:82.56, 8:84.18, 8.5:85.8, 9:87.42, 9.5:89.04, 10:90.66, 10.5:92.28, 11:93.9, 11.5:95.52, 12:97.14, 12.5:98.76, 13:100.38, 13.5:102, 14:103.62, 14.5:105.24, 15:106.86, .5+:1.62' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:43.02, 1:46.74, 1.5:50.46, 2:54.18, 2.5:57.18, 3:60.18, 3.5:63.18, 4:66.18, 4.5:69.18, 5:72.18, 5.5:74.22, 6:76.26, 6.5:78.3, 7:80.34, 7.5:82.38, 8:84.42, 8.5:86.46, 9:88.5, 9.5:90.54, 10:92.58, 10.5:94.62, 11:96.66, 11.5:98.7, 12:100.74, 12.5:102.78, 13:104.82, 13.5:106.86, 14:108.9, 14.5:110.94, 15:112.98, .5+:2.04' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:44.16, 1:47.64, 1.5:51.12, 2:54.6, 2.5:58.68, 3:62.76, 3.5:66.84, 4:70.92, 4.5:75, 5:79.08, 5.5:82.08, 6:85.08, 6.5:88.08, 7:91.08, 7.5:94.08, 8:97.08, 8.5:100.08, 9:103.08, 9.5:106.08, 10:109.08, 10.5:112.08, 11:115.08, 11.5:118.08, 12:121.08, 12.5:124.08, 13:127.08, 13.5:130.08, 14:133.08, 14.5:136.08, 15:139.08, .5+:3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:47.52, 1:51.24, 1.5:54.96, 2:58.68, 2.5:61.68, 3:64.68, 3.5:67.68, 4:70.68, 4.5:73.68, 5:76.68, 5.5:79.68, 6:82.68, 6.5:85.68, 7:88.68, 7.5:91.68, 8:94.68, 8.5:97.68, 9:100.68, 9.5:103.68, 10:106.68, 10.5:109.68, 11:112.68, 11.5:115.68, 12:118.68, 12.5:121.68, 13:124.68, 13.5:127.68, 14:130.68, 14.5:133.68, 15:136.68, .5+:3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:51.96, 1:56.52, 1.5:61.08, 2:65.64, 2.5:72.84, 3:80.04, 3.5:87.24, 4:94.44, 4.5:101.64, 5:108.84, 5.5:113.46, 6:118.08, 6.5:122.7, 7:127.32, 7.5:131.94, 8:136.56, 8.5:141.18, 9:145.8, 9.5:150.42, 10:155.04, 10.5:159.66, 11:164.28, 11.5:168.9, 12:173.52, 12.5:178.14, 13:182.76, 13.5:187.38, 14:192, 14.5:196.62, 15:201.24, .5+:4.62' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:52, 1:56.9, 1.5:61.8, 2:66.7, 2.5:70.6, 3:74.5, 3.5:78.4, 4:82.3, 4.5:86.2, 5:90.1, 5.5:94.25, 6:98.4, 6.5:102.55, 7:106.7, 7.5:110.85, 8:115, 8.5:119.15, 9:123.3, 9.5:127.45, 10:131.6, 10.5:135.75, 11:139.9, 11.5:144.05, 12:148.2, 12.5:152.35, 13:156.5, 13.5:160.65, 14:164.8, 14.5:168.95, 15:173.1, .5+:4.15' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:63.05, 1:69.5, 1.5:75.95, 2:82.4, 2.5:88, 3:93.6, 3.5:99.2, 4:104.8, 4.5:110.4, 5:116, 5.5:120.6, 6:125.2, 6.5:129.8, 7:134.4, 7.5:139, 8:143.6, 8.5:148.2, 9:152.8, 9.5:157.4, 10:162, 10.5:166.6, 11:171.2, 11.5:175.8, 12:180.4, 12.5:185, 13:189.6, 13.5:194.2, 14:198.8, 14.5:203.4, 15:208, .5+:4.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:71.8, 1:80.4, 1.5:89, 2:97.6, 2.5:105.55, 3:113.5, 3.5:121.45, 4:129.4, 4.5:137.35, 5:145.3, 5.5:151.45, 6:157.6, 6.5:163.75, 7:169.9, 7.5:176.05, 8:182.2, 8.5:188.35, 9:194.5, 9.5:200.65, 10:206.8, 10.5:212.95, 11:219.1, 11.5:225.25, 12:231.4, 12.5:237.55, 13:243.7, 13.5:249.85, 14:256, 14.5:262.15, 15:268.3, .5+:6.15' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Express Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Priority */
UPDATE configuration SET configuration_value = '0.5:35.4, 1:36.05, 1.5:36.7, 2:37.35, 2.5:38.1, 3:38.85, 3.5:39.6, 4:40.35, 4.5:41.1, 5:41.85, 5.5:42, 6:42.15, 6.5:42.3, 7:42.45, 7.5:42.6, 8:42.75, 8.5:42.9, 9:43.05, 9.5:43.2, 10:43.35, 10.5:43.5, 11:43.65, 11.5:43.8, 12:43.95, 12.5:44.1, 13:44.25, 13.5:44.4, 14:44.55, 14.5:44.7, 15:44.85, .5+:0.15' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:36.42, 1:37.08, 1.5:37.74, 2:38.4, 2.5:40.02, 3:41.64, 3.5:43.26, 4:44.88, 4.5:46.5, 5:48.12, 5.5:49.44, 6:50.76, 6.5:52.08, 7:53.4, 7.5:54.72, 8:56.04, 8.5:57.36, 9:58.68, 9.5:60, 10:61.32, 10.5:62.64, 11:63.96, 11.5:65.28, 12:66.6, 12.5:67.92, 13:69.24, 13.5:70.56, 14:71.88, 14.5:73.2, 15:74.52, .5+:1.32' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:32.28, 1:33.9, 1.5:35.52, 2:37.14, 2.5:38.82, 3:40.5, 3.5:42.18, 4:43.86, 4.5:45.54, 5:47.22, 5.5:48.48, 6:49.74, 6.5:51, 7:52.26, 7.5:53.52, 8:54.78, 8.5:56.04, 9:57.3, 9.5:58.56, 10:59.82, 10.5:61.08, 11:62.34, 11.5:63.6, 12:64.86, 12.5:66.12, 13:67.38, 13.5:68.64, 14:69.9, 14.5:71.16, 15:72.42, .5+:1.26' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:35.46, 1:37.38, 1.5:39.3, 2:41.22, 2.5:43.14, 3:45.06, 3.5:46.98, 4:48.9, 4.5:50.82, 5:52.74, 5.5:54.06, 6:55.38, 6.5:56.7, 7:58.02, 7.5:59.34, 8:60.66, 8.5:61.98, 9:63.3, 9.5:64.62, 10:65.94, 10.5:67.26, 11:68.58, 11.5:69.9, 12:71.22, 12.5:72.54, 13:73.86, 13.5:75.18, 14:76.5, 14.5:77.82, 15:79.14, .5+:1.32' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:38.52, 1:40.44, 1.5:42.36, 2:44.28, 2.5:46.56, 3:48.84, 3.5:51.12, 4:53.4, 4.5:55.68, 5:57.96, 5.5:59.88, 6:61.8, 6.5:63.72, 7:65.64, 7.5:67.56, 8:69.48, 8.5:71.4, 9:73.32, 9.5:75.24, 10:77.16, 10.5:79.08, 11:81, 11.5:82.92, 12:84.84, 12.5:86.76, 13:88.68, 13.5:90.6, 14:92.52, 14.5:94.44, 15:96.36, .5+:1.92' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:44.16, 1:46.68, 1.5:49.2, 2:51.72, 2.5:54, 3:56.28, 3.5:58.56, 4:60.84, 4.5:63.12, 5:65.4, 5.5:66.78, 6:68.16, 6.5:69.54, 7:70.92, 7.5:72.3, 8:73.68, 8.5:75.06, 9:76.44, 9.5:77.82, 10:79.2, 10.5:80.58, 11:81.96, 11.5:83.34, 12:84.72, 12.5:86.1, 13:87.48, 13.5:88.86, 14:90.24, 14.5:91.62, 15:93, .5+:1.38' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:46.31, 1:50.65, 1.5:54.99, 2:59.33, 2.5:63.98, 3:68.63, 3.5:73.28, 4:77.93, 4.5:82.58, 5:87.23, 5.5:90.18, 6:93.13, 6.5:96.08, 7:99.03, 7.5:101.98, 8:104.93, 8.5:107.88, 9:110.83, 9.5:113.78, 10:116.73, 10.5:119.68, 11:122.63, 11.5:125.58, 12:128.53, 12.5:131.48, 13:134.43, 13.5:137.38, 14:140.33, 14.5:143.28, 15:146.23, .5+:2.95' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:54.18, 1:59.13, 1.5:64.08, 2:69.03, 2.5:73.83, 3:78.63, 3.5:83.43, 4:88.23, 4.5:93.03, 5:97.83, 5.5:102.13, 6:106.43, 6.5:110.73, 7:115.03, 7.5:119.33, 8:123.63, 8.5:127.93, 9:132.23, 9.5:136.53, 10:140.83, 10.5:145.13, 11:149.43, 11.5:153.73, 12:158.03, 12.5:162.33, 13:166.63, 13.5:170.93, 14:175.23, 14.5:179.53, 15:183.83, .5+:4.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:59.53, 1:66.17, 1.5:72.81, 2:79.45, 2.5:86, 3:92.55, 3.5:99.1, 4:105.65, 4.5:112.2, 5:118.75, 5.5:124.5, 6:130.25, 6.5:136, 7:141.75, 7.5:147.5, 8:153.25, 8.5:159, 9:164.75, 9.5:170.5, 10:176.25, 10.5:182, 11:187.75, 11.5:193.5, 12:199.25, 12.5:205, 13:210.75, 13.5:216.5, 14:222.25, 14.5:228, 15:233.75, .5+:5.75' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Priority Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Value */
UPDATE configuration SET configuration_value = '0.5:9.65, 1:10.7, 1.5:11.75, 2:12.8, 2.5:13.6, 3:14.4, 3.5:15.2, 4:16, 4.5:16.8, 5:17.6, 5.5:18.1, 6:18.6, 6.5:19.1, 7:19.6, 7.5:20.1, 8:20.6, 8.5:21.1, 9:21.6, 9.5:22.1, 10:22.6, 10.5:23.1, 11:23.6, 11.5:24.1, 12:24.6, 12.5:25.1, 13:25.6, 13.5:26.1, 14:26.6, 14.5:27.1, 15:27.6, .5+:0.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:16.68, 1:19.26, 1.5:21.84, 2:24.42, 2.5:26.46, 3:28.5, 3.5:30.54, 4:32.58, 4.5:34.62, 5:36.66, 5.5:38.04, 6:39.42, 6.5:40.8, 7:42.18, 7.5:43.56, 8:44.94, 8.5:46.32, 9:47.7, 9.5:49.08, 10:50.46, 10.5:51.84, 11:53.22, 11.5:54.6, 12:55.98, 12.5:57.36, 13:58.74, 13.5:60.12, 14:61.5, 14.5:62.88, 15:64.26, .5+:1.38' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:22.44, 1:24.72, 1.5:27, 2:29.28, 2.5:31.32, 3:33.36, 3.5:35.4, 4:37.44, 4.5:39.48, 5:41.52, 5.5:42.6, 6:43.68, 6.5:44.76, 7:45.84, 7.5:46.92, 8:48, 8.5:49.08, 9:50.16, 9.5:51.24, 10:52.32, 10.5:53.4, 11:54.48, 11.5:55.56, 12:56.64, 12.5:57.72, 13:58.8, 13.5:59.88, 14:60.96, 14.5:62.04, 15:63.12, .5+:1.08' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:20.34, 1:20.34, 1.5:20.34, 2:20.34, 2.5:23.1, 3:25.86, 3.5:28.62, 4:31.38, 4.5:34.14, 5:36.9, 5.5:38.88, 6:40.86, 6.5:42.84, 7:44.82, 7.5:46.8, 8:48.78, 8.5:50.76, 9:52.74, 9.5:54.72, 10:56.7, 10.5:58.68, 11:60.66, 11.5:62.64, 12:64.62, 12.5:66.6, 13:68.58, 13.5:70.56, 14:72.54, 14.5:74.52, 15:76.5, .5+:1.98' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:25.62, 1:27.9, 1.5:30.18, 2:32.46, 2.5:34.26, 3:36.06, 3.5:37.86, 4:39.66, 4.5:41.46, 5:43.26, 5.5:44.88, 6:46.5, 6.5:48.12, 7:49.74, 7.5:51.36, 8:52.98, 8.5:54.6, 9:56.22, 9.5:57.84, 10:59.46, 10.5:61.08, 11:62.7, 11.5:64.32, 12:65.94, 12.5:67.56, 13:69.18, 13.5:70.8, 14:72.42, 14.5:74.04, 15:75.66, .5+:1.62' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:26.82, 1:30.06, 1.5:33.3, 2:36.54, 2.5:39.06, 3:41.58, 3.5:44.1, 4:46.62, 4.5:49.14, 5:51.66, 5.5:53.76, 6:55.86, 6.5:57.96, 7:60.06, 7.5:62.16, 8:64.26, 8.5:66.36, 9:68.46, 9.5:70.56, 10:72.66, 10.5:74.76, 11:76.86, 11.5:78.96, 12:81.06, 12.5:83.16, 13:85.26, 13.5:87.36, 14:89.46, 14.5:91.56, 15:93.66, .5+:2.1' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:27.4, 1:29.85, 1.5:32.3, 2:34.75, 2.5:41.25, 3:47.75, 3.5:54.25, 4:60.75, 4.5:67.25, 5:73.75, 5.5:77.35, 6:80.95, 6.5:84.55, 7:88.15, 7.5:91.75, 8:95.35, 8.5:98.95, 9:102.55, 9.5:106.15, 10:109.75, 10.5:113.35, 11:116.95, 11.5:120.55, 12:124.15, 12.5:127.75, 13:131.35, 13.5:134.95, 14:138.55, 14.5:142.15, 15:145.75, .5+:3.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:34.2, 1:40.55, 1.5:46.9, 2:53.25, 2.5:59.15, 3:65.05, 3.5:70.95, 4:76.85, 4.5:82.75, 5:88.65, 5.5:93.15, 6:97.65, 6.5:102.15, 7:106.65, 7.5:111.15, 8:115.65, 8.5:120.15, 9:124.65, 9.5:129.15, 10:133.65, 10.5:138.15, 11:142.65, 11.5:147.15, 12:151.65, 12.5:156.15, 13:160.65, 13.5:165.15, 14:169.65, 14.5:174.15, 15:178.65, .5+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:35.35, 1:42.35, 1.5:49.35, 2:56.35, 2.5:63.4, 3:70.45, 3.5:77.5, 4:84.55, 4.5:91.6, 5:98.65, 5.5:105.05, 6:111.45, 6.5:117.85, 7:124.25, 7.5:130.65, 8:137.05, 8.5:143.45, 9:149.85, 9.5:156.25, 10:162.65, 10.5:169.05, 11:175.45, 11.5:181.85, 12:188.25, 12.5:194.65, 13:201.05, 13.5:207.45, 14:213.85, 14.5:220.25, 15:226.65, .5+:6.4' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Value Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Economy */
UPDATE configuration SET configuration_value = '0.5:24.45, 1:27.7, 1.5:30.95, 2:34.2, 2.5:39.95, 3:45.7, 3.5:51.45, 4:57.2, 4.5:62.95, 5:68.7, 5.5:71, 6:73.3, 6.5:75.6, 7:77.9, 7.5:80.2, 8:82.5, 8.5:84.8, 9:87.1, 9.5:89.4, 10:91.7, 10.5:94, 11:96.3, 11.5:98.6, 12:100.9, 12.5:103.2, 13:105.5, 13.5:107.8, 14:110.1, 14.5:112.4, 15:114.7, .5+:2.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:31.5, 1:37.3, 1.5:43.1, 2:48.9, 2.5:54.3, 3:59.7, 3.5:65.1, 4:70.5, 4.5:75.9, 5:81.3, 5.5:85.45, 6:89.6, 6.5:93.75, 7:97.9, 7.5:102.05, 8:106.2, 8.5:110.35, 9:114.5, 9.5:118.65, 10:122.8, 10.5:126.95, 11:131.1, 11.5:135.25, 12:139.4, 12.5:143.55, 13:147.7, 13.5:151.85, 14:156, 14.5:160.15, 15:164.3, .5+:4.15' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:33, 1:39.5, 1.5:46, 2:52.5, 2.5:59.1, 3:65.7, 3.5:72.3, 4:78.9, 4.5:85.5, 5:92.1, 5.5:97.7, 6:103.3, 6.5:108.9, 7:114.5, 7.5:120.1, 8:125.7, 8.5:131.3, 9:136.9, 9.5:142.5, 10:148.1, 10.5:153.7, 11:159.3, 11.5:164.9, 12:170.5, 12.5:176.1, 13:181.7, 13.5:187.3, 14:192.9, 14.5:198.5, 15:204.1, .5+:5.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_3' ;

/* Parcel Force Global Economy Insurance Rates */
UPDATE configuration SET configuration_value = '' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_INSURE' ;

/* Parcel Force Ireland Express */
UPDATE configuration SET configuration_value = '0.5:16.49, 1:16.49, 1.5:16.49, 2:16.49, 2.5:17.48, 3:17.48, 3.5:17.48, 4:17.48, 4.5:17.48, 5:17.48, 5.5:20.9, 6:20.9, 6.5:20.9, 7:20.9, 7.5:20.9, 8:20.9, 8.5:20.9, 9:20.9, 9.5:20.9, 10:20.9, 10.5:24.32, 11:27.74, 11.5:31.16, 12:34.58, 12.5:38, 13:41.42, 13.5:44.84, 14:48.26, 14.5:51.68, 15:55.1, .5+:3.42' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_COST0_1' ;

/* Parcel Force Ireland Express Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_INSURE' ;
