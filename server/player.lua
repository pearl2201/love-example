require 'class'

Player = class()

function Player:init(name, id)
    self.name = name or "Unknown"
    self.id = id or 0
end
