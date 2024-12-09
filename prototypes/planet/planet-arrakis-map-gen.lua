data:extend(
    {
        {
            type = "noise-expression",
            name = "worm_territory_size",
            expression = "750"
        },
        {
            type = "noise-expression",
            name = "base_sandworm_territories",
            expression = "voronoi_cell_id{x = x, \z
                                          y = y, \z
                                          seed0 = map_seed, \z
                                          seed1 = 0, \z
                                          grid_size = worm_territory_size, \z
                                          distance_type = 'euclidean', \z
                                          jitter = 1}"
        },
        {
            type = "noise-expression",
            name = "sandworm_territory_expression",
            expression = "if{condition=arrakis_desert_noise <= deep_desert_to_sand_threshold, true_branch=base_sandworm_territories, false_branch=-1}"
        }
    }
)