require("prototypes.function")


local WORM = "big-sandworm"

local function already_attacked(surface, position, radius)
    local worms = surface.find_entities_filtered{name=WORM}

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

local POLLUTION_THRESHOLD = 15 -- Set your desired threshold
local worm_brain = {}


script.on_nth_tick(1200, function()
    if game.surfaces["arrakis"] then
        arrakis = game.surfaces["arrakis"] 
        for chunk in arrakis.get_chunks() do
            local chunk_position = {x = chunk.x*32, y = chunk.y*32}
            local pollution = arrakis.get_pollution(chunk_position)
            
            -- If pollution exceeds threshold, spawn the Demolisher
            if pollution > POLLUTION_THRESHOLD then
                if not already_attacked(arrakis, chunk_position, 200) then
                    arrakis.create_entity({
                        name = WORM,
                        position = arrakis.find_non_colliding_position(
                            WORM, chunk_position, 200, 1
                        )
                    })
                end

                -- reset pollution
                -- arrakis.pollute(chunk_position, -pollution)
            end
        end

        local worms = arrakis.find_entities_filtered{name=WORM}
        if table_size(worms) > 0 then
            for _, worm in pairs(worms) do
                local position = {x = worm.position.x, y = worm.position.y}
                local pollution = arrakis.get_pollution(position)
                local uuid = worm.unit_number

                if uuid then -- shouldn't need this, but to make sure
                    if worm_brain[uuid] then
                        worm_brain[uuid] = (worm_brain[uuid] + pollution) / 2
                    else
                        worm_brain[uuid] = pollution
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
                    player.add_custom_alert(blow_pos, {type="item", name="spice"}, {"", "Spice Blow immanent"}, true)
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

script.on_init(function ()
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

