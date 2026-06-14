local Esp = loadstring(game:HttpGet("YOUR_RAW_URL_HERE"))()

local Config = Esp.Config

Config['Enabled'] = true
Config['Distance'] = 500

Config['Boxes']['Enabled'] = true
Config['Boxes']['Gradients']['Top'] = Color3.fromRGB(255, 0, 0)
Config['Boxes']['Gradients']['Bot'] = Color3.fromRGB(255, 0, 0)

Config['Boxes']['Bounding Box']['Enabled'] = true
Config['Boxes']['Bounding Box']['IncludeAcsessories'] = false
Config['Boxes']['Bounding Box']['BoxY'] = 6
Config['Boxes']['Bounding Box']['BoxX'] = 2

Config['Boxes']['Box Glow']['Enabled'] = true
Config['Boxes']['Box Glow']['Top'] = Color3.fromRGB(255, 0, 0)
Config['Boxes']['Box Glow']['Bot'] = Color3.fromRGB(180, 0, 0)
Config['Boxes']['Box Glow']['Transparency'] = {1, 0.4}

Config['Boxes']['Filled']['Enabled'] = true
Config['Boxes']['Filled']['Top'] = Color3.fromRGB(255, 0, 0)
Config['Boxes']['Filled']['Bot'] = Color3.fromRGB(100, 0, 0)
Config['Boxes']['Filled']['Transparency'] = {1, 0.75}

Config['Bars']['Health Bar']['Enabled'] = true
Config['Bars']['Health Bar']['Top'] = Color3.fromRGB(0, 255, 0)
Config['Bars']['Health Bar']['Mid'] = Color3.fromRGB(255, 165, 0)
Config['Bars']['Health Bar']['Bot'] = Color3.fromRGB(255, 0, 0)

Config['Bars']['Armor Bar']['Enabled'] = false

Config['Texts']['Name']['Enabled'] = true
Config['Texts']['Name']['Color'] = Color3.fromRGB(255, 255, 255)

Config['Texts']['Distance']['Enabled'] = true
Config['Texts']['Distance']['Color'] = Color3.fromRGB(200, 200, 200)

Config['Texts']['Weapon']['Enabled'] = true
Config['Texts']['Weapon']['Color'] = Color3.fromRGB(255, 220, 100)

-- unload example

-- Esp:Unload()
