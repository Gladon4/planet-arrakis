require("prototypes.function")

local WORM = "big-sandworm"

local function already_attacked(surface, position, radius)
    local worms = surface.find_entities_filtered { name = WORM }

    if table_size(worms) == 0 then
        return false
    end

    for _, worm in pairs(worms) do
        if distance(position, worm.position) < radius then
            return true
        end
    end

    return false
end

local POLLUTION_THRESHOLD = 15
local ATTACK_DISTANCE = 90
local worm_brain = {}


script.on_nth_tick(1200, function()
    if game.surfaces["arrakis"] then
        arrakis = game.surfaces["arrakis"]
        for chunk in arrakis.get_chunks() do
            local chunk_position = { x = chunk.x * 32, y = chunk.y * 32 }
            local pollution = arrakis.get_pollution(chunk_position)

            if pollution > POLLUTION_THRESHOLD then
                if not already_attacked(arrakis, chunk_position, 125) then
                    -- direction from where the worm comes from
                    local angle = math.random() * 2 * math.pi

                    local spawn_position = {
                        x = chunk_position.x + math.cos(angle) * ATTACK_DISTANCE,
                        y = chunk_position.y + math.sin(angle) * ATTACK_DISTANCE
                    }

                    local directions = { defines.direction.west, defines.direction.north, defines.direction.east, defines.direction.south }
                    local dir_index = math.floor((angle + math.pi / 4) / (math.pi / 2)) % 4 + 1

                    log(angle)
                    log(dir_index)

                    local new_worm = arrakis.create_entity({
                        name = WORM,
                        position = arrakis.find_non_colliding_position(
                            WORM, spawn_position, 50, 1
                        ),
                        direction = directions[dir_index],
                        force = "enemy"
                    })
                end
            end
        end

        local worms = arrakis.find_entities_filtered { name = WORM }
        if table_size(worms) > 0 then
            for _, worm in pairs(worms) do
                local position = { x = worm.position.x, y = worm.position.y }
                local pollution = arrakis.get_pollution(position)
                local uuid = worm.unit_number

                if uuid then -- shouldn't need this, but to make sure
                    if worm_brain[uuid] then
                        worm_brain[uuid] = (worm_brain[uuid] + pollution) / 2
                    else
                        worm_brain[uuid] = 300
                    end
                end

                if worm_brain[uuid] < 1 then
                    worm.destroy()
                end

                arrakis.pollute(position, -pollution)
            end
        end
    end
end)


local function find_spice_blow_positions(surface, chance_per_chunk)
    if not surface then return end
    local spice_blow_positions = {}

    for chunk in surface.get_chunks() do
        if math.random() < chance_per_chunk then
            local position = {
                x = chunk.x * 32 + math.random(0, 31),
                y = chunk.y * 32 + math.random(0, 31)
            }

            local blow_pos = surface.create_entity({
                name = "spice-ore",
                position = position,
                force = "neutral"
            })

            for _, player in pairs(game.players) do
                if player.surface == surface then
                    player.add_custom_alert(blow_pos, { type = "item", name = "spice" }, { "", "Spice Blow immanent" }, true)
                end
            end

            table.insert(spice_blow_positions, position)
        end
    end
    storage.spice_blow_positions = spice_blow_positions
end

local function spawn_spice_blow(surface, ore_name, ore_amount, radius)
    if not surface then return end

    for i, position in ipairs(storage.spice_blow_positions) do
        -- TODO: custom explosion
        surface.create_entity({
            name = "big-explosion",
            position = position,
            force = "neutral"
        })

        surface.create_entity({
            name = "big-artillery-explosion",
            position = position,
            force = "neutral"
        })
        radius = math.random(radius * 0.5, radius * 1.5)

        for dx = -radius, radius do
            for dy = -radius, radius do
                local dist_squared = dx * dx + dy * dy
                if dist_squared <= radius * radius then
                    local ore_position = { x = position.x + dx, y = position.y + dy }
                    if math.random() < 0.6 then
                        surface.create_entity({
                            name = ore_name,
                            position = ore_position,
                            amount = math.random(ore_amount * 0.8, ore_amount * 1.5)
                        })
                    end
                end
            end
        end
    end
    storage.spice_blow_positions = {}
end

script.on_init(function()
    storage.spice_blow_positions = {}
end)

-- frequency of new spice blows, 15 min
local frequency = 15 * 60 * 60
script.on_event(defines.events.on_tick, function(event)
    -- Choose new spice blow locations
    if event.tick % frequency == 0 then
        find_spice_blow_positions(game.surfaces["arrakis"], 0.001)
    end
    -- Spawn the spice blow 30s later
    if event.tick % frequency == 1800 then
        spawn_spice_blow(game.surfaces["arrakis"], "spice-ore", 3000, 10)
    end
end)


script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.created_entity or event.entity
    if not (entity and entity.valid) then return end

    -- Only target electric mining drills
    if entity.name ~= "stationary-spice-harvester" then return end

    -- Get the mining drill's output position
    local drill = entity
    local output_position = drill.position
    local direction = drill.direction

    -- Calculate output position based on direction
    local offset = {
        [defines.direction.north] = { x = 0, y = -3 },
        [defines.direction.east]  = { x = 2, y = 0 },
        [defines.direction.south] = { x = 0, y = 2 },
        [defines.direction.west]  = { x = -3, y = 0 }
    }

    local delta = offset[direction] or { x = 0, y = 1 } -- default to south
    local chest_position = {
        x = output_position.x + delta.x,
        y = output_position.y + delta.y
    }

    -- Check if the tile is already occupied
    local surface = drill.surface

    -- Place a steel chest at the output position
    surface.create_entity({
        name = "steel-chest",
        position = chest_position,
        force = drill.force,
        create_build_effect_smoke = true
    })
end)

script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end

    -- Only target electric mining drills
    if entity.name ~= "stationary-spice-harvester" then return end

    -- Get the mining drill's output position
    local drill = entity
    local output_position = drill.position
    local direction = drill.direction

    -- Calculate output position based on direction
    local offset = {
        [defines.direction.north] = { x = 0, y = -3 },
        [defines.direction.east]  = { x = 2, y = 0 },
        [defines.direction.south] = { x = 0, y = 2 },
        [defines.direction.west]  = { x = -3, y = 0 }
    }

    local delta = offset[direction] or { x = 0, y = 1 } -- default to south
    local chest_position = {
        x = output_position.x + delta.x,
        y = output_position.y + delta.y
    }

    -- Check if the tile is already occupied
    local surface = drill.surface

    -- Place a steel chest at the output position
    surface.create_entity({
        name = "steel-chest",
        position = chest_position,
        force = drill.force,
        create_build_effect_smoke = true
    })
end)


script.on_event(defines.events.on_pre_player_mined_item, function(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end

    if entity.name == "stationary-spice-harvester" then
        local offset = {
            [defines.direction.north] = { x = 0, y = -2.5 },
            [defines.direction.east]  = { x = 2.5, y = 0 },
            [defines.direction.south] = { x = 0, y = 2.5 },
            [defines.direction.west]  = { x = -2.5, y = 0 }
        }
        local delta = offset[entity.direction] or { x = 0, y = 1 }
        local chest_position = {
            x = entity.position.x + delta.x,
            y = entity.position.y + delta.y
        }

        local surface = entity.surface

        local player = game.get_player(event.player_index)

        local chests = surface.find_entities_filtered {
            position = chest_position,
            name = "steel-chest"
        }

        if player == nil then return end

        for _, chest in pairs(chests) do
            if chest and chest.valid then
                local inv = chest.get_inventory(defines.inventory.chest)
                if inv and inv.valid then
                    local contents = inv.get_contents()
                    local player_inv = player.get_main_inventory()

                    for _, content in pairs(contents) do
                        if content then
                            local inserted = player_inv.insert({
                                name = content.name,
                                count = content.count,
                                quality = content.quality
                            })
                            if inserted and inserted > 0 then
                                player.create_local_flying_text {
                                    text = { "", "+", inserted, " ", { "item-name." .. content.name } },
                                    create_at_cursor = true
                                }
                            end
                            if type(inserted) == "number" and inserted < content.count then
                                surface.spill_item_stack({ position = player.position, stack = { name = content.name, count = content.count - inserted, quality = content.quality } })
                            end
                        end
                    end
                end
                chest.destroy()
            end
        end
    else
        return
    end
end)
