data:extend({
  {
    type = "recipe",
    name = "spice-harvester",
    category = "crafting",
    enabled = false, -- recipe is not available from the start
    energy_required = 5,
    ingredients = {
      { type = "item", name = "electric-mining-drill", amount = 1 },
      { type = "item", name = "processing-unit",   amount = 5 },
      { type = "item", name = "steel-plate",       amount = 10 },
      { type = "item", name = "car",               amount = 1}
    },
    results = { { type = "item", name = "spice-harvester", amount = 1 } }
  }
})
