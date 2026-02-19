data.extend{{
    type = "car",
    name = "spice-harvester",
    icon = "__planet-arrakis__/graphics/icons/harvester.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.4, result = "spice-harvester"},
    allow_remote_driving = true,
    consumption = "1500kW",
    braking_power = "10000kW",
    energy_per_hit_point = 10,
    rotation_speed = 0.002,
    effectivity = 0.2,
    max_health = 1000,
    deliver_category = "vehicle",
    collision_box = {{-3, -3}, {3, 3}},
    selection_box = {{-3, -3}, {3, 3}},
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "car-smoke",
          deviation = {0.25, 0.25},
          frequency = 200,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
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
                scale = 1,
                direction_count = 64,
                shift = util.by_pixel(0, 0),
                animation_speed = 8,
                max_advance = 0.2,
                stripes =
                {
                {
                filename = "__planet-arrakis__/graphics/entity/harvester/harvester-1.png",
                width_in_frames = 8,
                height_in_frames = 8
                },
                {
                filename = "__planet-arrakis__/graphics/entity/harvester/harvester-2.png",
                width_in_frames = 8,
                height_in_frames = 8
                }}
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
    emissions_per_second = { noise=0.3 }
}}