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
            subgroup = "extraction-machine",
            order = "a[items]-z[moisture-farm]",
            place_result = "moisture-farm",
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
            -- subgroup = "",
            stack_size = 5,
            weight = 100,
            --spoil_result = nil,
            --spoil_ticks = 60 * 60 * 60, -- 1 hour
        },
        {
            type = "item",
            name = "pentapod-brain",
            icon = "__planet-arrakis__/graphics/icons/pentapod-brain.png",
            icon_size = 64,
            -- subgroup = "",
            stack_size = 5,
            weight = 100,
            --spoil_result = nil,
            --spoil_ticks = 60 * 60 * 60, -- 1 hour
        },
    }
)