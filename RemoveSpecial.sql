/*
 * Clear configuration file of Insured standard Parcel enries
 * If you have used the standard parcel incureed to £100, £250, £500 This script will remove the entries from the configuration file.
 * 
 * to run this script
 * 
 * 1) Login to your zen cart admin
 * 2) Use Tools>Install SQL Patches
 * 3) Copy the contents of RemoveSpecial.sql and paste into the text window
 *    or 
 *    User the Browse button to load RemoveSpecial.sql into zen cart.
 */
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
