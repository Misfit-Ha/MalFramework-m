# Back to Game
## Description:
_This module helps reconnecting players return to gameplay quickly. It restores their last saved gear and offers squad teleportation identical to the JIP system._

## Features:
- Restores custom Arsenal loadouts if available
- Falls back to role-specific gear otherwise
- Provides squad teleportation (same logic as JIP)
- Automatically removes teleport option after timeout

## Usage:
_No setup required. Automatically activates for reconnecting players._

## Config:
| Variable               | Default     | Description                                 |
|:---------------------- |:----------- |:------------------------------------------- |
| `reconnectTimeout`     | 10 MINUTES  | Time window to use reconnection benefits    |

## Supported mission types:
- Coop
