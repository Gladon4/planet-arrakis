data:extend(
    {
        {
          type = "technology",
          name = "moisture-farm",
          icon = "__planet-arrakis__/graphics/technology/moisture-farm.png",
          icon_size = 256,
          essential = false,
          effects =
          {
            {
              type = "unlock-recipe",
              recipe = "moisture-farm"
            }
          },
          prerequisites = {"concrete", "fluid-handling"},
          unit =
          {
            count = 75,
            ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1}
            },
            time = 15
          }
        },
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
                recipe = "spice-harvester"
              }
            },
            prerequisites = {"metallurgic-science-pack", "electromagnetic-science-pack", "agricultural-science-pack", "moisture-farm"},
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
          {
          type = "technology",
          name = "holtzman-effect",
          icon = "__planet-arrakis__/graphics/technology/navigator.png",
          icon_size = 256,
          essential = false,
          effects = nil,
          --{
          --  {
              -- type = "unlock-recipe",
              -- recipe = "navigator"
            -- }
          -- },
          prerequisites = {"planet-discovery-arrakis"},
          unit =
          {
            count = 1500,
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
                {"agricultural-science-pack", 1},
                {"arrakis-science-pack", 1}
              },
            time = 60
          }
        },
          {
          type = "technology",
          name = "navigator",
          icon = "__planet-arrakis__/graphics/technology/navigator.png",
          icon_size = 256,
          essential = false,
          effects =
          {
            {
              type = "unlock-recipe",
              recipe = "biter-navigator"
            },
            {
              type = "unlock-recipe",
              recipe = "pentapod-navigator"
            },
            {
              type = "unlock-recipe",
              recipe = "biter-brain"
            },
            {
              type = "unlock-recipe",
              recipe = "pentapod-brain"
            }
          },
          prerequisites = {"holtzman-effect"},
          unit =
          {
            count = 1500,
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
                {"agricultural-science-pack", 1},
                {"arrakis-science-pack", 1}
              },
            time = 60
          }
        },
    }
)