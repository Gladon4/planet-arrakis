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
