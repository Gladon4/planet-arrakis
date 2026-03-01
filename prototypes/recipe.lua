-- TODO: maybe make the available recipe dependent on a moisture surface condition 
-- and have x recipes (eg dry air, moist air, wet air)

make_moisture_recipe_icon = function(planet_grapic)
  return {
       {
        icon = planet_grapic,
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
end

data:extend({
  {
    type = "recipe",
    name = "spice-harvester",
    category = "crafting",
    enabled = false, -- recipe is not available from the start
    energy_required = 5,
    ingredients = {
      { type = "item", name = "big-mining-drill",  amount = 4 },
      { type = "item", name = "processing-unit",   amount = 10},
      { type = "item", name = "steel-plate",       amount = 50},
      { type = "item", name = "engine-unit",       amount = 50},
      { type = "item", name = "iron-gear-wheel",   amount = 50}
    },
    results = { { type = "item", name = "spice-harvester", amount = 1 } }
  },
  {
    type = "recipe",
    name = "moisture-farm",
    category = "crafting",
    enabled = false,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "concrete",     amount = 5 },
      { type = "item", name = "steel-plate",  amount = 5 },
      { type = "item", name = "copper-cable", amount = 10}
    },
    results = {
      { type = "item", name = "moisture-farm", amount = 1},
    }
  },
  {
    type = "recipe",
    name = "mid-moisture",
    category = "moisture-recipes",
    enabled = true, --TODO add to research
    energy_required = 1,
    ingredients = nil,
    results = {{type = "fluid", name = "water", amount = 10}},
    surface_conditions =
    {
      {
        property = "moisture",
        min = 51,
        max = 200
      }
    },
    icons =  {
       {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.6,
        shift = {-12, -12}
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.6,
        shift = {0,8}
      }
    }
  },
  {
    type = "recipe",
    name = "wet-moisture",
    category = "moisture-recipes",
    enabled = true, --TODO add to research
    energy_required = 1,
    ingredients = nil,
    results = {{type = "fluid", name = "water", amount = 100}},
    surface_conditions =
    {
      {
        property = "moisture",
        min = 201
      }
    },
    icons = {
       {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.6,
        shift = {-12, -12}
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.6,
        shift = {0, 8}
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.6,
        shift = {12, -12}
      }
    }
  },
  {
    type = "recipe",
    name = "dry-moisture",
    category = "moisture-recipes",
    enabled = true, --TODO add to research
    energy_required = 1,
    ingredients = nil,
    results = {{type = "fluid", name = "water", amount = 1}},
    surface_conditions =
    {
      {
        property = "moisture",
        min = 5,
        max = 50
      }
    },
    icons = {
       {
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_size = 64,
        scale = 0.6,
        shift = {0, 0}
      }
    }
  },
  {
    type = "recipe",
    name = "navigation-data",
    category = "navigation-data",
    enabled = true, -- TODO add to research
    energy_required = 10,
    ingredients = nil,
    results = {{ type = "item", name="navigation-data", amount = 1}},
    icon = "__planet-arrakis__/graphics/icons/data.png",
    icon_size = 64
  }
})
