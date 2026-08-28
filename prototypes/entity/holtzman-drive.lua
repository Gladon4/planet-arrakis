-- TODO only one per ship

function engine_picture(repeat_count)
    -- TODO propper texture and shadow 
  return
  {
    layers = {                
        {
        filename = "__planet-arrakis__/graphics/entity/holtzman-engine/holtzman-base.png",
        priority = "high",
        width = 200,
        height = 200,
        shift = util.by_pixel(0,0),
        repeat_count = repeat_count,
        scale = 1
        },
    },
}
end


function accumulator_charge()
  return
  {
    layers =
    {
    --   engine_picture(72),
      {
        stripes =
        {{
            filename = "__planet-arrakis__/graphics/entity/holtzman-engine/holtzman-engine-1.png",
            width_in_frames = 6,
            height_in_frames = 6
        },
        {
            filename = "__planet-arrakis__/graphics/entity/holtzman-engine/holtzman-engine-2.png",
            width_in_frames = 6,
            height_in_frames = 6
        }},
        frame_count = 72,
        priority = "high",
        width = 200,
        height = 200,
        draw_as_glow = false,
        shift = util.by_pixel(0, 0),
        scale = 1,
        animation_speed = 0.5,
      }
    }
  }
end



data.extend({
    {
        type = "accumulator",
        name = "holtzman-drive",
        icon = "__planet-arrakis__/graphics/icons/holtzman-engine.png",
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.1, result = "iron-plate"},
        max_health = 1000,
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        energy_source = {
            type = "electric",
            buffer_capacity = "100GJ",
            usage_priority = "secondary-output",
            input_flow_limit = "1GW",
            output_flow_limit = "0W"
        },
        chargable_graphics =
        {
            picture = engine_picture(),
            charge_animation = accumulator_charge(),
            charge_cooldown = 60,
            -- discharge_animation = accumulator_discharge(),
            discharge_cooldown = 30
        },
        --water_reflection = accumulator_reflection(),
        -- working_sound =
        -- {
        --     main_sounds =
        --     {
        --     {
        --         sound = {filename = "__base__/sound/accumulator-working.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
        --         match_volume_to_activity = true,
        --         activity_to_volume_modifiers = {offset = 2, inverted = true},
        --         fade_in_ticks = 4,
        --         fade_out_ticks = 20
        --     },
        --     {
        --         sound = {filename = "__base__/sound/accumulator-discharging.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
        --         match_volume_to_activity = true,
        --         activity_to_volume_modifiers = {offset = 1},
        --         fade_in_ticks = 4,
        --         fade_out_ticks = 20
        --     }
        --     },
        --     idle_sound = {filename = "__base__/sound/accumulator-idle.ogg", volume = 0.35},
        --     max_sounds_per_prototype = 3,
        --     audible_distance_modifier = 0.5
        -- },

        -- circuit_connector = circuit_connector_definitions["accumulator"],
        -- circuit_wire_max_distance = default_circuit_wire_max_distance,

        -- default_output_signal = {type = "virtual", name = "signal-A"}
    }
})
