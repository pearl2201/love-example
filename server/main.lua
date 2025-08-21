package.path = package.path .. ';../lib/?.lua'
if arg[#arg] == "vsc_debug" then
    require("lldebugger").start()
end

require('lobby')


local sock = require('sock')
local bitser = require('bitser')
local lobby = Lobby()
-- server.lua
function love.load()
    -- Creating a server on any IP, port 22122
    server = sock.newServer("*", 22122)

    -- Called when someone connects to the server
    server:on("connect", function(data, client)
        -- Send a message back to the connected client
        local msg = "Hello from the server!"
        client:send("hello", msg)
    end)

    -- Called when the client disconnects from the server
    client:on("disconnect", function(data)
        print("Client disconnected from the server.")
    end)

    -- Custom callback, called whenever you send the event from the server
    client:on("hello", function(msg)
        print("The client replied: " .. msg)
    end)
end

function love.update(dt)
    server:update()
end
