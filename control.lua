require("prototypes.function")

local TARGET_UNITS = {
    "small-demolisher",
    "medium-demolisher",
    "large-demolisher",
}

local ORE_NAME = "spice-ore"     -- Name of the ore to spawn
local ORE_AMOUNT = 250          -- Amount of ore to spawn per tile
local SPAWN_RADIUS = 5          -- Radius around the enemy to spawn ores
local NOISE_FACTOR = 3
local REDUCTION_RATE = 1

-- Helper function to spawn ores around a position
local function spawn_or_refresh_ores(surface, position)
    for x = -SPAWN_RADIUS, SPAWN_RADIUS do
        for y = -SPAWN_RADIUS, SPAWN_RADIUS do
            -- Add random noise to the position
            local noise_x = (math.random() * 2 - 1) * NOISE_FACTOR
            local noise_y = (math.random() * 2 - 1) * NOISE_FACTOR
            local spawn_position = {
                x = position.x + x + noise_x,
                y = position.y + y + noise_y
            }

            local ore_amount_random = (math.random() * ORE_AMOUNT) + 1
            
            -- Calculate distance to maintain circular area
            local distance = math.sqrt(x * x + y * y)
            if distance <= SPAWN_RADIUS then
                -- Check for existing ore at this position
                local entities = surface.find_entities_filtered{
                    position = spawn_position,
                    name = ORE_NAME
                }
                if #entities > 0 then
                    -- Refresh existing ore
                    for _, ore in pairs(entities) do
                        ore.amount = ore_amount_random
                    end
                else
                    -- Create new ore if none exists
                    if surface.can_place_entity{name = ORE_NAME, position = spawn_position} then
                        surface.create_entity{
                            name = ORE_NAME,
                            position = spawn_position,
                            amount = ore_amount_random
                        }
                    end
                end
            end
        end
    end
end



-- Event handler to iterate through enemies and spawn ores
script.on_event(defines.events.on_tick, function(event)
    if event.tick % 600 == 0 then -- Run the code every 600 ticks (10 seconds)
        if game.surfaces["arrakis"] then
            local surface = game.surfaces["arrakis"] -- Default surface
            for _, unit in pairs(surface.find_entities_filtered{type = "segmented-unit"}) do
                if has_value(TARGET_UNITS, unit.name) then
                    spawn_or_refresh_ores(surface, unit.position)
                end
            end
            
            local ores = surface.find_entities_filtered{name = ORE_NAME}
            for _, ore in pairs(ores) do
                if ore.valid and ore.amount > 0 then
                    if ore.amount <= REDUCTION_RATE then
                        ore.destroy()
                    else
                        ore.amount = ore.amount - REDUCTION_RATE
                    end
                end
            end
        end
    end
end)
