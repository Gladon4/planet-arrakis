data.extend({
{
    type = "assembling-machine",
    name = "navigator",
    icon = "__planet-arrakis__/graphics/icons/navigator.png",
    --subgroup = "agriculture",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable", "not-deconstructable"},
    collision_box = {{-1.2, -2}, {1.2, 2}},
    selection_box = {{-1.5, -2}, {1.5, 2}},
    create_ghost_on_death = false,
    max_health = 350,
    show_recipe_icon = false,
    impact_category = "metal",
    production_health_effect =
    {
      not_producing = -2 / 60, -- 10 hp per second
      producing = 1 / 60 -- 5 hp per second
    },
    ignore_output_full = true,
    -- alert_icon_shift = util.by_pixel(0, -12),
    -- icon_draw_specification = {shift = {0, -0.3}},
    -- created_effect =
    -- {
    --   type = "direct",
    --   action_delivery =
    --   {
    --     type = "instant",
    --     source_effects =
    --     {
    --       type = "create-explosion",
    --       entity_name = "captive-spawner-explosion-1"
    --     }
    --   }
    -- },
    -- dying_explosion = "captive-spawner-explosion-2",
    -- dying_trigger_effect =
    -- {
    --   type = "create-entity",
    --   entity_name = "biter-spawner",
    --   as_enemy = true,
    --   ignore_no_enemies_mode = true,
    --   protected = true
    -- },
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 0
      }
    },
    -- fast_replaceable_group = "captive-biter-spawner",
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__planet-arrakis__/graphics/entity/navigator/navigator-1.png",
                    priority = "high",
                    width = 200,
                    height = 350,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(0,-25),
                    scale = 0.5
                },
                -- {
                --     filename = "__planet-arrakis__/graphics/entity/moisture-farm/moisture-farm-shadow-1.png",
                --     priority = "high",
                --     width = 500,
                --     height = 200,
                --     frame_count = 1,
                --     line_length = 1,
                --     shift = util.by_pixel(75,7),
                --     scale = 0.5,
                --     draw_as_shadow = true
                -- }
            }
        }
    --   working_visualisations = {
    --     {
    --       fadeout = true,
    --       animation = util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-fluids",{
    --         frame_count = 32,
    --         scale = 0.5,
    --         tint = {0.25,0.44,0,1},
    --         animation_speed = 0.4,
    --       })
    --     },
    --   }
    },
    -- open_sound = sounds.machine_open,
    -- close_sound = sounds.machine_close,
    -- working_sound =
    -- {
    --   sound = { filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6 },
    --   sound_accents =
    --   {
    --     {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-push", 3, 0.3)}, frame = 1, audible_distance_modifier = 0.6},
    --     {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-pull", 3, 0.3)}, frame = 17, audible_distance_modifier = 0.6},
    --   },
    -- },
    crafting_categories = {"navigation-data"},
    fixed_recipe = "navigation-data", 
    crafting_speed = 1.0,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"spice"},
      effectivity = 1,
      fuel_inventory_size = 1,
      -- emissions_per_minute = { pollution = -1 },
      burner_usage = "spice",
      light_flicker =
      {
        minimum_intensity = 0,
        maximum_intensity = 0,
        derivation_change_frequency = 0,
        derivation_change_deviation = 0,
        border_fix_speed = 0,
        minimum_light_size = 0,
        light_intensity_to_size_coefficient = 0,
        color = {0, 0, 0, 1}
      }
    },
    energy_usage = "1MW",
    module_slots = 0,
    allowed_effects = {},
    enable_logistic_control_behavior = false
  }
})
