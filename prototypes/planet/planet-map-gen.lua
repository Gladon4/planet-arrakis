local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

planet_map_gen.arrakis = function ()
    return
    {
        property_expression_names =
        {
            elevation =  "arrakis_elevation",
            cliff_elevation = "arrakis_elevation",
            cliffiness = 1.0,
        },
        
        cliff_settings = {
            name = "cliff",
            cliff_elevation_0 = 60,
            cliff_elevation_interval = 80,
            cliff_smoothing = 0,
            richness = 0.95
        },
        autoplace_controls =
        {
            ["rocks"] = {},
        },
                    
        autoplace_settings =
        {
            ["tile"] = 
            {
                settings =
                {
                    ["arrakis-deep-desert-sand"] = {},
                    ["arrakis-desert-sand"] = {},
                    ["arrakis-rock"] = {},
                }
            },
            ["decorative"] =
            {
                settings =
                {
                    ["small-sand-rock"] = {},
                    ["red-desert-bush"] = {},
                    ["white-desert-bush"] = {}
                }
            },
            ["entity"] =
            {
                settings =
                {
                    ["spice-ore"] = {},
                }
            }
        },
        starting_area = "normal"
    }
end

return planet_map_gen