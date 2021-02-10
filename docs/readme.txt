Installation overview
======================

This module installs in much the same way as other modules. Simply copy the "includes" and "image" folders to your online store directory.

Then go to modules / shipping in the store admin. For each of the methods you want to install, select that line and click [ Install ]

Next, click [ Edit] and switch it on (enable this shipping option "true")

You may want to also switch on "Hide invalid shipping" so customers aren't show methods they can't use.

The rates are the current RM charges, so are best left unchanged. If you want to add an amount for packaging cost, put that into the "Handling Fee" box. Then any changes in postage costs are easy to update.

If the order total is more than a set amount, this shipping method won't be offered. To change this limit, alter the amount in the "Maximum order value" box. To disable the limit, enter -1 in the box.

Some items are too big for certain postage methods. If you want to restrict the shipping options for a product, you assign a read only attribute to the item, which sets the "minimum" delivery method.

Run the SQL file "install3.2.sql" which will set up the attribute values.

Then it is easy to use the Attribute Controller to assign the relevant postage methods to an item.

If you read "HowToUseAttributePricing.htm" it lists how it works.

In the first table on that page, across the top there are the different attribute values you might have assigned to the item.

Down the side are listed the modules that can be offered if that attribute is set.

To read the table, look down the column under the attribute you have set for an item, and the rows marked with Y show the delivery modules available for that product.

As you can see, if no attribute is set, all options are shown to customer. If you set an option, that and any "larger" options are shown.

Further down the page there is another table. This is for when you have enabled "Attribute match" to "true" for specific delivery options. Only exact matches will be available, not giving the customer the option of a "bigger" alternative.

For example, with "Attribute match" off, an item set to "large letter" would also show the option of "small parcel" and "medium parcel". With "attribute match" on, only "large letter" would be offered. Where items in the basket have different options, only the biggest one will be offered.

Once you have assigned the relevant attribute value to an item, Zen Cart has a feature to copy that item's attributes to other items or to all items in specified categories.

So if you start with an item with no other attributes, you can easily copy it around your store 

**********************************************************
*Thanks to Hairydog for the text hope you find it useful.*
**********************************************************