-- Initialize variables
local itemCount = 0
local maxItems = 5
local specialItem = "appliedenergistics2:magenta_paint_ball"
local dropDelay = 3  -- Delay in seconds before dropping the item

-- Function to check and handle the special item
local function handleSpecialItem(item)
    print("Checking item: " .. tostring(item.name))
    if item.name == specialItem then
        print("Special item found. Dropping down.")
        turtle.dropDown()
        return true
    end
    return false
end

-- Main loop
print("Starting main loop")
while true do
    print("Attempting to suck item from above")
    -- Try to suck item from above
    local success, item = turtle.suckUp()
    
    if success then
        print("Item obtained: " .. tostring(item.name))
        -- Check if it's the special item
        if not handleSpecialItem(item) then
            itemCount = itemCount + 1
            print("Item count: " .. itemCount)
            
            -- Check if we've reached the maximum items
            if itemCount >= maxItems then
                print("Max items reached. Mining block in front.")
                -- Mine the block in front
                turtle.dig()
                print("Waiting for " .. dropDelay .. " seconds")
                -- Wait for 3 seconds
                os.sleep(dropDelay)
                print("Placing block back")
                -- Place the block back
                turtle.place()
                -- Reset the item count
                itemCount = 0
                print("Item count reset to 0")
            end
        end
    else
        print("No item obtained. Waiting for 1 second.")
        -- If no item was sucked, wait a bit before trying again
        os.sleep(1)
    end
end
