/*
 * Clear configuration file of Surface signed for and Airsure
 * 
 * to run this script
 * 
 * 1) Login to your zen cart admin
 * 2) Use Tools>Install SQL Patches
 * 3) Copy the contents of RemoveSurface.sql and paste into the text window
 *    or 
 *    User the Browse button to load RemoveSurface.sql into zen cart.
 */

DELETE FROM configuration WHERE configuration_key like "MODULE_SHIPPING_RMSMPARCELSF";
DELETE FROM configuration WHERE configuration_key like "MODULE_SHIPPING_RMAMASPARCEL";
