data:extend(
    {
        {
            type = "item",
            name = "spice",
            subgroup = "arrakis-processes",
            stack_size = 20,
            icon = "__planet-arrakis__/graphics/icons/spice.png",
            fuel_category = "spice",
            fuel_value = "6MJ",
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
            name = "navigation-data",
            icon = "__planet-arrakis__/graphics/icons/data.png",
            icon_size = 64,
            -- subgroup = "",
            stack_size = 1,
            spoil_result = nil,
            spoil_ticks = 60 * 60 * 60, -- 1 hour
        }
    }
)