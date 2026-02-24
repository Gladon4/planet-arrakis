data:extend({
  {
    type = "recipe",
    name = "spice-harvester",
    category = "crafting",
    enabled = false, -- recipe is not available from the start
    energy_required = 5,
    ingredients = {
      { type = "item", name = "big-mining-drill",  amount = 4},
      { type = "item", name = "processing-unit",   amount = 10},
      { type = "item", name = "steel-plate",       amount = 50},
      { type = "item", name = "engine-unit",       amount = 50},
      { type = "item", name = "iron-gear-wheel",   amount = 50}
    },
    results = { { type = "item", name = "spice-harvester", amount = 1 } }
  },
  {
    type = "recipe",
    name = "arrakis-moisture",
    category = "moisture-recipes",
    enabled = true, --TODO add to research
    energy_required = 1,
    ingredients = nil,
    results = {{type = "fluid", name = "water", amount = 1}},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1250,
        max = 1250
      }
    },
    icons = {
      {
        icon = "__planet-arrakis__/graphics/icons/arrakis.png",
        icon_size = 64,
        scale = 0.6,
        shift = {-12, -12}
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.7,
        shift = {5, 5}
      }
    }
  },
  {
    type = "recipe",
    name = "nauvis-moisture",
    category = "moisture-recipes",
    enabled = true, --TODO add to research
    energy_required = 1,
    ingredients = nil,
    results = {{type = "fluid", name = "water", amount = 10}},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 1000
      }
    },
    icons = {
       {
        icon = "__base__/graphics/icons/nauvis.png",
        icon_size = 64,
        scale = 0.6,
        shift = {-12, -12}
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.7,
        shift = {5, 5}
      }
    }
  }
})
