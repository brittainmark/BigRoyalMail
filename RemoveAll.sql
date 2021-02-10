/* 
 * Remove all royal mail configuration from database
 * 
 * Only run this if you want to completely remove big royal mail 3.2.0 as it will delete all your rates handeling fees
 * and changes you have made to country codes.
 * 
 * Author Mark Brittain
 */

DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLARGELETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLARGELETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STMIDPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STMIDPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STSMLPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STSMLPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLARGELETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLARGELETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDMIDPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDMIDPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDSMLPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDSMLPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMASPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMPARCELSF_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFEXPRESS10_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFEXPRESS24_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFEXPRESS48_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFEXPRESS9_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFEXPRESSAM_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFGECONOMY_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFGEXPRESS_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFGPRIORITY_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFGVALUE_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMPFIEXPRESS_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSMPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY9AM_%";