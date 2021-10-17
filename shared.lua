Cfg = {}
-- possibly GetConvar('voice_modes', '0.5;2.0;5.0')
-- possibly GetConvar('voice_modeNames', 'Whisper;Normal;Shouting') and seperate them on runtime?
if GetConvar('voice_useNativeAudio', 'false') == 'true' then
	-- native audio distance seems to be larger then regular gta units
	Cfg.voiceModes = {
		{1.0, "Whisper"}, -- Whisper speech distance in gta distance units
		{2.3, "Normal"}, -- Normal speech distance in gta distance units
		{5.0, "Shouting"}, -- Shout speech distance in gta distance units
        {15.0, "Obnoxious"},
	}
else
	Cfg.voiceModes = {
		{3.0, "Whisper"}, -- Whisper speech distance in gta distance units
		{7.0, "Normal"}, -- Normal speech distance in gta distance units
		{15.0, "Shouting"}, -- Shout speech distance in gta distance units
        {45.0, "Obnoxious"},
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

Cfg.ObnoxiousZones = {
    [1] = { -- Courtroom
        MinZ = 59.0,
        MaxZ = 67.0,
        Zone = {
            vector2(330.19345092773, -1624.8427734375),
            vector2(319.68203735352, -1637.2548828125),
            vector2(315.74005126953, -1633.6926269531),
            vector2(315.93069458008, -1631.9177246094),
            vector2(314.34649658203, -1630.0723876953),
            vector2(322.20581054688, -1620.2344970703),
            vector2(325.38845825195, -1620.9140625),
        },
    },
    [2] = { -- Church
        MinZ = 40.0,
        MaxZ = 53.0,
        Zone = {
            vector2(-786.65515136719, -7.0833082199097),
            vector2(-791.63745117188, 1.316162109375),
            vector2(-775.81549072266, 10.436867713928),
            vector2(-770.75793457031, 1.8158816099167),
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