local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

function tile_variations_template(high_res_picture, high_res_transition_mask, options)
    local function main_variation(size_)
      local y_ = ((size_ == 1) and 0) or ((size_ == 2) and 128) or ((size_ == 4) and 320) or 640
      local ret =
      {
        picture = high_res_picture,
        count = (options[size_] and options[size_].weights) and #options[size_].weights or 16,
        size = size_,
        y = y_,
        line_length = (size_ == 8) and 8 or 16,
        scale = 0.5
      }
  
      if options[size_] then
        for k, v in pairs(options[size_]) do
          ret[k] = v
        end
      end
  
      return ret
    end
  
    local result =
    {
      main =
      {
        main_variation(1),
        main_variation(2),
        main_variation(4)
      }
    }
  
    if (options.max_size == 8) then
      table.insert(result.main, main_variation(8))
    end
  
    if options.empty_transitions then
      result.empty_transitions = true
    else
      result.transition =
      {
        spritesheet = high_res_transition_mask,
        layout =
        {
          scale = 0.5,
          count = (options and options.mask_variations) or 8,
          double_side_count = 0,
          u_transition_count = 1,
          o_transition_count = 1,
          u_transition_line_length = 1,
          o_transition_line_length = 2,
          outer_corner_x = 576,
          side_x = 1152,
          u_transition_x = 1728,
          o_transition_x = 2304,
          mask = { y_offset = 0 }
        }
      }
    end
    return result
  
  end

data:extend(
    {
        {
            type = "noise-expression",
            name = "sand_rock_cutoff",
            expression = "0.3"
        },
        {
            type = "noise-expression",
            name = "arrakis_desert_noise",
            expression = "multioctave_noise{x = x,\z
                                            y = y,\z
                                            persistence = 0.5,\z
                                            seed0 = map_seed,\z
                                            seed1 = 0,\z
                                            octaves = 5,\z
                                            input_scale = 0.05} - sand_rock_cutoff"
        },
        {
          type = "tile",
          name = "arrakis-sand",
          -- subgroup = "vulcanus-tiles",
          -- order = "a-c",
          collision_mask = tile_collision_masks.ground(),
          autoplace =
          {
            probability_expression = "arrakis_desert_noise"
          },
          layer = 1,
          -- sprite_usage_surface = "arrakis",
          variants = tile_variations_template("__base__/graphics/terrain/sand-1.png", "__base__/graphics/terrain/masks/transition-4.png",
                {
                    max_size = 8,
                    [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
                    [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
                    [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
                }
            ),
      
          -- transitions_between_transitions = lava_stone_transitions_between_transitions,
          -- walking_sound = data.raw.tile["dirt-1"].walking_sound,
          map_color = {220,140,50}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
          walking_speed_modifier = .6,
          vehicle_friction_modifier = 1,
          -- pollution_absorption_per_second = tile_pollution.lava
        },
        {
            type = "tile",
            name = "arrakis-rock",
            -- subgroup = "vulcanus-tiles",
            -- order = "a-c",
            collision_mask = tile_collision_masks.ground(),
            autoplace =
            {
              probability_expression = "~arrakis_desert_noise"
            },
            layer = 4,
            -- sprite_usage_surface = "arrakis",
            variants = tile_variations_template(
                "__base__/graphics/terrain/dirt-1.png", "__base__/graphics/terrain/masks/transition-1.png",
                {
                    max_size = 4,
                    [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                    [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
                    [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
                    --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
                }
                ),
        
            -- transitions_between_transitions = lava_stone_transitions_between_transitions,
            -- walking_sound = data.raw.tile["dirt-1"].walking_sound,
            map_color = {115,80,50}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
            walking_speed_modifier = .6,
            vehicle_friction_modifier = 1,
            -- pollution_absorption_per_second = tile_pollution.lava
          },
    }
)