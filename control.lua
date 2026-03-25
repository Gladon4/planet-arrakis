require("prototypes.function")

local WORM = "small-sandworm"
local WORMS = {"small-sandworm", "medium-sandworm", "big-sandworm"}
local POLLUTION_THRESHOLD = 15
local ATTACK_DISTANCE = 80
local MIN_SPICE_BLOW_RADIUS = 10
local MAX_SPICE_BLOW_RADIUS = 30
local SPICE_ORE_AMOUNT = 3000
local CHANCE = 0.001
local SPAWN_DELAY = 7200
local FREQUENCY = 60 * 60 * 15

local DISAPPEAR_PROB = 0.3

local worm_brain = {}

local function already_attacked(surface, position, radius)
    local worms = surface.find_entities_filtered { name = WORMS }

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

local ORE_PER_TICK = 1
local MINE_PROB = 0.5
local MINE_RADIUS = 3
local POLLUTION_PER_ORE = 0

script.on_nth_tick(60, function()
    if not game.surfaces["arrakis"] then return end

    local arrakis = game.surfaces["arrakis"]

    spice = arrakis.find_entities_filtered{name="spice-ore"}

    if not spice or table_size(spice) == 0 then goto skip_spice end

    for _, ore in ipairs(spice) do
        if not (math.random() < DISAPPEAR_PROB) then goto continue1 end

        if ore.amount == 1 then 
            ore.destroy()
        else
            ore.amount = ore.amount - 1
        end

        ::continue1::
    end

    ::skip_spice::

    local harvesters = arrakis.find_entities_filtered({
        name = "spice-harvester"
    })

    if not harvesters or table_size(harvesters) == 0 then return end

    for _, harvester in ipairs(harvesters) do
        if not harvester.valid then goto continue2 end
        if harvester.speed == 0 then goto continue2 end

        local inventory = harvester.get_inventory(defines.inventory.car_trunk)
        if not inventory then goto continue2 end

        
        local ores = arrakis.find_entities_filtered({
            name = "spice-ore",
            position = harvester.position,
            radius = MINE_RADIUS
        })

        for _, ore in ipairs(ores) do
            if not ore.valid then goto next_ore end

            if not (math.random() < MINE_PROB) then goto next_ore end 

            local take = math.min(ORE_PER_TICK, ore.amount)

            local inserted = inventory.insert({
                name = "spice",
                count = take
            })
            
            if inserted > 0 then
                arrakis.pollute(ore.position, POLLUTION_PER_ORE)
                if ore.amount - inserted <= 0 then
                    ore.destroy()
                else
                    ore.amount = ore.amount - inserted
                end
            end

            ::next_ore::
        end

        ::continue2::
        
    end

    local worms = arrakis.find_entities_filtered { name = WORMS }
    if table_size(worms) == 0 then return end

    thumpers = arrakis.find_entities_filtered{name="thumper"}

    for _, worm in pairs(worms) do
        for _, harvester in pairs(harvesters) do
            if distance(harvester.position, worm.position) > 100 then
                goto next_harvester
            end
            worm.damage(100, game.forces.player, "physical", harvester)

            ::next_harvester::
        end 

        if table_size(thumpers) > 0 then 
            for _, thumper in pairs(thumpers) do
                if distance(thumper.position, worm.position) > 100 then
                    goto next_thumper
                end
                worm.damage(100, game.forces.player, "physical", thumper)

                ::next_thumper::
            end
        end
    end
end)

script.on_nth_tick(600, function()
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

                    local directions = {
                        defines.direction.west,
                        defines.direction.north,
                        defines.direction.east,
                        defines.direction.south
                    }

                    local dir_index = math.floor((angle + math.pi / 4) / (math.pi / 2)) % 4 + 1
                    local position = arrakis.find_non_colliding_position(WORM, spawn_position, 50, 1)
                    if not position then return end

                    local new_worm = arrakis.create_entity({
                        name = WORM,
                        position = position,
                        direction = directions[dir_index],
                        force = "enemy"
                    })
                    cars = arrakis.find_entities_filtered{type="car", position=chunk_position, radius=50}
                    
                    if table_size(cars) > 0 then 
                        for _, vehicle in pairs(cars) do
                            new_worm.damage(100, game.forces.player, "physical", vehicle)
                        end
                    end

                    thumpers = arrakis.find_entities_filtered{name="thumper", position=chunk_position, radius=50}
                    
                    if table_size(thumpers) > 0 then 
                        for _, thumper in pairs(thumpers) do
                            new_worm.damage(100, game.forces.player, "physical", thumper)
                        end
                    end
                end
            end
        end

        local worms = arrakis.find_entities_filtered { name = WORMS }
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

            local radius = math.random(MIN_SPICE_BLOW_RADIUS, MAX_SPICE_BLOW_RADIUS)

            for _, player in pairs(game.players) do
                if player.surface == surface then
                    player.add_custom_alert(
                        blow_pos,
                        { type = "item", name = "spice" },
                        { "", "Radius " .. radius .. " spice blow imminent" },
                        true
                    )
                end
            end

            table.insert(spice_blow_positions, {
                position = position,
                radius = radius
            })
        end
    end
    storage.spice_blow_positions = spice_blow_positions
end

local function spawn_spice_blow(surface, ore_name, ore_amount)
    if not surface then return end

    for _, spice_blow in ipairs(storage.spice_blow_positions) do
        local position = spice_blow.position
        local radius = spice_blow.radius

        -- TODO: custom explosion
        surface.create_entity({
            name = "big-artillery-explosion",
            position = position,
            force = "neutral"
        })

        for dx = -radius, radius do
            for dy = -radius, radius do
                local dist_squared = dx * dx + dy * dy
                if dist_squared <= radius * radius then
                    local ore_position = { x = position.x + dx, y = position.y + dy }
                    if math.random() < 0.5 then

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

script.on_event(defines.events.on_tick, function(event)
    -- Choose new spice blow locations
    if event.tick % FREQUENCY == 0 then
        find_spice_blow_positions(game.surfaces["arrakis"], CHANCE)
    end

    -- Spawn the spice ore
    if event.tick % FREQUENCY == SPAWN_DELAY then
        spawn_spice_blow(game.surfaces["arrakis"], "spice-ore", SPICE_ORE_AMOUNT)
    end
end)

script.on_event(defines.events.on_space_platform_changed_state, function(event)
    if event.platform.state == defines.space_platform_state.on_the_path then
        local platform = event.platform
        if not platform then return end

        local conneciton_length = platform.space_connection.length
        local charge_required = (conneciton_length / 15000) * 25 * 1000000000
        log("length:" .. conneciton_length .. ", charge required:" .. charge_required)

        
        local drives = platform.surface.find_entities_filtered{name = "holtzman-drive"}
        if table_size(drives) == 0 then return end
 
        local current_charge = drives[1].energy
        log("Charge:" .. current_charge)

        if (current_charge + 0.1) < charge_required then return end

        drives[1].energy = drives[1].energy - charge_required

        local schedule = platform.schedule
        platform.space_location = schedule.records[schedule.current].station
    end
end)
