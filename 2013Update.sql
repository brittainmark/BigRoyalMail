/* 
 * Update for Big royal Mail postage rates valid from 2 April 2013 for latest rates visit http://www.royalmail.com 
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

/* @Signed_Insurance = Penny more that default insurance */
SET @Signed_Insurance = "50.00";

/* @Min_Insurance = Penny more that signed for insurance */
SET @Min_Insurance = "50.01";

/* @Max_Insurance = Penny more that signed for insurance */
SET @Max_Insurance = "2500.00";

/* @Max_Insurance = Penny more that signed for insurance */
SET @PFValue_Insurance = "500.00";

/* @Expires_date = Date you want to be reminded of to update new rates */
SET @Expires_date = "2014-04-05";

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

/* Postage rates comma separated, format weight:cost e.g. 0.1:0.46, 0.2:1.78 is 100g £0.46, 200g £1.78 (assuming Kg for weight)  
*  First Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.60' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

/* First Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.70' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

/* First Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.90, 0.25:1.20, 0.5:1.60, 0.75:2.30' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1' ;

/* First Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:2.00, 0.25:2.30, 0.5:2.70, 0.75:3.40' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1' ;

/* Second Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.50' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

/* Second Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.45' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

/* Second Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.69, 0.25:1.10, 0.5:1.40, 0.75:1.90' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1' ;

/* Second Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.79, 0.25:2.20, 0.5:2.50, 0.75:3.00' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1' ;

/* First Class Small Parcel */
UPDATE configuration SET configuration_value = '1:3, 2:6.85' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_COST0_1' ;

/* Second Class Small Parcel */
UPDATE configuration SET configuration_value = '1:2.6, 2:5.6' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_COST0_1' ;

/* First Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:4.1, 2:7.95' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1' ;

/* Second Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:3.7, 2:6.7' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1' ;

/* First Class Medium Parcel */
UPDATE configuration SET configuration_value = '1:5.65, 2:8.9, 5:15.1, 10:21.25, 20:32.4' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1' ;

/* Second Class  Medium Parcel  */
UPDATE configuration SET configuration_value = '1:5.2, 2:8' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1' ;

/* First Class  Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.75, 2:10, 5:16.2, 10:22.35, 20:33.5' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1' ;

/* Second Class Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.3, 2:9.1' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1' ;

/* Special Delivery */
UPDATE configuration SET configuration_value = '0.1:6.22, 0.5:6.95, 1:8.25, 2:11, 10:25.8, 20:40' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' ;

/* Special Delivery Insurance rates */
UPDATE configuration SET configuration_value = '500:0,1000:1,2500:3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_INSURE' ;

/* Special Delivery 9am */
UPDATE configuration SET configuration_value = '0.1:17.64, 0.5:19.92, 1:21.6, 2:26.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance  */
UPDATE configuration SET configuration_value = '50:0,1000:2.2,2500:5.7' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_INSURE' ;

/* Parcel Force Express 48 */
UPDATE configuration SET configuration_value = '2:11.96, 5:12.92, 10:15.92, 15:22.46, 20:27.68, 25:38.48, 30:42.5, 1+:1.38' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_COST0_1' ;

/* Parcel Force Express 48 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_INSURE' ;

/* Parcel Force Express 24 */
UPDATE configuration SET configuration_value = '2:15.96, 5:16.92, 10:19.92, 15:26.46, 20:31.68, 25:42.48, 30:46.5, 1+:1.38' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_COST0_1' ;

/* Parcel Force Express 24 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_INSURE' ;

/* Parcel Force Express AM */
UPDATE configuration SET configuration_value = '2:19.96, 5:20.92, 10:23.92, 15:30.46, 20:35.68, 25:46.48, 30:50.5, 1+:1.38' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_COST0_1' ;

/* Parcel Force Express AM Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_INSURE' ;

/* Parcel Force Express 10 */
UPDATE configuration SET configuration_value = '2:29.96, 5:30.92, 10:33.92, 15:40.46, 20:45.68, 25:56.48, 30:60.5, 1+:1.38' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_COST0_1' ;

/* Parcel Force Express 10 Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_INSURE' ;

/* Parcel Force Express 9 */
UPDATE configuration SET configuration_value = '2:39.96, 5:40.92, 10:43.92, 15:50.46, 20:55.68, 25:66.48, 30:70.5, 1+:1.38' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_COST0_1' ;

/* Parcel Force Express 9 Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_INSURE' ;


/* Overseas Mailing 
*  Minimum and Maximum order values  */
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @PFValue_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_MAX_ORDERVALUE' ;

/* Postage and Packing Handling charges */
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF500_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL500_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF500_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_HANDLING' ;



/* Postage Rates 
*  Airmail Europe */
UPDATE configuration SET configuration_value = '0.1:3, 0.25:3.5, 0.5:4.95, 0.75:6.4, 1:7.85, 1.25:9.3, 1.5:10.75, 1.75:12.2, 2:13.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:3.5, 0.25:4.5, 0.5:7.2, 0.75:9.9, 1:12.6, 1.25:15.3, 1.5:18, 1.75:20.7, 2:23.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:3.5, 0.25:4.7, 0.5:7.55, 0.75:10.4, 1:13.25, 1.25:16.1, 1.5:18.95, 1.75:21.8, 2:24.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.25:8.8, 0.5:10.25, 0.75:11.7, 1:13.15, 1.25:14.6, 1.5:16.05, 1.75:17.5, 2:18.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.8, 0.5:12.5, 0.75:15.2, 1:17.9, 1.25:20.6, 1.5:23.3, 1.75:26, 2:28.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:10, 0.5:12.85, 0.75:15.7, 1:18.55, 1.25:21.4, 1.5:24.25, 1.75:27.1, 2:29.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* Airmail Signed For Insurance */
UPDATE configuration SET configuration_value = '50:0,500:2.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_INSURE' ;

/* Airsure Europe */
UPDATE configuration SET configuration_value = '0.1:8, 0.25:8.5, 0.5:9.95, 0.75:11.4, 1:12.85, 1.25:14.3, 1.5:15.75, 1.75:17.2, 2:18.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_COST0_1' ;

/* Airsure Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.9, 0.25:9.9, 0.5:12.6, 0.75:15.3, 1:18, 1.25:20.7, 1.5:23.4, 1.75:26.1, 2:28.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_COST0_2' ;

/* Airsure Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:8.9, 0.25:10.1, 0.5:12.95, 0.75:15.8, 1:18.65, 1.25:21.5, 1.5:24.35, 1.75:27.2, 2:30.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_COST0_3' ;

/* Airsure Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,500:2.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASPARCEL_ZONES_INSURE' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:2.6, 0.25:3.25, 0.5:4.85, 0.75:6.45, 0.1:8.05, 0.125:9.65, 1.5:11.25, 1.75:12.85, 2:14.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Europe Signed for */
UPDATE configuration SET configuration_value = '0.1:7.9, 0.25:8.55, 0.5:10.15, 0.75:11.75, 0.1:13.35, 0.125:14.95, 1.5:16.55, 1.75:18.15, 2:19.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:2.6, 0.25:3.25, 0.5:4.85, 0.75:6.45, 0.1:8.05, 0.125:9.65, 1.5:11.25, 1.75:12.85, 2:14.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;

/* Surface mail Rest of World Signed for */
UPDATE configuration SET configuration_value = '0.1:7.9, 0.25:8.55, 0.5:10.15, 0.75:11.75, 0.1:13.35, 0.125:14.95, 1.5:16.55, 1.75:18.15, 2:19.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCELSF_ZONES_COST0_2' ;

/* Surface Mail Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,500:2.6' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_INSURE' ;

/* Parcel Force Global Express */
UPDATE configuration SET configuration_value = '0.5:49.95, 1:52.25, 1.5:54.55, 2:56.85, 2.5:59.15, 3:61.4, 3.5:63.65, 4:65.9, 4.5:68.15, 5:70.4, 5.5:72.9, 6:75.4, 6.5:77.9, 7:80.4, 7.5:82.9, 8:85.4, 8.5:87.9, 9:90.4, 9.5:92.9, 10:95.4, 10.5:97.4, 11:99.4, 11.5:101.4, 12:103.4, 12.5:105.4, 13:107.4, 13.5:109.4, 14:111.4, 14.5:113.4, 15:115.4, .5+:2.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:45.6, 1:47.88, 1.5:50.16, 2:52.44, 2.5:54.72, 3:57.9, 3.5:61.08, 4:64.26, 4.5:67.44, 5:70.62, 5.5:72.18, 6:73.74, 6.5:75.3, 7:76.86, 7.5:78.42, 8:79.98, 8.5:81.54, 9:83.1, 9.5:84.66, 10:86.22, 10.5:88.5, 11:90.78, 11.5:93.06, 12:95.34, 12.5:97.62, 13:99.9, 13.5:102.18, 14:104.46, 14.5:106.74, 15:109.02, .5+:1.62' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:41.34, 1:44.88, 1.5:48.42, 2:51.96, 2.5:55.5, 3:58.38, 3.5:61.26, 4:64.14, 4.5:67.02, 5:69.9, 5.5:71.82, 6:73.74, 6.5:75.66, 7:77.58, 7.5:79.5, 8:81.42, 8.5:83.34, 9:85.26, 9.5:87.18, 10:89.1, 10.5:91.02, 11:92.94, 11.5:94.86, 12:96.78, 12.5:98.7, 13:100.62, 13.5:102.54, 14:104.46, 14.5:106.38, 15:108.3, .5+:1.62' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:42.42, 1:45.72, 1.5:49.02, 2:52.32, 2.5:55.62, 3:59.52, 3.5:63.42, 4:67.32, 4.5:71.22, 5:75.12, 5.5:78, 6:80.88, 6.5:83.76, 7:86.64, 7.5:89.52, 8:92.4, 8.5:95.28, 9:98.16, 9.5:101.04, 10:103.92, 10.5:106.2, 11:108.48, 11.5:110.76, 12:113.04, 12.5:115.32, 13:117.6, 13.5:119.88, 14:122.16, 14.5:124.44, 15:126.72, .5+:1.92' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:45.66, 1:49.2, 1.5:52.74, 2:56.28, 2.5:59.82, 3:62.7, 3.5:65.58, 4:68.46, 4.5:71.34, 5:74.22, 5.5:77.1, 6:79.98, 6.5:82.86, 7:85.74, 7.5:88.62, 8:91.5, 8.5:94.38, 9:97.26, 9.5:100.14, 10:103.02, 10.5:105.9, 11:108.78, 11.5:111.66, 12:114.54, 12.5:117.42, 13:120.3, 13.5:123.18, 14:126.06, 14.5:128.94, 15:131.82, .5+:2.58' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:49.92, 1:54.3, 1.5:58.68, 2:63.06, 2.5:67.44, 3:74.34, 3.5:81.24, 4:88.14, 4.5:95.04, 5:101.94, 5.5:106.38, 6:110.82, 6.5:115.26, 7:119.7, 7.5:124.14, 8:128.58, 8.5:133.02, 9:137.46, 9.5:141.9, 10:146.34, 10.5:149.88, 11:153.42, 11.5:156.96, 12:160.5, 12.5:164.04, 13:167.58, 13.5:171.12, 14:174.66, 14.5:178.2, 15:181.74, .5+:3.54' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:49.99, 1:54.69, 1.5:59.39, 2:64.09, 2.5:68.79, 3:72.54, 3.5:76.29, 4:80.04, 4.5:83.79, 5:87.54, 5.5:91.49, 6:95.44, 6.5:99.39, 7:103.34, 7.5:107.29, 8:111.24, 8.5:115.19, 9:119.14, 9.5:123.09, 10:127.04, 10.5:130.03, 11:133.02, 11.5:136.01, 12:139, 12.5:141.99, 13:144.98, 13.5:147.97, 14:150.96, 14.5:153.95, 15:156.94, .5+:2.95' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:60.6, 1:66.8, 1.5:73, 2:79.2, 2.5:85.4, 3:90.75, 3.5:96.1, 4:101.45, 4.5:106.8, 5:112.15, 5.5:116.56, 6:120.97, 6.5:125.38, 7:129.79, 7.5:134.2, 8:138.61, 8.5:143.02, 9:147.43, 9.5:151.84, 10:156.25, 10.5:161.05, 11:165.85, 11.5:170.65, 12:175.45, 12.5:180.25, 13:185.05, 13.5:189.85, 14:194.65, 14.5:199.45, 15:204.25, .5+:4.75' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:69, 1:77.24, 1.5:85.48, 2:93.72, 2.5:101.96, 3:109.58, 3.5:117.2, 4:124.82, 4.5:132.44, 5:140.06, 5.5:145.93, 6:151.8, 6.5:157.67, 7:163.54, 7.5:169.41, 8:175.28, 8.5:181.15, 9:187.02, 9.5:192.89, 10:198.76, 10.5:204.99, 11:211.22, 11.5:217.45, 12:223.68, 12.5:229.91, 13:236.14, 13.5:242.37, 14:248.6, 14.5:254.83, 15:261.06, .5+:6.33' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Express Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Priority */
UPDATE configuration SET configuration_value = '0.5:35.4, 1:36.05, 1.5:36.7, 2:37.35, 2.5:38, 3:38.7, 3.5:39.4, 4:40.1, 4.5:40.8, 5:41.5, 5.5:41.6, 6:41.7, 6.5:41.8, 7:41.9, 7.5:42, 8:42.1, 8.5:42.2, 9:42.3, 9.5:42.4, 10:42.5, 10.5:42.9, 11:43.3, 11.5:43.7, 12:44.1, 12.5:44.5, 13:44.9, 13.5:45.3, 14:45.7, 14.5:46.1, 15:46.5, .5+:0.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:36.42, 1:37.08, 1.5:37.74, 2:38.4, 2.5:39.06, 3:40.62, 3.5:42.18, 4:43.74, 4.5:45.3, 5:46.86, 5.5:48.12, 6:49.38, 6.5:50.64, 7:51.9, 7.5:53.16, 8:54.42, 8.5:55.68, 9:56.94, 9.5:58.2, 10:59.46, 10.5:60.72, 11:61.98, 11.5:63.24, 12:64.5, 12.5:65.76, 13:67.02, 13.5:68.28, 14:69.54, 14.5:70.8, 15:72.06, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:32.28, 1:33.9, 1.5:35.52, 2:37.14, 2.5:38.76, 3:40.38, 3.5:42, 4:43.62, 4.5:45.24, 5:46.86, 5.5:48.06, 6:49.26, 6.5:50.46, 7:51.66, 7.5:52.86, 8:54.06, 8.5:55.26, 9:56.46, 9.5:57.66, 10:58.86, 10.5:60.48, 11:62.1, 11.5:63.72, 12:65.34, 12.5:66.96, 13:68.58, 13.5:70.2, 14:71.82, 14.5:73.44, 15:75.06, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:35.46, 1:37.38, 1.5:39.3, 2:41.22, 2.5:43.14, 3:45, 3.5:46.86, 4:48.72, 4.5:50.58, 5:52.44, 5.5:53.7, 6:54.96, 6.5:56.22, 7:57.48, 7.5:58.74, 8:60, 8.5:61.26, 9:62.52, 9.5:63.78, 10:65.04, 10.5:66.6, 11:68.16, 11.5:69.72, 12:71.28, 12.5:72.84, 13:74.4, 13.5:75.96, 14:77.52, 14.5:79.08, 15:80.64, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:38.52, 1:40.44, 1.5:42.36, 2:44.28, 2.5:46.2, 3:48.42, 3.5:50.64, 4:52.86, 4.5:55.08, 5:57.3, 5.5:59.16, 6:61.02, 6.5:62.88, 7:64.74, 7.5:66.6, 8:68.46, 8.5:70.32, 9:72.18, 9.5:74.04, 10:75.9, 10.5:78.06, 11:80.22, 11.5:82.38, 12:84.54, 12.5:86.7, 13:88.86, 13.5:91.02, 14:93.18, 14.5:95.34, 15:97.5, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:44.16, 1:46.68, 1.5:49.2, 2:51.72, 2.5:54.24, 3:56.46, 3.5:58.68, 4:60.9, 4.5:63.12, 5:65.34, 5.5:66.66, 6:67.98, 6.5:69.3, 7:70.62, 7.5:71.94, 8:73.26, 8.5:74.58, 9:75.9, 9.5:77.22, 10:78.54, 10.5:80.16, 11:81.78, 11.5:83.4, 12:85.02, 12.5:86.64, 13:88.26, 13.5:89.88, 14:91.5, 14.5:93.12, 15:94.74, .5+:1.08' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:46.31, 1:50.65, 1.5:54.99, 2:59.33, 2.5:63.67, 3:67.09, 3.5:70.51, 4:73.93, 4.5:77.35, 5:80.77, 5.5:83.52, 6:86.27, 6.5:89.02, 7:91.77, 7.5:94.52, 8:97.27, 8.5:100.02, 9:102.77, 9.5:105.52, 10:108.27, 10.5:109.95, 11:111.63, 11.5:113.31, 12:114.99, 12.5:116.67, 13:118.35, 13.5:120.03, 14:121.71, 14.5:123.39, 15:125.07, .5+:1.89' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:54.18, 1:59.13, 1.5:64.08, 2:69.03, 2.5:73.98, 3:77.65, 3.5:81.32, 4:84.99, 4.5:88.66, 5:92.33, 5.5:96.32, 6:100.31, 6.5:104.3, 7:108.29, 7.5:112.28, 8:116.27, 8.5:120.26, 9:124.25, 9.5:128.24, 10:132.23, 10.5:134.63, 11:137.03, 11.5:139.43, 12:141.83, 12.5:144.23, 13:146.63, 13.5:149.03, 14:151.43, 14.5:153.83, 15:156.23, .5+:3.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:59.53, 1:66.17, 1.5:72.81, 2:79.45, 2.5:86.09, 3:91.76, 3.5:97.43, 4:103.1, 4.5:108.77, 5:114.44, 5.5:119.54, 6:124.64, 6.5:129.74, 7:134.84, 7.5:139.94, 8:145.04, 8.5:150.14, 9:155.24, 9.5:160.34, 10:165.44, 10.5:169.77, 11:174.1, 11.5:178.43, 12:182.76, 12.5:187.09, 13:191.42, 13.5:195.75, 14:200.08, 14.5:204.41, 15:208.74, .5+:4.48' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Priority Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Value */
UPDATE configuration SET configuration_value = '0.5:9.65, 1:10.7, 1.5:11.75, 2:12.8, 2.5:13.85, 3:14.4, 3.5:14.95, 4:15.5, 4.5:16.05, 5:16.6, 5.5:17.05, 6:17.5, 6.5:17.95, 7:18.4, 7.5:18.85, 8:19.3, 8.5:19.75, 9:20.2, 9.5:20.65, 10:21.1, 10.5:21.4, 11:21.7, 11.5:22, 12:22.3, 12.5:22.6, 13:22.9, 13.5:23.2, 14:23.5, 14.5:23.8, 15:24.1, .5+:0.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:10.74, 1:13.32, 1.5:15.9, 2:18.48, 2.5:21.06, 3:22.68, 3.5:24.3, 4:25.92, 4.5:27.54, 5:29.16, 5.5:30.48, 6:31.8, 6.5:33.12, 7:34.44, 7.5:35.76, 8:37.08, 8.5:38.4, 9:39.72, 9.5:41.04, 10:42.36, 10.5:43.02, 11:43.68, 11.5:44.34, 12:45, 12.5:45.66, 13:46.32, 13.5:46.98, 14:47.64, 14.5:48.3, 15:48.96, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:22.44, 1:24.72, 1.5:27, 2:29.28, 2.5:31.56, 3:33.18, 3.5:34.8, 4:36.42, 4.5:38.04, 5:39.66, 5.5:40.68, 6:41.7, 6.5:42.72, 7:43.74, 7.5:44.76, 8:45.78, 8.5:46.8, 9:47.82, 9.5:48.84, 10:49.86, 10.5:50.52, 11:51.18, 11.5:51.84, 12:52.5, 12.5:53.16, 13:53.82, 13.5:54.48, 14:55.14, 14.5:55.8, 15:56.46, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:20.34, 1:20.34, 1.5:20.34, 2:20.34, 2.5:20.34, 3:23.22, 3.5:26.1, 4:28.98, 4.5:31.86, 5:34.74, 5.5:36.66, 6:38.58, 6.5:40.5, 7:42.42, 7.5:44.34, 8:46.26, 8.5:48.18, 9:50.1, 9.5:52.02, 10:53.94, 10.5:54.3, 11:54.66, 11.5:55.02, 12:55.38, 12.5:55.74, 13:56.1, 13.5:56.46, 14:56.82, 14.5:57.18, 15:57.54, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:25.62, 1:27.9, 1.5:30.18, 2:32.46, 2.5:34.74, 3:36.06, 3.5:37.38, 4:38.7, 4.5:40.02, 5:41.34, 5.5:42.9, 6:44.46, 6.5:46.02, 7:47.58, 7.5:49.14, 8:50.7, 8.5:52.26, 9:53.82, 9.5:55.38, 10:56.94, 10.5:57.6, 11:58.26, 11.5:58.92, 12:59.58, 12.5:60.24, 13:60.9, 13.5:61.56, 14:62.22, 14.5:62.88, 15:63.54, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:26.82, 1:30.06, 1.5:33.3, 2:36.54, 2.5:39.78, 3:41.76, 3.5:43.74, 4:45.72, 4.5:47.7, 5:49.68, 5.5:51.72, 6:53.76, 6.5:55.8, 7:57.84, 7.5:59.88, 8:61.92, 8.5:63.96, 9:66, 9.5:68.04, 10:70.08, 10.5:71.52, 11:72.96, 11.5:74.4, 12:75.84, 12.5:77.28, 13:78.72, 13.5:80.16, 14:81.6, 14.5:83.04, 15:84.48, .5+:1.08' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:27.4, 1:29.85, 1.5:32.3, 2:34.75, 2.5:37.2, 3:43.6, 3.5:50, 4:56.4, 4.5:62.8, 5:69.2, 5.5:72.7, 6:76.2, 6.5:79.7, 7:83.2, 7.5:86.7, 8:90.2, 8.5:93.7, 9:97.2, 9.5:100.7, 10:104.2, 10.5:106.35, 11:108.5, 11.5:110.65, 12:112.8, 12.5:114.95, 13:117.1, 13.5:119.25, 14:121.4, 14.5:123.55, 15:125.7, .5+:1.85' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:34.2, 1:40.55, 1.5:46.9, 2:53.25, 2.5:59.6, 3:64.95, 3.5:70.3, 4:75.65, 4.5:81, 5:86.35, 5.5:90.4, 6:94.45, 6.5:98.5, 7:102.55, 7.5:106.6, 8:110.65, 8.5:114.7, 9:118.75, 9.5:122.8, 10:126.85, 10.5:129.85, 11:132.85, 11.5:135.85, 12:138.85, 12.5:141.85, 13:144.85, 13.5:147.85, 14:150.85, 14.5:153.85, 15:156.85, .5+:3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:35.35, 1:42.35, 1.5:49.35, 2:56.35, 2.5:63.35, 3:69.74, 3.5:76.13, 4:82.52, 4.5:88.91, 5:95.3, 5.5:101.38, 6:107.46, 6.5:113.54, 7:119.62, 7.5:125.7, 8:131.78, 8.5:137.86, 9:143.94, 9.5:150.02, 10:156.1, 10.5:160.53, 11:164.96, 11.5:169.39, 12:173.82, 12.5:178.25, 13:182.68, 13.5:187.11, 14:191.54, 14.5:195.97, 15:200.4, .5+:4.02' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Value Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Economy */
UPDATE configuration SET configuration_value = '0.5:24.2, 1:27.4, 1.5:30.6, 2:33.8, 2.5:37, 3:42.3, 3.5:47.6, 4:52.9, 4.5:58.2, 5:63.5, 5.5:65.65, 6:67.8, 6.5:69.95, 7:72.1, 7.5:74.25, 8:76.4, 8.5:78.55, 9:80.7, 9.5:82.85, 10:85, 10.5:87.35, 11:89.7, 11.5:92.05, 12:94.4, 12.5:96.75, 13:99.1, 13.5:101.45, 14:103.8, 14.5:106.15, 15:108.5, .5+:2.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:29.6, 1:34.4, 1.5:39.2, 2:44, 2.5:48.8, 3:53.3, 3.5:57.8, 4:62.3, 4.5:66.8, 5:71.3, 5.5:74.75, 6:78.2, 6.5:81.65, 7:85.1, 7.5:88.55, 8:92, 8.5:95.45, 9:98.9, 9.5:102.35, 10:105.8, 10.5:108.9, 11:112, 11.5:115.1, 12:118.2, 12.5:121.3, 13:124.4, 13.5:127.5, 14:130.6, 14.5:133.7, 15:136.8, .5+:2.65' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:31, 1:36.4, 1.5:41.8, 2:47.2, 2.5:52.6, 3:58.1, 3.5:63.6, 4:69.1, 4.5:74.6, 5:80.1, 5.5:84.75, 6:89.4, 6.5:94.05, 7:98.7, 7.5:103.35, 8:108, 8.5:112.65, 9:117.3, 9.5:121.95, 10:126.6, 10.5:130.25, 11:133.9, 11.5:137.55, 12:141.2, 12.5:144.85, 13:148.5, 13.5:152.15, 14:155.8, 14.5:159.45, 15:163.1, .5+:3.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_3' ;

/* Parcel Force Global Economy Insurance Rates */
UPDATE configuration SET configuration_value = '' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_INSURE' ;

/* Parcel Force Ireland Express */
UPDATE configuration SET configuration_value = '0.5:22.98, 1:22.98, 1.5:22.98, 2:22.98, 2.5:22.98, 3:22.98, 3.5:22.98, 4:22.98, 4.5:22.98, 5:22.98, 5.5:24.3, 6:25.62, 6.5:26.94, 7:28.26, 7.5:29.58, 8:30.9, 8.5:32.22, 9:33.54, 9.5:34.86, 10:36.18, 10.5:37.14, 11:38.1, 11.5:39.06, 12:40.02, 12.5:40.98, 13:41.94, 13.5:42.9, 14:43.86, 14.5:44.82, 15:45.78, .5+:0.96' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_COST0_1' ;

/* Parcel Force Ireland Express Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.2, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_INSURE' ;
