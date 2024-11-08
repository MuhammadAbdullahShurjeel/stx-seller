## STX SELLER SYSTEM ( BY STX SCRIPTS)

- How To Make More Shops

You can use this template and make more seller shops.

```
    {
        Prompt = {
            name = 'unique_butcher', --- This Thing Must Be Unique From Other Seller CFGS
            keybind = 0xF3830D8E, -- This Only Works For Prompt System
            eventnameEnable = false,
            eventname = nil, -- Must Be Unique. Write it in double quotations "event...."
            msg = 'Open Butcher Seller',
            promptvec = vector3(-5528.1064, -3048.9243, -2.3422) -- This is the coords for both target or prompt
        },
        ItemPrices = { --- Here's the table for the items to be sold. REMEMBER items that are not added in this table if you add those in inventory it will show notify you that buyer doesn't buy these types of items
            ['carrot'] = 10,
            ['canteen0'] = 25
        },
    },
```
