local meld = require("meld")

local function generate_frame_sequence(start)
    local result = {}
    for i = 1, 8 do
        result[i] = 1 + ((start + i) % 8)
    end
    return result
end

local function create_sandworm_segment(health, still_frame, segment_overrides)
    local variant = meld(table.deepcopy(data.raw["segment"]["big-demolisher-segment-x0_87"]), segment_overrides)
    variant.name = "sandworm-body-" .. health .. "-" .. still_frame
    variant.max_health = health
    -- variant.animation.layers[1].frame_sequence = generate_frame_sequence(still_frame)
    -- variant.animation.layers[2].frame_sequence = generate_frame_sequence(still_frame)
    return variant
end


local function create_sandworm(name, scale, length, health, speed, damage, min_spawn_distance)
    local segments = {}
    for i = 0, length do
        table.insert(segments, { segment = "sandworm-body-" .. health .. "-" .. (i % 8) })
    end

    table.insert(segments, { segment = "sandworm-tail-" .. health })

    ---@type data.SegmentedUnitPrototype
    ---@diagnostic disable-next-line: missing-fields
    local head_overrides = {
        name = "sandworm-" .. name,
        localised_name = { "entity-name.sandworm-" .. name },
        update_effects = meld.overwrite {
            {
                distance_cooldown = 3,
                effect =
                {
                    type = "nested-result",
                    action =
                    {
                        type = "area",
                        radius = 8,
                        force = "not-same",
                        collision_mask = { layers = { player = true, train = true, rail = true, transport_belt = true, is_object = true } },
                        action_delivery =
                        {
                            type = "instant",
                            target_effects =
                            {
                                {
                                    type = "damage",
                                    damage = { amount = damage, type = "impact" }
                                },
                            }
                        }
                    }
                }
            }
        },
       
        update_effects_while_enraged = meld.delete(),
        -- update_effects_while_enraged = meld.overwrite {},
        dying_trigger_effect = meld.delete(),
        -- dying_trigger_effect = meld.overwrite { },
        -- autoplace = meld.overwrite {},
        -- resistances = meld.overwrite {},
        -- working_sound = meld.overwrite {},
        vision_distance = 75 * scale,
        enraged_duration = 30 * second,
        revenge_attack_parameters = meld.delete(),
        forward_padding = 0,
        backward_padding = 0,
        forward_overlap = 0,
        backward_overlap = 0,
        collision_box = { { -1.5 * scale, -.8 * scale }, { 1.5 * scale, .8 * scale } },
        selection_box = { { -1.5 * scale, -.8 * scale }, { 1.5 * scale, .8 * scale } },
        patrolling_speed = speed,
        investigating_speed = speed,
        enraged_speed = speed * 1.5,
        attacking_speed = speed * 1.5,
        max_health = health,
        healing_per_tick = 10,
        turn_radius = 4 * scale,
        acceleration_rate = 1,
        render_layer = "object",
        -- collision_mask = { layers = { item = true, meltable = true, object = true, player = true, water_tile = true, is_object = true, is_lower_object = true } },
        segment_engine = meld.overwrite {
            segments = segments
        },
        -- animation = meld.overwrite {}
    }

    ---@type data.SegmentPrototype
    ---@diagnostic disable-next-line: missing-fields
    local tail_segment_overrides = {
        name = "sandworm-tail",
        localised_name = { "entity-name.sandworm-" .. name },
        update_effects = meld.delete(),
        update_effects_while_enraged = meld.delete(),
        dying_trigger_effect = meld.delete(),
        revenge_attack_parameters = meld.delete(),
        forward_padding = 0.0,
        backward_padding = 0.0,
        forward_overlap = 0,
        backward_overlap = 0,
        collision_box = { { -1.5 * scale, -.8 * scale }, { 1.5 * scale, .8 * scale } },
        selection_box = { { -1.5 * scale, -.8 * scale }, { 1.5 * scale, .8 * scale } },
        -- collision_mask = { layers = { item = true, meltable = true, object = true, player = true, water_tile = true, is_object = true, is_lower_object = true } },
        render_layer = "object",
        max_health = 10000,
        healing_per_tick = 10,
        -- resistances = meld.overwrite {},
        -- working_sound = meld.overwrite {},
        -- animation = meld.overwrite {}
    }

    ---@type data.SegmentPrototype
    ---@diagnostic disable-next-line: missing-fields
    local segment_overrides = {
        name = "sandworm-body",
        localised_name = { "entity-name.sandworm-" .. name },
        update_effects = meld.delete(),
        update_effects_while_enraged = meld.delete(),
        dying_trigger_effect = meld.delete(),
        forward_padding = 0.0,
        backward_padding = 0.0,
        forward_overlap = 0,
        backward_overlap = 0,
        collision_box = { { -1.5 * scale, -.8 * scale }, { 1.5 * scale, .8 * scale } },
        selection_box = { { -1.5 * scale, -.8 * scale }, { 1.5 * scale, .8 * scale } },
        -- collision_mask = { layers = { item = true, meltable = true, object = true, player = true, water_tile = true, is_object = true, is_lower_object = true } },
        render_layer = "object",
        max_health = 10000,
        healing_per_tick = 10,
        -- working_sound = meld.overwrite {},
        -- resistances = meld.overwrite {},
        -- animation = meld.overwrite({})
    }

    for i = 0, 8 do
        data:extend({ create_sandworm_segment(health, i, segment_overrides) })
    end


    local centipede_tail = meld(table.deepcopy(data.raw["segment"]["big-demolisher-tail-x0_64"]),
        tail_segment_overrides)
    centipede_tail.name = "sandworm-tail-" .. health
    centipede_tail.max_health = health
    data:extend({ centipede_tail })


    data:extend({ meld(table.deepcopy(data.raw["segmented-unit"]["big-demolisher"]), head_overrides) })
end

create_sandworm("giant", 1.0, 60, 30000, .03, 1000, 2000)
