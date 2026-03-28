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
    name = "navigator-recipe",
    category = "navigator-recipe",
    enabled = true,
    energy_required = 30,
    ingredients = nil,
    results = nil,
    icon = "__planet-arrakis__/graphics/icons/data.png",
    icon_size = 64
  },
  {
    type = "recipe",
    name = "biter-brain",
    category = "organic",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "item", name = "biter-egg", amount=1},
      {type = "fluid", name = "water", amount = 50}, --TODO Water of life maybe?
      {type = "item", name = "nutrients", amount = 20}
    },
    results = {{ type = "item", name="biter-brain", probability = 0.05, amount = 1}},
    icon = "__planet-arrakis__/graphics/icons/biter-brain.png",
    icon_size = 64
  },
  {
    type = "recipe",
    name = "pentapod-brain",
    category = "organic",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "item", name = "pentapod-egg", amount=1},
      {type = "fluid", name = "water", amount = 50}, --TODO Water of life maybe?
      {type = "item", name = "nutrients", amount = 20}
    },
    results = {{ type = "item", name="pentapod-brain", probability = 0.1, amount = 1}},
    icon = "__planet-arrakis__/graphics/icons/pentapod-brain.png",
    icon_size = 64
  },
  {
    type = "recipe",
    name = "biter-navigator",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "steel-plate",     amount = 50 },
      { type = "item", name = "carbon-fiber",  amount = 100 },
      { type = "item", name = "biter-brain", amount = 1},
      { type = "item", name = "spice", amount = 100},
      { type = "fluid", name = "water", amount = 100}
    },
    results = {
      { type = "item", name = "navigator", amount = 1},
    }
  },

  {
    type = "recipe",
    name = "pentapod-navigator",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "steel-plate",     amount = 50 },
      { type = "item", name = "carbon-fiber",  amount = 100 },
      { type = "item", name = "pentapod-brain", amount = 1},
      { type = "item", name = "spice", amount = 100},
      { type = "fluid", name = "water", amount = 100}
    },
    results = {
      { type = "item", name = "navigator", amount = 1},
    }
  },
})
