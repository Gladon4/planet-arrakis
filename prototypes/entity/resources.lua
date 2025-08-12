local resource_autoplace = require("resource-autoplace")  

data:extend(
    {
        {
            type = "resource",
            name = "spice-ore",
            icon = "__planet-arrakis__/graphics/icons/spice-ore.png",
            flags = {"placeable-neutral"},
            --order= "",
            tree_removal_probability = 0.8,
            tree_removal_max_distance = 32 * 32,
            minable = 
            {
                mining_particle = "iron-ore-particle",
                mining_time = 1,
                result = "spice"
            },
            category = "spice-mining",
            subgroup = "arrakis-processes",
            order="e[spice-ore]",
            -- subgroup = resource_parameters.subgroup,
            -- walking_sound = resource_parameters.walking_sound,
            -- collision_mask = resource_parameters.collision_mask,
            collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
            stages =
            {
            sheet =
            {
                filename = "__planet-arrakis__/graphics/entity/spice-ore/spice-ore.png",
                priority = "extra-high",
                size = 128,
                frame_count = 8,
                variation_count = 8,
                scale = 0.8
            }
            },
            --resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
            autoplace = resource_autoplace.resource_autoplace_settings
            {
                name = "spice-ore",
                order = "a",
                base_density = 10,
                -- base_spots_per_km = 1,
                has_starting_area_placement = false,
                regular_rq_factor_multiplier = 0,
                starting_rq_factor_multiplier = 0,
                candidate_spot_count = 0,
                -- tile_restriction = autoplace_parameters.tile_restriction
            },
            map_color = {0.2, 0.5, 0.8},
            mining_visualisation_tint = { r = 0.1, g = 0.3, b = 1.0, a = 1.0 },
        }
    }
)