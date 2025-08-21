require 'class'

IdGenerator = class()

function IdGenerator:init()
    self.current_id = 0
    self.available_ids = {}
end

-- Generates a new unique ID or reuses a previously returned one.
function IdGenerator:get_id()
    if #self.available_ids > 0 then
        -- Reuse an ID from the available pool
        return table.remove(self.available_ids)
    else
        -- Generate a new ID
        self.current_id = self.current_id + 1
        return self.current_id
    end
end

-- Returns an ID to the pool of available IDs for reuse.
function IdGenerator:return_id(id)
    if id and type(id) == "number" and id > 0 then
        -- Add the ID to the available pool if it's not already there
        local is_available = false
        for _, v in ipairs(self.available_ids) do
            if v == id then
                is_available = true
                break
            end
        end
        if not is_available then
            table.insert(self.available_ids, id)
        end
    end
end
