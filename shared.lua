Cfg = {}
-- possibly GetConvar('voice_modes', '0.5;2.0;5.0')
-- possibly GetConvar('voice_modeNames', 'Whisper;Normal;Shouting') and seperate them on runtime?
if GetConvar('voice_useNativeAudio', 'false') == 'true' then
	-- native audio distance seems to be larger then regular gta units
	Cfg.voiceModes = {
		{1.0, "Whisper"}, -- Whisper speech distance in gta distance units
		{2.3, "Normal"}, -- Normal speech distance in gta distance units
		{5.0, "Shouting"} -- Shout speech distance in gta distance units
	}
else
	Cfg.voiceModes = {
		{3.0, "Whisper"}, -- Whisper speech distance in gta distance units
		{7.0, "Normal"}, -- Normal speech distance in gta distance units
		{15.0, "Shouting"} -- Shout speech distance in gta distance units
	}
end


-- @ENCORE
Cfg.WhisperZones = {
    [1] = { -- MRPD Holding Cells,
        MinZ = 25.0,
        MaxZ = 29.5,
        Zone = {
            vector2(476.66131591797, -1004.2270507812),
            vector2(476.5569152832, -1015.9202270508),
            vector2(488.66571044922, -1015.9314575195),
            vector2(488.6745300293, -1004.0549926758),
        },
    },
    [2] = { -- Pillbox Ward A
        MinZ = 42.0,
        MaxZ = 45.8,
        Zone = {
            vector2(301.39358520508, -580.52136230469),
            vector2(308.70275878906, -559.60870361328),
            vector2(330.68487548828, -567.54614257812),
            vector2(323.1467590332, -588.88098144531),
        }
    },
}





logger = {
	['log'] = function(message, ...)
		print((message):format(...))
	end,
	['info'] = function(message, ...)
		if GetConvarInt('voice_debugMode', 0) >= 1 then
			print(('[info] ' .. message):format(...))
		end	
	end,
	['warn'] = function(message, ...)
		print(('[^1WARNING^7] ' .. message):format(...))
	end,
	['error'] = function(message, ...)
		print(('[^1ERROR^7] ' .. message):format(...))
	end,
	['verbose'] = function(message, ...)
		if GetConvarInt('voice_debugMode', 0) >= 4 then
			print(('[verbose] ' .. message):format(...))
		end	
	end,
}


function tPrint(tbl, indent)
	indent = indent or 0
	for k, v in pairs(tbl) do
		local tblType = type(v)
		formatting = string.rep("  ", indent) .. k .. ": "
		if tblType == "table" then
			print(formatting)
			tPrint(v, indent + 1)
		elseif tblType == 'boolean' then
			print(formatting .. tostring(v))
		elseif tblType == "function" then
			print(formatting .. tostring(v))
		else
			print(formatting .. v)
		end
	end
end