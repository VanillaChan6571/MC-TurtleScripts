-- Initialize variables
local itemCount = 0
local maxItems = 5
local specialItem = "appliedenergistics2:magenta_paint_ball"
local throwDelay = 3  -- Delay in seconds before throwing the item
local mineDelay = 5   -- Delay in seconds before mining after 5th item

-- Function to handle the special item
local function handleSpecialItem(item)
    if item.name == specialItem then
        print("Special item found. Dropping down.")
        turtle.dropDown()
        return true
    end
    return false
end

-- Function to throw item in front
local function throwItem()
    print("Throwing item in front")
    turtle.drop()
end

-- Main loop
print("Starting main loop")
while true do
    print("Attempting to suck item from above")
    local success, item = turtle.suckUp()
    
    if success then
        itemCount = itemCount + 1
        print("Item obtained. Count: " .. itemCount)
        
        -- Handle special item if necessary
        if not handleSpecialItem(turtle.getItemDetail(1)) then
            -- Wait before throwing
            print("Waiting " .. throwDelay .. " seconds before throwing")
            os.sleep(throwDelay)
            
            -- Throw the item
            throwItem()
        end
        
        -- Check if we've reached the maximum items
        if itemCount >= maxItems then
            print("Max items reached. Waiting " .. mineDelay .. " seconds before mining")
            os.sleep(mineDelay)
            
            print("Mining block in front")
            turtle.dig()
            
            print("Placing block back")
            turtle.place()
            
            -- Reset the item count
            itemCount = 0
            print("Item count reset to 0")
        end
    else
        print("No item obtained. Waiting for 1 second.")
        os.sleep(1)
    end
end
