# EspLibrary
**Made by Jairo**

## What is this?
A performance-focused ScreenGui ESP library for Roblox executors. Built around the sUNC standard with a hard 60fps cap, event-driven health/weapon updates, dirty-checked property writes, and zero runtime instance traversal.

---

## Requirements
- sUNC-compliant executor
- Roblox game with standard `Humanoid` + `HumanoidRootPart` character rigs

---

## Loading

```lua
local Esp = loadstring(game:HttpGet("YOUR_RAW_URL_HERE"))()
```

---

## Config

All settings live at `getgenv().Library.Config` and can be mutated at any time.

### Top Level
| Key | Type | Default | Description |
|---|---|---|---|
| `Enabled` | `boolean` | `true` | Master toggle for the entire ESP |
| `Distance` | `number` | `400` | Max render distance in studs |

### Boxes
| Key | Type | Default | Description |
|---|---|---|---|
| `Boxes.Enabled` | `boolean` | `true` | Toggles the box outline and fill |
| `Boxes.Gradients.Top` | `Color3` | White | Top color of the box outline gradient |
| `Boxes.Gradients.Bot` | `Color3` | White | Bottom color of the box outline gradient |

#### Bounding Box
| Key | Type | Default | Description |
|---|---|---|---|
| `Boxes['Bounding Box'].Enabled` | `boolean` | `true` | Uses per-part bounding box projection. Falls back to root-scale estimate if false |
| `Boxes['Bounding Box'].IncludeAcsessories` | `boolean` | `false` | Include accessories in bounding box calculation |
| `Boxes['Bounding Box'].BoxX` | `number` | `0` | Horizontal padding on the box |
| `Boxes['Bounding Box'].BoxY` | `number` | `4` | Vertical padding on the box |

#### Box Glow
| Key | Type | Default | Description |
|---|---|---|---|
| `Boxes['Box Glow'].Enabled` | `boolean` | `false` | Toggles the outer glow ImageLabel |
| `Boxes['Box Glow'].Top` | `Color3` | Red | Top glow color |
| `Boxes['Box Glow'].Bot` | `Color3` | Red | Bottom glow color |
| `Boxes['Box Glow'].Transparency` | `{number, number}` | `{1, 0.5}` | `{top transparency, bottom transparency}` |

#### Filled
| Key | Type | Default | Description |
|---|---|---|---|
| `Boxes.Filled.Enabled` | `boolean` | `true` | Toggles the filled box frame |
| `Boxes.Filled.Top` | `Color3` | White | Top fill color |
| `Boxes.Filled.Bot` | `Color3` | White | Bottom fill color |
| `Boxes.Filled.Transparency` | `{number, number}` | `{1, 0.8}` | `{top transparency, bottom transparency}` |

### Bars
| Key | Type | Default | Description |
|---|---|---|---|
| `Bars['Health Bar'].Enabled` | `boolean` | `true` | Toggles the vertical health bar on the left side |
| `Bars['Health Bar'].Top` | `Color3` | Green | Health bar top color |
| `Bars['Health Bar'].Mid` | `Color3` | Orange | Health bar mid color |
| `Bars['Health Bar'].Bot` | `Color3` | Red | Health bar bottom color |
| `Bars['Armor Bar'].Enabled` | `boolean` | `true` | Toggles the horizontal armor bar below the box |
| `Bars['Armor Bar'].Top` | `Color3` | Light blue | Armor bar left color |
| `Bars['Armor Bar'].Mid` | `Color3` | Dark blue | Armor bar mid color |
| `Bars['Armor Bar'].Bot` | `Color3` | Navy | Armor bar right color |

### Texts
| Key | Type | Default | Description |
|---|---|---|---|
| `Texts.Name.Enabled` | `boolean` | `true` | Toggles the player display name above the box |
| `Texts.Name.Color` | `Color3` | White | Name text color |
| `Texts.Distance.Enabled` | `boolean` | `true` | Toggles the distance label below the box |
| `Texts.Distance.Color` | `Color3` | White | Distance text color |
| `Texts.Weapon.Enabled` | `boolean` | `true` | Toggles the current tool label below the box |
| `Texts.Weapon.Color` | `Color3` | White | Weapon text color |

---

## Methods

### `Library:Unload()`
Destroys all ESP instances, disconnects all connections, and clears the cache. Safe to call before reloading.

```lua
getgenv().Library:Unload()
```

### `Library:AddTarget(Player)`
Manually adds a player to the ESP cache. Called automatically for all current and joining players.

### `Library:RemoveTarget(Player)`
Manually removes a player from the ESP cache and destroys their ESP objects.

---

## Armor Integration
The armor bar reads `Data['Armor']` and `Data['MaxArmor']` from the player's cache entry. To drive it from your game's armor system:

```lua
local Esp = getgenv().Library
local Cache = Esp.Cache

game:GetService("Players").PlayerAdded:Connect(function(Player)
    repeat task.wait() until Cache[Player]
    -- update whenever armor changes in your game
    Cache[Player]['Armor'] = 75
    Cache[Player]['MaxArmor'] = 100
end)
```

---

## Unload Guard
The library auto-unloads any previous instance on re-execution:
```lua
if getgenv().Library and getgenv().Library.Unload then
    pcall(getgenv().Library.Unload, getgenv().Library)
end
```
