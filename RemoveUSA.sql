update configuration set configuration_value = replace(configuration_value, "US", "")
WHERE `configuration_key` LIKE "MODULE_SHIPPING_RMAM%ZONES_COUNTRIES%";