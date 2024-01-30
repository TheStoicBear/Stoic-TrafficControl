author "TheStoicBear"
description "Stoic-TrafficControl"
version "1.0.0"

fx_version "cerulean"
game "gta5"
lua54 "yes"

client_scripts {
    'source/client.lua'
}

shared_scripts {
    "@ox_lib/init.lua"
}

dependency "ox_lib"