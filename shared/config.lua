Config = {}

Config.Core = 'rsg-core'

Config.Debug = true

Config.Inv = 'v2'
Config.InvName = 'rsg-inventory' -- this is used for rsg inventory v2 exports
Config.InvSettings = {
    maxweight = 10000000,
    slots = 2,
}

Config.Interaction = 'target' -- prompt : RSGCORE PROMPT SYSTEM | target : target System

Config.InteractionName = 'rsg-target' --- rsg-core : using for prompt | rsg-target : for target system

Config.Locations = {
    {
        Prompt = {
            name = 'unique_butcher',
            keybind = 0xF3830D8E, -- This keybind only works for prompt system
            msg = 'Open Butcher Seller',
            promptvec = vector3(-5527.9995, -3048.5862, -2.3513)
        },
        ItemPrices = {
            ['carrot'] = 10,
            ['canteen0'] = 25
        },
    },
    {
        Prompt = {
            name = 'unique_butcher_1',
            keybind = 0xF3830D8E,
            msg = 'Open Trapper Seller',
            promptvec = vector3(-333.90, 773.21, 116.26)
        },
        ItemPrices = {
            ['bread'] = 10,
            ['canteen0'] = 25
        },
    },
}



Config.locale = "en"

Config.locales = {
    ["en"] = {
        open_inv = "Open Inventory",
        sell_stuff = "Sell That Stuff",
        seller_name = "Seller",
        seller_error = "I donot buy these types of items!",
        seller_success = "I will Buy All The Items For: ",
        seller_currency = "$",
        seller_Menu_Title = "Menu",
        
    }

}