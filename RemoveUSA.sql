#
# Remove USA code from existing categories
#
UPDATE configuration SET configuration_value = replace(configuration_value, "US", "") WHERE `configuration_key` LIKE "MODULE_SHIPPING_RMAM%ZONES_COUNTRIES%";