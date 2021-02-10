see CREDITS.txt for licence and contributors.

INSTALLATION

Copy the files from BigRoyalMail_V3.0.1/includes/* and BigRoyalMail_V3.0.1/images/*
onto your server into:

YOUR_SHOPPING_CART_DIRECTORY/includes/
YOUR_SHOPPING_CART_DIRECTORY/images/

1) Login to your zen cart admin.
2) Go to admin->Modules->Shipping

3) Select the modules you want to install by clicking on it then clicking install. 
4) Modify any of the settings then click Update.

5) Repeat steps 3) and 4) for all the modules you wish to install.
 
NB.
1) These modules only take into account weight and not the size of your items. Therefore I would recommend that you either 
   install the letter modules or the others not both.
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
