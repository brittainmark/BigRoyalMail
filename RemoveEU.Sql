#
# Remove all EU specific configuration entries
#
DELETE FROM configuration WHERE configuration_key LIKE 'MODULE_SHIPPING_RMAMTEU%';