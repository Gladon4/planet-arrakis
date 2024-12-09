local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

tile_collision_masks.desert_sand = function()
  return
  {layers={  -- copy of oily shallow ocean allow only player, vehicles, and elevated rail pillars. No other structures, rail, belts, etc.
    ground_tile=true,
    water_tile=true,
    -- resource=true
  }}
end

tile_collision_masks.deep_desert_sand = function()
  return
  {layers={
    ground_tile=true,
    water_tile=true,
    -- resource=true,
    -- rail_support=true
  }}
end


local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64*9
      },
      side =
      {
        count = 8,
        x = 64*9*2
      },
      u_transition =
      {
        count = 1,
        x = 64*9*3
      },
      o_transition =
      {
        count = 1,
        x = 64*9*4
      }
    }
  }
end

data:extend(
    {
        {
            type = "noise-expression",
            name = "deep_desert_to_sand_threshold",
            expression = "0.1"
        },
        {
            type = "noise-expression",
            name = "sand_to_rock_threshold",
            expression = "0.4"
        },
        {
            type = "noise-expression",
            name = "arrakis_desert_noise",
            expression = "multioctave_noise{x = x,\z
                                            y = y,\z
                                            persistence = 0.7,\z
                                            seed0 = map_seed,\z
                                            seed1 = 0,\z
                                            octaves = 8,\z
                                            input_scale = 0.03}"
        },
        {
          type = "tile",
          name = "arrakis-deep-desert-sand",
          -- subgroup = "vulcanus-tiles",
          -- order = "a-c",
          collision_mask = tile_collision_masks.deep_desert_sand(),
          autoplace =
          {
            probability_expression = "arrakis_desert_noise <= deep_desert_to_sand_threshold"
          },
          layer = 1,
          layer_group = "ground-natural",
          -- sprite_usage_surface = "arrakis",
          variants =
          {
            transition = transition_masks(),
            material_background =
            {
              picture = "__planet-arrakis__/graphics/terrain/arrakis-deep-desert-sand.png",
              line_length = 4,
              count = 16,
              scale = 0.5
            },
            material_texture_width_in_tiles = 10,
            material_texture_height_in_tiles = 7
          },
          default_cover_tile = "foundation",
          -- transitions_between_transitions = lava_stone_transitions_between_transitions,
          -- walking_sound = data.raw.tile["dirt-1"].walking_sound,
          -- map_color = {220,140,50}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
          map_color = {113,77,54},
          walking_speed_modifier = .6,
          vehicle_friction_modifier = 4,
          -- pollution_absorption_per_second = tile_pollution.lava
        },
        {
          type = "tile",
          name = "arrakis-sand",
          -- subgroup = "vulcanus-tiles",
          -- order = "a-c",
          collision_mask = tile_collision_masks.desert_sand(),
          autoplace =
          {
            probability_expression = "(arrakis_desert_noise > deep_desert_to_sand_threshold) & (arrakis_desert_noise <= sand_to_rock_threshold)"
          },
          layer = 2,
          layer_group = "ground-natural",
          -- sprite_usage_surface = "arrakis",
          variants =
          {
            transition = transition_masks(),
            material_background =
            {
              picture = "__planet-arrakis__/graphics/terrain/arrakis-sand.png",
              line_length = 4,
              count = 16,
              scale = 0.5
            },
            material_texture_width_in_tiles = 10,
            material_texture_height_in_tiles = 7
          },
          default_cover_tile = "foundation",
          -- transitions_between_transitions = lava_stone_transitions_between_transitions,
          -- walking_sound = data.raw.tile["dirt-1"].walking_sound,
          -- map_color = {220,140,50}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
          map_color = {111,74,52},
          walking_speed_modifier = .8,
          vehicle_friction_modifier = 2,
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
              probability_expression = "arrakis_desert_noise > sand_to_rock_threshold"
            },
            layer = 3,
            -- sprite_usage_surface = "arrakis",
            variants =
            {
              transition = transition_masks(),
              material_background =
              {
                picture = "__planet-arrakis__/graphics/terrain/arrakis-rock.png",
                line_length = 8,
                count = 16,
                scale = 0.5
              },
              material_texture_width_in_tiles = 8,
              material_texture_height_in_tiles = 8
            },
        
            -- transitions_between_transitions = lava_stone_transitions_between_transitions,
            -- walking_sound = data.raw.tile["dirt-1"].walking_sound,
            -- map_color = {115,80,50}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
            -- map_color={131, 85, 66},
            map_color = {114,78,56},
            -- walking_speed_modifier = .6,
            vehicle_friction_modifier = 1,
            -- pollution_absorption_per_second = tile_pollution.lava
          },
    }
)