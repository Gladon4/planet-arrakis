data:extend(
    {
        {
            type = "item",
            name = "spice",
            stack_size = 100,
            icon = "__planet-arrakis__/graphics/icons/spice.png",
        },
        {
            type = "item",
            name = "stationary-spice-harvester",
            icon = "__base__/graphics/icons/electric-mining-drill.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "a[items]-z[stationary-spice-harvester]",
            place_result = "stationary-spice-harvester",
            stack_size = 10
        }
    }
)