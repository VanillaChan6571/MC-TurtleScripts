-- Function to handle the item in the given slot
function handleItem(slotNumber)
    local item = turtle.getItemDetail(slotNumber)
    if item then
        print("Slot " .. slotNumber .. " contains: " .. item.name)
        
        -- Select the slot
        turtle.select(slotNumber)
        
        if item.name == "appliedenergistics2:magenta_paint_ball" then
            -- Try to drop the magenta paint ball below
            if turtle.dropDown() then
                print("Dropped magenta paint ball below")
                return true
            else
                print("Failed to drop magenta paint ball below")
            end
        end
        
        -- For any item (including magenta paint ball if dropping below failed),
        -- attempt to drop it in front of the turtle
        print("Attempting to drop item in front of turtle")
        if turtle.drop() then
            print("Successfully dropped item in front: " .. item.name)
            return true
        else
            print("Failed to drop item in front: " .. item.name)
        end
    else
        print("Slot " .. slotNumber .. " is empty")
    end
    return false
end

-- Main loop
print("Script started. Handling items in slot 1")
while true do
    print("Checking slot 1...")
    if handleItem(1) then
        print("Item in slot 1 was handled successfully")
    else
        print("No action taken for slot 1")
    end
    
    -- Wait a bit before checking again
    print("Waiting for 3 seconds before next check")
    os.sleep(3)
end
