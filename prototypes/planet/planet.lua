-- local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

require("prototypes.planet.planet-arrakis-map-gen")
local planet_map_gen = require("prototypes.planet.planet-map-gen")

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend(
    {
        {
            type = "planet",
            name = "arrakis",
            icon = "__planet-arrakis__/graphics/icons/arrakis.png",
            starmap_icon = "__planet-arrakis__/graphics/icons/starmap-planet-arrakis.png",
            starmap_icon_size = 512,
            gravity_pull = 10,
            distance = 12,
            orientation = 0.7,
            magnitude = 1.0,
            order = "b[arrakis]",
            subgroup = "planets",
            map_gen_settings = planet_map_gen.arrakis(),
            pollutant_type = "noise",
            solar_power_in_space = 200,
            asteroid_spawn_influence = 1,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
            surface_properties =
            {
                ["day-night-cycle"] = 10 * minute,
                ["magnetic-field"] = 25,
                ["solar-power"] = 200,
                pressure = 1000,
                gravity = 10
            },
        },
        {
            type = "space-connection",
            name = "nauvis-arrakis",
            subgroup = "planet-connections",
            from = "nauvis",
            to = "arrakis",
            order = "a",
            length = 15000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        },
    }
)