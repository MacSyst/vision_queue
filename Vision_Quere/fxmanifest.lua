fx_version 'cerulean'
game 'gta5'

name 'mac_queue'
author 'VisonQueue / benrizzz'
discription 'a good queue for servers'
github 'https://github.com/MacSyst/mac_queue'


lua52 "yes"
version '1.0.0'

client_scripts {
    'client.lua'
}

shared_scripts  {
    '@es_extended/imports.lua',
    'config.lua'
}



server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}