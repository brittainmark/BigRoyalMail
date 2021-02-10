# 
#  Remove all royal mail configuration from database   
#    
#  Only run this if you want to completely remove big royal mail 3.5.0 as it will delete all your rates handeling fees  
#  and changes you have made to country codes.  
#    
#  Author Mark Brittain  
#   

DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STLARGELETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STLARGELETTERSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STLETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STLETTERSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STMEDPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STMEDPARCELSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STMIDPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STMIDPARCELSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STSMLPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STSMLPARCELSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDLARGELETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDLARGELETTERSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDLETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDLETTERSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDMEDPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDMEDPARCELSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDMIDPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDMIDPARCELSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDSMLPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDSMLPARCELSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMLARGELETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMLARGELETTERSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMLETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMLETTERSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMASPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMPARCELSF_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMTLARGELETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMTLETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMTPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMTSLARGELETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMTSLETTER_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMTSPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFEXPRESS10_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFEXPRESS24_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFEXPRESS48_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFEXPRESS9_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFEXPRESSAM_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFGECONOMY_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFGEXPRESS_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFGPRIORITY_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFGVALUE_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMPFIEXPRESS_%';	
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSMPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSPECIALDELIVERY_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSPECIALDELIVERY9AM_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSPECIALDELIVERYSAT_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSPECIALDELIVERYSAT9AM_%';
#
# historic royal mail methods
#
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMAMTEUPARCEL_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSTDPARCELS100_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSTDPARCELS250_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSTDPARCELS500_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STPACKET_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM1STPACKETSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDPACKET_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RM2NDPACKETSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULES_SHIPPING_RMSTDPARCELS_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSPECIALDELIVERY1000_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSPECIALDELIVERY2500_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM1000_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM2500_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMAMASSMALLPACKET500_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMAMASSMALLPACKET_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMAMSMALLPACKET_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMAMSMALLPACKETSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMAMSMALLPACKETSF500_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSMSMALLPACKET_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSMSMALLPACKETSF_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSMSMALLPACKETSF500_%';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMSMPARCELSF';
DELETE FROM configuration WHERE configuration_key like 'MODULE_SHIPPING_RMAMASPARCEL';