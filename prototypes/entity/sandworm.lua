local meld = require("meld")
require("__space-age__/prototypes/entity/enemies")

local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local sandworm_segment_scales =
{
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
  1.0,
}


local function sandworm_spritesheet(file_name, is_shadow, scale)
    is_shadow = is_shadow or false
    return util.sprite_load("__planet-arrakis__/graphics/entity/sandworm/sandworm-" .. file_name,
    {
      direction_count = 128,
      dice = 0, -- dicing is incompatible with sprite alpha masking, do not attempt
      draw_as_shadow = is_shadow,
      scale = scale,
      multiply_shift = scale * 2,
      surface = "any",
      usage = "enemy"
    })
end


local function make_sandworm_head(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier)
    local head = make_demolisher_head(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, simulations.factoriopedia_vulcanus_enemy_small_demolisher, space_age_sounds.demolisher.small)
    head.vision_distance = 100
    
    head.icon = "__planet-arrakis__/graphics/icons/sandworm.png"
    head.ammo_type = meld.delete()
    head.animation =
    {
      layers =
      {
        sandworm_spritesheet("head", false, 0.5 * scale),
        sandworm_spritesheet("head-shadow", true, 0.5 * scale),
      }
    }
    head.update_effects = 
    {{
        distance_cooldown = 3,
        effect =
        {
            type = "nested-result",
            action =
            {
                type = "area",
                radius = 15,
                force = "not-same",
                collision_mask = { layers = { player = true, train = true, rail = true, transport_belt = true, is_object = true } },
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                        {
                            type = "damage",
                            damage = { amount = 100 * damage_multiplier, type = "impact" }
                        },
                    }
                }
            }
        }
    }}
    head.segment_engine =
    {
      segments = make_demolisher_segment_specifications(base_name, sandworm_segment_scales, scale)
    }
    head.corpse = nil
    head.dying_trigger_effect = nil
    head.turn_radius = 8 * scale
    head.patrolling_turn_radius = 10 * scale

    return head
end

local function make_sandworm_segments(base_name, sandworm_segment_scales, scale, damage_multiplier, health)
    local segments = make_demolisher_segments(base_name, sandworm_segment_scales, scale, damage_multiplier, health, space_age_sounds.demolisher.small)
    
    for i, segment in pairs(segments) do
        segment.update_effects = {}
        if (i < table_size(segments)) then
            segment.animation =
            {
                layers =
                {
                    sandworm_spritesheet("segment", false, 0.5 * sandworm_segment_scales[i] * scale),
                    sandworm_spritesheet("segment-shadow", true, 0.5 * sandworm_segment_scales[i] * scale),
                },
            }
        else
            segment.animation =
            {
                layers =
                {
                    sandworm_spritesheet("tail", false, 0.5 * sandworm_segment_scales[i] * scale),
                    sandworm_spritesheet("tail-shadow", true, 0.5 * sandworm_segment_scales[i] * scale),
                },
            }
        end
    end
    
    return segments
end

function make_sandworm_corpse(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier)
  local corpse_tint = {0.7,0.7,0.7}
  return {
    {
      name = base_name .. "-corpse",
      localised_name = {"entity-name.sandworm-corpse", {"entity-name."..base_name}},
      type = "simple-entity",
      flags = {"placeable-neutral", "placeable-off-grid"},
      icon = "__space-age__/graphics/icons/huge-volcanic-rock.png",
      subgroup = "grass",
      order=order,
      collision_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
      selection_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
      -- damaged_trigger_effect = hit_effects.rock(),
      -- dying_trigger_effect = decorative_trigger_effects.huge_rock(),
      map_color = {129, 105, 78},
      count_as_rock_for_filtered_deconstruction = true,
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      impact_category = "stone",
      render_layer = "object",
      max_health = 2000,
      resistances =
      {
        {
          type = "fire",
          percent = 100
        }
      },
      autoplace = {
        order = "a[landscape]-c[rock]-a[huge]",
        probability_expression = "vulcanus_rock_huge"
      },
      pictures =
      {
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-05.png",
          width = 201,
          height = 179,
          scale = 1.2 * scale,
          shift = {0.25, 0.0625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-06.png",
          width = 233,
          height = 171,
          scale = 1.2 * scale,
          shift = {0.429688, 0.046875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-07.png",
          width = 240,
          height = 192,
          scale = 1.2 * scale,
          shift = {0.398438, 0.03125},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-08.png",
          width = 219,
          height = 175,
          scale = 1.2 * scale,
          shift = {0.148438, 0.132812},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-09.png",
          width = 240,
          height = 208,
          scale = 1.2 * scale,
          shift = {0.3125, 0.0625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-10.png",
          width = 243,
          height = 190,
          scale = 1.2 * scale,
          shift = {0.1875, 0.046875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-11.png",
          width = 249,
          height = 185,
          scale = 1.2 * scale,
          shift = {0.398438, 0.0546875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-12.png",
          width = 273,
          height = 163,
          scale = 1.2 * scale,
          shift = {0.34375, 0.0390625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-13.png",
          width = 275,
          height = 175,
          scale = 1.2 * scale,
          shift = {0.273438, 0.0234375},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-14.png",
          width = 241,
          height = 215,
          scale = 1.2 * scale,
          shift = {0.195312, 0.0390625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-15.png",
          width = 318,
          height = 181,
          scale = 1.2 * scale,
          shift = {0.523438, 0.03125},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-16.png",
          width = 217,
          height = 224,
          scale = 1.2 * scale,
          shift = {0.0546875, 0.0234375},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-17.png",
          width = 332,
          height = 228,
          scale = 1.2 * scale,
          shift = {0.226562, 0.046875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-18.png",
          width = 290,
          height = 243,
          scale = 1.2 * scale,
          shift = {0.195312, 0.0390625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-19.png",
          width = 349,
          height = 225,
          scale = 1.2 * scale,
          shift = {0.609375, 0.0234375},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-20.png",
          width = 287,
          height = 250,
          scale = 1.2 * scale,
          shift = {0.132812, 0.03125},
          tint = corpse_tint
        }
      }
    }
  }
end

local function make_sandworm_effects(base_name, order, scale, damage_multiplier)
    return make_demolisher_effects(base_name, order, scale, damage_multiplier)
end

local function create_sandworm(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier)
    data:extend({make_sandworm_head(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier)})
    data:extend(make_sandworm_segments(base_name, sandworm_segment_scales, scale, damage_multiplier, health))
    data:extend(make_sandworm_corpse(base_name, order, scale))
    data:extend(make_sandworm_effects(base_name, order, scale, damage_multiplier))
end

create_sandworm("small-sandworm", "s-k", 0.75, 1, 10000, 10, 0.8)
create_sandworm("medium-sandworm", "s-l", 1.25, 2.5, 50000, 50, 1.0)
create_sandworm("big-sandworm", "s-m", 1.75, 5, 100000, 100, 1.2)