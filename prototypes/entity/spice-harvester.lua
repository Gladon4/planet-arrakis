data.extend{{
    type = "car",
    name = "spice-harvester",
    icon = "__planet-arrakis__/graphics/icons/harvester.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 10.0, result = "spice-harvester"},
    allow_remote_driving = true,
    consumption = "1500kW",
    braking_power = "10000kW",
    energy_per_hit_point = 10,
    rotation_speed = 0.002,
    effectivity = 0.2,
    max_health = 1000,
    deliver_category = "vehicle",
    collision_box = {{-3, -5}, {3, 4}},
    selection_box = {{-3, -5}, {3, 4}},
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 3,
      -- TODO: fitting smoke
      smoke = nil,
    },
    friction = 0.15,
    render_layer = "object",
    weight = 2000,
    guns = {},
    inventory_size = 100,
    animation = 
    {
        layers = 
        {
            {
                priority = "low",
                width = 400,
                height = 400,
                frame_count = 2,
                scale = 1.0,
                direction_count = 64,
                shift = util.by_pixel(0, 0),
                animation_speed = 8,
                max_advance = 0.2,
                stripes =
                {{
                filename = "__planet-arrakis__/graphics/entity/harvester/harvester-1.png",
                width_in_frames = 8,
                height_in_frames = 8
                },
                {
                filename = "__planet-arrakis__/graphics/entity/harvester/harvester-2.png",
                width_in_frames = 8,
                height_in_frames = 8
                }}
              },
              {
                priority = "low",
                width = 400,
                height = 400,
                frame_count = 2,
                draw_as_shadow = true,
                direction_count = 64,
                scale = 1.2,
                shift = {1.4, 0},
                max_advance = 0.2,
                stripes = util.multiplystripes(2,
                {
                  {
                  filename = "__planet-arrakis__/graphics/entity/harvester/harvester-shadow-1.png",
                  width_in_frames = 8,
                  height_in_frames = 8
                  },
                  {
                  filename = "__planet-arrakis__/graphics/entity/harvester/harvester-shadow-2.png",
                  width_in_frames = 8,
                  height_in_frames = 8
                  }
                })
              }
        }
    },
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1250,
        max = 1250
      }
    },
    emissions_per_second = { noise=0.5 }
}}