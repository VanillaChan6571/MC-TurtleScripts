-- Function to detect if block in front is obsidian
function isObsidianAhead()
    local success, data = turtle.inspect()
    return success and data.name == "minecraft:obsidian"
end

-- Function to place blocks downward until hitting something
function placeSandColumn()
    while not turtle.detectDown() do
        -- Check if we have items to place
        if turtle.getItemCount() == 0 then
            -- Try to select next slot with items
            for i = 1, 16 do
                if turtle.getItemCount(i) > 0 then
                    turtle.select(i)
                    break
                end
            end
            -- If no items found, return false
            if turtle.getItemCount() == 0 then
                print("Out of sand blocks!")
                return false
            end
        end
        -- Place the block
        turtle.placeDown()
    end
    return true
end

-- Function to handle obstacle and turn if needed
function handleObstacle()
    if isObsidianAhead() then
        print("Obsidian detected, turning left...")
        turtle.turnLeft()
        if turtle.forward() then
            turtle.turnLeft()
            return true
        else
            print("Cannot complete turn pattern!")
            turtle.turnRight() -- Turn back to original position
            return false
        end
    end
    return false
end

-- Main program
print("Starting sand wall construction...")
while true do
    -- Place column of sand
    if not placeSandColumn() then
        break  -- Stop if we're out of sand
    end
    
    -- Try to move forward
    if not turtle.forward() then
        -- If blocked, check for obsidian and handle turn pattern
        if not handleObstacle() then
            print("Path blocked and cannot turn!")
            break
        end
    end
    
    -- Optional: add a small delay to prevent overwhelming the server
    os.sleep(0.2)
end
print("Construction complete or stopped.")
