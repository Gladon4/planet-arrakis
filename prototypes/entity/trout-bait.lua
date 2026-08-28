data:extend({
  {
    type = "assembling-machine",
    name = "trout-bait",
    icon = "__planet-arrakis__/graphics/placeholder.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "trout-bait"},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 200,
    energy_usage = "1W",
    crafting_speed = 1,
    energy_source = {
      type = "void"
    },
    crafting_categories = {"trout-bait-recipes"},
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__planet-arrakis__/graphics/placeholder.png",
            priority = "high",
            width = 32,
            height = 32,
            frame_count = 1,
            line_length = 1,
            scale = 1,
            shift = util.by_pixel(0, 8)
          },
          {
            filename = "__planet-arrakis__/graphics/placeholder.png",
            priority = "high",
            width = 32,
            height = 32,
            frame_count = 1,
            line_length = 1,
            scale = 0.85,
            shift = {0.47, -0.19},
            draw_as_shadow = true
          }
        }
      }
    },
    impact_category = "metal"
  }
})
