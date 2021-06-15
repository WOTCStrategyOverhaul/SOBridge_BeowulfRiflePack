//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_SOBridge_BeowulfRiflePack.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_SOBridge_BeowulfRiflePack extends X2DownloadableContentInfo;

var config array<name> arrWeaponTemplateName;

/// <summary>
/// Called after the Templates have been created (but before they are validated) while this DLC / Mod is installed.
/// </summary>
static event OnPostTemplatesCreated()
{
    local X2ItemTemplateManager ItemTemplateManager;    
    local X2ItemTemplate ItemTemplate;    
    local X2WeaponTemplate WeaponTemplate;
    local name WeaponTemplateToUpdate;
    
    ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    foreach default.arrWeaponTemplateName(WeaponTemplateToUpdate)
    {
        // Original mod does not have difficulty variant
        ItemTemplate = ItemTemplateManager.FindItemTemplate(WeaponTemplateToUpdate);

        // Since this is a bridge mod for specific mod, 100% confident this is an X2WeaponTemplate        
        WeaponTemplate = X2WeaponTemplate(ItemTemplate);

        if (WeaponTemplate != none)
        {
            // Reset SpecialRequirementsFn
            if (WeaponTemplate.Requirements.SpecialRequirementsFn != none)
            {                    
                WeaponTemplate.Requirements.SpecialRequirementsFn = "";                 
            }
        }        
    }
}