/* 
 * Update for Big royal Mail postage rates valid from 26 March 2018 for latest rates visit http://www.royalmail.com 
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
SET @Expires_date = "2019-03-25";

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
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_MAX_ORDERVALUE' ;

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
UPDATE configuration SET configuration_value = '0.1:0.67' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

/* First Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.77' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

/* First Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:1.01, 0.25:1.4, 0.5:1.87, 0.75:2.6' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1' ;

/* First Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:2.11, 0.25:2.5, 0.5:2.97, 0.75:3.7' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1' ;

/* Second Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.58' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

/* Second Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.68' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

/* Second Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.79, 0.25:1.26, 0.5:1.64, 0.75:2.22' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1' ;

/* Second Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.89, 0.25:2.36, 0.5:2.74, 0.75:3.32' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1' ;

/* First Class Small Parcel */
UPDATE configuration SET configuration_value = '1:3.45, 2:5.5' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_COST0_1' ;

/* Second Class Small Parcel */
UPDATE configuration SET configuration_value = '1:2.95, 2:2.95' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_COST0_1' ;

/* First Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:4.45, 2:6.5' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1' ;

/* Second Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:3.95, 2:3.95' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1' ;

/* First Class Medium Parcel */
UPDATE configuration SET configuration_value = '1:5.75, 2:8.95, 5:15.85, 10:21.9, 20:33.4' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1' ;

/* Second Class  Medium Parcel  */
UPDATE configuration SET configuration_value = '1:5.05, 2:5.05, 5:13.75, 10:20.25, 20:28.55' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1' ;

/* First Class  Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.75, 2:9.95, 5:16.85, 10:22.9, 20:34.4' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1' ;

/* Second Class Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.05, 2:6.05, 5:14.75, 10:21.25, 20:29.55' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1' ;

/* Special Delivery */
UPDATE configuration SET configuration_value = '0.1:6.5, 0.5:7.3, 1:8.6, 2:11, 10:26.6, 20:41.2' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' ;

/* Special Delivery Insurance rates */
UPDATE configuration SET configuration_value = '500:0,1000:1,2500:3' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_INSURE' ;

/* Special Delivery 9am */
UPDATE configuration SET configuration_value = '0.1:18.36, 0.5:20.76, 1:22.5, 2:26.94' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance  */
UPDATE configuration SET configuration_value = '50:0,1000:2.2,2500:5.7' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_INSURE' ;

/* Special Delivery Saturday*/
UPDATE configuration SET configuration_value = '0.1:10.8, 0.5:11.76, 1:13.32, 2:16.2, 10:34.92, 20:52.44' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_COST0_1' ;

/* Special Delivery Saturday Insurance rates */
UPDATE configuration SET configuration_value = '500:0,1000:1.2,2500:3.6' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_INSURE' ;

/* Special Delivery Saturday 9am */
UPDATE configuration SET configuration_value = '0.1:21.36, 0.5:23.76, 1:25.5, 2:29.94' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_COST0_1' ;

/* Special Delivery Satueday 9am Insurance  */
UPDATE configuration SET configuration_value = '500:0,1000:2.2,2500:5.7' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_INSURE' ;

/* Parcel Force Express 48 */  
UPDATE configuration SET configuration_value = '2:12.12, 5:13.14, 10:16.62, 15:23.4, 20:28.8, 25:40.08, 30:44.22' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_COST0_1' ;

/* Parcel Force Express 48 Insurance Rates */ 
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_INSURE' ;

/* Parcel Force Express 24 */  
UPDATE configuration SET configuration_value = '2:16.68, 5:17.7, 10:21.12, 15:27.96, 20:33.36, 25:44.58, 30:48.78' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_COST0_1' ;

/* Parcel Force Express 24 Insurance Rates */ 
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_INSURE' ;

/* Parcel Force Express AM */  
UPDATE configuration SET configuration_value = '2:19.74, 5:20.7, 10:24.18, 15:30.96, 20:36.42, 25:47.64, 30:51.28' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_COST0_1' ;

/* Parcel Force Express AM Insurance Rates */ 
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_INSURE' ;

/* Parcel Force Express 10 */  
UPDATE configuration SET configuration_value = '2:29.82, 5:30.84, 10:34.26, 15:41.04, 20:46.44, 25:57.72, 30:61.92' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_COST0_1' ;

/* Parcel Force Express 10 Insurance Rates */ 
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_INSURE' ;

/* Parcel Force Express 9 */  
UPDATE configuration SET configuration_value = '2:39.9, 5:40.92, 10:44.34, 15:51.18, 20:56.58, 25:67.8, 30:72' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_COST0_1' ;

/* Parcel Force Express 9 Insurance Rates */ 
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_INSURE' ;


/* Overseas Mailing 
*  Minimum and Maximum order values  */
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = 0 WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @PFValue_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Max_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_MAX_ORDERVALUE' ;


/* Postage and Packing Handling charges */
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandlingGWW WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_HANDLING_3' ;

/* Postage rates */
/* Europe Airmail Large Letter */
UPDATE configuration SET configuration_value = '0.1:2.65, 0.25:3.85, 0.5:4.9, 0.75:5.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_1' ;

/* World zone 1 Large Letter  */
UPDATE configuration SET configuration_value = '0.1:3.3, 0.25:4.85, 0.5:7.1, 0.75:9.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_2' ;

/* World zone 2 Large Letter */
UPDATE configuration SET configuration_value = '0.1:3.45, 0.25:5.15, 0.5:7.5, 0.75:9.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_3' ;

/* Europe Airmail Large Letter Signed */
UPDATE configuration SET configuration_value = '0.1:7.85, 0.25:8.3, 0.5:9.1, 0.75:9.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_1' ;

/* World zone 1 Large Letter Signed  */
UPDATE configuration SET configuration_value = '0.1:8.5, 0.25:9.35, 0.5:11.15, 0.75:12.45' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_2' ;

/* World zone 2 Large Letter Signed */
UPDATE configuration SET configuration_value = '0.1:8.7, 0.25:9.65, 0.5:11.5, 0.75:12.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_3' ;

/* Insurance Airmail Large Letter Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_INSURE' ;

/*  Europe Airmail Letter */
UPDATE configuration SET configuration_value = '0.01:1.25, 0.02:1.25, 0.1:1.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_1' ;

/* World zone 1 Letter  */
UPDATE configuration SET configuration_value = '0.01:1.25, 0.02:1.45, 0.1:2.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_2' ;

/* World zone 2 Letter */
UPDATE configuration SET configuration_value = '0.01:1.25, 0.02:1.45, 0.1:2.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_3' ;

/* Europe Airmail Letter Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6, 0.1:6.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_1' ;

/* World zone 1 Letter Signed  */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.35, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_2' ;

/* World zone 2 Letter Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.35, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_3' ;

/* Insurance Airmail Letter Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_INSURE' ;

/*  Airmail Europe */
UPDATE configuration SET configuration_value = '0.1:4.15, 0.25:4.45, 0.5:6.2, 0.75:7.45, 1:8.65, 1.25:9.75, 1.5:10.9, 1.75:11.7, 2:12.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:4.85, 0.25:5.55, 0.5:8.5, 0.75:10.95, 1:13.35, 1.25:14.8, 1.5:16.3, 1.75:17.5, 2:18.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:5.25, 0.25:6.05, 0.5:9.2, 0.75:11.65, 1:14.1, 1.25:15.75, 1.5:17.55, 1.75:19, 2:20.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.95, 0.25:9.05, 0.5:10.55, 0.75:11.6, 1:12.55, 1.25:13.5, 1.5:14.45, 1.75:15.05, 2:15.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:9.65, 0.25:10.15, 0.5:12.95, 0.75:15.15, 1:17.35, 1.25:18.5, 1.5:19.7, 1.75:20.6, 2:21.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:9.9, 0.25:10.5, 0.5:13.45, 0.75:15.8, 1:18.15, 1.25:19.6, 1.5:21.1, 1.75:22.25, 2:23' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* Airmail Signed For Insurance */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_INSURE' ;

/* Europe Airmail Large Letter Tracked EU*/
UPDATE configuration SET configuration_value = '0.1:9.42, 0.25:9.96, 0.5:10.92, 0.75:11.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULARGELETTER_ZONES_COST0_1' ;

/* Insurance Airmail Large Letter Tracked EU*/
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULARGELETTER_ZONES_INSURE' ;

/* Europe Airmail Letter Tracked EU */
UPDATE configuration SET configuration_value = '0.01:7.2, 0.02:7.2, 0.1:7.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULETTER_ZONES_COST0_1' ;

/* Insurance Airmail Letter Tracked EU */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULETTER_ZONES_INSURE' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '0.1:10.74, 0.25:10.86, 0.5:12.66, 0.75:13.92, 1:15.06, 1.25:16.2, 1.5:17.34, 1.75:18.06, 2:18.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked EU Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,250:3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_INSURE' ;

/* Europe Airmail Large Letter Tracked */
UPDATE configuration SET configuration_value = '0.1:7.85, 0.25:8.3, 0.5:9.1, 0.75:9.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_1' ;

/* World zone 1 Large Letter Tracked  */
UPDATE configuration SET configuration_value = '0.1:8.5, 0.25:9.35, 0.5:11.15, 0.75:12.45' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_2' ;

/* World zone 2 Large Letter Tracked */
UPDATE configuration SET configuration_value = '0.1:8.7, 0.25:9.65, 0.5:11.5, 0.5:12.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_3' ;

/* Insurance Airmail Large Letter Tracked */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_INSURE' ;

/* Europe Airmail Letter Tracked */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6, 0.1:6.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_1' ;

/* World zone 1 Letter Tracked  */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.35, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_2' ;

/* World zone 2 Letter Tracked */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.35, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_3' ;

/* Insurance Airmail Letter Tracked */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_INSURE' ;

/* International Tracked Europe non EU*/
UPDATE configuration SET configuration_value = '0.1:8.95, 0.25:9.05, 0.5:10.55, 0.75:11.6, 1:12.55, 1.25:13.5, 1.5:14.45, 1.75:15.05, 2:15.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:9.65, 0.25:10.15, 0.5:12.95, 0.75:15.15, 1:17.35, 1.25:18.5, 1.5:19.7, 1.75:20.6, 2:21.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9.9, 0.25:10.5, 0.5:13.45, 0.75:15.8, 1:18.15, 1.25:19.6, 1.5:21.1, 1.75:22.25, 2:23' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

/* International Tracked Insurance Rates */
UPDATE configuration SET configuration_value = '50:0, 250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_INSURE' ;

/* Europe Airmail Large Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.1:7.85, 0.25:8.3, 0.5:9.1, 0.75:9.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_1' ;

/* World zone 1 Large Letter Tracked and Signed  */
UPDATE configuration SET configuration_value = '0.1:8.5, 0.25:9.35, 0.5:11.15, 0.75:12.45' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_2' ;

/* World zone 2 Large Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.1:8.7, 0.25:9.65, 0.5:11.5, 0.75:12.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_3' ;

/* Insurance Airmail Large Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_INSURE' ;

/* Europe Airmail Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6, 0.1:6.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_1' ;

/* World zone 1 Letter Tracked and Signed  */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.35, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_2' ;

/* World zone 2 Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.35, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_3' ;

/* Insurance Airmail Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_INSURE' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:8.95, 0.25:9.05, 0.5:10.55, 0.75:11.6, 1:12.55, 1.25:13.5, 1.5:14.45, 1.75:15.05, 2:15.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:9.65, 0.25:10.15, 0.5:12.95, 0.75:15.15, 1:17.35, 1.25:18.5, 1.5:19.7, 1.75:20.6, 2:21.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9.9, 0.25:10.5, 0.5:13.45, 0.75:15.8, 1:18.15, 1.25:19.6, 1.5:21.1, 1.75:22.25, 2:23' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

/* International Tracked and Signed Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_INSURE' ;

/* Parcel Force Global Economy */
UPDATE configuration SET configuration_value = '0.5:24.7, 1:27.25, 1.5:29.8, 2:32.35, 2.5:38.8, 3:45.25, 3.5:51.7, 4:58.15, 4.5:64.6, 5:71.05, 5.5:74.75, 6:78.45, 6.5:82.15, 7:85.85, 7.5:89.55, 8:93.25, 8.5:96.95, 9:100.65, 9.5:104.35, 10:108.05, 10.5:110.45, 11:112.85, 11.5:115.25, 12:117.65, 12.5:120.05, 13:122.45, 13.5:124.85, 14:127.25, 14.5:129.65, 15:132.05, .5+:2.35' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:31.85, 1:38.1, 1.5:44.35, 2:50.6, 2.5:56.7, 3:62.8, 3.5:68.9, 4:75, 4.5:81.1, 5:87.2, 5.5:91.75, 6:96.3, 6.5:100.85, 7:105.4, 7.5:109.95, 8:114.5, 8.5:119.05, 9:123.6, 9.5:128.15, 10:132.7, 10.5:136.05, 11:139.4, 11.5:142.75, 12:146.1, 12.5:149.45, 13:152.8, 13.5:156.15, 14:159.5, 14.5:162.85, 15:166.2, .5+:3.35' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:33.35, 1:40.5, 1.5:47.65, 2:54.8, 2.5:61.95, 3:69.1, 3.5:76.25, 4:83.4, 4.5:90.55, 5:97.7, 5.5:104.2, 6:110.7, 6.5:117.2, 7:123.7, 7.5:130.2, 8:136.7, 8.5:143.2, 9:149.7, 9.5:156.2, 10:162.7, 10.5:167.15, 11:171.6, 11.5:176.05, 12:180.5, 12.5:184.95, 13:189.4, 13.5:193.85, 14:198.3, 14.5:202.75, 15:207.2, .5+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_3' ;

/* Parcel Force Global Express */
UPDATE configuration SET configuration_value = '0.5:52.5, 1:55.08, 1.5:57.66, 2:60.24, 2.5:62.76, 3:65.28, 3.5:67.8, 4:70.32, 4.5:72.84, 5:75.36, 5.5:78.18, 6:81, 6.5:83.82, 7:86.64, 7.5:89.46, 8:92.28, 8.5:95.1, 9:97.92, 9.5:100.74, 10:103.56, 10.5:105.72, 11:107.88, 11.5:110.04, 12:112.2, 12.5:114.36, 13:116.52, 13.5:118.68, 14:120.84, 14.5:123, 15:125.16, .5+:2.34' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:47.94, 1:50.46, 1.5:52.98, 2:55.5, 2.5:59.22, 3:62.94, 3.5:66.66, 4:70.38, 4.5:74.1, 5:77.82, 5.5:79.56, 6:81.3, 6.5:83.04, 7:84.78, 7.5:86.52, 8:88.26, 8.5:90, 9:91.74, 9.5:93.48, 10:95.22, 10.5:97.56, 11:99.9, 11.5:102.24, 12:104.58, 12.5:106.92, 13:109.26, 13.5:111.6, 14:113.94, 14.5:116.28, 15:118.62, .5+:1.74' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:43.5, 1:47.58, 1.5:51.66, 2:55.74, 2.5:59.1, 3:62.46, 3.5:65.82, 4:69.18, 4.5:72.54, 5:75.9, 5.5:78, 6:80.1, 6.5:82.2, 7:84.3, 7.5:86.4, 8:88.5, 8.5:90.6, 9:92.7, 9.5:94.8, 10:96.9, 10.5:98.82, 11:100.74, 11.5:102.66, 12:104.58, 12.5:106.5, 13:108.42, 13.5:110.34, 14:112.26, 14.5:114.18, 15:116.1, .5+:1.72' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:44.76, 1:48.36, 1.5:51.96, 2:55.56, 2.5:59.76, 3:63.96, 3.5:68.16, 4:72.36, 4.5:76.56, 5:80.76, 5.5:83.94, 6:87.12, 6.5:90.3, 7:93.48, 7.5:96.66, 8:99.84, 8.5:103.02, 9:106.2, 9.5:109.38, 10:112.56, 10.5:115.02, 11:117.48, 11.5:119.94, 12:122.4, 12.5:124.86, 13:127.32, 13.5:129.78, 14:132.24, 14.5:134.7, 15:137.16, .5+:2.04' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:48.06, 1:51.9, 1.5:55.74, 2:59.58, 2.5:62.7, 3:65.82, 3.5:68.94, 4:72.06, 4.5:75.18, 5:78.3, 5.5:81.42, 6:84.54, 6.5:87.66, 7:90.78, 7.5:93.9, 8:97.02, 8.5:100.14, 9:103.26, 9.5:106.38, 10:109.5, 10.5:112.56, 11:115.62, 11.5:118.68, 12:121.74, 12.5:124.8, 13:127.86, 13.5:130.92, 14:133.98, 14.5:137.04, 15:140.1, .5+:2.76' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:52.5, 1:57.2, 1.5:61.9, 2:66.6, 2.5:74.1, 3:81.6, 3.5:89.1, 4:96.6, 4.5:104.1, 5:111.6, 5.5:116.65, 6:121.7, 6.5:126.75, 7:131.8, 7.5:136.85, 8:141.9, 8.5:146.95, 9:152, 9.5:157.05, 10:162.1, 10.5:165.45, 11:168.8, 11.5:172.15, 12:175.5, 12.5:178.85, 13:182.2, 13.5:185.55, 14:188.9, 14.5:192.25, 15:195.6, .5+:3.7' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:52.55, 1:57.55, 1.5:62.55, 2:67.55, 2.5:71.55, 3:75.55, 3.5:79.55, 4:83.55, 4.5:87.55, 5:91.55, 5.5:95.8, 6:100.05, 6.5:104.3, 7:108.55, 7.5:112.8, 8:117.05, 8.5:121.3, 9:125.55, 9.5:129.8, 10:134.05, 10.5:137.3, 11:140.55, 11.5:143.8, 12:147.05, 12.5:150.3, 13:153.55, 13.5:156.8, 14:160.05, 14.5:163.3, 15:166.55, .5+:3.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:63.7, 1:70.3, 1.5:76.9, 2:83.5, 2.5:89.25, 3:95, 3.5:100.75, 4:106.5, 4.5:112.25, 5:118, 5.5:122.7, 6:127.4, 6.5:132.1, 7:136.8, 7.5:141.5, 8:146.2, 8.5:150.9, 9:155.6, 9.5:160.3, 10:165, 10.5:170.15, 11:175.3, 11.5:180.45, 12:185.6, 12.5:190.75, 13:195.9, 13.5:201.05, 14:206.2, 14.5:211.35, 15:216.5, .5+:5.05' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:72.7, 1:81.45, 1.5:90.2, 2:98.95, 2.5:107.05, 3:115.15, 3.5:123.25, 4:131.35, 4.5:139.45, 5:147.55, 5.5:153.85, 6:160.15, 6.5:166.45, 7:172.75, 7.5:179.05, 8:185.35, 8.5:191.65, 9:197.95, 9.5:204.25, 10:210.55, 10.5:217.2, 11:223.85, 11.5:230.5, 12:237.15, 12.5:243.8, 13:250.45, 13.5:257.1, 14:263.75, 14.5:270.4, 15:277.05, .5+:6.75' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Express Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Priority */
UPDATE configuration SET configuration_value = '0.5:30, 1:31.32, 1.5:32.64, 2:33.96, 2.5:34.98, 3:36, 3.5:37.02, 4:38.04, 4.5:39.06, 5:40.08, 5.5:40.5, 6:40.92, 6.5:41.34, 7:41.76, 7.5:42.18, 8:42.6, 8.5:43.02, 9:43.44, 9.5:43.86, 10:44.28, 10.5:44.76, 11:45.24, 11.5:45.72, 12:46.2, 12.5:46.68, 13:47.16, 13.5:47.64, 14:48.12, 14.5:48.6, 15:49.08, .5+:0.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:30.78, 1:33.36, 1.5:35.94, 2:38.52, 2.5:41.1, 3:43.68, 3.5:46.26, 4:48.84, 4.5:51.42, 5:54, 5.5:55.14, 6:56.28, 6.5:57.42, 7:58.56, 7.5:59.7, 8:60.84, 8.5:61.98, 9:63.12, 9.5:64.26, 10:65.4, 10.5:66.18, 11:66.96, 11.5:67.74, 12:68.52, 12.5:69.3, 13:70.08, 13.5:70.86, 14:71.64, 14.5:72.42, 15:73.2, .5+:0.78' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:34.2, 1:36.54, 1.5:38.88, 2:41.22, 2.5:43.5, 3:45.78, 3.5:48.06, 4:50.34, 4.5:52.62, 5:54.9, 5.5:55.92, 6:56.94, 6.5:57.96, 7:58.98, 7.5:60, 8:61.02, 8.5:62.04, 9:63.06, 9.5:64.08, 10:65.1, 10.5:66.6, 11:68.1, 11.5:69.6, 12:71.1, 12.5:72.6, 13:74.1, 13.5:75.6, 14:77.1, 14.5:78.6, 15:80.1, .5+:0.72' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:35.82, 1:37.8, 1.5:39.78, 2:41.76, 2.5:43.92, 3:46.08, 3.5:48.24, 4:50.4, 4.5:52.56, 5:54.72, 5.5:56.28, 6:57.84, 6.5:59.4, 7:60.96, 7.5:62.52, 8:64.08, 8.5:65.64, 9:67.2, 9.5:68.76, 10:70.32, 10.5:71.82, 11:73.32, 11.5:74.82, 12:76.32, 12.5:77.82, 13:79.32, 13.5:80.82, 14:82.32, 14.5:83.82, 15:85.32, .5+:0.66' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:38.94, 1:41.1, 1.5:43.26, 2:45.42, 2.5:47.76, 3:50.1, 3.5:52.44, 4:54.78, 4.5:57.12, 5:59.46, 5.5:61.38, 6:63.3, 6.5:65.22, 7:67.14, 7.5:69.06, 8:70.98, 8.5:72.9, 9:74.82, 9.5:76.74, 10:78.66, 10.5:80.88, 11:83.1, 11.5:85.32, 12:87.54, 12.5:89.76, 13:91.98, 13.5:94.2, 14:96.42, 14.5:98.64, 15:100.86, .5+:0.72' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:42.2, 1:45.45, 1.5:48.7, 2:51.95, 2.5:54.7, 3:57.45, 3.5:60.2, 4:62.95, 4.5:65.7, 5:68.45, 5.5:70.8, 6:73.15, 6.5:75.5, 7:77.85, 7.5:80.2, 8:82.55, 8.5:84.9, 9:87.25, 9.5:89.6, 10:91.95, 10.5:93.2, 11:94.45, 11.5:95.7, 12:96.95, 12.5:98.2, 13:99.45, 13.5:100.7, 14:101.95, 14.5:103.2, 15:104.45, .5+:1.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:44.8, 1:47.35, 1.5:49.9, 2:52.45, 2.5:58.95, 3:65.45, 3.5:71.95, 4:78.45, 4.5:84.95, 5:91.45, 5.5:95.2, 6:98.95, 6.5:102.7, 7:106.45, 7.5:110.2, 8:113.95, 8.5:117.7, 9:121.45, 9.5:125.2, 10:128.95, 10.5:131.35, 11:133.75, 11.5:136.15, 12:138.55, 12.5:140.95, 13:143.35, 13.5:145.75, 14:148.15, 14.5:150.55, 15:152.95, .5+:2.4' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:47.5, 1:53.5, 1.5:59.5, 2:65.5, 2.5:71.5, 3:77.5, 3.5:83.5, 4:89.5, 4.5:95.5, 5:101.5, 5.5:106.05, 6:110.6, 6.5:115.15, 7:119.7, 7.5:124.25, 8:128.8, 8.5:133.35, 9:137.9, 9.5:142.45, 10:147, 10.5:150.45, 11:153.9, 11.5:157.35, 12:160.8, 12.5:164.25, 13:167.7, 13.5:171.15, 14:174.6, 14.5:178.05, 15:181.5, .5+:3.35' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:60.15, 1:67.1, 1.5:74.05, 2:81, 2.5:87.9, 3:94.8, 3.5:101.7, 4:108.6, 4.5:115.5, 5:122.4, 5.5:128.6, 6:134.8, 6.5:141, 7:147.2, 7.5:153.4, 8:159.6, 8.5:165.8, 9:172, 9.5:178.2, 10:184.4, 10.5:188.85, 11:193.3, 11.5:197.75, 12:202.2, 12.5:206.65, 13:211.1, 13.5:215.55, 14:220, 14.5:224.45, 15:228.9, .5+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_9' ;

/* Parcel Force Global Priority Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_INSURE' ;

/* Parcel Force Global Value */
UPDATE configuration SET configuration_value = '0.5:9.78, 1:11.04, 1.5:12.3, 2:13.56, 2.5:14.52, 3:15.48, 3.5:16.44, 4:17.4, 4.5:18.36, 5:19.32, 5.5:19.74, 6:20.16, 6.5:20.58, 7:21, 7.5:21.42, 8:21.84, 8.5:22.26, 9:22.68, 9.5:23.1, 10:23.52, 10.5:23.82, 11:24.12, 11.5:24.42, 12:24.72, 12.5:25.02, 13:25.32, 13.5:25.62, 14:25.92, 14.5:26.22, 15:26.52, .5+:0.300000000000001' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:16.86, 1:19.32, 1.5:21.78, 2:24.24, 2.5:26.7, 3:29.16, 3.5:31.62, 4:34.08, 4.5:36.54, 5:39, 5.5:40.08, 6:41.16, 6.5:42.24, 7:43.32, 7.5:44.4, 8:45.48, 8.5:46.56, 9:47.64, 9.5:48.72, 10:49.8, 10.5:50.52, 11:51.24, 11.5:51.96, 12:52.68, 12.5:53.4, 13:54.12, 13.5:54.84, 14:55.56, 14.5:56.28, 15:57, .5+:0.72' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:22.68, 1:25.02, 1.5:27.36, 2:29.7, 2.5:31.92, 3:34.14, 3.5:36.36, 4:38.58, 4.5:40.8, 5:43.02, 5.5:44.04, 6:45.06, 6.5:46.08, 7:47.1, 7.5:48.12, 8:49.14, 8.5:50.16, 9:51.18, 9.5:52.2, 10:53.22, 10.5:53.94, 11:54.66, 11.5:55.38, 12:56.1, 12.5:56.82, 13:57.54, 13.5:58.26, 14:58.98, 14.5:59.7, 15:60.42, .5+:0.719999999999999' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:20.58, 1:21.24, 1.5:21.9, 2:22.56, 2.5:25.14, 3:27.72, 3.5:30.3, 4:32.88, 4.5:35.46, 5:38.04, 5.5:40.08, 6:42.12, 6.5:44.16, 7:46.2, 7.5:48.24, 8:50.28, 8.5:52.32, 9:54.36, 9.5:56.4, 10:58.44, 10.5:59.04, 11:59.64, 11.5:60.24, 12:60.84, 12.5:61.44, 13:62.04, 13.5:62.64, 14:63.24, 14.5:63.84, 15:64.44, .5+:0.66' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:25.92, 1:28.26, 1.5:30.6, 2:32.94, 2.5:34.98, 3:37.02, 3.5:39.06, 4:41.1, 4.5:43.14, 5:45.18, 5.5:46.8, 6:48.42, 6.5:50.04, 7:51.66, 7.5:53.28, 8:54.9, 8.5:56.52, 9:58.14, 9.5:59.76, 10:61.38, 10.5:62.1, 11:62.82, 11.5:63.54, 12:64.26, 12.5:64.98, 13:65.7, 13.5:66.42, 14:67.14, 14.5:67.86, 15:68.58, .5+:0.719999999999999' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:27.1, 1:30.4, 1.5:33.7, 2:37, 2.5:39.7, 3:42.4, 3.5:45.1, 4:47.8, 4.5:50.5, 5:53.2, 5.5:55.45, 6:57.7, 6.5:59.95, 7:62.2, 7.5:64.45, 8:66.7, 8.5:68.95, 9:71.2, 9.5:73.45, 10:75.7, 10.5:76.95, 11:78.2, 11.5:79.45, 12:80.7, 12.5:81.95, 13:83.2, 13.5:84.45, 14:85.7, 14.5:86.95, 15:88.2, .5+:1.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:27.7, 1:30.25, 1.5:32.8, 2:35.35, 2.5:41.8, 3:48.25, 3.5:54.7, 4:61.15, 4.5:67.6, 5:74.05, 5.5:77.75, 6:81.45, 6.5:85.15, 7:88.85, 7.5:92.55, 8:96.25, 8.5:99.95, 9:103.65, 9.5:107.35, 10:111.05, 10.5:113.45, 11:115.85, 11.5:118.25, 12:120.65, 12.5:123.05, 13:125.45, 13.5:127.85, 14:130.25, 14.5:132.65, 15:135.05, .5+:2.35' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:34.55, 1:40.8, 1.5:47.05, 2:53.3, 2.5:59.4, 3:65.5, 3.5:71.6, 4:77.7, 4.5:83.8, 5:89.9, 5.5:94.45, 6:99, 6.5:103.55, 7:108.1, 7.5:112.65, 8:117.2, 8.5:121.75, 9:126.3, 9.5:130.85, 10:135.4, 10.5:138.75, 11:142.1, 11.5:145.45, 12:148.8, 12.5:152.15, 13:155.5, 13.5:158.85, 14:162.2, 14.5:165.55, 15:168.9, .5+:3.34999999999999' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:35.75, 1:42.9, 1.5:50.05, 2:57.2, 2.5:64.35, 3:71.5, 3.5:78.65, 4:85.8, 4.5:92.95, 5:100.1, 5.5:106.6, 6:113.1, 6.5:119.6, 7:126.1, 7.5:132.6, 8:139.1, 8.5:145.6, 9:152.1, 9.5:158.6, 10:165.1, 10.5:169.55, 11:174, 11.5:178.45, 12:182.9, 12.5:187.35, 13:191.8, 13.5:196.25, 14:200.7, 14.5:205.15, 15:209.6, .5+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_9' ;

/* Parcel Force Global Value Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_INSURE' ;

/* Parcel Force Ireland Express */
UPDATE configuration SET configuration_value = '2:16.68, 5:17.7, 10:21.18, 15:28.2, 20:33.48, 25:44.76, 30:48.96' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_COST0_1' ;

/* Parcel Force Ireland Express Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_INSURE' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:3.9, 0.25:4.2, 0.5:6.1, 0.75:7.15, 0.1:8.55, 0.125:9.8, 1.5:10.85, 1.75:11.65, 2:12.05' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:3.9, 0.25:4.2, 0.5:6.1, 0.75:7.15, 0.1:8.55, 0.125:9.8, 1.5:10.85, 1.75:11.65, 2:12.05' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;
