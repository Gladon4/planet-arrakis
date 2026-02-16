-- Noise Pollution, which atracts worms  
data:extend(
    {
        {
            type = "airborne-pollutant",
            name = "noise",
            chart_color = {r = 250, g = 250, b = 0, a = 149},
            icon =
            {
            filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
            priority = "high",
            size = 64,
            mipmap_count = 2,
            y = 3 * 64,
            flags = {"gui-icon"}
            },
            affects_evolution = false,
            affects_water_tint = false,
        }
    }
)

