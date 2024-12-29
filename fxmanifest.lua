fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

description 'egl_armor'
author 'Eagle'
version '1.1.0'

shared_scripts {
    'locales_init.lua',
    'locales/*.lua',
    'config.lua',
    'core.lua',
}

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}
