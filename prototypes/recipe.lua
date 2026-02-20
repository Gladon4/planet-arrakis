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
    results = {{type = "fluid", name = "water", amount = 1}}
  }
})
