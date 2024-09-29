-- Initialize variables
local itemCount = 0
local maxItems = 5
local specialItem = "appliedenergistics2:magenta_paint_ball"
local dropDelay = 3  -- Delay in seconds before dropping the item

-- Function to check and handle the special item
local function handleSpecialItem(item)
    if item.name == specialItem then
        turtle.dropDown()
        return true
    end
    return false
end

-- Main loop
while true do
    -- Try to suck item from above
    local success, item = turtle.suckUp()
    
    if success then
        -- Check if it's the special item
        if not handleSpecialItem(item) then
            itemCount = itemCount + 1
            
            -- Check if we've reached the maximum items
            if itemCount >= maxItems then
                -- Mine the block in front
                turtle.dig()
                -- Wait for 3 seconds
                os.sleep(dropDelay)
                -- Place the block back
                turtle.place()
                -- Reset the item count
                itemCount = 0
            end
        end
    else
        -- If no item was sucked, wait a bit before trying again
        os.sleep(1)
    end
end
