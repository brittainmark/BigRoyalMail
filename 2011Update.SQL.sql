/* 
 * Update for Big royal Mail postage rates valid from 4 April 2011 for latest rates visit http://www.royalmail.com 
 * 
 * Assumes weights in Kg costs in GBP.
 * 
 * created by Mark Brittain. 
 * 
 * Donations via paypal to info@inner-light.co.uk
 * 
 * N.B. I do not guarentee to update this every year please check the rates with royal mail.
 
*  @Default_Insurance = Currently 100 first class stamps */
SET @Default_Insurance = "46.00";
/* @Min_Insurance = Penny more that default insurance */
SET @Min_Insurance = "46.01";
/* @Expires_date = Date you want to be reminded of to update new rates */
SET @Expires_date = "2012-04-02";
/*
 * If you require different handling fees for each seperate type of postage please either remove the handling fees section below or replace the @... values with
 * the appropriate fees.
 
*  Handling fee for uk orders */
SET @UKHandling = "0.00"; 
/* Handling fee for European orders */
SET @EuropeHandling = "0.00"; 
/* Handling fee for rest of world orders */
SET @ROWHandling = "0.00"; 


/* SET the reminder date */
UPDATE configuration SET configuration_value = @Expires_date WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';

/* UK Postage rates 
*  Minimun and Maximum order values  */

UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Min_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS100_MIN_ORDERVALUE' ;

/* Postage and Packing Handling Charges */

UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKET_ZONES_HANDLING_1 ' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS100_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS250_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_HANDLING_1' ;

/* Postage rates comma seperated, format weight:cost e.g. 0.1:0.46, 0.2:1.78 is upto 100g £0.46, upto 200g £1.78 (assuming Kg for weight)  
*  First Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.46' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

/* First Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.23' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

/* First Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.75, 0.25:1.09, 0.5:1.46, 0.75:2.07' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1' ;

/* First Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.52, 0.25:1.86, 0.5:2.23, 0.75:2.84' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1' ;

/* First Class Packet */
UPDATE configuration SET configuration_value = '0.1:1.58, 0.25:1.96, 0.5:2.48, 0.75:3.05, 1:3.71, 1.25:4.9, 1.5:5.66, 1.75:6.42, 2:7.18, 4:8.95, 6:12' WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKET_ZONES_COST0_1' ;

/* First Class Packet Signed for */
UPDATE configuration SET configuration_value = '0.1:2.35, 0.25:2.73, 0.5:3.25, 0.75:3.82, 1:4.48, 1.25:5.67, 1.5:6.43, 1.75:7.19, 2:7.95, 4:9.72, 6:12.77' WHERE configuration_key = 'MODULE_SHIPPING_RM1STPACKETSF_ZONES_COST0_1' ;

/* Second Class Letter */
UPDATE configuration SET configuration_value = '0.1:0.36' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

/* Second Class Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.13' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

/* Second Class Large Letter */
UPDATE configuration SET configuration_value = '0.1:0.58, 0.25:0.92, 0.5:1.23, 0.75:1.76' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1' ;

/* Second Class Large Letter Signed for */
UPDATE configuration SET configuration_value = '0.1:1.35, 0.25:1.69, 0.5:2.00, 0.75:2.53' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1' ;

/* Second Class Packet */
UPDATE configuration SET configuration_value = '0.1:1.33, 0.25:1.72, 0.5:2.16, 0.75:2.61, 1:3.15' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKET_ZONES_COST0_1' ;

/* Second Class Packet Signed for */
UPDATE configuration SET configuration_value = '0.1:2.1, 0.25:2.49, 0.5:2.93, 0.75:3.38, 1:3.92' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDPACKETSF_ZONES_COST0_1' ;

/* Standard Parcel */
UPDATE configuration SET configuration_value = '2:4.41, 4:7.62, 6:10.34, 8:12.67, 10:13.61, 20:15.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS_ZONES_COST0_1' ;

/* Standard Parcel Insurance 100 */
UPDATE configuration SET configuration_value = '2:6.49, 4:10.34, 6:13.61, 8:16.4, 10:17.53, 20:20.23' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS100_ZONES_COST0_1' ;

/* Standard Parcel Insurance 250 */
UPDATE configuration SET configuration_value = '2:8.29, 4:12.14, 6:15.41, 8:18.2, 10:19.33, 20:22.03' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS250_ZONES_COST0_1' ;

/* Standard Parcel Insurance 500 */
UPDATE configuration SET configuration_value = '2:9.49, 4:13.34, 6:16.61, 8:19.4, 10:20.53, 20:23.23' WHERE configuration_key = 'MODULE_SHIPPING_RMSTDPARCELS500_ZONES_COST0_1' ;

/* Special Delivery */
UPDATE configuration SET configuration_value = '0.1:5.45, 0.5:5.9, 1:7, 2:9.05, 10:22.7' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1' ;

/* Special Delivery Insurance 1000 */
UPDATE configuration SET configuration_value = '0.1:6.35, 0.5:6.8, 1:7.9, 2:9.95, 10:23.6' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_ZONES_COST0_1' ;

/* Special Delivery Insurance 2500 */
UPDATE configuration SET configuration_value = '0.1:8.2, 0.5:8.65, 1:9.75, 2:11.8, 10:25.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_ZONES_COST0_1' ;

/* Special Delivery 9am */
UPDATE configuration SET configuration_value = '0.1:15.25, 0.5:17.30, 1:19.35, 2:23.45' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance 1000 */
UPDATE configuration SET configuration_value = '0.1:17.30, 0.5:19.35, 1:21.40, 2:25.50' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_ZONES_COST0_1' ;

/* Special Delivery 9am Insurance 2500 */
UPDATE configuration SET configuration_value = '0.1:20.55, 0.5:22.60, 1:24.65, 2:28.75' WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_ZONES_COST0_1' ;

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
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKET_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_HANDLING_2' ;

/* Postage Rates 
*  Airmail Europe */
UPDATE configuration SET configuration_value = '0.1:1.49, 0.12:1.61, 0.14:1.79, 0.16:1.93, 0.18:2.11' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.2:2.19, 0.22:2.29, 0.24:2.39, 0.26:2.49, 0.28:2.56' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.3:2.61, 0.4:3.16, 0.5:3.71, 0.6:4.26, 0.7:4.81' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.8:5.36, 0.9:5.91, 1:6.46, 1.1:7.01' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.2:7.56, 1.3:8.11, 1.4:8.66, 1.5:9.21' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.6:9.76, 1.7:10.31, 1.8:10.86, 1.9:11.41, 2:11.96' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST5_1' ;

/* Airmail Europe Signed For */
UPDATE configuration SET configuration_value = '0.1:6.44, 0.12:6.56, 0.14:6.74, 0.16:6.88, 0.18:7.06' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.2:7.14, 0.22:7.24, 0.24:7.34, 0.26:7.44, 0.28:7.51' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.3:7.56, 0.4:8.11, 0.5:8.66, 0.6:9.21, 0.7:9.76' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.8:10.31, 0.9:10.86, 1:11.41, 1.1:11.96' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.2:12.51, 1.3:13.06, 1.4:13.61, 1.5:14.16' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.6:14.71, 1.7:15.26, 1.8:15.81, 1.9:16.36, 2:16.91' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_1' ;

/* Airmail Europe Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:8.94, 0.12:9.06, 0.14:9.24, 0.16:9.38, 0.18:9.56' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.2:9.64, 0.22:9.74, 0.24:9.84, 0.26:9.94, 0.28:10.01' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.3:10.06, 0.4:10.61, 0.5:11.16, 0.6:11.71, 0.7:12.26' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.8:12.81, 0.9:13.36, 1:13.91, 1.1:14.46' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.2:15.01, 1.3:15.56, 1.4:16.11, 1.5:16.66' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.6:17.21, 1.7:17.76, 1.8:18.31, 1.9:18.86, 2:19.41' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Airmail Rest of World */
UPDATE configuration SET configuration_value = '0.1:2.07, 0.12:2.32, 0.14:2.6, 0.16:2.9, 0.18:3.2' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.2:3.5, 0.22:3.8, 0.24:3.96, 0.26:4.06, 0.28:4.16' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.3:4.26, 0.4:5.37, 0.5:6.48, 0.6:7.59, 0.7:8.7' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.8:9.81, 0.9:10.92, 1:12.03, 1.1:13.14' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.2:14.25, 1.3:15.36, 1.4:16.47, 1.5:17.58' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.6:18.69, 1.7:19.8, 1.8:20.91, 1.9:22.02, 2:23.13' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSSMALLPACKET_ZONES_COST5_2' ;

/* Airmail Rest of World Signed For */
UPDATE configuration SET configuration_value = '0.1:7.02, 0.12:7.27, 0.14:7.55, 0.16:7.85, 0.18:8.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.2:8.45, 0.22:8.75, 0.24:8.91, 0.26:9.01, 0.28:9.11' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.3:9.21, 0.4:10.32, 0.5:11.43, 0.6:12.54, 0.7:13.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.8:14.76, 0.9:15.87, 1:16.98, 1.1:18.09' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.2:19.2, 1.3:20.31, 1.4:21.42, 1.5:22.53' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.6:23.64, 1.7:24.75, 1.8:25.86, 1.9:26.97, 2:28.08' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF_ZONES_COST5_2' ;

/* Airmail Rest of World Signed for £500 compensation */
UPDATE configuration SET configuration_value = '0.1:9.52, 0.12:9.77, 0.14:10.05, 0.16:10.35, 0.18:10.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.2:10.95, 0.22:11.25, 0.24:11.41, 0.26:11.51, 0.28:11.61' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.3:11.71, 0.4:12.82, 0.5:13.93, 0.6:15.04, 0.7:16.15' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '0.8:17.26, 0.9:18.37, 1:19.48, 1.1:20.59' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.2:21.7, 1.3:22.81, 1.4:23.92, 1.5:25.03' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.6:26.14, 1.7:27.25, 1.8:28.36, 1.9:29.47, 2:30.58' WHERE configuration_key = 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_ZONES_COST5_2' ;

/* Airsure Europe */

UPDATE configuration SET configuration_value = '0.1:7.67, 0.12:7.81, 0.14:8.3, 0.16:8.2, 0.18:8.41' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.2:8.51, 0.22:8.63, 0.24:8.75, 0.26:8.87, 0.28:8.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.3:9.01, 0.4:9.67, 0.5:10.33, 0.6:10.99, 0.7:11.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.8:12.31, 0.9:12.97, 1:13.63, 1.1:14.29' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.2:14.95, 1.3:15.61, 1.4:16.27, 1.5:16.93' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.6:17.59, 1.7:18.25, 1.8:18.91, 1.9:19.57, 2:20.23' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_1' ;

/* Airsure Europe insurance up to £500 */

UPDATE configuration SET configuration_value = '0.1:10.67, 0.12:10.81, 0.14:11.3, 0.16:11.2, 0.18:11.41' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.2:11.51, 0.22:11.63, 0.24:11.75, 0.26:11.87, 0.28:11.95' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.3:12.01, 0.4:12.67, 0.5:13.33, 0.6:13.99, 0.7:14.65' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.8:15.31, 0.9:15.97, 1:16.63, 1.1:17.29' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.2:17.95, 1.3:18.61, 1.4:19.27, 1.5:19.93' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.6:20.59, 1.7:21.25, 1.8:21.91, 1.9:22.57, 2:23.23' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_1' ;

/* Airsure Rest of World */

UPDATE configuration SET configuration_value = '0.1:7.37, 0.12:7.62, 0.14:7.9, 0.16:8.2, 0.18:8.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.2:8.8, 0.22:9.1, 0.24:9.26, 0.26:9.36, 0.28:9.46' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.3:9.56, 0.4:10.67, 0.5:11.78, 0.6:12.89, 0.7:14' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.8:15.11, 0.9:16.22, 1:17.33, 1.1:18.44' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.2:19.55, 1.3:20.66, 1.4:21.77, 1.5:22.88' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.6:23.99, 1.7:25.1, 1.8:26.21, 1.9:27.32, 2:28.43' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET_ZONES_COST5_1' ;

/* Airsure Rest of World insurance up to £500 */

UPDATE configuration SET configuration_value = '0.1:9.87, 0.12:10.12, 0.14:10.4, 0.16:10.7, 0.18:11' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.2:11.3, 0.22:11.6, 0.24:11.76, 0.26:11.86, 0.28:11.96' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.3:12.06, 0.4:13.17, 0.5:14.28, 0.6:15.39, 0.7:16.5' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '0.8:17.61, 0.9:18.72, 1:19.83, 1.1:20.94' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.2:22.05, 1.3:23.16, 1.4:24.27, 1.5:25.38' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.6:26.49, 1.7:27.6, 1.8:28.71, 1.9:29.82, 2:30.93' WHERE configuration_key = 'MODULE_SHIPPING_RMAMASSMALLPACKET500_ZONES_COST5_1' ;

/* Surface mail Europe */

UPDATE configuration SET configuration_value = '0.1:1.12, 0.15:1.5, 0.2:1.89, 0.25:2.28, 0.3:2.64, 0.35:3.02, 0.4:3.42' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.45:3.79, 0.5:4.16, 0.55:4.5, 0.6:4.84, 0.65:5.18, 0.7:5.52, 0.75:5.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.8:6.2, 0.85:6.54, 0.9:6.88, 0.95:7.22, 1:7.56, 1.05:7.9, 1.1:8.24' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.15:8.58, 1.2:8.92, 1.25:9.26, 1.3:9.6, 1.35:9.94, 1.4:10.28' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.45:10.62, 1.5:10.96, 1.55:11.3, 1.6:11.64, 1.65:11.98, 1.7:12.32' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.75:12.66, 1.8:13, 1.85:13.34, 1.9:13.68, 1.95:14.02, 2:14.36' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_1' ;

/* Surface mail Europe Signed for */

UPDATE configuration SET configuration_value = '0.1:6.07, 0.15:6.45, 0.2:6.84, 0.25:7.23, 0.3:7.59, 0.35:7.97, 0.4:8.37' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.45:8.74, 0.5:9.11, 0.55:9.45, 0.6:9.79, 0.65:10.13, 0.7:10.47, 0.75:10.81' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.8:11.15, 0.85:11.49, 0.9:11.83, 0.95:12.17, 1:12.51, 1.05:12.85, 1.1:13.19' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.15:13.53, 1.2:13.87, 1.25:14.21, 1.3:14.55, 1.35:14.89, 1.4:15.23' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.45:15.57, 1.5:15.91, 1.55:16.25, 1.6:16.59, 1.65:16.93, 1.7:17.27' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.75:17.61, 1.8:17.95, 1.85:18.29, 1.9:18.63, 1.95:18.97, 2:19.31' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_1' ;

/* Surface mail Europe Signed for Insurance to £500 */

UPDATE configuration SET configuration_value = '0.1:8.57, 0.15:8.95, 0.2:9.34, 0.25:9.73, 0.3:10.09, 0.35:10.47, 0.4:10.87' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_1' ;
UPDATE configuration SET configuration_value = '0.45:11.24, 0.5:11.61, 0.55:11.95, 0.6:12.29, 0.65:12.63, 0.7:12.97, 0.75:13.31' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_1' ;
UPDATE configuration SET configuration_value = '0.8:13.65, 0.85:13.99, 0.9:14.33, 0.95:14.67, 1:15.01, 1.05:15.35, 1.1:15.69' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_1' ;
UPDATE configuration SET configuration_value = '1.15:16.03, 1.2:16.37, 1.25:16.71, 1.3:17.05, 1.35:17.39, 1.4:17.73' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_1' ;
UPDATE configuration SET configuration_value = '1.45:18.07, 1.5:18.41, 1.55:18.75, 1.6:19.09, 1.65:19.43, 1.7:19.77' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_1' ;
UPDATE configuration SET configuration_value = '1.75:20.11, 1.8:20.45, 1.85:20.79, 1.9:21.13, 1.95:21.47, 2:21.81' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_1' ;

/* Surface mail Rest of World */

UPDATE configuration SET configuration_value = '0.1:1.12, 0.15:1.5, 0.2:1.89, 0.25:2.28, 0.3:2.64, 0.35:3.02, 0.4:3.42' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.45:3.79, 0.5:4.16, 0.55:4.5, 0.6:4.84, 0.65:5.18, 0.7:5.52, 0.75:5.86' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.8:6.2, 0.85:6.54, 0.9:6.88, 0.95:7.22, 1:7.56, 1.05:7.9, 1.1:8.24' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.15:8.58, 1.2:8.92, 1.25:9.26, 1.3:9.6, 1.35:9.94, 1.4:10.28' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.45:10.62, 1.5:10.96, 1.55:11.3, 1.6:11.64, 1.65:11.98, 1.7:12.32' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.75:12.66, 1.8:13, 1.85:13.34, 1.9:13.68, 1.95:14.02, 2:14.36' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKET_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for */

UPDATE configuration SET configuration_value = '0.1:6.07, 0.15:6.45, 0.2:6.84, 0.25:7.23, 0.3:7.59, 0.35:7.97, 0.4:8.37' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.45:8.74, 0.5:9.11, 0.55:9.45, 0.6:9.79, 0.65:10.13, 0.7:10.47, 0.75:10.81' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.8:11.15, 0.85:11.49, 0.9:11.83, 0.95:12.17, 1:12.51, 1.05:12.85, 1.1:13.19' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.15:13.53, 1.2:13.87, 1.25:14.21, 1.3:14.55, 1.35:14.89, 1.4:15.23' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.45:15.57, 1.5:15.91, 1.55:16.25, 1.6:16.59, 1.65:16.93, 1.7:17.27' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.75:17.61, 1.8:17.95, 1.85:18.29, 1.9:18.63, 1.95:18.97, 2:19.31' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF_ZONES_COST5_2' ;

/* Surface mail Rest of World Signed for Insurance to £500 */

UPDATE configuration SET configuration_value = '0.1:8.57, 0.15:8.95, 0.2:9.34, 0.25:9.73, 0.3:10.09, 0.35:10.47, 0.4:10.87' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST0_2' ;
UPDATE configuration SET configuration_value = '0.45:11.24, 0.5:11.61, 0.55:11.95, 0.6:12.29, 0.65:12.63, 0.7:12.97, 0.75:13.31' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST1_2' ;
UPDATE configuration SET configuration_value = '0.8:13.65, 0.85:13.99, 0.9:14.33, 0.95:14.67, 1:15.01, 1.05:15.35, 1.1:15.69' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST2_2' ;
UPDATE configuration SET configuration_value = '1.15:16.03, 1.2:16.37, 1.25:16.71, 1.3:17.05, 1.35:17.39, 1.4:17.73' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST3_2' ;
UPDATE configuration SET configuration_value = '1.45:18.07, 1.5:18.41, 1.55:18.75, 1.6:19.09, 1.65:19.43, 1.7:19.77' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST4_2' ;
UPDATE configuration SET configuration_value = '1.75:20.11, 1.8:20.45, 1.85:20.79, 1.9:21.13, 1.95:21.47, 2:21.81' WHERE configuration_key = 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_ZONES_COST5_2' ;
