package.path = package.path .. ';../lib/?.lua;../shared/?.lua';

local sock = require('sock')
local bitser = require('bitser')

local sock = require "sock"

-- client.lua
function love.load()
    print("Client loaded.")
    -- Creating a new client on localhost:22122
    client = sock.newClient("localhost", 22122)
    
    -- Creating a client to connect to some ip address
    -- client = sock.newClient("198.51.100.0", 22122)

    -- Called when a connection is made to the server
    client:on("connect", function(data)
        print("Client connected to the server.")
    end)
    
    -- Called when the client disconnects from the server
    client:on("disconnect", function(data)
        print("Client disconnected from the server.")
    end)

    -- Custom callback, called whenever you send the event from the server
    client:on("hello", function(msg)
        print("The server replied: " .. msg)
    end)

    client:connect()
    
    --  You can send different types of data
    client:send("greeting", "Hello, my name is Inigo Montoya.")
    client:send("isShooting", true)
    client:send("bulletsLeft", 1)
    client:send("position", {
        x = 465.3,
        y = 50,
    })
end

function love.update(dt)
    client:update()
end