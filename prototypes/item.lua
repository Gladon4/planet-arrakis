local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend(
    {
        {
            type = "item",
            name = "spice",
            subgroup = "arrakis-processes",
            stack_size = 20,
            icon = "__planet-arrakis__/graphics/icons/spice.png",
            fuel_category = "spice",
            fuel_value = "10MJ",
        },
        {
            type = "item",
            name = "spice-harvester",
            icon = "__planet-arrakis__/graphics/icons/harvester.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "a[items]-z[spice-harvester]",
            place_result = "spice-harvester",
            stack_size = 1
        },
        {
            type = "item",
            name = "moisture-farm",
            icon = "__planet-arrakis__/graphics/icons/moisture-farm.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "a[items]-z[moisture-farm]",
            place_result = "moisture-farm",
            stack_size = 20
        },
        {
            type = "item",
            name = "navigator",
            icon = "__planet-arrakis__/graphics/icons/navigator.png",
            icon_size = 64,
            subgroup = "planet-arrakis-space",
            order = "a[items]-z[navigator]",
            place_result = "navigator",
            stack_size = 20
        },
        {
            type = "tool",
            name = "arrakis-science-pack",
            icon = "__planet-arrakis__/graphics/icons/arrakis-science-pack.png",
            subgroup = "science-pack",
            -- color_hint = { text = "P" },
            order = "z[arrakis-science-pack]",
            inventory_move_sound = item_sounds.science_inventory_move,
            pick_sound = item_sounds.science_inventory_pickup,
            drop_sound = item_sounds.science_inventory_move,
            stack_size = 200,
            weight = 1 * kg,
            durability = 1,
            random_tint_color = item_tints.bluish_science,
            default_import_location = "arrakis"
        },
        {
            type = "item",
            name = "biter-brain",
            icon = "__planet-arrakis__/graphics/icons/biter-brain.png",
            icon_size = 64,
            subgroup = "arrakis-intermediate-products",
            stack_size = 5,
            weight = 100,
        },
        {
            type = "item",
            name = "pentapod-brain",
            icon = "__planet-arrakis__/graphics/icons/pentapod-brain.png",
            icon_size = 64,
            subgroup = "arrakis-intermediate-products",
            stack_size = 5,
            weight = 100,
        },
        {
            type = "item",
            name = "thumper",
            icon = "__planet-arrakis__/graphics/icons/thumper.png",
            icon_size = 64,
            subgroup = "turret",
            order = "c[items]-z[thumper]",
            place_result = "thumper",
            stack_size = 10
        },
        {
            type = "item",
            name = "holtzman-drive",
            icon = "__planet-arrakis__/graphics/icons/holtzman-engine.png",
            icon_size = 64,
            subgroup = "planet-arrakis-space",
            order = "b[items]-a[holtzman-drive]",
            place_result = "holtzman-drive",
            stack_size = 10
        },
        {
            type = "item",
            name = "trout-bait",
            icon = "__planet-arrakis__/graphics/placeholder.png",
            icon_size = 64,
            subgroup = "planet-arrakis-production",
            order = "a[items]-z[trout-bait]",
            place_result = "trout-bait",
            stack_size = 10
        },
        {
            type = "item",
            name = "worm-growth-area",
            icon = "__planet-arrakis__/graphics/placeholder.png",
            icon_size = 64,
            subgroup = "planet-arrakis-production",
            order = "a[items]-z[worm-growth-area]",
            place_result = "worm-growth-area",
            stack_size = 10
        },
    }
)