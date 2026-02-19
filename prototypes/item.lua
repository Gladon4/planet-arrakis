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
            icon = "__base__/graphics/icons/car.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "a[items]-z[spice-harvester]",
            place_result = "spice-harvester",
            stack_size = 1
        }
    }
)