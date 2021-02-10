see CREDITS.txt for licence and contributors.

INSTALLATION

Copy the files from BigRoyalMail_V3.1.0/includes/* and BigRoyalMail_V3.1.0/images/*
onto your server into:

YOUR_SHOPPING_CART_DIRECTORY/includes/
YOUR_SHOPPING_CART_DIRECTORY/images/

1) Login to your zen cart admin.
2) Go to admin->Modules->Shipping

3) Select the modules you want to install by clicking on it then clicking install. 
4) Modify any of the settings then click Update.

5) Repeat steps 3) and 4) for all the modules you wish to install.

6) Run Install3.2.sql to add the entries to the configuration file.
  1) Login to your zen cart admin
  2) Use Tools>Install SQL Patches
  3) Copy the contents of Install3.2.sql and paste into the text window
     or 
     User the Browse button to load Install3.2.sql into zen cart.
 
7) If you want to force a minimum delivery method then set the appropriate attributes for each product. This can be done by visiting the product 
   1) Login to your zen cart admin
   2) Use Catalog>Categories/Products> then navidate to your products
   3) Then click on the A in a circle.
   4) Select Minimum Delivery Method: [Read only]...
   5) Select the appropriate option value.
      The order is
      a) Large Letter
      b) Small Parcel
      c) Medium Parcel
      d) Special Delivary or Parcel Force
      Therefore if you select Large letter only standard letter will be excluded.
      If you select Medium Parcel then standard letter, Large Letter and Small Parcel will be excluded. 
      
 
NB.
1) I have now change the modules to allow you to use attributes to determin the minimum delivery method for items (take some size into accont). 
   This does not take into account multiple items that when packed together would make the parcel larger than the size set.
   Therefor you may still need to consider which modules you install.
2) All pricing information is based on Kg not Lbs. if you are using Lbs as your weight measure you will either have to adjust 
   your product weights to Kg or recalculate the weights to Lbs.
3) If you are using Kg and have not already done so adjust the TEXT_PRODUCTS_WEIGHT_UNIT to Kg to display the correct information 
   in zen cart admin. This can be found in YOUR_SHOPPING_CART_DIRECTORY>YOUR_ADMIN>include>language>english.php
4) As for 3) adjust the weight to TEXT_PRODUCTS_WEIGHT_UNIT to Kg. this should be found in CATALOG_SITE>include>language>english.php 
   or YOUR_SHOPPING_CART_DIRECTORY>include>language>YOUR_TEMPLATE>english.php. you should always save the changes to the second location to avoid them 
   being lost on update.

 
If you wish to modify any of the text in the language files please use the template overrides system. Copy the file to your template folder 
in the includes>language>english>modules>shipping>YOUR_TEMPLATE this way you will not loose any changes if you install updates.
 
 --------------------------------------------------

if you are upgrading please read the file UPGRADES.txt.

---------------------------------------------------

If you are using printer papers you can ship upto 5kg overseas. The upgrade Sql PrintedPapers.sql will apply the rates.
NOTE:  It will not differentiate between printed papers and other types of post so do not use this unless you know you are shipping printed papers.
       Additionally you must have installed the full package before applying this update as it only changes the rates.
See PrintedPapers.sql for how to apply.
