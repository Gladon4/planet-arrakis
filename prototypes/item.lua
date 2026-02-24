data:extend(
    {
        {
            type = "item",
            name = "spice",
            subgroup = "arrakis-processes",
            stack_size = 20,
            icon = "__planet-arrakis__/graphics/icons/spice.png",
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
        }
    }
)