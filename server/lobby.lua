require 'class'

Lobby = class()

function Lobby:init()
    self.rooms = {}
end

function Lobby:createRoom(player, roomName)
    local roomId = #self.rooms + 1
    local room = Room(roomName, roomId)
    room:addPlayer(player)
    self.rooms[roomId] = room

    return room
end

function Lobby:getRoom(roomId)
    return self.rooms[roomId]
end


function  Lobby:getRooms()
    return self.rooms
end

function  Lobby:joinRoom(player, roomId)
    local room = self:getRoom(roomId)
    if not room then
        error("Room not found")
    end
    room:addPlayer(player)
end

function Lobby:removeRoom(roomId)
    if not self.rooms[roomId] then
        error("Room not found")
    end
    self.rooms[roomId] = nil
    
end

local lobby = Lobby()

return lobby;