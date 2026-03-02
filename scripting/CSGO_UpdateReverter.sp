#include <sourcemod>
#include <CSWeaponsAPI>

#pragma semicolon 1
#pragma newdecls required

#define PLUGIN_VERSION "1.0.0"

public Plugin myinfo =
{
    name = "CS:GO Update Reverter",
    author = "RATING3PRO",
    description = "Reverts Deagle damage (pre-2021) and M4A1-S clip size (25 bullets)",
    version = PLUGIN_VERSION
};

public void OnPluginStart()
{
    // Attempt to apply changes immediately
    UpdateWeaponStats();
}

public void OnMapStart()
{
    // Re-apply changes on map load to ensure they persist
    UpdateWeaponStats();
}

// Called when CSWeaponsAPI loads weapon data (if supported by extension hot-loading)
public void OnCSWeaponDataLoaded(CSWeaponData weapon_data)
{
    char classname[64];
    weapon_data.GetClassName(classname, sizeof(classname));
    
    if (StrEqual(classname, "weapon_deagle"))
    {
        weapon_data.Damage = 63;
    }
    else if (StrEqual(classname, "weapon_m4a1_silencer"))
    {
        weapon_data.MaxClip1 = 25;
        weapon_data.DefaultClip1 = 25;
        weapon_data.PrimaryReserveAmmoMax = 75;
    }
}

void UpdateWeaponStats()
{
    // 1. Revert Deagle Damage to 63 (Pre-Sept 2021 update)
    // The update reduced base damage from 63 to 53.
    CSWeaponData deagle = CSWeaponData.GetByClassName("weapon_deagle");
    if (deagle)
    {
        deagle.Damage = 63;
    }
    
    // 2. Revert M4A1-S Magazine to 25 (Pre-June 2022 update)
    // The update reduced mag size from 25 to 20.
    CSWeaponData m4a1s = CSWeaponData.GetByClassName("weapon_m4a1_silencer");
    if (m4a1s)
    {
        m4a1s.MaxClip1 = 25;
        m4a1s.DefaultClip1 = 25;
        m4a1s.PrimaryReserveAmmoMax = 75; // Standard 3 magazines reserve (25 * 3)
    }
}
