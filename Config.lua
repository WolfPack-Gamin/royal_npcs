
--				NPC MODEL'S -  https://github.com/abdulkadiraktas/rdr3_discoveries/blob/master/peds/peds_list.lua
--			BLIP COLOR MODI	-  https://github.com/abdulkadiraktas/rdr3_discoveries/tree/master/useful_info_from_rpfs/blip_modifiers
--BLIP SPRITE TYPE Option 2 -  https://github.com/femga/rdr3_discoveries/tree/master/useful_info_from_rpfs/textures/blips
--BLIP SPRITE TYPE Option 1 -  https://filmcrz.github.io/blips/

Config = {}
Config.wantnpc = true 	-- Turn Off NPC Spawn
Config.wantblip = true	-- Turn Off Blip Spawn
Config.npcloc = {
    npc1  = { -- Strawberry Store
		-----------NPC
		pos  = vector3(-1789.85, -388.30, 159.38), -- Pos of the first NPC IN AREA
		apos = vector3(-1796.07, -385.23, 159.38), -- is a close pos of 2 npc's, can be the same as the first one
		npcarea = 2,  -- Cant be more than 2
		he =  55.59,  -- Direction of ped 
		dist = 10.0,  -- Distance to dispawn
		tipo = 'u_m_m_valgenstoreowner_01',	
		-----------BLIP
		name = 'General Store', -- OF the blip - But u can use to know what blip is		
		blipON = true,	-- Turn Blip on minimap ON or Off
		sprite =  819673798,   
		modi = "BLIP_MODIFIER_MP_COLOR_6",	
	},
	npc2  = { -- Strawberry Tailor
		-----------NPC
		pos  = vector3(-1796.07, -385.23, 159.38), 
		apos = vector3(-1796.07, -385.23, 159.38),
		npcarea = 2, 
		he = 275.94, 
		dist = 10.0,  
		tipo = 's_m_m_tailor_01',
		-----------BLIP		
		name = 'Tailor: Strawberry', 	
		blipON = false,	
		sprite = 1496995379,  
		modi = "BLIP_MODIFIER_MP_COLOR_3",	
	},
	npc3  = { -- Strawberry WoodSeller
		-----------NPC
		pos  = vector3(-1815.90, -421.99, 159.00), 
		apos = vector3(-1815.90, -421.99, 159.00),
		npcarea = 1, 
		he = -26.0, 
		dist = 25.0,  
		tipo = 'u_m_o_bht_docwormwood',	
		-----------BLIP		
		name = 'Wood - Strawberry', 	
		blipON = true,	
		sprite = 1904459580,  
		modi = "BLIP_MODIFIER_MP_COLOR_26",	
	},
	}