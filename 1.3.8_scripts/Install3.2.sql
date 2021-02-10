--
-- Set up the Attributes for Big royal Mail delivery options.
--
-- Create or find the Delivery option
--
SELECT (@options_id:=ifnull(max(products_options_id)+1,1)) FROM products_options;

SELECT (@options_id := ifnull(products_options_id, @options_id)) FROM products_options WHERE products_options_name="Minimum Delivery Method:" ;

REPLACE INTO products_options (products_options_id, language_id, products_options_name, products_options_sort_order, products_options_type, products_options_length, products_options_comment, products_options_size, products_options_images_per_row, products_options_images_style, products_options_rows) VALUES
(@options_id, 1, 'Minimum Delivery Method:', 0, 5, 32, '', 32, 0, 0, 0);

SELECT (@options_id := products_options_id) FROM products_options WHERE products_options_name="Minimum Delivery Method:" ;

--
-- Set up the option values
--
-- Large Letter
--
SELECT (@LargeLetter_id := ifnull(max(products_options_values_id)+1,1)) FROM products_options_values;

SELECT (@LargeLetter_id := ifnull(products_options_values_id, @LargeLetter_id)) FROM products_options_values WHERE products_options_values_name="Large Letter" ;

REPLACE INTO products_options_values (products_options_values_id, language_id, products_options_values_name, products_options_values_sort_order) VALUES
(@LargeLetter_id, 1, 'Large Letter', 10);

SELECT (@LargeLetter_id := products_options_values_id) FROM products_options_values WHERE products_options_values_name="Large Letter" ;

--
-- Small Parcel
--
SELECT (@SmallParcel_id := ifnull(max(products_options_values_id)+1,1)) FROM products_options_values;

SELECT (@SmallParcel_id := ifnull(products_options_values_id, @SmallParcel_id)) FROM products_options_values WHERE products_options_values_name="Small Parcel" ;

REPLACE INTO products_options_values (products_options_values_id, language_id, products_options_values_name, products_options_values_sort_order) VALUES
(@SmallParcel_id, 1, 'Small Parcel', 20);


SELECT (@SmallParcel_id := products_options_values_id) FROM products_options_values WHERE products_options_values_name="Small Parcel" ;

--
-- Medium Parcel
--
SELECT (@MediumParcel_id := ifnull(max(products_options_values_id)+1,1)) FROM products_options_values;

SELECT (@MediumParcel_id := ifnull(products_options_values_id, @MediumParcel_id)) FROM products_options_values WHERE products_options_values_name="Medium Parcel" ;

REPLACE INTO products_options_values (products_options_values_id, language_id, products_options_values_name, products_options_values_sort_order) VALUES
(@MediumParcel_id, 1, 'Medium Parcel', 30);


SELECT (@MediumParcel_id := products_options_values_id) FROM products_options_values WHERE products_options_values_name="Medium Parcel" ;

--
-- Parcel Force
--
SELECT (@ParcelForce_id := ifnull(max(products_options_values_id)+1,1)) FROM products_options_values;

SELECT (@ParcelForce_id := ifnull(products_options_values_id, @ParcelForce_id)) FROM products_options_values WHERE products_options_values_name="Special Delivary or Parcel Force" ;

REPLACE INTO products_options_values (products_options_values_id, language_id, products_options_values_name, products_options_values_sort_order) VALUES
(@ParcelForce_id, 1, 'Special Delivary or Parcel Force', 40);


SELECT (@ParcelForce_id := products_options_values_id) FROM products_options_values WHERE products_options_values_name="Special Delivary or Parcel Force" ;

--
-- Link the option and option values.
--
SELECT (@Pov2po_id := ifnull(max(products_options_values_to_products_options_id)+1,1)) FROM products_options_values_to_products_options;

SELECT (@Pov2po_id := ifnull(products_options_values_to_products_options_id, @Pov2po_id)) FROM products_options_values_to_products_options 
WHERE products_options_id= @options_id AND products_options_values_id = @LargeLetter_id;
REPLACE INTO products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) VALUES
(@Pov2po_id, @options_id, @LargeLetter_id);

SELECT (@Pov2po_id := ifnull(max(products_options_values_to_products_options_id)+1,1)) FROM products_options_values_to_products_options;

SELECT (@Pov2po_id := ifnull(products_options_values_to_products_options_id, @Pov2po_id)) FROM products_options_values_to_products_options 
WHERE products_options_id= @options_id AND products_options_values_id = @SmallParcel_id;
REPLACE INTO products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) VALUES
(@Pov2po_id, @options_id, @SmallParcel_id);

SELECT (@Pov2po_id := ifnull(max(products_options_values_to_products_options_id)+1,1)) FROM products_options_values_to_products_options;

SELECT (@Pov2po_id := ifnull(products_options_values_to_products_options_id, @Pov2po_id)) FROM products_options_values_to_products_options 
WHERE products_options_id= @options_id AND products_options_values_id = @MediumParcel_id;
REPLACE INTO products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) VALUES
(@Pov2po_id, @options_id, @MediumParcel_id);

SELECT (@Pov2po_id := ifnull(max(products_options_values_to_products_options_id)+1,1)) FROM products_options_values_to_products_options;

SELECT (@Pov2po_id := ifnull(products_options_values_to_products_options_id, @Pov2po_id)) FROM products_options_values_to_products_options 
WHERE products_options_id= @options_id AND products_options_values_id = @ParcelForce_id;
REPLACE INTO products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) VALUES
(@Pov2po_id, @options_id, @ParcelForce_id);

-- 
-- Add the insurance rates for Special delivery if installed
--
INSERT ignore INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added)
SELECT 'Insurance rates ', 'MODULE_SHIPPING_RMSPECIALDELIVERY_ZONES_INSURE', '500:0,1000:1,2500:3', 'example: 200:1.2 means values less than or equal to £200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now()
FROM configuration WHERE configuration_key  = "MODULE_SHIPPING_RMSPECIALDELIVERY_STATUS";
  
INSERT ignore INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added)
SELECT 'Insurance rates ', 'MODULE_SHIPPING_RMSPECIALDELIVERY9AM_ZONES_INSURE', '50:0,2.2:1000,5.7:2500', 'example: 200:1.2 means values less than or equal to &pound;200 would cost &pound;1.20. to insure. 100+:4.5 means that each additional &pound;100 costs &pound;4.50 to insure.', '6', '0', 'zen_cfg_textarea(', now()
FROM configuration WHERE configuration_key  = "MODULE_SHIPPING_RMSPECIALDELIVERY9AM_STATUS";

-- 
-- Update max order value for special to 2500
-- 
UPDATE configuration SET configuration_value = 2500 WHERE configuration_key  = "MODULE_SHIPPING_RMSPECIALDELIVERY_MAX_ORDERVALUE";

UPDATE configuration SET configuration_value = 2500 WHERE configuration_key  = "MODULE_SHIPPING_RMSPECIALDELIVERY9AM_MAX_ORDERVALUE";
