# 
# Update for Big royal Mail postage rates valid from 3 April 2023 for latest rates visit  http://www.royalmail.com  
# Assumes weights in Kg costs in GBP. 
# created by Mark Brittain.  
# Donations via paypal to messages@inner-light.co.uk 
# N.B. I do not guarantee to update this every year please check the rates with royal mail.
# ***** update descriptions as descritpions.txt***** 
# 
SET @Default_Insurance = "20.00";

# @Signed_Insurance
SET @Signed_Insurance = "50.00";

# @Min_Insurance = Penny more that signed for insurance 
SET @Min_Insurance = "50.01";

# @Max_Insurance = Penny more that signed for insurance 
SET @Max_Insurance = "2500.00";

# @Max_Insurance Tracked signed for
SET @AS_Insurance = "250.00";

# @Max_Insurance Parcel force 
SET @PFValue_Insurance = "500.00";

# @Expires_date = Date you want to be reminded of to update new rates 
SET @Expires_date = "2024-04-01";

# 
# If you require different handling fees for each separate type of postage please either remove the handling fees section below or replace the @... values with 
# the appropriate fees. 
# 
 
# Handling fee for uk orders 
SET @UKHandling = "0.00"; 

# Handling fee for European orders 
SET @EuropeHandling = "0.00"; 

# Handling fee for European orders Zone 2
SET @EuropeHandlingZ2 = "0.00"; 

# Handling fee for European orders Zone 3
SET @EuropeHandlingZ3 = "0.00"; 

# Handling fee for rest of world Zone 1 orders 
SET @ROWHandling = "0.00"; 

# Handling fee for rest of world Zone 2 orders 
SET @ROWHandlingZ2 = "0.00"; 

# Handling fee for rest of world Zone 3 orders 
SET @ROWHandlingZ3 = "0.00"; 

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
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTER_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS10_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS24_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS48_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESS9_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @PFHandling WHERE configuration_key = 'MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_HANDLING' ;
UPDATE configuration SET configuration_value = @UKHandling WHERE configuration_key = 'MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_HANDLING' ;

# Postage rates comma separated, format weight:cost e.g. 0.1:0.46, 0.2:1.78 is 100g £0.46, 200g £1.78 (assuming Kg for weight)  
#  First Class Letter 
UPDATE configuration SET configuration_value = '0.1:1,1' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTER_ZONES_COST0_1' ;

# First Class Letter Signed for 
UPDATE configuration SET configuration_value = '0.1:2.60' WHERE configuration_key = 'MODULE_SHIPPING_RM1STLETTERSF_ZONES_COST0_1' ;

# First Class Large Letter 
UPDATE configuration SET configuration_value = "0.1:1.6, 0.25:2.25, 0.5:2.95, 0.75:3.3" WHERE configuration_key = "MODULE_SHIPPING_RM1STLARGELETTER_ZONES_COST0_1" ;

# First Class Large Letter Signed for 
UPDATE configuration SET configuration_value = "0.1:3.1, 0.25:3.75, 0.5:4.45, 0.75:4.8" WHERE configuration_key = "MODULE_SHIPPING_RM1STLARGELETTERSF_ZONES_COST0_1" ;

# Second Class Letter 
UPDATE configuration SET configuration_value = '0.1:0.75' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTER_ZONES_COST0_1' ;

# Second Class Letter Signed for 
UPDATE configuration SET configuration_value = '0.1:2.25' WHERE configuration_key = 'MODULE_SHIPPING_RM2NDLETTERSF_ZONES_COST0_1' ;

# Second Class Large Letter 
UPDATE configuration SET configuration_value = "0.1:1.15, 0.25:1.85, 0.5:2.4, 0.75:2.7" WHERE configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTER_ZONES_COST0_1" ;

# Second Class Large Letter Signed for 
UPDATE configuration SET configuration_value = "0.1:2.65, 0.25:3.35, 0.5:3.9, 0.75:4.2" WHERE configuration_key = "MODULE_SHIPPING_RM2NDLARGELETTERSF_ZONES_COST0_1" ;

# First Class Small Parcel 
UPDATE configuration SET configuration_value = "2:4.19" WHERE configuration_key = "MODULE_SHIPPING_RM1STSMLPARCEL_ZONES_COST0_1" ;

# Second Class Small Parcel 
UPDATE configuration SET configuration_value = "2:3.49" WHERE configuration_key = "MODULE_SHIPPING_RM2NDSMLPARCEL_ZONES_COST0_1" ;

# First Class Small Parcel Signed For 
UPDATE configuration SET configuration_value = "2:5.39" WHERE configuration_key = "MODULE_SHIPPING_RM1STSMLPARCELSF_ZONES_COST0_1" ;

# Second Class Small Parcel Signed For 
UPDATE configuration SET configuration_value = "2:4.69" WHERE configuration_key = "MODULE_SHIPPING_RM2NDSMLPARCELSF_ZONES_COST0_1" ;

# First Class Medium Parcel 
UPDATE configuration SET configuration_value = "2:6.29,10:7.99,20:11.99" WHERE configuration_key = "MODULE_SHIPPING_RM1STMEDPARCEL_ZONES_COST0_1" ;

# Second Class  Medium Parcel  
UPDATE configuration SET configuration_value = "2:5.49,10:6.99,20:10.49" WHERE configuration_key = "MODULE_SHIPPING_RM2NDMEDPARCEL_ZONES_COST0_1" ;

# First Class  Medium Parcel Signed For 
UPDATE configuration SET configuration_value = "2:7.49,10:9.19,20:13.19" WHERE configuration_key = "MODULE_SHIPPING_RM1STMEDPARCELSF_ZONES_COST0_1" ;

# Second Class Medium Parcel Signed For 
UPDATE configuration SET configuration_value = "2:6.69,10:8.19,20:11.69" WHERE configuration_key = "MODULE_SHIPPING_RM2NDMEDPARCELSF_ZONES_COST0_1" ;

# Special Delivery 
UPDATE configuration SET configuration_value = "0.1:6.85, 0.5:7.65, 1:8.95, 2:11.15, 10:15.45, 20:19.45" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_COST0_1" ;

# Special Delivery Insurance rates 
UPDATE configuration SET configuration_value = "500:0,1000:1,2500:3" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY_INSURANCE" ;

# Special Delivery 9am 
UPDATE configuration SET configuration_value = "0.1:23.95, 0.5:26.95, 1:29.95, 2:35.95" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_COST0_1" ;

# Special Delivery 9am Insurance  
UPDATE configuration SET configuration_value = "50:0,1000:2.2,2500:5.7" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERY9AM_INSURANCE" ;

# Special Delivery Saturday
UPDATE configuration SET configuration_value = "0.1:11.22, 0.5:12.18, 1:13.74, 2:16.38, 10:21.54, 20:26.34" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT_ZONES_COST0_1" ;

# Special Delivery Saturday Insurance rates 
UPDATE configuration SET configuration_value = "500:0,1000:1.2,2500:3.6" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT_INSURANCE" ;

# Special Delivery Saturday 9am 
UPDATE configuration SET configuration_value = "0.1:26.95, 0.5:29.95, 1:32.95, 2:38.95" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_ZONES_COST0_1" ;

# Special Delivery Satueday 9am Insurance  
UPDATE configuration SET configuration_value = "500:0,1000:2.2,2500:5.7" WHERE configuration_key = "MODULE_SHIPPING_RMSPECIALDELIVERYSAT9AM_INSURANCE" ;

# Parcel Force Express 48   
UPDATE configuration SET configuration_value = "5:9.95,10:11.45,20:13.45,30:16.45" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS48_ZONES_COST0_1" ;

# Parcel Force Express 48 Insurance Rates  
UPDATE configuration SET configuration_value = "100:0, 200:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS48_INSURANCE" ;

# Parcel Force Express 24   
UPDATE configuration SET configuration_value = "5:10.45,10:12.95,20:15.95,30:18.95" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS24_ZONES_COST0_1" ;

# Parcel Force Express 24 Insurance Rates  
UPDATE configuration SET configuration_value = "100:0, 200:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS24_INSURANCE" ;

# Parcel Force Express AM   
UPDATE configuration SET configuration_value = "5:13.45,10:15.95,20:18.95,30:21.95" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESSAM_ZONES_COST0_1" ;

# Parcel Force Express AM Insurance Rates  
UPDATE configuration SET configuration_value = "200:0, 300:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESSAM_INSURANCE" ;

# Parcel Force Express 10   
UPDATE configuration SET configuration_value = "5:20.45,10:22.95,20:25.95,30:28.95" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS10_ZONES_COST0_1" ;

# Parcel Force Express 10 Insurance Rates  
UPDATE configuration SET configuration_value = "200:0, 300:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS10_INSURANCE" ;

# Parcel Force Express 9   
UPDATE configuration SET configuration_value = "5:40.45,10:47.95,20:55.95,30:63.95" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS9_ZONES_COST0_1" ;

# Parcel Force Express 9 Insurance Rates  
UPDATE configuration SET configuration_value = "200:0, 300:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFEXPRESS9_INSURANCE" ;


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
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTER_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTER_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMLETTERSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_5' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCEL_ZONES_HANDLING_6' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMPARCELSF_ZONES_HANDLING_5' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTLETTER_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_5' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTPARCEL_ZONES_HANDLING_6' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSLETTER_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @EuropeHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_1' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_2' ;
UPDATE configuration SET configuration_value = @EuropeHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_3' ;
UPDATE configuration SET configuration_value = @ROWHandling WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_4' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ2 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_5' ;
UPDATE configuration SET configuration_value = @ROWHandlingZ3 WHERE configuration_key = 'MODULE_SHIPPING_RMAMTSPARCEL_ZONES_HANDLING_6' ;
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
UPDATE configuration SET configuration_value = "0.1:3.25,0.25:4.95,0.5:5.95, 0.75:6.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_1" ;

# World zone 1 Large Letter  
UPDATE configuration SET configuration_value = "0.1:4.2,0.25:6.4,0.5:8.7, 0.75:11.35" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_2" ;

# World zone 2 Large Letter 
UPDATE configuration SET configuration_value = "0.1:4.2,0.25:7.5,0.5:10.55, 0.75:14.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_3" ;

# World zone 3 Large Letter 
UPDATE configuration SET configuration_value = "0.1:4.2,0.25:6.55,0.5:9, 0.75:11.8" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTER_ZONES_COST0_4" ;

# Europe Airmail Large Letter Signed 
UPDATE configuration SET configuration_value = "0.1:8.75,0.25:9.9,0.5:10.65,0.75:11.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_1" ;

# World zone 1 Large Letter Signed  
UPDATE configuration SET configuration_value = "0.1:9.7,0.25:11.2,0.5:13,0.75:14.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_2" ;

# World zone 2 Large Letter Signed 
UPDATE configuration SET configuration_value = "0.1:9.8,0.25:12.25,0.5:14.8,0.75:17.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_ZONES_COST0_3" ;

# Insurance Airmail Large Letter Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMLARGELETTERSF_INSURANCE" ;

#  Europe Airmail Letter 
UPDATE configuration SET configuration_value = "0.1:2.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_1" ;

# World zone 1 Letter  
UPDATE configuration SET configuration_value = "0.1:2.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_2" ;

# World zone 2 Letter 
UPDATE configuration SET configuration_value = "0.1:2.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_3" ;

# World zone 3 Letter 
UPDATE configuration SET configuration_value = "0.1:2.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTER_ZONES_COST0_4" ;

# Europe Airmail Letter Signed 
UPDATE configuration SET configuration_value = "0.1:7.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_1" ;

# World zone 1 Letter Signed  
UPDATE configuration SET configuration_value = "0.1:7.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_2" ;

# World zone 2 Letter Signed 
UPDATE configuration SET configuration_value = "0.1:7.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_ZONES_COST0_3" ;

# Insurance Airmail Letter Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMLETTERSF_INSURANCE" ;

#  Airmail Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:7.55,0.5:9.45,0.75:10.65,1:11.85,1.5:12.85,2:14.35" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_1" ;

#  Airmail Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:7.7,0.5:9.75,0.75:11,1:12.15,1.5:13.35,2:14.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_2" ;

#  Airmail Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:8.4,0.5:10.35,0.75:11.75,1:13.15,1.25:14.3,1.5:15.45,2:16.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_3" ;

# Airmail Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:10,0.25:11.35,0.5:15.45,0.75:18.2,1:21,1.25:23.4,1.5:25.65,2:26.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_4" ;

# Airmail Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:11.3,0.25:12.25,0.5:17,0.75:20.1,1:23.35,1.25:26.35,1.5:29.45,2:31.15" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_5" ;

# Airmail Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:11.35,0.25:12.95,0.5:18.6,0.75:21.35,1:25,1.25:28.45,1.5:31.2,2:32.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCEL_ZONES_COST0_6" ;

# Airmail Europe  zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.25:12.5,0.5:13.8,0.75:14.85,1:15.8,1.25:16.35,1.5:16.45,2:16.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_1" ;

# Airmail Europe  zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.25:12.65,0.5:14.2,0.75:15.2,1:16.1,1.25:16.4,1.5:16.65,2:17.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_2" ;

# Airmail Europe  zone 3 Signed For 
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.45,0.75:16.6,1:17.75,1.25:18.4,1.5:19,2:19.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_3" ;

# Airmail Rest of World Zone 1 Signed For 
UPDATE configuration SET configuration_value = "0.1:16.1,0.25:16.45,0.5:20.35,0.75:22.75,1:25.4,1.25:27.4,1.5:28.8,2:29.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_4" ;

# Airmail Rest of World Zone 2 Signed For 
UPDATE configuration SET configuration_value = "0.1:17.25,0.25:17.6,0.5:22.1,0.75:24.9,1:28.05,1.25:30.5,1.5:33,2:34.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_ZONES_COST0_5" ;

# Airmail Signed For Insurance 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMPARCELSF_INSURANCE" ;

# Europe Airmail Large Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:8.65,0.25:9.55,0.5:10.55,0.75:10.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_1" ;

# World zone 1 Large Letter Tracked  
UPDATE configuration SET configuration_value = "0.1:9.6,0.25:11.05,0.5:12.9,0.75:14.75" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_2" ;

# World zone 2 Large Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:9.65,0.25:12.15,0.5:14.7,0.75:17.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_3" ;

# World zone 3 Large Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:9.65,0.25:11.25,0.5:13.2,0.75:15.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_ZONES_COST0_4" ;

# Insurance Airmail Large Letter Tracked 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLARGELETTER_INSURANCE" ;

# Europe Airmail Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:7.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_1" ;

# World zone 1 Letter Tracked  
UPDATE configuration SET configuration_value = "0.1:7.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_2" ;

# World zone 2 Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:7.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_3" ;

# World zone 3 Letter Tracked 
UPDATE configuration SET configuration_value = "0.1:7.2" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_ZONES_COST0_4" ;

# Insurance Airmail Letter Tracked 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTLETTER_INSURANCE" ;

# International Tracked Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:10.95,0.5:12.15,0.75:13.05,1:13.65,2:13.9" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_1" ;

# International Tracked Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:11.25,0.5:12.45,0.75:13.4,1:14.05,1.5:14.45,2:15.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_2" ;

# International Tracked Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:12.05,0.5:13.65,0.75:14.5,1:15.2,1.25:15.95,1.5:16.75,2:17.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_3" ;

# International Tracked Rest of World Zone 1 
UPDATE configuration SET configuration_value = "0.25:13.85,0.5:17.9,0.75:20.35,1:23,1.25:24.95,1.5:26.35,2:27.45" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_4" ;

# International Tracked Rest of World Zone 2 
UPDATE configuration SET configuration_value = "0.25:15.2,0.5:19.8,0.75:22.6,1:25.55,1.25:28.35,1.5:30.85,2:32.55" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_5" ;

# International Tracked Rest of World Zone 3 
UPDATE configuration SET configuration_value = "0.25:15.65,0.5:19.85,0.75:22.45,1:25.15,2:28.95" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_ZONES_COST0_6" ;

# International Tracked Insurance Rates 
UPDATE configuration SET configuration_value = "50:0, 250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTPARCEL_INSURANCE" ;

# Europe Airmail Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:8.75,0.25:9.9,0.5:10.65, 0.75:11.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_1" ;

# World zone 1 Large Letter Tracked and Signed  
UPDATE configuration SET configuration_value = "0.1:9.7,0.25:11.2,0.5:13, 0.75:14.85" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_2" ;

# World zone 2 Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:9.8,0.25:12.25,0.5:14.8, 0.75:17.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_3" ;

# World zone 3 Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:9.75,0.25:11.35,0.5:13.3, 0.75:15.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_ZONES_COST0_4" ;

# Insurance Airmail Large Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLARGELETTER_INSURANCE" ;

# Europe Airmail Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:7.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_1" ;

# World zone 1 Letter Tracked and Signed  
UPDATE configuration SET configuration_value = "0.1:7.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_2" ;

# World zone 2 Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:7.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_3" ;

# World zone 3 Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "0.1:7.4" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_ZONES_COST0_4" ;

# Insurance Airmail Letter Tracked and Signed 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSLETTER_INSURANCE" ;

# Postage Rates 
#  International Tracked and Signed Europe Zone 1
UPDATE configuration SET configuration_value = "0.25:12.5,0.5:13.8,0.75:14.85,1:15.8,1.25:16.35,1.5:16.45,2:16.6" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_1" ;

#  International Tracked and Signed Europe Zone 2
UPDATE configuration SET configuration_value = "0.25:12.65,0.5:14.2,0.75:15.2,1:16.1,1.25:16.4,1.5:16.65,2:17.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_2" ;

#  International Tracked and Signed Europe Zone 3
UPDATE configuration SET configuration_value = "0.25:13.9,0.5:15.45,0.75:16.6,1:17.75,1.25:18.4,1.5:19,2:19.3" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_3" ;

# International Tracked and Signed Rest of World  Zone 1
UPDATE configuration SET configuration_value = "0.1:16.1,0.25:16.45,0.5:20.35,0.75:22.75,1:25.4,1.25:27.4,1.5:28.8,2:29.25" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_4" ;

# International Tracked and Signed Rest of World  Zone 2
UPDATE configuration SET configuration_value = "0.1:17.25,0.25:17.6,0.5:22.1,0.75:24.9,1:28.05,1.25:30.5,1.5:33,2:34.05" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_5" ;

# International Tracked and Signed Rest of World  Zone 3
UPDATE configuration SET configuration_value = "0.1:16.75,0.25:18.35,0.5:23.75,0.75:25.75,1:29.4,1.25:32.85,1.5:35.6,2:36.1" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_ZONES_COST0_6" ;

# International Tracked and Signed Insurance Rates 
UPDATE configuration SET configuration_value = "50:0,250:2.5" WHERE configuration_key = "MODULE_SHIPPING_RMAMTSPARCEL_INSURANCE" ;

# Parcel Force Global Economy 
UPDATE configuration SET configuration_value = "0.5:24.7, 1:27.25, 1.5:29.8, 2:32.35, 2.5:38.8, 3:45.25, 3.5:51.7, 4:58.15, 4.5:64.6, 5:71.05, 5.5:74.75, 6:78.45, 6.5:82.15, 7:85.85, 7.5:89.55, 8:93.25, 8.5:96.95, 9:100.65, 9.5:104.35, 10:108.05, 10.5:110.45, 11:112.85, 11.5:115.25, 12:117.65, 12.5:120.05, 13:122.45, 13.5:124.85, 14:127.25, 14.5:129.65, 15:132.05, .5+:2.35" WHERE configuration_key = "MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:31.85, 1:38.1, 1.5:44.35, 2:50.6, 2.5:56.7, 3:62.8, 3.5:68.9, 4:75, 4.5:81.1, 5:87.2, 5.5:91.75, 6:96.3, 6.5:100.85, 7:105.4, 7.5:109.95, 8:114.5, 8.5:119.05, 9:123.6, 9.5:128.15, 10:132.7, 10.5:136.05, 11:139.4, 11.5:142.75, 12:146.1, 12.5:149.45, 13:152.8, 13.5:156.15, 14:159.5, 14.5:162.85, 15:166.2, .5+:3.35" WHERE configuration_key = "MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_2" ;
UPDATE configuration SET configuration_value = "0.5:33.35, 1:40.5, 1.5:47.65, 2:52.1, 2.5:59.7, 3:67.3, 3.5:74.9, 4:82.5, 4.5:90.1, 5:97.7, 5.5:104.2, 6:110.7, 6.5:117.2, 7:123.7, 7.5:130.2, 8:136.7, 8.5:143.2, 9:149.7, 9.5:156.2, 10:162.7, 10.5:167.15, 11:171.6, 11.5:176.05, 12:180.5, 12.5:184.95, 13:189.4, 13.5:193.85, 14:198.3, 14.5:202.75, 15:207.2, .5+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGECONOMY_ZONES_COST0_3" ;

# Parcel Force Global Express 
UPDATE configuration SET configuration_value = "0.5:54.65, 1:57.3, 1.5:59.95, 2:62.6, 2.5:65.25, 3:67.9, 3.5:70.55, 4:73.2, 4.5:75.85, 5:78.5, 5.5:81.4, 6:84.3, 6.5:87.2, 7:90.1, 7.5:93, 8:95.9, 8.5:98.8, 9:101.7, 9.5:104.6, 10:107.5, 10.5:109.75, 11:112, 11.5:114.25, 12:116.5, 12.5:118.75, 13:121, 13.5:123.25, 14:125.5, 14.5:127.75, 15:130, .5+:2.45" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:47.94, 1:50.46, 1.5:52.98, 2:55.5, 2.5:59.22, 3:62.94, 3.5:66.66, 4:70.38, 4.5:74.1, 5:77.82, 5.5:79.56, 6:81.3, 6.5:83.04, 7:84.78, 7.5:86.52, 8:88.26, 8.5:90, 9:91.74, 9.5:93.48, 10:95.22, 10.5:97.56, 11:99.9, 11.5:102.24, 12:104.58, 12.5:106.92, 13:109.26, 13.5:111.6, 14:113.94, 14.5:116.28, 15:118.62, .5+:1.74" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_2" ;
UPDATE configuration SET configuration_value = "0.5:43.5, 1:47.58, 1.5:51.66, 2:55.74, 2.5:59.1, 3:62.46, 3.5:65.82, 4:69.18, 4.5:72.54, 5:75.9, 5.5:78, 6:80.1, 6.5:82.2, 7:84.3, 7.5:86.4, 8:88.5, 8.5:90.6, 9:92.7, 9.5:94.8, 10:96.9, 10.5:98.82, 11:100.74, 11.5:102.66, 12:104.58, 12.5:106.5, 13:108.42, 13.5:110.34, 14:112.26, 14.5:114.18, 15:116.1, .5+:1.74" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_3" ;
UPDATE configuration SET configuration_value = "0.5:44.76, 1:48.36, 1.5:51.96, 2:55.56, 2.5:59.76, 3:63.96, 3.5:68.16, 4:72.36, 4.5:76.56, 5:80.76, 5.5:83.94, 6:87.12, 6.5:90.3, 7:93.48, 7.5:96.66, 8:99.84, 8.5:103.02, 9:106.2, 9.5:109.38, 10:112.56, 10.5:115.02, 11:117.48, 11.5:119.94, 12:122.4, 12.5:124.86, 13:127.32, 13.5:129.78, 14:132.24, 14.5:134.7, 15:137.16, .5+:2.04" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_4" ;
UPDATE configuration SET configuration_value = "0.5:48.06, 1:51.9, 1.5:55.74, 2:59.58, 2.5:62.7, 3:65.82, 3.5:68.94, 4:72.06, 4.5:75.18, 5:78.3, 5.5:81.42, 6:84.54, 6.5:87.66, 7:90.78, 7.5:93.9, 8:97.02, 8.5:100.14, 9:103.26, 9.5:106.38, 10:109.5, 10.5:112.56, 11:115.62, 11.5:118.68, 12:121.74, 12.5:124.8, 13:127.86, 13.5:130.92, 14:133.98, 14.5:137.04, 15:140.1, .5+:2.76" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_5" ;
UPDATE configuration SET configuration_value = "0.5:52.5, 1:57.18, 1.5:61.86, 2:66.54, 2.5:74.04, 3:81.54, 3.5:89.04, 4:96.54, 4.5:104.04, 5:111.54, 5.5:116.58, 6:121.62, 6.5:126.66, 7:131.7, 7.5:136.74, 8:141.78, 8.5:146.82, 9:151.86, 9.5:156.9, 10:161.94, 10.5:165.3, 11:168.66, 11.5:172.02, 12:175.38, 12.5:178.74, 13:182.1, 13.5:185.46, 14:188.82, 14.5:192.18, 15:195.54, .5+:3.72" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_6" ;
UPDATE configuration SET configuration_value = "0.5:54.65, 1:59.85, 1.5:65.05, 2:70.25, 2.5:74.4, 3:78.55, 3.5:82.7, 4:86.85, 4.5:91, 5:95.15, 5.5:99.55, 6:103.95, 6.5:108.35, 7:112.75, 7.5:117.15, 8:121.55, 8.5:125.95, 9:130.35, 9.5:134.75, 10:139.15, 10.5:142.55, 11:145.95, 11.5:149.35, 12:152.75, 12.5:156.15, 13:159.55, 13.5:162.95, 14:166.35, 14.5:169.75, 15:173.15, .5+:3.35" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_7" ;
UPDATE configuration SET configuration_value = "0.5:66.25, 1:73.1, 1.5:79.95, 2:86.8, 2.5:92.8, 3:98.8, 3.5:104.8, 4:110.8, 4.5:116.8, 5:122.8, 5.5:127.7, 6:132.6, 6.5:137.5, 7:142.4, 7.5:147.3, 8:152.2, 8.5:157.1, 9:162, 9.5:166.9, 10:171.8, 10.5:177.15, 11:182.5, 11.5:187.85, 12:193.2, 12.5:198.55, 13:203.9, 13.5:209.25, 14:214.6, 14.5:219.95, 15:225.3, .5+:5.25" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_8" ;
UPDATE configuration SET configuration_value = "0.5:75.65, 1:84.75, 1.5:93.85, 2:102.95, 2.5:111.35, 3:119.75, 3.5:128.15, 4:136.55, 4.5:144.95, 5:153.35, 5.5:159.95, 6:166.55, 6.5:173.15, 7:179.75, 7.5:186.35, 8:192.95, 8.5:199.55, 9:206.15, 9.5:212.75, 10:219.35, 10.5:226.2, 11:233.05, 11.5:239.9, 12:246.75, 12.5:253.6, 13:260.45, 13.5:267.3, 14:274.15, 14.5:281, 15:287.85, .5+:7.05" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_ZONES_COST0_9" ;

# Parcel Force Global Express Insurance Rates 
UPDATE configuration SET configuration_value = "200:0, 300:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGEXPRESS_INSURANCE" ;

# Parcel Force Global Priority 
UPDATE configuration SET configuration_value = "0.5:25, 1:26, 1.5:27, 2:28, 2.5:29, 3:31.22, 3.5:33.43, 4:35.65, 4.5:37.86, 5:40.08, 5.5:40.5, 6:40.92, 6.5:41.34, 7:41.76, 7.5:42.18, 8:42.6, 8.5:43.02, 9:43.44, 9.5:43.86, 10:44.28, 10.5:44.76, 11:45.24, 11.5:45.72, 12:46.2, 12.5:46.68, 13:47.16, 13.5:47.64, 14:48.12, 14.5:48.6, 15:49.08, .5+:0.3" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:26, 1:27, 1.5:28, 2:29, 2.5:30, 3:34.8, 3.5:39.6, 4:44.4, 4.5:49.2, 5:54, 5.5:55.14, 6:56.28, 6.5:57.42, 7:58.56, 7.5:59.7, 8:60.84, 8.5:61.98, 9:63.12, 9.5:64.26, 10:65.4, 10.5:66.18, 11:66.96, 11.5:67.74, 12:68.52, 12.5:69.3, 13:70.08, 13.5:70.86, 14:71.64, 14.5:72.42, 15:73.2, .5+:0.78" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_2" ;
UPDATE configuration SET configuration_value = "0.5:26, 1:27, 1.5:28, 2:29, 2.5:30, 3:34.98, 3.5:39.96, 4:44.94, 4.5:49.92, 5:54.9, 5.5:55.92, 6:56.94, 6.5:57.96, 7:58.98, 7.5:60, 8:61.02, 8.5:62.04, 9:63.06, 9.5:64.08, 10:65.1, 10.5:66.6, 11:68.1, 11.5:69.6, 12:71.1, 12.5:72.6, 13:74.1, 13.5:75.6, 14:77.1, 14.5:78.6, 15:80.1, .5+:0.72" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_3" ;
UPDATE configuration SET configuration_value = "0.5:30, 1:31, 1.5:32, 2:33, 2.5:34, 3:38.14, 3.5:42.29, 4:46.43, 4.5:50.58, 5:54.72, 5.5:56.28, 6:57.84, 6.5:59.4, 7:60.96, 7.5:62.52, 8:64.08, 8.5:65.64, 9:67.2, 9.5:68.76, 10:70.32, 10.5:71.82, 11:73.32, 11.5:74.82, 12:76.32, 12.5:77.82, 13:79.32, 13.5:80.82, 14:82.32, 14.5:83.82, 15:85.32, .5+:0.66" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_4" ;
UPDATE configuration SET configuration_value = "0.5:38, 1:39, 1.5:40, 2:41, 2.5:42, 3:45.49, 3.5:48.98, 4:52.48, 4.5:55.97, 5:59.46, 5.5:61.38, 6:63.3, 6.5:65.22, 7:67.14, 7.5:69.06, 8:70.98, 8.5:72.9, 9:74.82, 9.5:76.74, 10:78.66, 10.5:80.88, 11:83.1, 11.5:85.32, 12:87.54, 12.5:89.76, 13:91.98, 13.5:94.2, 14:96.42, 14.5:98.64, 15:100.86, .5+:0.72" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_5" ;
UPDATE configuration SET configuration_value = "0.5:42.18, 1:45.4, 1.5:46.9, 2:48.4, 2.5:50, 3:53.69, 3.5:57.38, 4:61.08, 4.5:64.77, 5:68.46, 5.5:70.8, 6:73.14, 6.5:75.48, 7:77.82, 7.5:80.16, 8:82.5, 8.5:84.84, 9:87.18, 9.5:89.52, 10:91.86, 10.5:93.12, 11:94.38, 11.5:95.64, 12:96.9, 12.5:98.16, 13:99.42, 13.5:100.68, 14:101.94, 14.5:103.2, 15:104.46, .5+:1.26" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_6" ;
UPDATE configuration SET configuration_value = "0.5:44.8, 1:47.35, 1.5:49.35, 2:51.35, 2.5:53, 3:60.69, 3.5:68.38, 4:76.07, 4.5:83.76, 5:91.45, 5.5:95.2, 6:98.95, 6.5:102.7, 7:106.45, 7.5:110.2, 8:113.95, 8.5:117.7, 9:121.45, 9.5:125.2, 10:128.95, 10.5:131.35, 11:133.75, 11.5:136.15, 12:138.55, 12.5:140.95, 13:143.35, 13.5:145.75, 14:148.15, 14.5:150.55, 15:152.95, .5+:2.4" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_7" ;
UPDATE configuration SET configuration_value = "0.5:47.5, 1:53.5, 1.5:57.5, 2:61.5, 2.5:65, 3:72.3, 3.5:79.6, 4:86.9, 4.5:94.2, 5:101.5, 5.5:106.05, 6:110.6, 6.5:115.15, 7:119.7, 7.5:124.25, 8:128.8, 8.5:133.35, 9:137.9, 9.5:142.45, 10:147, 10.5:150.45, 11:153.9, 11.5:157.35, 12:160.8, 12.5:164.25, 13:167.7, 13.5:171.15, 14:174.6, 14.5:178.05, 15:181.5, .5+:3.35" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_8" ;
UPDATE configuration SET configuration_value = "0.5:60.15, 1:67.1, 1.5:74.05, 2:81, 2.5:87.9, 3:94.8, 3.5:101.7, 4:108.6, 4.5:115.5, 5:122.4, 5.5:128.6, 6:134.8, 6.5:141, 7:147.2, 7.5:153.4, 8:159.6, 8.5:165.8, 9:172, 9.5:178.2, 10:184.4, 10.5:188.85, 11:193.3, 11.5:197.75, 12:202.2, 12.5:206.65, 13:211.1, 13.5:215.55, 14:220, 14.5:224.45, 15:228.9, .5+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_ZONES_COST0_9" ;

# Parcel Force Global Priority Insurance Rates 
UPDATE configuration SET configuration_value = "100:0, 200:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGPRIORITY_INSURANCE" ;

# Parcel Force Global Value 
UPDATE configuration SET configuration_value = "0.5:9.8, 1:11.04, 1.5:12.3, 2:13.56, 2.5:14.52, 3:15.48, 3.5:16.44, 4:17.4, 4.5:18.36, 5:19.32, 5.5:19.74, 6:20.16, 6.5:20.58, 7:21, 7.5:21.42, 8:21.84, 8.5:22.26, 9:22.68, 9.5:23.1, 10:23.52, 10.5:23.82, 11:24.12, 11.5:24.42, 12:24.72, 12.5:25.02, 13:25.32, 13.5:25.62, 14:25.92, 14.5:26.22, 15:26.52, .5+:0.300000000000001" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_1" ;
UPDATE configuration SET configuration_value = "0.5:16.85, 1:19.35, 1.5:21.85, 2:24.35, 2.5:25, 3:27.8, 3.5:30.6, 4:33.4, 4.5:36.2, 5:39, 5.5:40.08, 6:41.16, 6.5:42.24, 7:43.32, 7.5:44.4, 8:45.48, 8.5:46.56, 9:47.64, 9.5:48.72, 10:49.8, 10.5:50.52, 11:51.24, 11.5:51.96, 12:52.68, 12.5:53.4, 13:54.12, 13.5:54.84, 14:55.56, 14.5:56.28, 15:57, .5+:0.72" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_2" ;
UPDATE configuration SET configuration_value = "0.5:22.68, 1:24, 1.5:25, 2:26, 2.5:27, 3:30.2, 3.5:33.41, 4:36.61, 4.5:39.82, 5:43.02, 5.5:44.04, 6:45.06, 6.5:46.08, 7:47.1, 7.5:48.12, 8:49.14, 8.5:50.16, 9:51.18, 9.5:52.2, 10:53.22, 10.5:53.94, 11:54.66, 11.5:55.38, 12:56.1, 12.5:56.82, 13:57.54, 13.5:58.26, 14:58.98, 14.5:59.7, 15:60.42, .5+:0.719999999999999" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_3" ;
UPDATE configuration SET configuration_value = "0.5:20.58, 1:21.24, 1.5:21.9, 2:22.56, 2.5:25.14, 3:27.72, 3.5:30.3, 4:32.88, 4.5:35.46, 5:38.04, 5.5:40.08, 6:42.12, 6.5:44.16, 7:46.2, 7.5:48.24, 8:50.28, 8.5:52.32, 9:54.36, 9.5:56.4, 10:58.44, 10.5:59.04, 11:59.64, 11.5:60.24, 12:60.84, 12.5:61.44, 13:62.04, 13.5:62.64, 14:63.24, 14.5:63.84, 15:64.44, .5+:0.66" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_4" ;
UPDATE configuration SET configuration_value = "0.5:25.92, 1:28.26, 1.5:30.6, 2:32.94, 2.5:34.98, 3:37.02, 3.5:39.06, 4:41.1, 4.5:43.14, 5:45.18, 5.5:46.8, 6:48.42, 6.5:50.04, 7:51.66, 7.5:53.28, 8:54.9, 8.5:56.52, 9:58.14, 9.5:59.76, 10:61.38, 10.5:62.1, 11:62.82, 11.5:63.54, 12:64.26, 12.5:64.98, 13:65.7, 13.5:66.42, 14:67.14, 14.5:67.86, 15:68.58, .5+:0.719999999999999" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_5" ;
UPDATE configuration SET configuration_value = "0.5:27.12, 1:30.42, 1.5:33.72, 2:37.02, 2.5:39.72, 3:42.42, 3.5:45.12, 4:47.82, 4.5:50.52, 5:53.22, 5.5:55.5, 6:57.78, 6.5:60.06, 7:62.34, 7.5:64.62, 8:66.9, 8.5:69.18, 9:71.46, 9.5:73.74, 10:76.02, 10.5:77.28, 11:78.54, 11.5:79.8, 12:81.06, 12.5:82.32, 13:83.58, 13.5:84.84, 14:86.1, 14.5:87.36, 15:88.62, .5+:1.26" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_6" ;
UPDATE configuration SET configuration_value = "0.5:27.7, 1:30.25, 1.5:32.8, 2:35.35, 2.5:41.8, 3:48.25, 3.5:54.7, 4:61.15, 4.5:67.6, 5:74.05, 5.5:77.75, 6:81.45, 6.5:85.15, 7:88.85, 7.5:92.55, 8:96.25, 8.5:99.95, 9:103.65, 9.5:107.35, 10:111.05, 10.5:113.45, 11:115.85, 11.5:118.25, 12:120.65, 12.5:123.05, 13:125.45, 13.5:127.85, 14:130.25, 14.5:132.65, 15:135.05, .5+:2.35" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_7" ;
UPDATE configuration SET configuration_value = "0.5:34.55, 1:40.8, 1.5:47.05, 2:53.3, 2.5:59.4, 3:65.5, 3.5:71.6, 4:77.7, 4.5:83.8, 5:89.9, 5.5:94.45, 6:99, 6.5:103.55, 7:108.1, 7.5:112.65, 8:117.2, 8.5:121.75, 9:126.3, 9.5:130.85, 10:135.4, 10.5:138.75, 11:142.1, 11.5:145.45, 12:148.8, 12.5:152.15, 13:155.5, 13.5:158.85, 14:162.2, 14.5:165.55, 15:168.9, .5+:3.34999999999999" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_8" ;
UPDATE configuration SET configuration_value = "0.5:35.75, 1:42.9, 1.5:50.05, 2:57.2, 2.5:60, 3:68.02, 3.5:76.04, 4:84.06, 4.5:92.08, 5:100.1, 5.5:106.6, 6:113.1, 6.5:119.6, 7:126.1, 7.5:132.6, 8:139.1, 8.5:145.6, 9:152.1, 9.5:158.6, 10:165.1, 10.5:169.55, 11:174, 11.5:178.45, 12:182.9, 12.5:187.35, 13:191.8, 13.5:196.25, 14:200.7, 14.5:205.15, 15:209.6, .5+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_ZONES_COST0_9" ;

# Parcel Force Global Value Insurance Rates 
UPDATE configuration SET configuration_value = "100:0, 200:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFGVALUE_INSURANCE" ;

# Parcel Force Ireland Express 
UPDATE configuration SET configuration_value = "2:16.68, 5:17.7, 10:21.12, 15:26.96, 20:32.36, 25:43.58, 30:47.78" WHERE configuration_key = "MODULE_SHIPPING_RMPFIEXPRESS_ZONES_COST0_1" ;

# Parcel Force Ireland Express Insurance Rates 
UPDATE configuration SET configuration_value = "200:0, 300:1.8, 100+:4.5" WHERE configuration_key = "MODULE_SHIPPING_RMPFIEXPRESS_INSURANCE" ;

# Surface mail Europe 
UPDATE configuration SET configuration_value = "0.25:6.75,0.5:9.4,0.75:10.6,1:11.8,1.5:12.8,2:14.3" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_1" ;

# Surface mail Rest of World 
UPDATE configuration SET configuration_value = "0.25:6.75,0.5:9.4,0.75:10.6,1:11.8,1.5:12.8,2:14.3" WHERE configuration_key = "MODULE_SHIPPING_RMSMPARCEL_ZONES_COST0_2" ;
