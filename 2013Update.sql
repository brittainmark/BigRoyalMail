/* 
 * Update for Big royal Mail postage rates valid from 2 April 2013 for latest rates visit http://www.royalmail.com 
 * 
 * Assumes weights in Kg costs in GBP.
 * 
 * created by Mark Brittain. 
 * 
 * Donations via paypal to info@inner-light.co.uk
 * 
 * N.B. I do not guarentee to update this every year please check the rates with royal mail.
 * 
 
*  @Default_Insurance = Currently £20 */
SET @Default_Insurance = "20.00";

/* signed for insurance = Currently £50*/
SET @Signed_Insurance = "50.00";

/* @Min_Insurance = Penny more that default insurance */
SET @Min_Insurance = "46.01";

/* @Expires_date = Date you want to be reminded of to update new rates */
SET @Expires_date = "2014-04-01";

/*
 * If you require different handling fees for each seperate type of postage please either remove the handling fees section below or replace the @... values with
 * the appropriate fees.
 */
 
/* Handling fee for uk orders */
SET @UKHandling = "0.00"; 

/* Handling fee for European orders */
SET @EuropeHandling = "0.00"; 

/* Handling fee for rest of world Zone 1 orders and rest of world where no zone 2*/
SET @ROWHandling = "0.00"; 

/* Handling fee for rest of world Zone 2 orders */
SET @ROWHandlingZ2 = "0.00"; 


/* SET the reminder date */
UPDATE configuration SET configuration_value = @Expires_date WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';

/* UK Postage rates 
*  Minimun and Maximum order values  */
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Signed_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_MAX_ORDERVALUE' ;


/* Postage and Packing Handling Charges */
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_HANDLING_1' ;

/* Postage rates comma seperated, format weight:cost e.g. 0.1:0.46, 0.2:1.78 is upto 100g �0.46, upto 200g �1.78 (assuming Kg for weight)  
*  First Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.60' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

/* First Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.70' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

/* First Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.90, 0.25:1.20, 0.5:1.60, 0.75:2.30' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1' ;

/* First Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:2.0, 0.25:2.30, 0.5:2.70, 0.75:3.40' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1' ;

/* Second Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.50' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

/* Second Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.60' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

/* Second Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.69, 0.25:1.10, 0.5:1.40, 0.75:1.90' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1' ;

/* Second Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.79, 0.25:2.20, 0.5:2.50, 0.75:3.00' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1' ;

/* First Class Small Parcel */
UPDATE configuration SET configuration_value = '1.0:3.0, 2:6.85' WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKET_ZONES_COST0_1' ;

/* Second Class Small Parcel */
UPDATE configuration SET configuration_value = '1.0:2.60, 2:5.6' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_ZONES_COST0_1' ;

/* First Class Small Parcel Signed for */
UPDATE configuration SET configuration_value = '1.0:4.10, 2:7.95' WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_ZONES_COST0_1' ;

/* Second Class Small Parcel Signed for */
UPDATE configuration SET configuration_value = '1.0:3.70, 2:6.70' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_ZONES_COST0_1' ;

/* First Class Medium Parcel */
UPDATE configuration SET configuration_value = '1:5.65, 2:8.9, 5:15.1, 10:21.25, 20:32.40' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST0_1' ;

/* Second Class Medium Parcel */
UPDATE configuration SET configuration_value = '1:5.20, 2:8.0, 5:13.35, 10:19.65, 20:27.70' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST0_1' ;

/* First Class Medium Parcel Signed for */
UPDATE configuration SET configuration_value = '1:6.75, 2:10.00, 5:16.2, 10:22.35, 20:33.50' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST0_1' ;

/* Second Class Medium Parcel Signed for */
UPDATE configuration SET configuration_value = '1:6.3, 2:9.10, 5:14.45, 10:20.75, 20:28.80' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST0_1' ;



/* Special Delivery 1pm*/
UPDATE configuration SET configuration_value = '0.1:6.22, 0.5:6.95, 1:8.25, 2:11.00, 10:25.80, 20:40.00' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' ;

/* Special Delivery Insurance 1000 */
UPDATE configuration SET configuration_value = '0.1:6.9, 0.5:7.35, 1:8.55, 2:10.75, 10:25.5' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_COST0_1' ;

/* Special Delivery Insurance 2500 */
UPDATE configuration SET configuration_value = '0.1:8.9, 0.5:9.35, 1:10.55, 2:12.75, 10:27.5' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_COST0_1' ;

/* Special Delivery 9am */
UPDATE configuration SET configuration_value = '0.1:17.64, 0.5:19.92, 1:21.60, 2:26.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance 1000 */
UPDATE configuration SET configuration_value = '0.1:21.9, 0.5:24, 1:25.65, 2:29.95' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance 2500 */
UPDATE configuration SET configuration_value = '0.1:25.4, 0.5:27.5, 1:29.15, 2:33.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_COST0_1' ;

/* Overseas Mailing 
*  Minimun and Maximum order values  */
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Min_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_MIN_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Min_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_MIN_ORDERVALUE';
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_MAX_ORDERVALUE' ;
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
UPDATE configuration SET configuration_value = '0.1:2.7, 0.15:2.93, 0.2:3.16' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:3.39, 0.3:3.62, 0.4:4.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:4.82, 0.6:5.42, 0.7:6.02, 0.8:6.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:7.22, 1:7.82, 1.1:8.42, 1.2:9.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:9.62, 1.4:10.22, 1.5:10.82, 1.6:11.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:12.02, 1.8:12.62, 1.9:13.22, 2:13.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_1' ;

/* Airmail Rest of World  Zone 1*/
UPDATE configuration SET configuration_value = '0.1:3.3, 0.15:3.86, 0.2:4.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:4.98, 0.3:5.54, 0.4:6.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:7.98, 0.6:9.2, 0.7:10.42, 0.8:11.64' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:12.86, 1:14.08, 1.1:15.3, 1.2:16.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:17.74, 1.4:18.96, 1.5:20.18, 1.6:21.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:22.62, 1.8:23.84, 1.9:25.06, 2:26.28' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_2' ;

/* Airmail Rest of World  Zone 2*/
UPDATE configuration SET configuration_value = '0.1:3.3, 0.15:3.9, 0.2:4.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.25:5.1, 0.3:5.7, 0.4:6.98' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '0.5:8.26, 0.6:9.54, 0.7:10.82, 0.8:12.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '0.9:13.38, 1:14.66, 1.1:15.94, 1.2:17.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.3:18.5, 1.4:19.78, 1.5:21.06, 1.6:22.34' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '1.7:23.62, 1.8:24.9, 1.9:26.18, 2:27.46' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_COST5_3' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:7.85, 0.15:8.08, 0.2:8.31' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:8.54, 0.3:8.77, 0.4:9.37' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:9.97, 0.6:10.57, 0.7:11.17, 0.8:11.77' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:12.37, 1:12.97, 1.1:13.57, 1.2:14.17' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:14.77, 1.4:15.37, 1.5:15.97, 1.6:16.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:17.17, 1.8:17.77, 1.9:18.37, 2:18.97' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_1' ;

/* Airmail Rest of World Zone 1 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.45, 0.15:9.01, 0.2:9.57' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:10.13, 0.3:10.69, 0.4:11.91' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:13.13, 0.6:14.35, 0.7:15.57, 0.8:16.79' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:18.01, 1:19.23, 1.1:20.45, 1.2:21.67' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:22.89, 1.4:24.11, 1.5:25.33, 1.6:26.55' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:27.77, 1.8:28.99, 1.9:30.21, 2:31.43' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_2' ;

/* Airmail Rest of World Zone 2 Signed For */
UPDATE configuration SET configuration_value = '0.1:8.45, 0.15:9.05, 0.2:9.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.25:10.25, 0.3:10.85, 0.4:12.13' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '0.5:13.41, 0.6:14.69, 0.7:15.97, 0.8:17.25' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '0.9:18.53, 1:19.81, 1.1:21.09, 1.2:22.37' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.3:23.65, 1.4:24.93, 1.5:26.21, 1.6:27.49' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '1.7:28.77, 1.8:30.05, 1.9:31.33, 2:32.61' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_3' ;

/* Airmail Europe Signed for �500 compensation */
UPDATE configuration SET configuration_value = '0.1:10, 0.15:10.23, 0.2:10.46' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:10.69, 0.3:10.92, 0.4:11.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:12.12, 0.6:12.72, 0.7:13.32, 0.8:13.92' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:14.52, 1:15.12, 1.1:15.72, 1.2:16.32' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:16.92, 1.4:17.52, 1.5:18.12, 1.6:18.72' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:19.32, 1.8:19.92, 1.9:20.52, 2:21.12' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Airmail Rest of World Zone 1 Signed for �500 compensation */
UPDATE configuration SET configuration_value = '0.1:10.6, 0.15:11.16, 0.2:11.72' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:12.28, 0.3:12.84, 0.4:14.06' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:15.28, 0.6:16.5, 0.7:17.72, 0.8:18.94' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:20.16, 1:21.38, 1.1:22.6, 1.2:23.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:25.04, 1.4:26.26, 1.5:27.48, 1.6:28.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:29.92, 1.8:31.14, 1.9:32.36, 2:33.58' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_2' ;

/* Airmail Rest of World Zone 2 Signed for �500 compensation */
UPDATE configuration SET configuration_value = '0.1:10.6, 0.15:11.2, 0.2:11.8' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.25:12.4, 0.3:13, 0.4:14.28' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '0.5:15.56, 0.6:16.84, 0.7:18.12, 0.8:19.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '0.9:20.68, 1:21.96, 1.1:23.24, 1.2:24.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.3:25.8, 1.4:27.08, 1.5:28.36, 1.6:29.64' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '1.7:30.92, 1.8:32.2, 1.9:33.48, 2:34.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_3' ;

/* Airsure Europe */
UPDATE configuration SET configuration_value = '0.1:7.7, 0.15:7.93, 0.2:8.16' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:8.39, 0.3:8.62, 0.4:9.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:9.82, 0.6:10.42, 0.7:11.02, 0.8:11.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:12.22, 1:12.82, 1.1:13.42, 1.2:14.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:14.62, 1.4:15.22, 1.5:15.82, 1.6:16.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:17.02, 1.8:17.62, 1.9:18.22, 2:18.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_1' ;

/* Airsure Rest of World Zone 1 */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.15:8.86, 0.2:9.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:9.98, 0.3:10.54, 0.4:11.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:12.98, 0.6:14.2, 0.7:15.42, 0.8:16.64' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:17.86, 1:19.08, 1.1:20.3, 1.2:21.52' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:22.74, 1.4:23.96, 1.5:25.18, 1.6:26.4' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:27.62, 1.8:28.84, 1.9:30.06, 2:31.28' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_2' ;

/* Airsure Rest of World Zone 2 */
UPDATE configuration SET configuration_value = '0.1:8.3, 0.15:8.9, 0.2:9.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.25:10.1, 0.3:10.7, 0.4:11.98' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '0.5:13.26, 0.6:14.54, 0.7:15.82, 0.8:17.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '0.9:18.38, 1:19.66, 1.1:20.94, 1.2:22.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.3:23.5, 1.4:24.78, 1.5:26.06, 1.6:27.34' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '1.7:28.62, 1.8:29.9, 1.9:31.18, 2:32.46' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_3' ;

/* Airsure Europe insurance up to �500 */
UPDATE configuration SET configuration_value = '0.1:10.3, 0.15:10.53, 0.2:10.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:10.99, 0.3:11.22, 0.4:11.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:12.42, 0.6:13.02, 0.7:13.62, 0.8:14.22' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:14.82, 1:15.42, 1.1:16.02, 1.2:16.62' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:17.22, 1.4:17.82, 1.5:18.42, 1.6:19.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:19.62, 1.8:20.22, 1.9:20.82, 2:21.42' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_1' ;

/* Airsure Rest of World Zone 1 insurance up to �500 */
UPDATE configuration SET configuration_value = '0.1:10.9, 0.15:11.46, 0.2:12.02' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:12.58, 0.3:13.14, 0.4:14.36' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:15.58, 0.6:16.8, 0.7:18.02, 0.8:19.24' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:20.46, 1:21.68, 1.1:22.9, 1.2:24.12' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:25.34, 1.4:26.56, 1.5:27.78, 1.6:29' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:30.22, 1.8:31.44, 1.9:32.66, 2:33.88' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_2' ;

/* Airsure Rest of World Zone 2 insurance up to �500 */
UPDATE configuration SET configuration_value = '0.1:10.9, 0.15:11.5, 0.2:12.1' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_3' ;
UPDATE configuration SET configuration_value = '0.25:12.7, 0.3:13.3, 0.4:14.58' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_3' ;
UPDATE configuration SET configuration_value = '0.5:15.86, 0.6:17.14, 0.7:18.42, 0.8:19.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_3' ;
UPDATE configuration SET configuration_value = '0.9:20.98, 1:22.26, 1.1:23.54, 1.2:24.82' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_3' ;
UPDATE configuration SET configuration_value = '1.3:26.1, 1.4:27.38, 1.5:28.66, 1.6:29.94' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_3' ;
UPDATE configuration SET configuration_value = '1.7:31.22, 1.8:32.5, 1.9:33.78, 2:35.06' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_3' ;

/* Surface mail Europe */
UPDATE configuration SET configuration_value = '0.1:2.2, 0.15:2.54, 0.2:2.88' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:3.22, 0.3:3.56, 0.4:4.21' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:4.86, 0.6:5.51, 0.7:6.16, 0.8:6.81' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:7.46, 1:8.11, 1.1:8.76, 1.2:9.41' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:10.06, 1.4:10.71, 1.5:11.36, 1.6:12.01' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:12.66, 1.8:13.31, 1.9:13.96, 2:14.61' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_1' ;

/* Surface mail Europe Signed for */
UPDATE configuration SET configuration_value = '0.1:7.35, 0.15:7.69, 0.2:8.03' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:8.37, 0.3:8.71, 0.4:9.36' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:10.01, 0.6:10.66, 0.7:11.31, 0.8:11.96' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:12.61, 1:13.26, 1.1:13.91, 1.2:14.56' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:15.21, 1.4:15.86, 1.5:16.51, 1.6:17.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:17.81, 1.8:18.46, 1.9:19.11, 2:19.76' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_1' ;

/* Surface mail Europe Signed for Insurance to �500 */
UPDATE configuration SET configuration_value = '0.1:9.95, 0.15:10.29, 0.2:10.63' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.25:10.97, 0.3:11.31, 0.4:11.96' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.5:12.61, 0.6:13.26, 0.7:13.91, 0.8:14.56' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.9:15.21, 1:15.86, 1.1:16.51, 1.2:17.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.3:17.81, 1.4:18.46, 1.5:19.11, 1.6:19.76' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.7:20.41, 1.8:21.06, 1.9:21.71, 2:22.36' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Surface mail Rest of World */
UPDATE configuration SET configuration_value = '0.1:2.2, 0.15:2.54, 0.2:2.88' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:3.22, 0.3:3.56, 0.4:4.21' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:4.86, 0.6:5.51, 0.7:6.16, 0.8:6.81' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:7.46, 1:8.11, 1.1:8.76, 1.2:9.41' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:10.06, 1.4:10.71, 1.5:11.36, 1.6:12.01' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:12.66, 1.8:13.31, 1.9:13.96, 2:14.61' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for */
UPDATE configuration SET configuration_value = '0.1:7.35, 0.15:7.69, 0.2:8.03' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:8.37, 0.3:8.71, 0.4:9.36' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:10.01, 0.6:10.66, 0.7:11.31, 0.8:11.96' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:12.61, 1:13.26, 1.1:13.91, 1.2:14.56' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:15.21, 1.4:15.86, 1.5:16.51, 1.6:17.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:17.81, 1.8:18.46, 1.9:19.11, 2:19.76' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for Insurance to �500 */
UPDATE configuration SET configuration_value = '0.1:9.95, 0.15:10.29, 0.2:10.63' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.25:10.97, 0.3:11.31, 0.4:11.96' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.5:12.61, 0.6:13.26, 0.7:13.91, 0.8:14.56' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.9:15.21, 1:15.86, 1.1:16.51, 1.2:17.16' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.3:17.81, 1.4:18.46, 1.5:19.11, 1.6:19.76' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.7:20.41, 1.8:21.06, 1.9:21.71, 2:22.36' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_2' ;
