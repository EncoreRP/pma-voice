game {'gta5'}

fx_version 'cerulean'
author 'AvarianKnight'
description 'VOIP built using FiveM\'s built in mumble.'

lua54 'yes'

shared_script 'shared.lua'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/ComboZone.lua',

    'client/**/*.lua',
}

server_scripts {
    'server/**/*.lua'
}

files {
    'ui/*.ogg',
    'ui/css/*.css',
    'ui/js/*.js',
    'ui/index.html',
}

ui_page 'ui/index.html'

provides {
	'mumble-voip',
    -- why does it use so many different names
    'tokovoip',
    'toko-voip',
    'tokovoip_script'
}
