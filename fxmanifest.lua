fx_version 'cerulean'
game 'gta5'

author 'knoes'
version '1.0'

client_script 'client/main.lua'
server_script 'server/main.lua'

shared_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
	'config.lua',
}


lua54 'yes'
