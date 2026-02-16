data:extend(
    {
        {
            type = "technology",
            name = "planet-discovery-arrakis",
            icons = util.technology_icon_constant_planet("__planet-arrakis__/graphics/technology/arrakis.png"),
            icon_size = 256,
            essential = true,
            effects =
            {
              {
                type = "unlock-space-location",
                space_location = "arrakis",
                use_icon_overlay_constant = true
              },
              {
                type = "unlock-recipe",
                recipe = "stationary-spice-harvester"
              }
            },
            prerequisites = {"metallurgic-science-pack", "electromagnetic-science-pack", "agricultural-science-pack"},
            unit =
            {
              count = 3000,
              ingredients =
              {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
                {"metallurgic-science-pack", 1},
                {"electromagnetic-science-pack", 1},
                {"agricultural-science-pack", 1}
              },
              time = 60
            }
          },
    }
)