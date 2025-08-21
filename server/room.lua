require 'class'

Room = class()

function Room:init(name, id)
    self.name = name or "Default Room"
    self.id = id or 0
    self.players = {}
end

function Room:addPlayer(player)
    if not player or type(player) ~= "table" then
        error("Invalid player object")
    end
    table.insert(self.players, player)
    
end

function Room:romvePlayer(playerId)
    for i, player in ipairs(self.players) do
        if player.id == playerId then
            table.remove(self.players, i)
            return true
        end
    end
    return false -- Player not found
    
end