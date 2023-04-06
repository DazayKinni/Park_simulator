enum SAVEDATA_FORMAT
{
    BINARY,
    JSON,
    PRETTY,
}

VaultCreate("Default", { destination: "savedata.json", format: SAVEDATA_FORMAT.PRETTY });
VaultCreateShortcut(SAVEDATA_AUDIO_MUSIC,    VAULT_DEFAULT, "audio",    "music"  );
VaultCreateShortcut(SAVEDATA_AUDIO_SFX,      VAULT_DEFAULT, "audio",    "sfx"    );
VaultCreateShortcut(SAVEDATA_INPUTS_HAPTICS, VAULT_DEFAULT, "controls", "haptics");

function SavedataResetAll()
{
    VaultClearAll();
    VaultWrite(SAVEDATA_AUDIO_MUSIC,    0.8 );
    VaultWrite(SAVEDATA_AUDIO_SFX,      0.9 );
    VaultWrite(SAVEDATA_INPUTS_HAPTICS, true);
}

//macros
#macro VAULT_DEFAULT            "Default"
#macro SAVEDATA_AUDIO_MUSIC     "~ music volume"
#macro SAVEDATA_AUDIO_SFX       "~ sfx volume"
#macro SAVEDATA_INPUTS_HAPTICS  "~ haptics"