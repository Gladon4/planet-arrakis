require("__base__/prototypes/entity/mining-drill")

function electric_mining_drill_smoke()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke.png",
    line_length = 6,
    width = 48,
    height = 72,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    shift = util.by_pixel(0, 3),
    scale = 0.833
  }
end

function electric_mining_drill_smoke_front()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke-front.png",
    line_length = 6,
    width = 148,
    height = 132,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    shift = util.by_pixel(-3, 9),
    scale = 0.833
  }
end

function electric_mining_drill_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill.png",
    line_length = 6,
    width = 162,
    height = 156,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    shift = util.by_pixel(1, -11),
    scale = 0.833
  }
end

function electric_mining_drill_shadow_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-shadow.png",
    line_length = 7,
    width = 218,
    height = 56,
    frame_count = 21,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_shadow_sequence,
    draw_as_shadow = true,
    shift = util.by_pixel(21, 5),
    scale = 0.833
  }
end

function electric_mining_drill_horizontal_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal.png",
    line_length = 6,
    width = 80,
    height = 160,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    shift = util.by_pixel(2, -12),
    scale = 0.833
  }
end

function electric_mining_drill_horizontal_front_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal-front.png",
    line_length = 6,
    width = 66,
    height = 154,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    shift = util.by_pixel(-3, 3),
    scale = 0.833
  }
end

function electric_mining_drill_horizontal_shadow_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal-shadow.png",
    line_length = 7,
    width = 180,
    height = 164,
    frame_count = 21,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_shadow_sequence,
    draw_as_shadow = true,
    shift = util.by_pixel(33, 1),
    scale = 0.833
  }
end

function electric_mining_drill_status_colors()
  return
  {
    -- If no_power, idle, no_minable_resources, disabled, insufficient_input or full_output is used, always_draw of corresponding layer must be set to true to draw it in those states.

    no_power = {0, 0, 0, 0},                  -- If no_power is not specified or is nil, it defaults to clear color {0,0,0,0}

    idle = {1, 0, 0, 1},                      -- If idle is not specified or is nil, it defaults to white.
    no_minable_resources = {1, 0, 0, 1},      -- If no_minable_resources, disabled, insufficient_input or full_output are not specified or are nil, they default to idle color.
    insufficient_input = {1, 0, 0, 1},
    full_output = {1, 1, 0, 1},
    disabled = {1, 1, 0, 1},

    working = {0, 1, 0, 1},                   -- If working is not specified or is nil, it defaults to white.
    low_power = {1, 1, 0, 1},                 -- If low_power is not specified or is nil, it defaults to working color.
  }
end

function electric_mining_drill_status_leds_working_visualisation()
  local led_blend_mode = nil -- "additive"
  local led_tint = {1, 1, 1}
  return
  {
    apply_tint = "status",
    always_draw = true,
    north_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-light.png",
      width = 32,
      height = 32,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(26, -48),
      scale = 0.833
    },
    east_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-light.png",
      width = 32,
      height = 34,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(38, -32),
      scale = 0.833
    },
    south_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-light.png",
      width = 38,
      height = 46,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(26, 26),
      scale = 0.833
    },
    west_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-light.png",
      width = 32,
      height = 34,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(-39, -32),
      scale = 0.833
    }
  }
end


local stationary_spice_harvester = {
    type = "mining-drill",
    name = "stationary-spice-harvester",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "iron-plate"},
    max_health = 400,
    corpse = "electric-mining-drill-remnants",
    dying_explosion = "electric-mining-drill-explosion",
    collision_box = {{-2.1, -2.85}, {2.1, 2.85}},
    selection_box = {{-2.5, -2}, {2.5, 3}},
    resource_categories = {"basic-solid"},  -- You need to define this category
    mining_speed = 0.5,
    mining_power = 5,
    energy_source = {
        type = "void",
        emissions_per_minute = { noise = 0 },
        usage_priority = "secondary-input"
    },
    energy_usage="1MW",
    module_slots = 0,
    vector_to_place_result = {0, -2.35},
    graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,

      status_colors = electric_mining_drill_status_colors(),

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = {north = 14, east = 30, south = 30, west = 30},

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N.png",
              line_length = 1,
              width = 190,
              height = 208,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, 17),
              repeat_count = 5,
              scale = 0.833,
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-output.png",
              line_length = 5,
              width = 60,
              height = 66,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(-3, -23),
              scale = 0.833,
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-shadow.png",
              line_length = 1,
              width = 212,
              height = 204,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(6, 18),
              repeat_count = 5,
              scale = 0.833,
            }
          }
        },
        east =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E.png",
              line_length = 1,
              width = 192,
              height = 188,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -4),
              repeat_count = 5,
              scale = 0.833,
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-output.png",
              line_length = 5,
              width = 50,
              height = 74,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(30, -8),
              scale = 0.833,
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-shadow.png",
              line_length = 1,
              width = 222,
              height = 182,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(10, 2),
              repeat_count = 5,
              scale = 0.833,
            }
          }
        },
        south =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S.png",
              line_length = 1,
              width = 184,
              height = 192,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -22),
              repeat_count = 5,
              scale = 0.833,
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-shadow.png",
              line_length = 1,
              width = 212,
              height = 204,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(6, -20),
              repeat_count = 5,
              scale = 0.833,
            }
          }
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W.png",
              line_length = 1,
              width = 192,
              height = 188,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -4),
              repeat_count = 5,
              scale = 0.833,
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-output.png",
              line_length = 5,
              width = 50,
              height = 60,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(-31, -13),
              scale = 0.833,
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-shadow.png",
              line_length = 1,
              width = 200,
              height = 182,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(-5, 2),
              repeat_count = 5,
              scale = 0.833,
            }
          }
        }
      },

      shift_animation_waypoints =
      {
        -- Movement should be between 0.25-0.4 distance
        -- Bounds -0.5 - 0.6
        north = {{0, 0}, {0, -0.3}, {0, 0.1}, {0, 0.5}, {0, 0.2}, {0, -0.1}, {0, -0.5}, {0, -0.15}, {0, 0.25}, {0, 0.6}, {0, 0.3}},
        -- Bounds -1 - 0
        east = {{0, 0}, {-0.4, 0}, {-0.1, 0}, {-0.5, 0}, {-0.75, 0}, {-1, 0}, {-0.65, 0}, {-0.3, 0}, {-0.9, 0}, {-0.6, 0}, {-0.3, 0}},
        -- Bounds -1 - 0
        south = {{0, 0}, {0, -0.4}, {0, -0.1}, {0, -0.5}, {0, -0.75}, {0, -1}, {0, -0.65}, {0, -0.3}, {0, -0.9}, {0, -0.6}, {0, -0.3}},
        -- Bounds 0 - 1
        west = {{0, 0}, {0.4, 0}, {0.1, 0}, {0.5, 0}, {0.75, 0}, {1, 0}, {0.65, 0}, {0.3, 0}, {0.9, 0}, {0.6, 0}, {0.3, 0}}
      },

      shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
      shift_animation_transition_duration = 30 / electric_drill_animation_speed,

      working_visualisations =
      {
        -- dust animation 1
        {
          constant_speed = true,
          synced_fadeout = true,
          align_to_waypoint = true,
          apply_tint = "resource-color",
          animation = electric_mining_drill_smoke(),
          north_position = {0, 0.25},
          east_position = {0, 0},
          south_position = {0, 0.25},
          west_position = {0, 0}
        },

        -- dust animation directional 1
        {
          constant_speed = true,
          fadeout = true,
          apply_tint = "resource-color",
          north_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-smoke.png",
                line_length = 5,
                width = 42,
                height = 58,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-1, -44),
                scale = 0.833
              }
            }
          },
          east_animation = nil,
          south_animation = nil,
          west_animation = nil
        },

        -- drill back animation
        {
          animated_shift = true,
          always_draw = true,
          north_animation =
          {
            layers =
            {
              electric_mining_drill_animation(),
              electric_mining_drill_shadow_animation()
            }
          },
          east_animation =
          {
            layers =
            {
              electric_mining_drill_horizontal_animation(),
              electric_mining_drill_horizontal_shadow_animation()
            }
          },
          south_animation =
          {
            layers =
            {
              electric_mining_drill_animation(),
              electric_mining_drill_shadow_animation()
            }
          },
          west_animation =
          {
            layers =
            {
              electric_mining_drill_horizontal_animation(),
              electric_mining_drill_horizontal_shadow_animation()
            }
          }
        },

        -- dust animation 2
        {
          constant_speed = true,
          synced_fadeout = true,
          align_to_waypoint = true,
          apply_tint = "resource-color",
          animation = electric_mining_drill_smoke_front(),
          north_position = {0, 0.25},
          east_position = {0, 0},
          south_position = {0, 0.25},
          west_position = {0, 0}
        },

        -- dust animation directional 2
        {
          constant_speed = true,
          fadeout = true,
          apply_tint = "resource-color",
          north_animation = nil,
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-smoke.png",
                line_length = 5,
                width = 46,
                height = 56,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(24, -12),
                scale = 0.833
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-smoke.png",
                line_length = 5,
                width = 48,
                height = 36,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-2, 20),
                scale = 0.833
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-smoke.png",
                line_length = 5,
                width = 46,
                height = 54,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-25, -11),
                scale = 0.833
              }
            }
          }
        },

        -- drill front animation
        {
          animated_shift = true,
          always_draw = true,
          --north_animation = util.empty_sprite(),
          east_animation = electric_mining_drill_horizontal_front_animation(),
          --south_animation = util.empty_sprite(),
          west_animation = electric_mining_drill_horizontal_front_animation()
        },

        -- front frame
        {
          always_draw = true,
          north_animation = nil,
          east_animation =
          {
            priority = "high",
            filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-front.png",
            line_length = 1,
            width = 136,
            height = 148,
            animation_speed = electric_drill_animation_speed,
            shift = util.by_pixel(21, 10),
            scale = 0.833
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-output.png",
                line_length = 5,
                width = 84,
                height = 56,
                frame_count = 5,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-1, 34),
                scale = 0.833
              },
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-front.png",
                line_length = 1,
                width = 190,
                height = 104,
                animation_speed = electric_drill_animation_speed,
                repeat_count = 5,
                shift = util.by_pixel(0, 27),
                scale = 0.833
              }
            }
          },
          west_animation =
          {
            priority = "high",
            filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-front.png",
            line_length = 1,
            width = 134,
            height = 140,
            animation_speed = electric_drill_animation_speed,
            shift = util.by_pixel(-22, 12),
            scale = 0.833
          }
        },

        -- LEDs
        electric_mining_drill_status_leds_working_visualisation(),

        -- light
        --electric_mining_drill_primary_light,
        electric_mining_drill_secondary_light
      }
    },
    working_sound = {
        sound = {filename = "__base__/sound/electric-mining-drill.ogg"},
        apparent_volume = 1.5
    },
    resource_searching_radius = 3.49,
    collision_mask = {layers={object=true, rail=true, rail_support=true, is_lower_object=true, is_object=true}},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1250,
        max = 1250
      }
    },
}

data:extend({stationary_spice_harvester})