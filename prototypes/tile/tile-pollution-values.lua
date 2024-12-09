local base_tile_pollution_values = require("__space-age__/prototypes/tile/tile-pollution-values")
local arrakis_tile_pollution_values =
{
  desert_rock =         { noise = 0.01 },
  desert_sand =         { noise = 0.000003 },
  deep_desert_sand =    { noise = 0.0000001 },
}

return util.merge{base_tile_pollution_values, arrakis_tile_pollution_values}
