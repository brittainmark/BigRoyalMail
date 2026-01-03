<?php
/**
 * Big Royal Mail Shipping for Zen Cart
 * Version 4.0.0
 *
 * @package shippingMethod
 * @copyright Portions Copyright 2004-2025 Zen Cart Team
 * @author Mark Brittain (brittainmark)
 * @version $Id: ScriptedInstaller.php 2025-02-21 retched Version 4.0.0 $
****************************************************************************
    Big Royal Mail for Zen Cart
    A shipping module for ZenCart, an ecommerce platform
    Copyright (C) 2025  Mark Brittain (brittainmark) gitbrit@inner-light.co.uk

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
****************************************************************************/

use Zencart\PluginSupport\ScriptedInstaller as ScriptedInstallBase;

class ScriptedInstaller extends ScriptedInstallBase
{
    protected function executeInstall()
    {

        /**
         * Check if non-encapsulated version is present and set the version if it is not set
         */
        $configuration = $this->getConfigurationKeyDetails('MODULE_SHIPPING_BIGROYALMAIL_VERSION', true);
        if ($configuration === false) {
            $removed = $this->purgeOldFiles();

            if (!$removed) {
                return false;
            }
            /**
             * Set the configuration key
             */
            $keyId = $this->addConfigurationKey('MODULE_SHIPPING_BIGROYALMAIL_VERSION', [
                    'configuration_title' => 'Version',
                    'configuration_value' => '4.0.0',
                    'configuration_description' => 'Version installed:',
                    'configuration_group_id' => 6,
                    'sort_order' => 0,
                    'set_function' => 'zen_cfg_select_option([\'0.0.0\'], ', 
                ]);
        }
        return true;

    }

    protected function executeUpgrade($oldVersion)
    {
        global $messageStack;
        // $version contains the old version being upgrade from.

        switch ($oldVersion) {
            case "v4.0.0":
                // Changes to the database from v4.0.0 should be put here.
                break;
        }

        // Update the version setting to match the new version. (This happens regardless of version, so this should sit outside version check.)
        $this->updateConfigurationKey('MODULE_SHIPPING_BIGROYALMAIL_VERSION', [
            'configuration_value' => $this->version,
            'set_function' => "zen_cfg_select_option([\'$this->version\'], "
        ]);
        return true;

    }

    protected function executeUninstall()
    {
        /**
         * List of big Royal Mail modules
         */

        $brmModules = [
            'RM1STLARGELETTER',
            'RM1STLARGELETTERSF',
            'RM1STLETTER',
            'RM1STLETTERSF',
            'RM1STMEDPARCEL',
            'RM1STMEDPARCELSF',
            'RM1STSMLPARCEL',
            'RM1STSMLPARCELSF',
            'RM2NDLARGELETTER',
            'RM2NDLARGELETTERSF',
            'RM2NDLETTER',
            'RM2NDLETTERSF',
            'RM2NDMEDPARCEL',
            'RM2NDMEDPARCELSF',
            'RM2NDSMLPARCEL',
            'RM2NDSMLPARCELSF',
            'RMAMLARGELETTER',
            'RMAMLARGELETTERSF',
            'RMAMLETTER',
            'RMAMLETTERSF',
            'RMAMPARCEL',
            'RMAMPARCELSF',
            'RMAMTLARGELETTER',
            'RMAMTLETTER',
            'RMAMTPARCEL',
            'RMAMTSLARGELETTER',
            'RMAMTSLETTER',
            'RMAMTSPARCEL',
            'RMPFEXPRESS10',
            'RMPFEXPRESS24',
            'RMPFEXPRESS48',
            'RMPFEXPRESSAM',
            'RMPFGECONOMY',
            'RMPFGEXPRESS',
            'RMPFGPRIORITY',
            'RMPFGVALUE',
            'RMPFIEXPRESS',
            'RMSMPARCEL',
            'RMSPECIALDELIVERY9AM',
            'RMSPECIALDELIVERY',
            'RMSPECIALDELIVERYSAT9AM',
            'RMSPECIALDELIVERYSAT',
            'RMT24LARGELETTER',
            'RMT24LARGELETTERSF',
            'RMT24MEDPARCEL',
            'RMT24MEDPARCELSF',
            'RMT24SMLPARCEL',
            'RMT24SMLPARCELSF',
            'RMT48LARGELETTER',
            'RMT48LARGELETTERSF',
            'RMT48MEDPARCEL',
            'RMT48MEDPARCELSF',
            'RMT48SMLPARCEL',
            'RMT48SMLPARCELSF',
        ];
        /**
         * Get list of installed shipping modules
         */
        $brmModule_listing = $this->executeInstallerSelectQuery("SELECT configuration_value FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'MODULE_SHIPPING_INSTALLED'");
        $updated_listing = $brmModule_listing->fields['configuration_value'] ?? '';
        /**
         * belt and braces remove all entries for all modules installed or not
         */
        foreach ($brmModules as $brmModule) {
            /**
             * Delete the keys set up general keys for all modules
             */
            $brmKeys =[
                'MODULE_SHIPPING_' . $brmModule . '_STATUS',
                'MODULE_SHIPPING_' . $brmModule . '_HIDE_SHIPPING_ERRORS',
                'MODULE_SHIPPING_' . $brmModule . '_TAX_CLASS',
                'MODULE_SHIPPING_' . $brmModule . '_SORT_ORDER',
                'MODULE_SHIPPING_' . $brmModule . '_ATTRIBUTE_MATCH',
                'MODULE_SHIPPING_' . $brmModule . '_MIN_ORDERVALUE',
                'MODULE_SHIPPING_' . $brmModule . '_MAX_ORDERVALUE',
                'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING',
                'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_1',
                'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_1',
                'MODULE_SHIPPING_' . $brmModule . '_INSURANCE',
                'MODULE_SHIPPING_' . $brmModule . '_ZONES_INSURE',
                
            ];
            
            switch ($brmModule) {
                case 'RMSPECIALDELIVERYSAT':
                case 'RMSPECIALDELIVERYSAT9AM':
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_DISPLAY_DAYS';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_FRIDAY_CUTOFF';
                    break;
                    
             /**
             * Deliberate fall through to add extra zones for different modules from here
             */
                case 'RMPFGEXPRESS':
                case 'RMPFGPRIORITY':
                case 'RMPFGVALUE':
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_9';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_9';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_9';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_8';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_8';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_8';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_7';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_7';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_7';
                 case 'RMAMPARCEL':
                 case 'RMAMTPARCEL':
                 case 'RMAMTSPARCEL':
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_6';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_6';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_6';
                 case 'RMAMPARCELSF':
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_5';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_5';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_5';                   
                case 'RMAMLARGELETTER':
                case 'RMAMLETTER':
                case 'RMAMLETTERSF':
                case 'RMAMTLARGELETTER':
                case 'RMAMTLETTER':
                case 'RMAMTSLARGELETTER':
                case 'RMAMTSLETTER':
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_4';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_4';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_4';
                 case 'RMAMLARGELETTERSF':
                 case 'RMPFGECONOMY':
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_3';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_3';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_3';
                case 'RMSMPARCEL':
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_2';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COUNTRIES_2';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_COST0_2';
                    $brmKeys[] = 'MODULE_SHIPPING_' . $brmModule . '_ZONES_HANDLING_1';
                    break;
                default:
            }
            /**
             * delete the keys
             */
            $this->deleteConfigurationKeys($brmKeys);
            /**
             *  remove module from shipping installed list
             */
            $updated_listing = preg_replace("/" . strtolower($brmModule) . ".php;?/", '', $updated_listing);
        }
        /**
         * remove expires date
         */
        $this->deleteConfigurationKeys('MODULE_SHIPPING_RM_EXPIRES');
        /**
         * Update shipping methods installed
         */
        $this->executeInstallerSql("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value='" . $updated_listing . "' WHERE configuration_key = 'MODULE_SHIPPING_INSTALLED'");

        return true;

    }
    protected function purgeOldFiles():bool
    {
         /**
         * check if old not encapsulated plugin is present
         */
        $brmModule = DIR_FS_CATALOG_MODULES . 'shipping/';
        $brmLang = DIR_FS_CATALOG_LANGUAGES . 'modules/shipping/';
        $brmFiles = [
            'rm1stlargeletter.php',
            'rm1stlargelettersf.php',
            'rm1stletter.php',
            'rm1stlettersf.php',
            'rm1stmedparcel.php',
            'rm1stmedparcelsf.php',
            'rm1stsmlparcel.php',
            'rm1stsmlparcelsf.php',
            'rm2ndlargeletter.php',
            'rm2ndlargelettersf.php',
            'rm2ndletter.php',
            'rm2ndlettersf.php',
            'rm2ndmedparcel.php',
            'rm2ndmedparcelsf.php',
            'rm2ndsmlparcel.php',
            'rm2ndsmlparcelsf.php',
            'rmamlargeletter.php',
            'rmamlargelettersf.php',
            'rmamletter.php',
            'rmamlettersf.php',
            'rmamparcel.php',
            'rmamparcelsf.php',
            'rmamtlargeletter.php',
            'rmamtletter.php',
            'rmamtparcel.php',
            'rmamtslargeletter.php',
            'rmamtsletter.php',
            'rmamtsparcel.php',
            'rmpfexpress10.php',
            'rmpfexpress24.php',
            'rmpfexpress48.php',
            'rmpfexpress9.php',
            'rmpfexpressam.php',
            'rmpfgeconomy.php',
            'rmpfgexpress.php',
            'rmpfgpriority.php',
            'rmpfgvalue.php',
            'rmpfiexpress.php',
            'rmsmparcel.php',
            'rmspecialdelivery9am.php',
            'rmspecialdelivery.php',
            'rmspecialdeliverysat9am.php',
            'rmspecialdeliverysat.php',
            'rmt24largeletter.php',
            'rmt24largelettersf.php',
            'rmt24medparcel.php',
            'rmt24medparcelsf.php',
            'rmt24smlparcel.php',
            'rmt24smlparcelsf.php',
            'rmt48largeletter.php',
            'rmt48largelettersf.php',
            'rmt48medparcel.php',
            'rmt48medparcelsf.php',
            'rmt48smlparcel.php',
            'rmt48smlparcelsf.php',
        ];
        $brmDirectory = $brmModule . 'BigRoyalMail';
        if (is_dir($brmDirectory)) {
            /*
             * remove the directory content then delete the directory
             */
            $removed = (unlink($brmDirectory . '/main.php') && unlink($brmDirectory . '/quote.php') && unlink($brmDirectory . '/rVersion.php') && unlink($brmDirectory . '/rates.php'));
            if ($removed) {
                $removed = rmdir($brmDirectory);
            }
            if (!$removed) {
                $this->errorContainer->addError(
                    0,
                    'Unable to detele files from non encapsulated Version of Big Royal mail. Please delete the Big Royal mail files [' . 
                        implode($brmFiles, ', ') . '] and the BigRoyalMail directory from ' . $brmModule . ' and lang.rm... files from' . 
                        $brmLang . ' then try again',
                    true);
            }
            return false;
        }

        $brmFilesList = '';
        $brmLangFileList = '';
        $brmFileError = false;
        foreach ($brmFiles as $brmFile) {
            $checkFile = $brmModule . $brmFile;
            if (file_exists($checkFile)) {
                if (!unlink($checkFile)) {
                    $brmFileList .= $brmFile . ', ';
                    $brmFileError = true;
                }
            }
            $checkFile = $brmLang . 'lang.' . $brmFile;
            if (file_exists($checkFile)) {
                if (!unlink($checkFile)) {
                    $brmLangFileList .= 'lang.' . $brmFile . ', ';
                    $brmFileError = true;
                }
            }
        }
        if ($brmFileError) {
            $this->errorContainer->addError(
                    0,
                    'Unable to detele files from non encapsulated Version of Big Royal mail. Please delete the Big Royal mail files [' .
                       implode($brmFileList, ', ') . '] and the BigRoyalMail directory from ' . $brmModule .
                       ' and language file [' . implode($brmLangFileList, ', ') . '] then try again',
                    true);
            return false;
        }
        return true;
    }

}