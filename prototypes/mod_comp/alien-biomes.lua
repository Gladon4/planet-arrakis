-- Only decorations for now if Alien Biomes is loaded.
-- For the rocks create autoplace controls
if mods["alien-biomes"] then
    data.raw["optimized-decorative"]["small-sand-rock"].autoplace =
    {
      control = "rocks",
      order = "a[doodad]-a[rock]-d[small]",
      placement_density = 2,
      probability_expression = "multioctave_noise{x=x, y=y, persistence=0.2, seed0=map_seed, seed1=123, octaves=4} > 1.5",
    }

    data.raw["optimized-decorative"]["red-desert-bush"].autoplace =
    {
      order = "a[doodad]-d[garballo]-c",
      probability_expression = "multioctave_noise{x=x, y=y, persistence=0.2, seed0=map_seed, seed1=324, octaves=4} > 1.5",
    }

    data.raw["optimized-decorative"]["white-desert-bush"].autoplace =
    {
      order = "a[doodad]-g[asterisk]-b",
      probability_expression = "multioctave_noise{x=x, y=y, persistence=0.2, seed0=map_seed, seed1=957, octaves=4} > 1.5",
    }
end
