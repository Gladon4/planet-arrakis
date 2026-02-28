data:extend({
  {
    type = "simple-entity-with-owner",
    name = "thumper",
    icon = "__planet-arrakis__/graphics/icons/thumper.png",
    icon_size = 64,

    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "iron-plate"},

    max_health = 10,

    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

    collision_mask = {
      layers = {
        object = true,
        player = true,
        train = true
      }
    },

    render_layer = "object",

    picture = {
      filename = "__planet-arrakis__/graphics/entity/thumper/thumper.png",
      width = 128,
      height = 128,
      scale= 0.5,
      shift = {0, 0}
    },

    emissions_per_second =  { noise=10 }
  }
})