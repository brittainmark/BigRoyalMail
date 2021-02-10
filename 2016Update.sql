/* 
 * Update for Big royal Mail postage rates valid from 29 March 2016 for latest rates visit http://www.royalmail.com 
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
SET @Default_Insurance = '20.00';

/* @Signed_Insurance*/
SET @Signed_Insurance = '50.00';

/* @Min_Insurance = Penny more that signed for insurance */
SET @Min_Insurance = '50.01';

/* @Max_Insurance = Penny more that signed for insurance */
SET @Max_Insurance = '2500.00';

/* @Max_Insurance Tracked signed for*/
SET @AS_Insurance = '250.00';

/* @Max_Insurance Parcel force */
SET @PFValue_Insurance = '500.00';

/* @Expires_date = Date you want to be reminded of to update new rates */
SET @Expires_date = '2017-03-27';

/*
 * If you require different handling fees for each separate type of postage please either remove the handling fees section below or replace the @... values with
 * the appropriate fees.
 */
 
/* Handling fee for uk orders */
SET @UKHandling = '0.00'; 

/* Handling fee for European orders */
SET @EuropeHandling = '0.00'; 

/* Handling fee for rest of world Zone 1 orders */
SET @ROWHandling = '0.00'; 

/* Handling fee for rest of world Zone 2 orders */
SET @ROWHandlingZ2 = '0.00'; 

/* Handling fee for Parcel Force orders */
SET @PFHandling = '0.00'; 

/* Handling fee for Parcel Force Global World Wide orders */
SET @PFHandlingGWW = '0.00'; 


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
UPDATE configuration SET configuration_value = '0.1:0.64' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

/* First Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.74' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

/* First Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.96, 0.25:1.27, 0.5:1.71, 0.75:2.46' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1' ;

/* First Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:2.06, 0.25:2.37, 0.5:2.81, 0.75:3.56' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1' ;

/* Second Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.55' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

/* Second Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.65' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

/* Second Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.75, 0.25:1.2, 0.5:1.54, 0.75:2.09' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1' ;

/* Second Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.85, 0.25:2.3, 0.5:2.64, 0.75:3.19' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1' ;

/* First Class Small Parcel */
UPDATE configuration SET configuration_value = '1:3.35, 2:5.5' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_COST0_1' ;

/* Second Class Small Parcel */
UPDATE configuration SET configuration_value = '1:2.85, 2:2.85' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_COST0_1' ;

/* First Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:4.45, 2:6.6' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1' ;

/* Second Class Small Parcel Signed For */
UPDATE configuration SET configuration_value = '1:3.95, 2:3.95' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1' ;

/* First Class Medium Parcel */
UPDATE configuration SET configuration_value = '1:5.7, 2:8.95, 5:15.85, 10:21.9, 20:33.4' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1' ;

/* Second Class  Medium Parcel  */
UPDATE configuration SET configuration_value = '1:4.95, 2:4.95, 5:13.75, 10:20.25, 20:28.55' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1' ;

/* First Class  Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.8, 2:10.05, 5:16.95, 10:23, 20:34.5' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1' ;

/* Second Class Medium Parcel Signed For */
UPDATE configuration SET configuration_value = '1:6.05, 2:6.05, 5:14.85, 10:21.35, 20:29.65' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1' ;

/* Special Delivery */
UPDATE configuration SET configuration_value = '0.1:6.45, 0.5:7.25, 1:8.55, 2:11, 10:26.6, 20:41.2' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' ;

/* Special Delivery Insurance rates */
UPDATE configuration SET configuration_value = '500:0,1000:1,2500:3' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_INSURE' ;

/* Special Delivery 9am */
UPDATE configuration SET configuration_value = '0.1:18.36, 0.5:20.76, 1:22.5, 2:26.94' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance  */
UPDATE configuration SET configuration_value = '50:0,1000:2.2,2500:5.7' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_INSURE' ;

/* Special Delivery Saturday*/
UPDATE configuration SET configuration_value = '0.1:10.74, 0.5:11.7, 1:13.26, 2:16.2, 10:34.92, 20:52.44' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_COST0_1' ;

/* Special Delivery Saturday Insurance rates */
UPDATE configuration SET configuration_value = '500:0,1000:1.2,2500:3.6' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_INSURE' ;

/* Special Delivery Saturday 9am */
UPDATE configuration SET configuration_value = '0.1:21.36, 0.5:23.76, 1:25.5, 2:29.94' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_COST0_1' ;

/* Special Delivery Satueday 9am Insurance  */
UPDATE configuration SET configuration_value = '500:0,1000:2.2,2500:5.7' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_INSURE' ;

/* Parcel Force Express 48 */
UPDATE configuration SET configuration_value = '2:11.99, 5:12.98, 10:16.4, 15:23.14, 20:28.51, 25:39.64, 30:43.78, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_COST0_1' ;

/* Parcel Force Express 48 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 500:4.8, 500+:4.8' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_INSURE' ;

/* Parcel Force Express 24 */
UPDATE configuration SET configuration_value = '2:16.49, 5:17.48, 10:20.9, 15:27.64, 20:33.01, 25:44.14, 30:48.28, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_COST0_1' ;

/* Parcel Force Express 24 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 500:4.8, 500+:4.8' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_INSURE' ;

/* Parcel Force Express AM */
UPDATE configuration SET configuration_value = '2:19.49, 5:20.48, 10:23.9, 15:30.64, 20:36.01, 25:47.14, 30:51.28, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_COST0_1' ;

/* Parcel Force Express AM Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 500:4.8, 500+:4.8' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_INSURE' ;

/* Parcel Force Express 10 */
UPDATE configuration SET configuration_value = '2:29.48, 5:30.48, 10:33.9, 15:40.63, 20:46.01, 25:57.13, 30:61.27, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_COST0_1' ;

/* Parcel Force Express 10 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 500:4.8, 500+:4.8' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_INSURE' ;

/* Parcel Force Express 9 */
UPDATE configuration SET configuration_value = '2:39.48, 5:40.48, 10:43.9, 15:50.93, 20:56, 25:67.13, 30:71.27, 1+:1.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_COST0_1' ;

/* Parcel Force Express 9 Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 500:4.8, 500+:4.8' WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_INSURE' ;


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
UPDATE configuration SET configuration_value = '0.1:2.45, 0.25:3.7, 0.5:5.15, 0.75:6.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_1' ;

/* World zone 1 Large Letter  */
UPDATE configuration SET configuration_value = '0.1:3.15, 0.25:4.75, 0.5:7.45, 0.75:10.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_2' ;

/* World zone 2 Large Letter */
UPDATE configuration SET configuration_value = '0.1:3.3, 0.1:5.05, 0.25:7.9, 0.5:10.75' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_3' ;

/* Europe Airmail Large Letter Signed */
UPDATE configuration SET configuration_value = '0.1:7.75, 0.25:8.25, 0.5:9.65, 0.75:10.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_1' ;

/* World zone 1 Large Letter Signed  */
UPDATE configuration SET configuration_value = '0.1:8.35, 0.25:9.25, 0.5:11.85, 0.75:13.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_2' ;

/* World zone 2 Large Letter Signed */
UPDATE configuration SET configuration_value = '0.1:8.55, 0.1:9.55, 0.25:12.25, 0.5:14.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_3' ;

/* Insurance Airmail Large Letter Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_INSURE' ;

/*  Europe Airmail Letter */
UPDATE configuration SET configuration_value = '0.01:1.05, 0.02:1.05, 0.1:1.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_1' ;

/* World zone 1 Letter  */
UPDATE configuration SET configuration_value = '0.01:1.05, 0.02:1.33, 0.1:2.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_2' ;

/* World zone 2 Letter */
UPDATE configuration SET configuration_value = '0.01:1.05, 0.01:1.33, 0.02:2.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_3' ;

/* Europe Airmail Letter Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6, 0.1:6.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_1' ;

/* World zone 1 Letter Signed  */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.33, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_2' ;

/* World zone 2 Letter Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.01:6.33, 0.02:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_3' ;

/* Insurance Airmail Letter Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_INSURE' ;

/*  Airmail Europe */
UPDATE configuration SET configuration_value = '0.1:3.55, 0.25:4.05, 0.5:5.6, 0.75:6.95, 1:8.35, 1.25:9.6, 1.5:10.95, 1.75:12.3, 2:13.45' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:4.2, 0.25:5.1, 0.5:7.8, 0.75:10.4, 1:13.05, 1.25:14.65, 1.5:16.35, 1.75:18.05, 2:19.75' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:4.55, 0.25:5.55, 0.5:8.55, 0.75:11.25, 1:14, 1.25:15.8, 1.5:17.7, 1.75:19.6, 2:21.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.5, 1.25:13.55, 1.5:14.95, 1.75:15.45, 2:16.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.55, 1.5:20.15, 1.75:21.15, 2:22.75' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:19.65, 1.5:21.55, 1.75:22.65, 2:24.45' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3' ;

/* Airmail Signed For Insurance */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_INSURE' ;

/* Europe Airmail Large Letter Tracked EU*/
UPDATE configuration SET configuration_value = '0.1:9.3, 0.25:9.9, 0.5:11.58, 0.75:12.66' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULARGELETTER_ZONES_COST0_1' ;

/* Insurance Airmail Large Letter Tracked EU*/
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULARGELETTER_ZONES_INSURE' ;

/* Europe Airmail Letter Tracked EU */
UPDATE configuration SET configuration_value = '0.01:7.2, 0.02:7.2, 0.1:7.83' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEULETTER_ZONES_COST0_1' ;

/* Insurance Airmail Letter Tracked EU */
UPDATE configuration SET configuration_value = '50:0,250:2.5' where configuration_key = 'MODULE_SHIPPING_RMAMTEULETTER_ZONES_INSURE' ;

/* International Tracked Europe EU*/
UPDATE configuration SET configuration_value = '0.1:9.84, 0.25:10.44, 0.5:12.18, 0.75:13.32, 1:15, 1.25:16.26, 1.5:17.94, 1.75:18.54, 2:19.98' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_COST0_1' ;

/* International Tracked EU Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,250:3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTEUPARCEL_ZONES_INSURE' ;

/* Europe Airmail Large Letter Tracked */
UPDATE configuration SET configuration_value = '0.1:7.75, 0.25:8.25, 0.5:9.65, 0.75:10.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_1' ;

/* World zone 1 Large Letter Tracked  */
UPDATE configuration SET configuration_value = '0.1:8.35, 0.25:9.25, 0.5:11.85, 0.75:13.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_2' ;

/* World zone 2 Large Letter Tracked */
UPDATE configuration SET configuration_value = '0.1:8.55, 0.1:9.55, 0.25:12.25, 0.5:14.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_3' ;

/* Insurance Airmail Large Letter Tracked */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_INSURE' ;

/* Europe Airmail Letter Tracked */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6, 0.1:6.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_1' ;

/* World zone 1 Letter Tracked  */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.33, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_2' ;

/* World zone 2 Letter Tracked */
UPDATE configuration SET configuration_value = '0.01:6, 0.01:6.33, 0.02:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_3' ;

/* Insurance Airmail Letter Tracked */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_INSURE' ;

/* International Tracked Europe non EU*/
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.5, 1.25:13.55, 1.5:14.95, 1.75:15.45, 2:16.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.55, 1.5:20.15, 1.75:21.15, 2:22.75' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:19.65, 1.5:21.55, 1.75:22.65, 2:24.45' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3' ;

/* International Tracked Insurance Rates */
UPDATE configuration SET configuration_value = '12.5:17.2,13.55:18.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_INSURE' ;

/* Europe Airmail Large Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.1:7.75, 0.25:8.25, 0.5:9.65, 0.75:10.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_1' ;

/* World zone 1 Large Letter Tracked and Signed  */
UPDATE configuration SET configuration_value = '0.1:8.35, 0.25:9.25, 0.5:11.85, 0.75:13.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_2' ;

/* World zone 2 Large Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.1:8.55, 0.1:9.55, 0.25:12.25, 0.5:14.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_3' ;

/* Insurance Airmail Large Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_INSURE' ;

/* Europe Airmail Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6, 0.1:6.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_1' ;

/* World zone 1 Letter Tracked and Signed  */
UPDATE configuration SET configuration_value = '0.01:6, 0.02:6.33, 0.1:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_2' ;

/* World zone 2 Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '0.01:6, 0.01:6.33, 0.02:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_3' ;

/* Insurance Airmail Letter Tracked and Signed */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_INSURE' ;

/* International Tracked and Signed Europe*/
UPDATE configuration SET configuration_value = '0.1:8.2, 0.25:8.7, 0.5:10.15, 0.75:11.1, 1:12.5, 1.25:13.55, 1.5:14.95, 1.75:15.45, 2:16.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1' ;

/* International Tracked Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.75, 0.5:12.45, 0.75:14.55, 1:17.2, 1.25:18.55, 1.5:20.15, 1.75:21.15, 2:22.75' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2' ;

/* International Tracked Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:9, 0.25:10.05, 0.5:12.9, 0.75:15.4, 1:18.15, 1.25:19.65, 1.5:21.55, 1.75:22.65, 2:24.45' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3' ;

/* International Tracked and Signed Insurance Rates */
UPDATE configuration SET configuration_value = '50:0,250:2.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_INSURE' ;

/* Parcel Force Global Economy */
UPDATE configuration SET configuration_value = '0.5:24.45, 1:26.95, 1.5:29.45, 2:31.95, 2.5:38.3, 3:44.65, 3.5:51, 4:57.35, 4.5:63.7, 5:70.05, 5.5:73.7, 6:77.35, 6.5:81, 7:84.65, 7.5:88.3, 8:91.95, 8.5:95.6, 9:99.25, 9.5:102.9, 10:106.55, 10.5:108.9, 11:111.25, 11.5:113.6, 12:115.95, 12.5:118.3, 13:120.65, 13.5:123, 14:125.35, 14.5:127.7, 15:130.05, .5+:2.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:31.5, 1:37.65, 1.5:43.8, 2:49.95, 2.5:55.95, 3:61.95, 3.5:67.95, 4:73.95, 4.5:79.95, 5:85.95, 5.5:90.45, 6:94.95, 6.5:99.45, 7:103.95, 7.5:108.45, 8:112.95, 8.5:117.45, 9:121.95, 9.5:126.45, 10:129.75, 10.5:133.05, 11:136.35, 11.5:139.65, 12:142.95, 12.5:146.25, 13:149.55, 13.5:152.85, 14:156.15, 14.5:159.45, 15:162.75, .5+:3.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:33, 1:40.05, 1.5:47.1, 2:54.15, 2.5:61.2, 3:68.25, 3.5:75.3, 4:82.35, 4.5:89.4, 5:96.45, 5.5:102.85, 6:109.25, 6.5:115.65, 7:122.05, 7.5:128.45, 8:134.85, 8.5:141.25, 9:147.65, 9.5:154.05, 10:158.5, 10.5:162.9, 11:167.3, 11.5:171.7, 12:176.1, 12.5:180.5, 13:184.9, 13.5:189.3, 14:193.7, 14.5:198.1, 15:202.5, .5+:4.45' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_3' ;

/* Parcel Force Global Economy Insurance Rates */
UPDATE configuration SET configuration_value = '' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGECONOMY_ZONES_INSURE' ;

/* Parcel Force Global Express */
UPDATE configuration SET configuration_value = '0.5:51.95, 1:54.5, 1.5:57.05, 2:59.6, 2.5:62.05, 3:64.5, 3.5:66.95, 4:69.4, 4.5:71.85, 5:74.3, 5.5:77.05, 6:79.8, 6.5:82.55, 7:85.3, 7.5:88.05, 8:90.8, 8.5:93.55, 9:96.3, 9.5:99.05, 10:101.8, 10.5:102.25, 11:102.7, 11.5:103.15, 12:103.6, 12.5:104.05, 13:104.5, 13.5:104.95, 14:105.4, 14.5:105.85, 15:106.3, .5+:0.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:47.46, 1:49.92, 1.5:52.38, 2:54.84, 2.5:58.5, 3:62.16, 3.5:65.82, 4:69.48, 4.5:73.14, 5:76.8, 5.5:78.48, 6:80.16, 6.5:81.84, 7:83.52, 7.5:85.2, 8:86.88, 8.5:88.56, 9:90.24, 9.5:91.92, 10:93.6, 10.5:95.05, 11:96.5, 11.5:97.95, 12:99.4, 12.5:100.85, 13:102.3, 13.5:103.75, 14:105.2, 14.5:106.65, 15:108.1, .5+:1.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:43.02, 1:47.04, 1.5:51.06, 2:55.08, 2.5:58.38, 3:61.68, 3.5:64.98, 4:68.28, 4.5:71.58, 5:74.88, 5.5:76.92, 6:78.96, 6.5:81, 7:83.04, 7.5:85.08, 8:87.12, 8.5:89.16, 9:91.2, 9.5:93.24, 10:95.28, 10.5:97.73, 11:100.18, 11.5:102.63, 12:105.08, 12.5:107.53, 13:109.98, 13.5:112.43, 14:114.88, 14.5:117.33, 15:119.78, .5+:2.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:44.28, 1:47.82, 1.5:51.36, 2:54.9, 2.5:59.04, 3:63.18, 3.5:67.32, 4:71.46, 4.5:75.6, 5:79.74, 5.5:82.86, 6:85.98, 6.5:89.1, 7:92.22, 7.5:95.34, 8:98.46, 8.5:101.58, 9:104.7, 9.5:107.82, 10:110.94, 10.5:114.39, 11:117.84, 11.5:121.29, 12:124.74, 12.5:128.19, 13:131.64, 13.5:135.09, 14:138.54, 14.5:141.99, 15:145.44, .5+:3.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:47.58, 1:51.36, 1.5:55.14, 2:58.92, 2.5:61.98, 3:65.04, 3.5:68.1, 4:71.16, 4.5:74.22, 5:77.28, 5.5:80.34, 6:83.4, 6.5:86.46, 7:89.52, 7.5:92.58, 8:95.64, 8.5:98.7, 9:101.76, 9.5:104.82, 10:107.88, 10.5:112.33, 11:116.78, 11.5:121.23, 12:125.68, 12.5:130.13, 13:134.58, 13.5:139.03, 14:143.48, 14.5:147.93, 15:152.38, .5+:4.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:51.96, 1:56.58, 1.5:61.2, 2:65.82, 2.5:73.2, 3:80.58, 3.5:87.96, 4:95.34, 4.5:102.72, 5:110.1, 5.5:115.08, 6:120.06, 6.5:125.04, 7:130.02, 7.5:135, 8:139.98, 8.5:144.96, 9:149.94, 9.5:154.92, 10:159.9, 10.5:165.35, 11:170.8, 11.5:176.25, 12:181.7, 12.5:187.15, 13:192.6, 13.5:198.05, 14:203.5, 14.5:208.95, 15:214.4, .5+:5.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:52, 1:56.95, 1.5:61.9, 2:66.85, 2.5:70.8, 3:74.75, 3.5:78.7, 4:82.65, 4.5:86.6, 5:90.55, 5.5:94.75, 6:98.95, 6.5:103.15, 7:107.35, 7.5:111.55, 8:115.75, 8.5:119.95, 9:124.15, 9.5:128.35, 10:132.55, 10.5:139, 11:145.45, 11.5:151.9, 12:158.35, 12.5:164.8, 13:171.25, 13.5:177.7, 14:184.15, 14.5:190.6, 15:197.05, .5+:6.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:63.05, 1:69.55, 1.5:76.05, 2:82.55, 2.5:88.2, 3:93.85, 3.5:99.5, 4:105.15, 4.5:110.8, 5:116.45, 5.5:121.1, 6:125.75, 6.5:130.4, 7:135.05, 7.5:139.7, 8:144.35, 8.5:149, 9:153.65, 9.5:158.3, 10:162.95, 10.5:170.4, 11:177.85, 11.5:185.3, 12:192.75, 12.5:200.2, 13:207.65, 13.5:215.1, 14:222.55, 14.5:230, 15:237.45, .5+:7.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:71.95, 1:80.6, 1.5:89.25, 2:97.9, 2.5:105.9, 3:113.9, 3.5:121.9, 4:129.9, 4.5:137.9, 5:145.9, 5.5:152.1, 6:158.3, 6.5:164.5, 7:170.7, 7.5:176.9, 8:183.1, 8.5:189.3, 9:195.5, 9.5:201.7, 10:207.9, 10.5:216.35, 11:224.8, 11.5:233.25, 12:241.7, 12.5:250.15, 13:258.6, 13.5:267.05, 14:275.5, 14.5:283.95, 15:292.4, .5+:8.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9' ;

/* Parcel Force Global Express Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 500:4.8, 500+:4.8' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGEXPRESS_ZONES_INSURE' ;

/* Parcel Force Global Priority */
UPDATE configuration SET configuration_value = '0.5:29.65, 1:30.9, 1.5:32.15, 2:33.4, 2.5:34.4, 3:35.4, 3.5:36.4, 4:37.4, 4.5:38.4, 5:39.4, 5.5:39.8, 6:40.2, 6.5:40.6, 7:41, 7.5:41.4, 8:41.8, 8.5:42.2, 9:42.6, 9.5:43, 10:43.4, 10.5:43.85, 11:44.3, 11.5:44.75, 12:45.2, 12.5:45.65, 13:46.1, 13.5:46.55, 14:47, 14.5:47.45, 15:47.9, .5+:0.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:30.48, 1:33, 1.5:35.52, 2:38.04, 2.5:40.56, 3:43.08, 3.5:45.6, 4:48.12, 4.5:50.64, 5:53.16, 5.5:54.24, 6:55.32, 6.5:56.4, 7:57.48, 7.5:58.56, 8:59.64, 8.5:60.72, 9:61.8, 9.5:62.88, 10:63.96, 10.5:64.68, 11:65.4, 11.5:66.12, 12:66.84, 12.5:67.56, 13:68.28, 13.5:69, 14:69.72, 14.5:70.44, 15:71.16, .5+:0.72' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:33.84, 1:36.12, 1.5:38.4, 2:40.68, 2.5:42.9, 3:45.12, 3.5:47.34, 4:49.56, 4.5:51.78, 5:54, 5.5:54.96, 6:55.92, 6.5:56.88, 7:57.84, 7.5:58.8, 8:59.76, 8.5:60.72, 9:61.68, 9.5:62.64, 10:63.6, 10.5:65.04, 11:66.48, 11.5:67.92, 12:69.36, 12.5:70.8, 13:72.24, 13.5:73.68, 14:75.12, 14.5:76.56, 15:78, .5+:0.66' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:35.46, 1:37.38, 1.5:39.3, 2:41.22, 2.5:43.32, 3:45.42, 3.5:47.52, 4:49.62, 4.5:51.72, 5:53.82, 5.5:55.32, 6:56.82, 6.5:58.32, 7:59.82, 7.5:61.32, 8:62.82, 8.5:64.32, 9:65.82, 9.5:67.32, 10:68.82, 10.5:70.26, 11:71.7, 11.5:73.14, 12:74.58, 12.5:76.02, 13:77.46, 13.5:78.9, 14:80.34, 14.5:81.78, 15:83.22, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:38.52, 1:40.62, 1.5:42.72, 2:44.82, 2.5:47.1, 3:49.38, 3.5:51.66, 4:53.94, 4.5:56.22, 5:58.5, 5.5:60.36, 6:62.22, 6.5:64.08, 7:65.94, 7.5:67.8, 8:69.66, 8.5:71.52, 9:73.38, 9.5:75.24, 10:77.1, 10.5:79.25, 11:81.4, 11.5:83.55, 12:85.7, 12.5:87.85, 13:90, 13.5:92.15, 14:94.3, 14.5:96.45, 15:98.6, .5+:0.66' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:41.76, 1:44.94, 1.5:48.12, 2:51.3, 2.5:54, 3:56.7, 3.5:59.4, 4:62.1, 4.5:64.8, 5:67.5, 5.5:69.78, 6:72.06, 6.5:74.34, 7:76.62, 7.5:78.9, 8:81.18, 8.5:83.46, 9:85.74, 9.5:88.02, 10:90.3, 10.5:91.5, 11:92.7, 11.5:93.9, 12:95.1, 12.5:96.3, 13:97.5, 13.5:98.7, 14:99.9, 14.5:101.1, 15:102.3, .5+:1.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:44.35, 1:46.85, 1.5:49.35, 2:51.85, 2.5:58.25, 3:64.65, 3.5:71.05, 4:77.45, 4.5:83.85, 5:90.25, 5.5:93.95, 6:97.65, 6.5:101.35, 7:105.05, 7.5:108.75, 8:112.45, 8.5:116.15, 9:119.85, 9.5:123.55, 10:127.25, 10.5:129.6, 11:131.95, 11.5:134.3, 12:136.65, 12.5:139, 13:141.35, 13.5:143.7, 14:146.05, 14.5:148.4, 15:150.75, .5+:2.35' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:47, 1:52.9, 1.5:58.8, 2:64.7, 2.5:70.6, 3:76.5, 3.5:82.4, 4:88.3, 4.5:94.2, 5:100.1, 5.5:104.6, 6:109.1, 6.5:113.6, 7:118.1, 7.5:122.6, 8:127.1, 8.5:131.6, 9:136.1, 9.5:140.6, 10:145.1, 10.5:148.5, 11:151.9, 11.5:155.3, 12:158.7, 12.5:162.1, 13:165.5, 13.5:168.9, 14:172.3, 14.5:175.7, 15:179.1, .5+:3.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:59.55, 1:66.4, 1.5:73.25, 2:80.1, 2.5:86.9, 3:93.7, 3.5:100.5, 4:107.3, 4.5:114.1, 5:120.9, 5.5:127, 6:133.1, 6.5:139.2, 7:145.3, 7.5:151.4, 8:157.5, 8.5:163.6, 9:169.7, 9.5:175.8, 10:181.9, 10.5:186.3, 11:190.7, 11.5:195.1, 12:199.5, 12.5:203.9, 13:208.3, 13.5:212.7, 14:217.1, 14.5:221.5, 15:225.9, .5+:4.45' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_9' ;

/* Parcel Force Global Priority Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 500:4.8, 500+:4.8' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGPRIORITY_ZONES_INSURE' ;

/* Parcel Force Global Value */
UPDATE configuration SET configuration_value = '0.5:9.65, 1:10.85, 1.5:12.05, 2:13.25, 2.5:14.2, 3:15.15, 3.5:16.1, 4:17.05, 4.5:18, 5:18.95, 5.5:19.35, 6:19.75, 6.5:20.15, 7:20.55, 7.5:20.95, 8:21.35, 8.5:21.75, 9:22.15, 9.5:22.55, 10:22.95, 10.5:23.2, 11:23.45, 11.5:23.7, 12:23.95, 12.5:24.2, 13:24.45, 13.5:24.7, 14:24.95, 14.5:25.2, 15:25.45, .5+:0.25' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:16.68, 1:19.08, 1.5:21.48, 2:23.88, 2.5:26.28, 3:28.68, 3.5:31.08, 4:33.48, 4.5:35.88, 5:38.28, 5.5:39.3, 6:40.32, 6.5:41.34, 7:42.36, 7.5:43.38, 8:44.4, 8.5:45.42, 9:46.44, 9.5:47.46, 10:48.48, 10.5:49.14, 11:49.8, 11.5:50.46, 12:51.12, 12.5:51.78, 13:52.44, 13.5:53.1, 14:53.76, 14.5:54.42, 15:55.08, .5+:0.66' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:22.44, 1:24.72, 1.5:27, 2:29.28, 2.5:31.44, 3:33.6, 3.5:35.76, 4:37.92, 4.5:40.08, 5:42.24, 5.5:43.2, 6:44.16, 6.5:45.12, 7:46.08, 7.5:47.04, 8:48, 8.5:48.96, 9:49.92, 9.5:50.88, 10:51.84, 10.5:52.5, 11:53.16, 11.5:53.82, 12:54.48, 12.5:55.14, 13:55.8, 13.5:56.46, 14:57.12, 14.5:57.78, 15:58.44, .5+:0.66' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:20.34, 1:20.94, 1.5:21.54, 2:22.14, 2.5:24.66, 3:27.18, 3.5:29.7, 4:32.22, 4.5:34.74, 5:37.26, 5.5:39.24, 6:41.22, 6.5:43.2, 7:45.18, 7.5:47.16, 8:49.14, 8.5:51.12, 9:53.1, 9.5:55.08, 10:57.06, 10.5:57.6, 11:58.14, 11.5:58.68, 12:59.22, 12.5:59.76, 13:60.3, 13.5:60.84, 14:61.38, 14.5:61.92, 15:62.46, .5+:0.6' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_4' ;
UPDATE configuration SET configuration_value = '0.5:25.62, 1:27.9, 1.5:30.18, 2:32.46, 2.5:34.44, 3:36.42, 3.5:38.4, 4:40.38, 4.5:42.36, 5:44.34, 5.5:45.9, 6:47.46, 6.5:49.02, 7:50.58, 7.5:52.14, 8:53.7, 8.5:55.26, 9:56.82, 9.5:58.38, 10:59.94, 10.5:60.6, 11:61.26, 11.5:61.92, 12:62.58, 12.5:63.24, 13:63.9, 13.5:64.56, 14:65.22, 14.5:65.88, 15:66.54, .5+:0.66' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_5' ;
UPDATE configuration SET configuration_value = '0.5:26.82, 1:30.06, 1.5:33.3, 2:36.54, 2.5:39.18, 3:41.82, 3.5:44.46, 4:47.1, 4.5:49.74, 5:52.38, 5.5:54.6, 6:56.82, 6.5:59.04, 7:61.26, 7.5:63.48, 8:65.7, 8.5:67.92, 9:70.14, 9.5:72.36, 10:74.58, 10.5:75.78, 11:76.98, 11.5:78.18, 12:79.38, 12.5:80.58, 13:81.78, 13.5:82.98, 14:84.18, 14.5:85.38, 15:86.58, .5+:1.2' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_6' ;
UPDATE configuration SET configuration_value = '0.5:27.4, 1:29.9, 1.5:32.4, 2:34.9, 2.5:41.25, 3:47.6, 3.5:53.95, 4:60.3, 4.5:66.65, 5:73, 5.5:76.65, 6:80.3, 6.5:83.95, 7:87.6, 7.5:91.25, 8:94.9, 8.5:98.55, 9:102.2, 9.5:105.85, 10:109.5, 10.5:111.85, 11:114.2, 11.5:116.55, 12:118.9, 12.5:121.25, 13:123.6, 13.5:125.95, 14:128.3, 14.5:130.65, 15:133, .5+:2.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_7' ;
UPDATE configuration SET configuration_value = '0.5:34.2, 1:40.35, 1.5:46.5, 2:52.65, 2.5:58.65, 3:64.65, 3.5:70.65, 4:76.65, 4.5:82.65, 5:88.65, 5.5:93.15, 6:97.65, 6.5:102.15, 7:106.65, 7.5:111.15, 8:115.65, 8.5:120.15, 9:124.65, 9.5:129.15, 10:133.65, 10.5:136.95, 11:140.25, 11.5:143.55, 12:146.85, 12.5:150.15, 13:153.45, 13.5:156.75, 14:160.05, 14.5:163.35, 15:166.65, .5+:3.3' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_8' ;
UPDATE configuration SET configuration_value = '0.5:35.35, 1:42.4, 1.5:49.45, 2:56.5, 2.5:63.55, 3:70.6, 3.5:77.65, 4:84.7, 4.5:91.75, 5:98.8, 5.5:105.2, 6:111.6, 6.5:118, 7:124.4, 7.5:130.8, 8:137.2, 8.5:143.6, 9:150, 9.5:156.4, 10:162.8, 10.5:167.2, 11:171.6, 11.5:176, 12:180.4, 12.5:184.8, 13:189.2, 13.5:193.6, 14:198, 14.5:202.4, 15:206.8, .5+:4.45' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_9' ;

/* Parcel Force Global Value Insurance Rates */
UPDATE configuration SET configuration_value = '100:0, 200:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFGVALUE_ZONES_INSURE' ;

/* Parcel Force Ireland Express */
UPDATE configuration SET configuration_value = '2:16.49, 5:17.48, 10:20.9, 15:27.64, 20:33.01, 25:44.14, 30:48.28' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_COST0_1' ;

/* Parcel Force Ireland Express Insurance Rates */
UPDATE configuration SET configuration_value = '200:0, 300:1.8, 100+:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMPFIEXPRESS_ZONES_INSURE' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:3.35, 0.25:3.85, 0.5:5.4, 0.75:6.75, 0.1:8.2, 0.125:9.4, 1.5:10.75, 1.75:12.1, 2:13.25' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:3.35, 0.25:3.85, 0.5:5.4, 0.75:6.75, 0.1:8.2, 0.125:9.4, 1.5:10.75, 1.75:12.1, 2:13.25' WHERE configuration_key = 'MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2' ;