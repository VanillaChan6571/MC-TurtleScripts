-- Function to check if the item in a slot matches the desired item
function checkSlot(slotNumber, itemName)
    local item = turtle.getItemDetail(slotNumber)
    if item and item.name == itemName then
        return true
    end
    return false
end

-- Main loop
while true do
    -- Check each inventory slot
    for slot = 1, 16 do
        if checkSlot(slot, "appliedenergistics2:magenta_paint_ball") then
            -- Select the slot
            turtle.select(slot)
            
            -- Try to drop the item below
            if turtle.dropDown() then
                print("Dropped magenta paint ball below")
            else
                -- If dropping fails, attempt to use the item (right-click)
                if turtle.placeDown() then
                    print("Used magenta paint ball")
                else
                    print("Failed to drop or use magenta paint ball")
                end
            end
        end
    end
    
    -- Wait a bit before checking again
    os.sleep(1)
end
