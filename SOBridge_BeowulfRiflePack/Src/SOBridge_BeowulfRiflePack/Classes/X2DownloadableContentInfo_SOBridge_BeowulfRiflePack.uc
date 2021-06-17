class X2DownloadableContentInfo_SOBridge_BeowulfRiflePack extends X2DownloadableContentInfo;

var config array<name> arrWeaponTemplateName;

static event OnPostTemplatesCreated()
{
    local array<X2DataTemplate> DifficultyVariants;
    local X2ItemTemplateManager ItemTemplateManager;    
    local X2WeaponTemplate WeaponTemplate;
    local X2DataTemplate DataTemplate;
    local name WeaponTemplateToUpdate;
    
    ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    foreach default.arrWeaponTemplateName(WeaponTemplateToUpdate)
    {
        ItemTemplateManager.FindDataTemplateAllDifficulties(WeaponTemplateToUpdate, DifficultyVariants);

        foreach DifficultyVariants(DataTemplate)
        {
            // Since this is a bridge mod for specific mod, 100% confident this is an X2WeaponTemplate        
            WeaponTemplate = X2WeaponTemplate(DataTemplate);

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
}