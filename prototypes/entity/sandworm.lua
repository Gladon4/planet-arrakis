local meld = require("meld")
require("__space-age__/prototypes/entity/enemies")

local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local sandworm_segment_scales =
{
  1.09,
  1.27,
  1.36,
  1.36,
  1.36,
  1.36,
  1.33,
  1.30,
  1.37,
  1.52,
  1.52,
  1.40,
  1.41,
  1.28,
  1.28,
  1.17,
  1.10,
  1.08,
  1.08,
  1.09,
  1.20,
  1.20,
  1.10,
  1.10,
  0.99,
  0.99,
  0.99,
  0.87,
  0.87,
  0.97,
  0.87,
  0.97,
  0.99,
  0.87,
  0.87,
  0.87,
  0.87,
  0.77,
  0.77,
  0.65,
  0.64,
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
    if head.vision_distance > 100 then
        head.vision_distance = 100
    end
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

local function make_sandworm_corpse(base_name, order, scale)
    return make_demolisher_corpse(base_name, order, scale)
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