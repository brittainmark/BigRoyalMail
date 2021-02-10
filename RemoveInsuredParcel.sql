/*
 * Clear configuration file of Insured standard Parcel enries
 * If you have used the standard parcel incureed to £100, £250, £500 This script will remove the entries from the configuration file.
 * 
 * to run this script
 * 
 * 1) Login to your zen cart admin
 * 2) Use Tools>Install SQL Patches
 * 3) Copy the contents of RemoveInsuredParcel.sql and paste into the text window
 *    or 
 *    User the Browse button to load RemoveInsuredParcel.sql into zen cart.
 */
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSTDPARCELS100_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSTDPARCELS250_%";
DELETE FROM configuration WHERE configuration_key like "MODULES_SHIPPING_RMSTDPARCELS500_%";