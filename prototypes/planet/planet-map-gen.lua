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
            -- ["entity:spice-ore:probability"] = "arrakis_spice_ore_probability",
            -- ["entity:spice-ore:richness"] = "arrakis_spice_ore_richness"
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
                    ["sand-1"] = {},
                    ["sand-2"] = {},
                    ["sand-3"] = {},
                }
            },
            ["decorative"] =
            {
                settings =
                {
                    ["medium-sand-rock"] = {},
                    ["small-sand-rock"] = {}
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