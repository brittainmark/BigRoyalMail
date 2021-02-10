/* 
 * Remove all royal mail configuration from database
 * 
 * Only run this if you want to completely remove big royal mail 3.1.0 as it will delete all your rates handeling fees
 * and changes you have made to country codes.
 * 
 * Author Mark Brittain
 */

DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLARGELETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLARGELETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STLETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STSMLPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STSMLPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STMIDPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM1STMIDPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLARGELETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLARGELETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLETTER_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDLETTERSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDSMLPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDSMLPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDMIDPARCEL_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RM2NDMIDPARCELSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMASSMALLPACKET_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMASSMALLPACKET500_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMSMALLPACKET_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMSMALLPACKETSF_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMAMSMALLPACKETSF500_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSMSMALLPACKET_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSMSMALLPACKETSF_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSMSMALLPACKETSF500_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY1000_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY2500_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY9AM_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY9AM1000_%";	
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSPECIALDELIVERY9AM2500_%";
