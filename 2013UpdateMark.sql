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

/* @Expires_date = Date you want to be reminded of to update new rates */
SET @Expires_date = "2014-04-05";

/*
 * If you require different handling fees for each separate type of postage please either remove the handling fees section below or replace the @... values with
 * the appropriate fees.
 */
 
/* Handling fee for uk orders */
SET @UKHandling = "1.00"; 

/* Handling fee for European orders */
SET @EuropeHandling = "2.00"; 

/* Handling fee for rest of world Zone 1 orders */
SET @ROWHandling = "2.00"; 

/* Handling fee for rest of world Zone 2 orders */
SET @ROWHandlingZ2 = "2.00"; 


/* SET the reminder date */
UPDATE configuration SET configuration_value = @Expires_date WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';

/* UK Postage rates 
*  Minimum and Maximum order values  */
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_MAX_ORDERVALUE' ;

/* Postage and Packing Handling Charges */
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_HANDLING_1' ;

/* Postage rates comma separated, format weight:cost e.g. 0.1:0.46, 0.2:1.78 is up to 100g £0.46, up to 200g £1.78 (assuming Kg for weight)  
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

/* First Class Small Parcel Confirmed */
UPDATE configuration SET configuration_value = '1:4.1, 2:7.95' WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1' ;

/* Second Class Small Parcel Confirmed */
UPDATE configuration SET configuration_value = '1:3.7, 2:6.7' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1' ;

/* First Class Medium Parcel */
UPDATE configuration SET configuration_value = '1:5.65, 2:8.9, 5:15.1, 10:21.25, 20:32.4' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1' ;

/* Second Class  Medium Parcel  */
UPDATE configuration SET configuration_value = '1:5.2, 2:8, 5:13.35, 10:19.65, 20:27.70' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1' ;

/* First Class  Medium Parcel Confirmed */
UPDATE configuration SET configuration_value = '1:6.75, 2:10, 5:16.2, 10:22.35, 20:33.5' WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1' ;

/* Second Class Medium Parcel Confirmed */
UPDATE configuration SET configuration_value = '1:6.3, 2:9.1, 5:14.45, 10:20.75, 20.28.80' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1' ;

/* Special Delivery */
UPDATE configuration SET configuration_value = '0.1:6.22, 0.5:6.95, 1:8.25, 2:11, 10:25.8, 20:40' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' ;

/* Special Delivery Insurance 1000 */
UPDATE configuration SET configuration_value = '0.1:7.22, 0.5:7.95, 1:9.25, 2:12, 10:26.8, 20:41' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_COST0_1' ;

/* Special Delivery Insurance 2500 */
UPDATE configuration SET configuration_value = '0.1:9.22, 0.5:9.95, 1:11.25, 2:14, 10:28.8, 20:43' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_COST0_1' ;

/* Special Delivery 9am */
UPDATE configuration SET configuration_value = '0.1:17.64, 0.5:19.92, 1:21.6, 2:26.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance 1000 */
UPDATE configuration SET configuration_value = '0.1:19.84, 0.5:22.12, 1:23.8, 2:28.36' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance 2500 */
UPDATE configuration SET configuration_value = '0.1:23.34, 0.5:25.62, 1:27.3, 2:31.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_COST0_1' ;

/* Overseas Mailing 
*  Minimum and Maximum order values  */
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Min_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_MIN_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Min_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Min_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_MIN_ORDERVALUE';

/* Postage and Packing Handling charges */
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_HANDLING_3' ;

/* Postage Rates 
*  Airmail Europe */
UPDATE configuration SET configuration_value = '0.1:3, 0.25:3.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:4.95, 0.75:6.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1:7.85, 1.25:9.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:10.75' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:12.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:13.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:3.5, 0.25:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:7.2, 0.75:9.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1:12.6, 1.25:15.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:18' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:20.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:23.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:3.5, 0.25:4.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:7.55, 0.75:10.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1:13.25, 1.25:16.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '1.5:18.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.75:21.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '2:24.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.25:8.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:10.25, 0.75:11.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1:13.15, 1.25:14.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:16.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:17.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:18.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:9.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:12.5, 0.75:15.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1:17.9, 1.25:20.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:23.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:26' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:28.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.8, 0.25:10' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '1:18.55, 1.25:21.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1:18.55, 1.25:21.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '1.5:24.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.75:27.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '2:29.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_3' ;

/* Airmail Europe Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:10.9, 0.25:11.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:12.85, 0.75:14.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1:15.75, 1.25:17.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:18.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:20.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:21.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Airmail Rest of World Zone 1 Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:11.4, 0.25:12.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:15.1, 0.75:17.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1:20.5, 1.25:23.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:25.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:28.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:31.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_2' ;

/* Airmail Rest of World Zone 2 Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:11.4, 0.25:12.6' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:15.45, 0.75:18.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1:21.15, 1.25:24' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '1.5:26.85' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.75:29.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '2:32.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_3' ;

/* Airsure Europe */
UPDATE configuration SET configuration_value = '0.1:8, 0.25:8.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:9.95, 0.75:11.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1:12.85, 1.25:14.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:15.75' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:17.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:18.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_1' ;

/* Airsure Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.9, 0.25:9.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:12.6, 0.75:15.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1:18, 1.25:20.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:23.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:26.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:28.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_2' ;

/* Airsure Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:8.9, 0.25:10.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:12.95, 0.75:15.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1:18.65, 1.25:21.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '1.5:24.35' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.75:27.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '2:30.05' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_3' ;

/* Airsure Europe insurance up to £500 */
UPDATE configuration SET configuration_value = '0.1:10.6, 0.25:11.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:12.55, 0.75:14' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '1:15.45, 1.25:16.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:18.35' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:19.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:21.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_1' ;

/* Airsure Rest of World Zone 1 insurance up to £500 */
UPDATE configuration SET configuration_value = '0.1:11.5, 0.25:12.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:15.2, 0.75:17.9' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '1:20.6, 1.25:23.3' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:26' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:28.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:31.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_2' ;

/* Airsure Rest of World Zone 2 insurance up to £500 */
UPDATE configuration SET configuration_value = '0.1:11.5, 0.25:12.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.5:15.55, 0.75:18.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '1:21.25, 1.25:24.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '1.5:26.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.75:29.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '2:32.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:2.6, 0.25:3.25' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:4.85, 0.75:6.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.1:8.05, 0.125:9.65' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:11.25' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:12.85' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:14.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_1' ;

/* Surface mail Europe Signed for */
UPDATE configuration SET configuration_value = '0.1:7.9, 0.25:8.55' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:10.15, 0.75:11.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.1:13.35, 0.125:14.95' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:16.55' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:18.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:19.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_1' ;

/* Surface mail Europe Signed for Insurance to £500 */
UPDATE configuration SET configuration_value = '0.1:10.5, 0.25:11.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.5:12.75, 0.75:14.35' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.1:15.95, 0.125:17.55' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.5:19.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.75:20.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '2:22.35' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:2.6, 0.25:3.25' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:4.85, 0.75:6.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.1:8.05, 0.125:9.65' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:11.25' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:12.85' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:14.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for */
UPDATE configuration SET configuration_value = '0.1:7.9, 0.25:8.55' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:10.15, 0.75:11.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.1:13.35, 0.125:14.95' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:16.55' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:18.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:19.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for Insurance to £500 */
UPDATE configuration SET configuration_value = '0.1:10.5, 0.25:11.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.5:12.75, 0.75:14.35' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.1:15.95, 0.125:17.55' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.5:19.15' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.75:20.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '2:22.35' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_2' ;
