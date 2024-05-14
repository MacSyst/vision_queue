fx_version 'cerulean'
game 'gta5'

name 'mac_queue'
author 'VisonQueue / benrizzz'
discription 'a good queue for servers'
github 'https://github.com/MacSyst/vision_queue/'


lua54 "yes"
version '1.0.0'


shared_scripts  {
    '@es_extended/imports.lua'
}



server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}
