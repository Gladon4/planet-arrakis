local resource_autoplace = require("resource-autoplace")

data:extend{
  {
    type = "noise-expression",
    name = "spice_subtract_noise",
    expression = "multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 112, octaves = 4, persistence = 0.67} > 0.3"
  },
  {
    type = "noise-expression",
    name = "voronoi_base",
    expression = "((1000 * voronoi_spot_noise{x = x, y = y, seed0 = map_seed, seed1 = 1, grid_size = 512, distance_type = 2}) < 75)"
  },
  {
    type = "noise-expression",
    name = "spice_scale_noise",
    expression = "abs(multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 112, octaves = 4, persistence = 0.67, output_scale = 500})"
  },
  {
    type = "noise-expression",
    name = "spice_ore_gen",
    expression = "(voronoi_base - spice_subtract_noise) * spice_scale_noise * arrakis_deep_sand_mask"
  },
}

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
            stages_effect =
            {
                sheet =
                {
                    filename = "__planet-arrakis__/graphics/entity/spice-ore/spice-sparkle.png",
                    priority = "extra-high",
                    size = 128,
                    frame_count = 8,
                    variation_count = 8,
                    scale = 0.35,
                    blend_mode = "additive",
                    flags = { "light" }
                }
            },
            effect_animation_period = 3.0,
            effect_animation_period_deviation = 0.5,
            effect_darkness_multiplier = 4.0,
            min_effect_alpha = 0.05,
            max_effect_alpha = 0.5,
            --resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
            autoplace =
            {
                probability_expression = "spice_ore_gen"
            },
            map_color = {0.2, 0.5, 0.8},
            mining_visualisation_tint = { r = 0.1, g = 0.3, b = 1.0, a = 1.0 },
        }
    }
)