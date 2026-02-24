data.extend{
    {
        type = "recipe-category",
        name = "moisture-recipes"
    },
    {
        type = "assembling-machine",
        name = "moisture-farm",
        icon = "__planet-arrakis__/graphics/icons/moisture-farm.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "moisture-farm"},
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        max_health = 100,
        energy_usage = "1W",
        crafting_speed = 1,
        energy_source = {
            type = "void"
        },
        crafting_categories = {"moisture-recipes"},
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__planet-arrakis__/graphics/entity/moisture-farm/moisture-farm-1.png",
                        priority = "high",
                        width = 200,
                        height = 300,
                        frame_count = 1,
                        line_length = 1,
                        shift = util.by_pixel(0,-23),
                        scale = 0.5
                    },
                     {
                        filename = "__planet-arrakis__/graphics/entity/moisture-farm/moisture-farm-shadow-1.png",
                        priority = "high",
                        width = 400,
                        height = 195,
                        frame_count = 1,
                        line_length = 1,
                        shift = util.by_pixel(50,5),
                        scale = 0.5,
                        draw_as_shadow = true
                    }
                }
            }
        },
        impact_category = "metal",
        fluid_boxes = {
            {
                production_type = "output",
                volume = 1000,
                pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -1} }}
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }}
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_connections = {{ flow_direction="output", direction = defines.direction.west, position = {-1, 0} }}
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_connections = {{ flow_direction="output", direction = defines.direction.east, position = {1, 0} }}
            }
        }
    }
}