# 
# Update for Big royal Mail postage rates valid from 7 April 2025 for latest rates visit  http://www.royalmail.com  
# Assumes weights in Kg costs in GBP. 
# created by Mark Brittain.  
# Donations via paypal to messages@inner-light.co.uk 
# N.B. I do not guarantee to update this every year please check the rates with royal mail.
# ***** update descriptions as descritpions.txt***** 
# 
# @Expires_date = Date you want to be reminded of to update new rates 
SET @Expires_date = "2026-04-06";

# SET the reminder date 
UPDATE configuration SET configuration_value = @Expires_date WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';

SET @Default_Insurance = "20.00";

# @Signed_Insurance
SET @Signed_Insurance = "20.00";

# @Min_Insurance = Penny more that signed for insurance 
SET @Min_Insurance = "20.01";

# @Max_Insurance = Penny more that signed for insurance 
SET @Max_Insurance = "2500.00";

# @Max_Insurance Tracked signed for
SET @AS_Insurance = "250.00";

# @Max_Insurance Parcel force 
SET @PFValue_Insurance = "500.00";

# @Expires_date = Date you want to be reminded of to update new rates 
SET @Expires_date = "2019-03-25";

# 
# If you require different handling fees for each separate type of postage please either remove the handling fees section below or replace the @... values with 
# the appropriate fees. 
# 
 
# Handling fee for uk orders 
SET @UKHandling = "0.00"; 

# Handling fee for European orders 
SET @EuropeHandling = "0.00"; 

# Handling fee for rest of world Zone 1 orders 
SET @ROWHandling = "0.00"; 

# Handling fee for rest of world Zone 2 orders 
SET @ROWHandlingZ2 = "0.00"; 

# Handling fee for Parcel Force orders 
SET @PFHandling = "0.00"; 

# Handling fee for Parcel Force Global World Wide orders 
SET @PFHandlingGWW = "0.00"; 


# SET the reminder date 
UPDATE configuration SET configuration_value = @Expires_date WHERE configuration_key = 'MODULE_SHIPPING_RM_EXPIRES';

# UK Postage rates 
#  Minimum and Maximum order values  
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

# Postage and Packing Handling Charges 
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

# Postage rates comma separated, format weight:cost e.g. 0.1:0.46, 0.2:1.78 is 100g £0.46, 200g £1.78 (assuming Kg for weight)  
#  First Class Letter 
UPDATE configuration SET configuration_value = '0.1:1.70' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

# First Class Letter Signed for 
UPDATE configuration SET configuration_value = '0.1:3.60' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

# First Class Large Letter 
UPDATE configuration SET configuration_value = "0.1:3.15, 0.25:3.6, 0.5:3.6, 0.75:3.6" WHERE configuration_key = "MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1" ;

# First Class Large Letter Signed for 
UPDATE configuration SET configuration_value = "0.1:5.05, 0.25:5.5, 0.5:5.5, 0.75:5.5" WHERE configuration_key = "MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1" ;

# Second Class Letter 
UPDATE configuration SET configuration_value = '0.1:0.87' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

# Second Class Letter Signed for 
UPDATE configuration SET configuration_value = '0.1:2.77' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

# Second Class Large Letter 
UPDATE configuration SET configuration_value = "0.1:1.55, 0.25:2, 0.5:2.4, 0.75:2.7" WHERE configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1" ;

# Second Class Large Letter Signed for 
UPDATE configuration SET configuration_value = "0.1:3.45, 0.25:3.9, 0.5:4.3, 0.75:4.6" WHERE configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1" ;

# First Class Small Parcel 
UPDATE configuration SET configuration_value = "2:4.99" WHERE configuration_key = "MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_COST0_1" ;

# Second Class Small Parcel 
UPDATE configuration SET configuration_value = "2:3.9" WHERE configuration_key = "MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_COST0_1" ;

# First Class Small Parcel Signed For 
UPDATE configuration SET configuration_value = "2:6.49" WHERE configuration_key = "MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1" ;

# Second Class Small Parcel Signed For 
UPDATE configuration SET configuration_value = "2:5.4" WHERE configuration_key = "MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1" ;

# First Class Medium Parcel 
UPDATE configuration SET configuration_value = "2:7.19,10:8.99,20:13.69" WHERE configuration_key = "MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1" ;

# Second Class  Medium Parcel  
UPDATE configuration SET configuration_value = "2:6.29,10:7.89,20:11.89" WHERE configuration_key = "MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1" ;

# First Class  Medium Parcel Signed For 
UPDATE configuration SET configuration_value = "2:8.69,10:10.49,20:15.19" WHERE configuration_key = "MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1" ;

# Second Class Medium Parcel Signed For 
UPDATE configuration SET configuration_value = "2:7.79,10:9.39,20:13.39" WHERE configuration_key = "MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1" ;

# Special Delivery 
UPDATE configuration SET configuration_value = "0.1:8.75, 0.5:9.85, 1:10.95, 2:14.05, 10:19.95, 20:23.75" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1" ;

# Special Delivery Insurance rates 
UPDATE configuration SET configuration_value = "750:0,1000:3,2500:10" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY_INSURANCE" ;

# Special Delivery 9am 
UPDATE configuration SET configuration_value = "0.1:38.95, 0.5:43.95, 1:48.95, 2:60.95" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1" ;

# Special Delivery 9am Insurance  
UPDATE configuration SET configuration_value = "50:0,1000:7,2500:15" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY9AM_INSURANCE" ;

# Special Delivery Saturday
UPDATE configuration SET configuration_value = "0.1:13.5, 0.5:14.82, 1:16.14, 2:19.86, 10:26.94, 20:31.5" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_COST0_1" ;

# Special Delivery Saturday Insurance rates 
UPDATE configuration SET configuration_value = "750:0,1000:3.6,2500:12" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT_INSURANCE" ;

# Special Delivery Saturday 9am 
UPDATE configuration SET configuration_value = "0.1:41.95, 0.5:46.95, 1:51.95, 2:63.95" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_COST0_1" ;

# Special Delivery Satueday 9am Insurance  
UPDATE configuration SET configuration_value = "500:0,1000:7,2500:15" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_INSURANCE" ;

# Tracked 24 Large Letter 
UPDATE configuration SET configuration_value = "" WHERE configuration_key = "MODULE_SHIPPING_RMT24LARGELETTER_ZONES_COST0_1" ;

# Tracked 24  Large Letter Signed for 
UPDATE configuration SET configuration_value = "" WHERE configuration_key = "MODULE_SHIPPING_RMT24LARGELETTERSF_ZONES_COST0_1" ;

# Tracked 48 Large Letter 
UPDATE configuration SET configuration_value = "" WHERE configuration_key = "MODULE_SHIPPING_RMT48LARGELETTER_ZONES_COST0_1" ;

# Tracked 48 Large Letter Signed for 
UPDATE configuration SET configuration_value = "" WHERE configuration_key = "MODULE_SHIPPING_RMT48LARGELETTERSF_ZONES_COST0_1" ;

# UK tracked 24 Small Parcel
UPDATE configuration SET configuration_value = "2:5.15" WHERE configuration_key = "MODULE_SHIPPING_RMT24SMLPARCEL_ZONES_COST0_1" ;

#UK tracked 24 Small Parcel Signed
UPDATE configuration SET configuration_value = "2:6.65" WHERE configuration_key = "MODULE_SHIPPING_RMT24SMLPARCELSF_ZONES_COST0_1" ;

# UK tracked 48 Small Parcel
UPDATE configuration SET configuration_value = "2:4.05" WHERE configuration_key = "MODULE_SHIPPING_RMT48SMLPARCEL_ZONES_COST0_1" ;

#UK tracked 48 Small Parcel Signed
UPDATE configuration SET configuration_value = "2:5.55" WHERE configuration_key = "MODULE_SHIPPING_RMT48SMLPARCELSF_ZONES_COST0_1" ;

#UK tracked 24 Medium Parcel
UPDATE configuration SET configuration_value = "2:7.45,10:9.29,20:13.99" WHERE configuration_key = "MODULE_SHIPPING_RMT24MEDPARCEL_ZONES_COST0_1" ;

#UK tracked 24 Medium Parcel Signed
UPDATE configuration SET configuration_value = "2:8.95,10:10.79,20:15.49" WHERE configuration_key = "MODULE_SHIPPING_RMT24MEDPARCELSF_ZONES_COST0_1" ;

#UK tracked 48 Medium Parcel
UPDATE configuration SET configuration_value = "2:6.55,10:8.19,20:12.19" WHERE configuration_key = "MODULE_SHIPPING_RMT48MEDPARCEL_ZONES_COST0_1" ;

#UK tracked 48 Medium Parcel Signed
UPDATE configuration SET configuration_value = "2:8.05,10:9.69,20:13.69" WHERE configuration_key = "MODULE_SHIPPING_RMT48MEDPARCELSF_ZONES_COST0_1" ;

# Parcel Force Express 48   
UPDATE configuration SET configuration_value = "5:13.6,10:15.7,20:18.85,30:22" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS48_ZONES_COST0_1" ;

# Parcel Force Express 48 Insurance Rates  
UPDATE configuration SET configuration_value = "150:0, 200:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS48_INSURANCE" ;

# Parcel Force Express 24   
UPDATE configuration SET configuration_value = "5:14.15,10:17.3,20:20.95,30:25.15" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS24_ZONES_COST0_1" ;

# Parcel Force Express 24 Insurance Rates  
UPDATE configuration SET configuration_value = "150:0, 200:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS24_INSURANCE" ;

# Parcel Force Express AM   
UPDATE configuration SET configuration_value = "5:18.35,10:21.5,20:25.15,20:29.35" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_COST0_1" ;

# Parcel Force Express AM Insurance Rates  
UPDATE configuration SET configuration_value = "200:0, 250:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESSAM_INSURANCE" ;

# Parcel Force Express 10   
UPDATE configuration SET configuration_value = "5:28.85,10:32,20:35.65,30:39.85" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS10_ZONES_COST0_1" ;

# Parcel Force Express 10 Insurance Rates  
UPDATE configuration SET configuration_value = "200:0, 250:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS10_INSURANCE" ;

# Parcel Force Express 9   
UPDATE configuration SET configuration_value = "5:74.7,10:85.1,20:96.15,30:114.35" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS9_ZONES_COST0_1" ;

# Parcel Force Express 9 Insurance Rates  
UPDATE configuration SET configuration_value = "200:0, 250:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS9_INSURANCE" ;


# Overseas Mailing 
#  Minimum and Maximum order values  
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @Default_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_MAX_ORDERVALUE' ;
UPDATE configuration SET configuration_value = @AS_Insurance WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_MAX_ORDERVALUE' ;
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


# Postage and Packing Handling charges 
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

# Postage rates 
# Europe Airmail Large Letter 
UPDATE configuration SET configuration_value = "0.1:3.5,0.25:5.8,0.5:7.2, 0.75:9.55" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_1" ;

# World zone 1 Large Letter  
UPDATE configuration SET configuration_value = "0.1:4.3,0.25:7.7,0.5:10.8, 0.75:16" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_2" ;

# World zone 2 Large Letter 
UPDATE configuration SET configuration_value = "0.1:4.3,0.25:9,0.5:13.1, 0.75:20.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_3" ;

# World zone 3 Large Letter 
UPDATE configuration SET configuration_value = "0.1:4.3,0.25:8,0.5:11.5, 0.75:17.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_4" ;

# Europe Airmail Large Letter Signed 
UPDATE configuration SET configuration_value = "0.1:10.05,0.25:11.35,0.5:12.15,0.75:12.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_1" ;

# World zone 1 Large Letter Signed  
UPDATE configuration SET configuration_value = "0.1:11.1,0.25:12.8,0.5:14.85,0.75:17" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_2" ;

# World zone 2 Large Letter Signed 
UPDATE configuration SET configuration_value = "0.1:11.25,0.25:14.05,0.5:16.95,0.75:21.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_3" ;

# Insurance Airmail Large Letter Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_INSURANCE" ;

#  Europe Airmail Letter 
UPDATE configuration SET configuration_value = "0.1:3.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_1" ;

# World zone 1 Letter  
UPDATE configuration SET configuration_value = "0.1:3.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_2" ;

# World zone 2 Letter 
UPDATE configuration SET configuration_value = "0.1:3.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_3" ;

# World zone 3 Letter 
UPDATE configuration SET configuration_value = "0.1:3.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_4" ;

# Europe Airmail Letter Signed 
UPDATE configuration SET configuration_value = "0.1:8.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_1" ;

# World zone 1 Letter Signed  
UPDATE configuration SET configuration_value = "0.1:8.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_2" ;

# World zone 2 Letter Signed 
UPDATE configuration SET configuration_value = "0.1:8.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_3" ;

# Insurance Airmail Letter Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_INSURANCE" ;

#  Airmail Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:8.95,0.5:11.25,0.75:12.4,1:13.55,1.5:14.25,2:16.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1" ;

#  Airmail Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:9.7,0.5:12.35,0.75:13.9,1:15.35,1.5:16.9,2:18.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2" ;

#  Airmail Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:10.65,0.5:13.1,0.75:14.9,1:16.6,1.25:18.1,1.5:19.55,2:21.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3" ;

# Airmail Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:13.05,0.25:14.05,0.5:19.3,0.75:22.7,1:26.2,1.25:29.25,1.5:32,2:33.55" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4" ;

# Airmail Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:14.55,0.25:15.2,0.5:21.2,0.75:25.1,1:29.15,1.25:32.9,1.5:36.75,2:38.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_5" ;

# Airmail Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.25:16.95,0.5:23.85,0.75:26.95,1:30.05,1.5:34.15,2:35.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_6" ;

# Airmail Europe  zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:14.25,0.5:15.8,0.75:17,1:18.1,1.25:18.7,1.5:18.8,2:19" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1" ;

# Airmail Europe  zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:14.6,0.5:16.4,0.75:17.55,1:18.6,1.25:18.95,1.5:19.2,2:19.75" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2" ;

# Airmail Europe  zone 3 Signed For 
UPDATE configuration SET configuration_value = "0.25:16.35,0.5:18.2,0.75:19.55,1:20.9,1.25:21.65,1.5:22.35,2:22.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3" ;

# Airmail Rest of World Zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:18.95,0.5:23.5,0.75:26.25,1:29.35,1.25:31.65,1.5:33.3,2:33.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4" ;

# Airmail Rest of World Zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:19.95,0.5:25.5,0.75:28.75,1:32.4,1.25:35.25,1.5:38.1,2:39.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_5" ;

# Airmail Signed For Insurance 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_INSURANCE" ;

# Europe Airmail Large Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:9.75,0.25:10.75,0.5:11.9,0.75:12.35" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_1" ;

# World zone 1 Large Letter Tracked  
UPDATE configuration SET configuration_value = "0.1:10.8,0.25:12.45,0.5:14.55,0.75:16.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_2" ;

# World zone 2 Large Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:10.85,0.25:13.7,0.5:16.55,0.75:19.75" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_3" ;

# World zone 3 Large Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:10.7,0.25:12.5,0.5:14.65,0.75:16.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_4" ;

# Insurance Airmail Large Letter Tracked 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_INSURANCE" ;

# Europe Airmail Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:8.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_1" ;

# World zone 1 Letter Tracked  
UPDATE configuration SET configuration_value = "0.1:8.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_2" ;

# World zone 2 Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:8.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_3" ;

# World zone 3 Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:8.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_4" ;

# Insurance Airmail Letter Tracked 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_INSURANCE" ;

# International Tracked Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:12.4,0.5:13.7,0.75:14.25,1:15,2:15.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1" ;

# International Tracked Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:12.7,0.5:14.05,0.75:15.1,1:15.85,1.5:16.3,2:17.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2" ;

# International Tracked Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.75,0.75:16.75,1:17.55,1.25:18.45,1.5:19.35,2:20.15" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3" ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = "0.25:16,0.5:20.7,0.75:23.5,1:26.55,1.25:28.8,1.5:30.45,2:31.7" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4" ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = "0.25:17.55,0.5:22.9,0.75:26.1,1:29.5,1.25:32.75,1.5:35.65,2:37.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_5" ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = "0.25:16.85,0.5:21.85,0.75:24.95,1:28.05,2:32.35" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_6" ;

# International Tracked Insurance Rates 
UPDATE configuration SET configuration_value = "50:0, 250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_INSURANCE" ;

# Europe Airmail Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:10.05,0.25:11.35,0.5:12.15, 0.75:12.65" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_1" ;

# World zone 1 Large Letter Tracked and Signed  
UPDATE configuration SET configuration_value = "0.1:11.1,0.25:12.8,0.5:14.85, 0.75:17" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_2" ;

# World zone 2 Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:11.25,0.25:14.05,0.5:16.95, 0.75:20.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_3" ;

# World zone 3 Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:11.25,0.25:13.05,0.5:15.3, 0.75:17.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_4" ;

# Insurance Airmail Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_INSURANCE" ;

# Europe Airmail Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:8.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_1" ;

# World zone 1 Letter Tracked and Signed  
UPDATE configuration SET configuration_value = "0.1:8.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_2" ;

# World zone 2 Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:8.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_3" ;

# World zone 3 Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:8.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_4" ;

# Insurance Airmail Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_INSURANCE" ;

#  International Tracked and Signed Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:14.25,0.5:15.8,0.75:17,1:18.1,1.25:18.7,1.5:18.8,2:19" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1" ;

#  International Tracked and Signed Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:14.6,0.5:16.4,0.75:17.55,1:18.6,1.25:18.95,1.5:19.2,2:19.75" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2" ;

#  International Tracked and Signed Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:16.35,0.5:18.2,0.75:19.55,1:20.9,1.25:21.65,1.5:22.35,2:22.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3" ;

# International Tracked and Signed Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.25:18.95,0.5:23.5,0.75:26.25,1:29.35,1.25:31.65,1.5:33.3,2:33.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4" ;

# International Tracked and Signed Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.25:19.95,0.5:25.5,0.75:28.75,1:32.4,1.25:35.25,1.5:38.1,2:39.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_5" ;

# International Tracked and Signed Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:19.5,0.25:20.8,0.5:27.2,0.75:29.5,1:33.2,1.25:38.3,1.5:39.95,2:40.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_6" ;

# International Tracked and Signed Insurance Rates 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_INSURANCE" ;

# Parcel Force Global Economy 
UPDATE configuration SET configuration_value = "0.5:26.46, 1:29.19, 1.5:31.92, 2:34.65, 2.5:41.56, 3:48.47, 3.5:55.38, 4:62.29, 4.5:69.2, 5:76.11, 5.5:80.07, 6:84.03, 6.5:87.99, 7:91.95, 7.5:95.91, 8:99.87, 8.5:103.83, 9:107.79, 9.5:111.75, 10:115.71" WHERE configuration_key = "MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:34.11, 1:40.81, 1.5:47.51, 2:54.21, 2.5:60.75, 3:67.29, 3.5:73.83, 4:80.37, 4.5:86.91, 5:93.45, 5.5:98.32, 6:103.19, 6.5:108.06, 7:112.93, 7.5:117.8, 8:122.67, 8.5:127.54, 9:132.41, 9.5:137.28, 10:142.15" WHERE configuration_key = "MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:35.72, 1:43.39, 1.5:51.06, 2:58.73, 2.5:66.39, 3:74.05, 3.5:81.71, 4:89.37, 4.5:97.03, 5:104.69, 5.5:111.65, 6:118.61, 6.5:125.57, 7:132.53, 7.5:139.49, 8:146.45, 8.5:153.41, 9:160.37, 9.5:167.33, 10:174.29" WHERE configuration_key = "MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1" ;

# Parcel Force Global Express 
UPDATE configuration SET configuration_value = "0.5:62.66, 1:65.7, 1.5:68.73, 2:71.77, 2.5:74.81, 3:77.85, 3.5:80.9, 4:83.94, 4.5:86.98, 5:90.02, 5.5:93.35, 6:96.68, 6.5:100.01, 7:103.34, 7.5:106.68, 8:110.01, 8.5:113.34, 9:116.67, 9.5:120, 10:123.33" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:54.96, 1:57.86, 1.5:60.75, 2:63.65, 2.5:67.91, 3:72.17, 3.5:76.44, 4:80.7, 4.5:84.96, 5:89.22, 5.5:91.22, 6:93.22, 6.5:95.22, 7:97.22, 7.5:99.22, 8:101.22, 8.5:103.21, 9:105.21, 9.5:107.21, 10:109.21" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:49.87, 1:54.55, 1.5:59.24, 2:63.92, 2.5:67.78, 3:71.65, 3.5:75.51, 4:79.37, 4.5:83.24, 5:87.1, 5.5:89.5, 6:91.89, 6.5:94.29, 7:96.69, 7.5:99.09, 8:101.48, 8.5:103.88, 9:106.28, 9.5:108.67, 10:111.07" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:51.32, 1:55.45, 1.5:59.59, 2:63.72, 2.5:68.54, 3:73.35, 3.5:78.17, 4:82.98, 4.5:87.8, 5:92.61, 5.5:96.25, 6:99.89, 6.5:103.52, 7:107.15, 7.5:110.79, 8:114.42, 8.5:118.06, 9:121.69, 9.5:125.33, 10:128.96" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:55.1, 1:59.52, 1.5:63.93, 2:68.35, 2.5:71.93, 3:75.5, 3.5:79.08, 4:82.66, 4.5:86.2300000000001, 5:89.8100000000001, 5.5:93.39, 6:96.97, 6.5:100.55, 7:104.13, 7.5:107.71, 8:111.28, 8.5:114.86, 9:118.44, 9.5:122.02, 10:125.6" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:60.2, 1:65.57, 1.5:70.93, 2:76.3, 2.5:84.9, 3:93.51, 3.5:102.11, 4:110.71, 4.5:119.32, 5:127.92, 5.5:133.71, 6:139.51, 6.5:145.3, 7:151.09, 7.5:156.88, 8:162.68, 8.5:168.47, 9:174.26, 9.5:180.05, 10:185.85" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:62.66, 1:68.64, 1.5:74.61, 2:80.59, 2.5:85.34, 3:90.09, 3.5:94.84, 4:99.59, 4.5:104.34, 5:109.09, 5.5:114.13, 6:119.18, 6.5:124.22, 7:129.26, 7.5:134.31, 8:139.35, 8.5:144.39, 9:149.43, 9.5:154.48, 10:159.52" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:75.96, 1:83.81, 1.5:91.67, 2:99.52, 2.5:106.42, 3:113.31, 3.5:120.21, 4:127.11, 4.5:134, 5:140.9, 5.5:146.52, 6:152.13, 6.5:157.75, 7:163.36, 7.5:168.98, 8:174.59, 8.5:180.21, 9:185.82, 9.5:191.44, 10:197.05" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:86.74, 1:97.19, 1.5:107.63, 2:118.08, 2.5:127.71, 3:137.34, 3.5:146.98, 4:156.61, 4.5:166.24, 5:175.87, 5.5:183.43, 6:190.98, 6.5:198.54, 7:206.09, 7.5:213.65, 8:221.2, 8.5:228.76, 9:236.31, 9.5:243.87, 10:251.42" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;

# Parcel Force Global Express Insurance Rates 
UPDATE configuration SET configuration_value = "200:0, 250:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_INSURANCE" ;

# Parcel Force Global Priority 
UPDATE configuration SET configuration_value = "0.5:26, 1:27.04, 1.5:28.08, 2:29.12, 2.5:31.22, 3:33.32, 3.5:35.42, 4:37.52, 4.5:39.62, 5:41.72, 5.5:42.16, 6:42.6, 6.5:43.04, 7:43.48, 7.5:43.92, 8:44.36, 8.5:44.8, 9:45.24, 9.5:45.68, 10:46.12" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:27.04, 1:28.08, 1.5:29.12, 2:30.16, 2.5:34.78, 3:39.4, 3.5:44.02, 4:48.64, 4.5:53.26, 5:57.88, 5.5:59.1, 6:60.32, 6.5:61.54, 7:62.76, 7.5:63.98, 8:65.2, 8.5:66.42, 9:67.64, 9.5:68.86, 10:70.08" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:27.04, 1:28.08, 1.5:29.12, 2:30.16, 2.5:34.94, 3:39.72, 3.5:44.5, 4:49.28, 4.5:54.06, 5:58.84, 5.5:59.93, 6:61.02, 6.5:62.11, 7:63.2, 7.5:64.29, 8:65.38, 8.5:66.47, 9:67.56, 9.5:68.65, 10:69.74" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:31.2, 1:32.24, 1.5:33.28, 2:34.32, 2.5:38.09, 3:41.86, 3.5:45.63, 4:49.4, 4.5:53.17, 5:56.94, 5.5:58.56, 6:60.18, 6.5:61.8, 7:63.42, 7.5:65.04, 8:66.66, 8.5:68.28, 9:69.9, 9.5:71.52, 10:73.14" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:39.52, 1:40.56, 1.5:41.6, 2:42.64, 2.5:45.84, 3:49.04, 3.5:52.24, 4:55.44, 4.5:58.64, 5:61.84, 5.5:63.84, 6:65.84, 6.5:67.84, 7:69.84, 7.5:71.84, 8:73.84, 8.5:75.84, 9:77.84, 9.5:79.84, 10:81.84" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:43.87, 1:46.03, 1.5:48.19, 2:50.35, 2.5:54.19, 3:58.03, 3.5:61.87, 4:65.71, 4.5:69.55, 5:73.39, 5.5:75.89, 6:78.39, 6.5:80.89, 7:83.39, 7.5:85.89, 8:88.39, 8.5:90.89, 9:93.39, 9.5:95.89, 10:98.39" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:46.59, 1:48.86, 1.5:51.13, 2:53.4, 2.5:60.35, 3:67.3, 3.5:74.25, 4:81.2, 4.5:88.15, 5:95.1, 5.5:99, 6:102.9, 6.5:106.8, 7:110.7, 7.5:114.6, 8:118.5, 8.5:122.4, 9:126.3, 9.5:130.2, 10:134.1" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:49.4, 1:54.25, 1.5:59.1, 2:63.95, 2.5:71.42, 3:78.89, 3.5:86.36, 4:93.83, 4.5:101.3, 5:108.77, 5.5:113.64, 6:118.51, 6.5:123.38, 7:128.25, 7.5:133.12, 8:137.99, 8.5:142.86, 9:147.73, 9.5:152.6, 10:157.47" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:62.56, 1:69.79, 1.5:77.02, 2:84.25, 2.5:91.43, 3:98.61, 3.5:105.79, 4:112.97, 4.5:120.15, 5:127.33, 5.5:133.78, 6:140.23, 6.5:146.68, 7:153.13, 7.5:159.58, 8:166.03, 8.5:172.48, 9:178.93, 9.5:185.38, 10:191.83" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;

# Parcel Force Global Priority Insurance Rates 
UPDATE configuration SET configuration_value = "100:0, 150:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_INSURANCE" ;

# Parcel Force Global Value 
UPDATE configuration SET configuration_value = "0.5:11.91, 1:13.07, 1.5:14.23, 2:15.39, 2.5:16.28, 3:17.17, 3.5:18.06, 4:18.95, 4.5:19.84, 5:20.73, 5.5:21.18, 6:21.63, 6.5:22.08, 7:22.53, 7.5:22.98, 8:23.43, 8.5:23.88, 9:24.33, 9.5:24.78, 10:25.23" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:18.05, 1:20.73, 1.5:23.41, 2:26.09, 2.5:28.71, 3:31.33, 3.5:33.95, 4:36.57, 4.5:39.19, 5:41.81, 5.5:42.96, 6:44.11, 6.5:45.26, 7:46.41, 7.5:47.56, 8:48.71, 8.5:49.86, 9:51.01, 9.5:52.16, 10:53.31" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:24.3, 1:25.49, 1.5:26.68, 2:27.87, 2.5:30.91, 3:33.95, 3.5:36.99, 4:40.03, 4.5:43.07, 5:46.11, 5.5:47.2, 6:48.29, 6.5:49.38, 7:50.47, 7.5:51.56, 8:52.65, 8.5:53.74, 9:54.83, 9.5:55.92, 10:57.01" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:24.38, 1:24.94, 1.5:25.5, 2:26.06, 2.5:28.51, 3:30.96, 3.5:33.41, 4:35.86, 4.5:38.31, 5:40.76, 5.5:42.95, 6:45.14, 6.5:47.33, 7:49.52, 7.5:51.71, 8:53.9, 8.5:56.09, 9:58.28, 9.5:60.47, 10:62.66" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:27.77, 1:30.29, 1.5:32.81, 2:35.33, 2.5:37.51, 3:39.69, 3.5:41.87, 4:44.05, 4.5:46.23, 5:48.41, 5.5:50.14, 6:51.87, 6.5:53.6, 7:55.33, 7.5:57.06, 8:58.79, 8.5:60.52, 9:62.25, 9.5:63.98, 10:65.71" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:29.05, 1:32.6, 1.5:36.15, 2:39.7, 2.5:42.59, 3:45.48, 3.5:48.37, 4:51.26, 4.5:54.15, 5:57.04, 5.5:59.48, 6:61.92, 6.5:64.36, 7:66.8, 7.5:69.24, 8:71.68, 8.5:74.12, 9:76.56, 9.5:79, 10:81.44" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:29.67, 1:32.4, 1.5:35.13, 2:37.86, 2.5:44.77, 3:51.68, 3.5:58.59, 4:65.5, 4.5:72.41, 5:79.32, 5.5:83.29, 6:87.26, 6.5:91.23, 7:95.2, 7.5:99.17, 8:103.14, 8.5:107.11, 9:111.08, 9.5:115.05, 10:119.02" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:37.01, 1:43.71, 1.5:50.41, 2:57.11, 2.5:63.65, 3:70.19, 3.5:76.73, 4:83.27, 4.5:89.81, 5:96.35, 5.5:101.22, 6:106.09, 6.5:110.96, 7:115.83, 7.5:120.7, 8:125.57, 8.5:130.44, 9:135.31, 9.5:140.18, 10:145.05" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:38.3, 1:45.96, 1.5:53.62, 2:61.28, 2.5:68.94, 3:76.6, 3.5:84.26, 4:91.92, 4.5:99.58, 5:107.24, 5.5:114.21, 6:121.18, 6.5:128.15, 7:135.12, 7.5:142.09, 8:149.06, 8.5:156.03, 9:163, 9.5:169.97, 10:176.94" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;

# Parcel Force Global Value Insurance Rates 
UPDATE configuration SET configuration_value = "100:0, 150:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_INSURANCE" ;

# Parcel Force Ireland Express 
UPDATE configuration SET configuration_value = "2:16.68, 5:17.7, 10:21.12" WHERE configuration_key = "MODULE_SHIPPING_RMPFIEXPRESS_ZONES_COST0_1" ;

# Parcel Force Ireland Express Insurance Rates 
UPDATE configuration SET configuration_value = "200:0, 250:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFIEXPRESS_INSURANCE" ;

# Surface mail Europe 
UPDATE configuration SET configuration_value = "0.25:9.3,0.5:14,0.75:14.45,1:15.6,1.5:17.15,2:20.25" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1" ;

# Surface mail Rest of World 
UPDATE configuration SET configuration_value = "0.25:9.3,0.5:14,0.75:14.45,1:15.6,1.5:17.15,2:20.25" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2" ;
