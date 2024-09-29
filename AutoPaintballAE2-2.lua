-- Function to check if the item in a slot matches the desired item
function checkSlot(slotNumber, itemName)
    local item = turtle.getItemDetail(slotNumber)
    if item then
        print("Slot " .. slotNumber .. " contains: " .. item.name)
        if item.name == itemName then
            return true
        end
    else
        print("Slot " .. slotNumber .. " is empty")
    end
    return false
end

-- Main loop
print("Script started. Checking for appliedenergistics2:magenta_paint_ball")
while true do
    print("Checking slot 1...")
    -- Check only the first inventory slot
    if checkSlot(1, "appliedenergistics2:magenta_paint_ball") then
        print("Found magenta paint ball in slot 1")
        -- Select the first slot
        turtle.select(1)
        
        -- Try to drop the item below
        if turtle.dropDown() then
            print("Dropped magenta paint ball below")
        else
            print("Couldn't drop item, attempting to use it")
            -- If dropping fails, attempt to use the item (right-click)
            if turtle.placeDown() then
                print("Used magenta paint ball")
            else
                print("Failed to drop or use magenta paint ball")
            end
        end
    else
        print("No magenta paint ball found in slot 1")
    end
    
    -- Wait a bit before checking again
    print("Waiting for 5 seconds before next check")
    os.sleep(5)
end
