local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

planet_map_gen.arrakis = function ()
    return
    {
        property_expression_names =
        {
            elevation = 0,
            temperature = 100,
            moisture = 0,
            cliffiness = 0,
            cliff_elevation = 0,
            -- ["entity:spice-ore:probability"] = "0",
            -- ["entity:spice-ore:richness"] = "0"
        },
        territory_settings =
        {
          units = {"small-demolisher", "medium-demolisher", "big-demolisher"},
          territory_index_expression = "demolisher_territory_expression",
          territory_variation_expression = "demolisher_variation_expression",
          minimum_territory_size = 10
        },
        autoplace_controls =
        {
            ["spice_ore"] = {},
        },
        autoplace_settings =
        {
            ["tile"] = 
            {
                settings =
                {
                    ["arrakis-sand"] = {},
                    ["arrakis-rock"] = {},
                }
            },
            ["decorative"] =
            {
                settings =
                {
                    -- ["medium-sand-rock"] = {},
                    -- ["small-sand-rock"] = {}
                }
            },
            ["entity"] =
            {
                settings =
                {
                    ["spice-ore"] = {},
                }
            }
        }
    }
end

return planet_map_gen