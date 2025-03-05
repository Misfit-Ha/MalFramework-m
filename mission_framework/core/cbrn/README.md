# CBRN  
## Description:  
*This module adds CBRN threat zones that injure players without proper protection (AI unaffected). Features arcade-style mechanics with 4 color-coded threat levels, mask fogging effects, oxygen systems, and decontamination requirements.*  

*Players use Chemical Detectors (Contact DLC) and geiger counter items to monitor threat levels. Includes integration with KAT Medical for chemical injuries.*  

## Key Features:  
- 4-tier threat system (Green/Yellow/Orange/Red)  
- Progressive mask fogging mechanics  
- Oxygen tank duration system  
- Decontamination showers  
- Vanilla and ACE3 gear compatibility  
- Vehicle protection configurations  
- KAT Medical integration (chemical warfare injuries)  

## Usage:  
1. *Create zones via server init (recommended initServer.sqf):*  
```sqf  
/*  
Arguments:  
    0: POSITION - Center of zone  
    1: SCALAR - Threat level (0-4.9)  
    2: SCALAR - Full effect radius  
    3: SCALAR - Partial effect radius  
*/  
[getMarkerPos "zone_center", 2.5, 50, 100] call cbrn_fnc_createZone;  
```  

2. *Control zones via trigger variables:*  
```sqf  
// Disable zone  
_trigger setVariable ["cbrn_active", false, true];  
```  

## Configuration:  
*Configure in mission_framework\config\config.sqf*  

| Variable | Type | Default | Description |  
|----------|------|---------|-------------|  
| `cbrn_maxDamage` | SCALAR | 100 | Total damage before death. Passive contamination starts at 50% |  
| `cbrn_backpacks` | ARRAY | `["B_SCBA_01_F"...]` | Oxygen tank backpacks |  
| `cbrn_conditioning` | ARRAY | `["B_CombinationUnitRespirator_01_F"]` | Air conditioning backpacks that reduce fogging |  
| `cbrn_suits` | ARRAY | `["U_C_CBRN_Suit_01_Blue_F"...]` | Protective uniforms |  
| `cbrn_masks` | ARRAY | `["G_AirPurifyingRespirator_02_black_F"...]` | Gas masks |  
| `cbrn_threatGeiger` | STRING | "ACE_HuntIR_monitor" | Geiger counter item |  
| `cbrn_maxOxygenTime` | SCALAR | 1800 | Oxygen duration in seconds (30min) |  
| `cbrn_deconWaterTime` | SCALAR | 120 | Decon shower water supply (seconds) |  
| `cbrn_fogStartTime` | SCALAR | 300 | Mask fog starts after 5 minutes |  
| `cbrn_fogMaxTime` | SCALAR | 600 | Full fog opacity after 10 minutes |  
| `cbrn_vehicles` | ARRAY | `[]` | CBRN-proof vehicles: `[["B_APC_Wheeled_01_cannon_F", 5]]` |  

## Protection Levels:  
1. **Yellow Threat**: Gas mask required  
2. **Orange Threat**: Mask + Oxygen tank  
3. **Red Threat**: Full suit + Mask + Oxygen  

## Mechanics:  
- **Passive Contamination**: Starts at 50% damage - requires decon shower  
- **Fogging System**: Masks fog up over time, affected by:  
  - Fatigue levels (`cbrn_fogFatigueEnabled`)  
  - Air conditioning units  
  - Removal fade-out speed (`cbrn_fogFadeCoef`)  
- **Vehicle Protection**: Configure specific vehicles with protection values  
- **Medical Integration**: Compatible with KAT Medical chemical injuries  

## Notes:  
- Decon showers have limited water - turn off after use!  
- Oxygen tanks have 30min runtime by default  
- Fogging overlay doesn't fully block vision  
- Delete disabled zones only after syncing changes in MP  
- Configure KAT support via `cbrn_kat_enabled`  

## Requirements:  
- CBA_A3  
- ACE3  
- (Optional) KAT Medical for advanced injuries  

## Contributors:  
diwako, Celene, Alan245  

*For detailed implementation guide and updates, visit [BI Forum Thread](https://forums.bohemia.net/forums/topic/225668-cbrn-script/)*