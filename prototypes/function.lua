function has_value (tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end


function distance (point_a, point_b)
    local x = point_a.x - point_b.x
    local y = point_a.y - point_b.y

    return math.sqrt(x^2 + y^2)
end