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
              }
            },
            prerequisites = {"space-platform-thruster"},
            unit =
            {
              count = 1000,
              ingredients =
              {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"space-science-pack", 1}
              },
              time = 60
            }
          },
    }
)