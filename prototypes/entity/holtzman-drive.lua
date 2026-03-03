data.extend({
    {
        type = "container",
        name = "holtzman-drive",
        inventory_size = 5,
        icon = "__planet-arrakis__/graphics/icons/holtzman-engine.png",
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.1, result = "wooden-chest"},
        max_health = 100,
        -- corpse = "wooden-chest-remnants",
        -- dying_explosion = "wooden-chest-explosion",
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        --fast_replaceable_group = "container",
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        -- open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6 },
        -- close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
        impact_category = "metal",
        icon_draw_specification = {scale = 0.7},
        picture =
        {
            layers =
            {
                {
                filename = "__planet-arrakis__/graphics/entity/holtzman-engine/holtzman-engine.png",
                priority = "extra-high",
                width = 200,
                height = 200,
                shift = util.by_pixel(0,0),
                scale = 1
                },
                -- {
                -- filename = "__base__/graphics/entity/wooden-chest/wooden-chest-shadow.png",
                -- priority = "extra-high",
                -- width = 104,
                -- height = 40,
                -- shift = util.by_pixel(10, 6.5),
                -- draw_as_shadow = true,
                -- scale = 1
                -- }
            }
        },
        -- circuit_connector = circuit_connector_definitions["chest"],
        -- circuit_wire_max_distance = default_circuit_wire_max_distance
    }
})