# Undercover
## Description:
_This module adds an ability to conceal as non-combatant after removing all weapons from inventory slots (Rifle, Pistol and launcher). It also has an addictional function to make certain zones reveal or conceal cover, Use area markers or triggers to specify those areas._

## Usage:
1. _Set undercover variable to true_
2. _(Optional) Place down your markers and put the of name the markers in deniedAreasArray or safeAreasArray_

## Config:
_Description of each value set in the config file._

| Variable          | Variable type | Default value         | Game mode | Description                           |
|:------------      |:------------- |:--------------        |:--------- |:--------------------------            |
| `undercover`      | `BOOLEAN`     | `false`               | Coop/TvT  | Enables the function                  |
| `deniedAreas`     | `BOOLEAN`     | `false`               | Coop/TvT  | Enables the denied Areas function     |
| `deniedAreasArray`| `ARRAY`       | `["deniedArea_01"]`   | Coop/TvT  | Array of denied Areas names           |
| `safeAreasArray`  | `ARRAY`       | `["safeArea_01"]`     | Coop/TvT  | Array of safe Areas names             |

## Supported mission type(s):
 - Coop
 - TvT
