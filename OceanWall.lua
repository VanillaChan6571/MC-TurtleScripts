-- Function to place blocks downward until hitting something
function placeSandColumn()
    -- Keep placing blocks while there's nothing below
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

-- Main program
print("Starting sand wall construction...")
while true do
    -- Place column of sand
    if not placeSandColumn() then
        break  -- Stop if we're out of sand
    end
    
    -- Try to move forward
    if not turtle.forward() then
        print("Path blocked! Cannot move forward.")
        break
    end
    
    -- Optional: add a small delay to prevent overwhelming the server
    os.sleep(0.2)
end
print("Construction complete or stopped.")
