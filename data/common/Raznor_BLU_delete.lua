-- 33/57 : 10:18   -- didn't track precise enough
-- 39.0/66.0 : 10:48 - 5 JP  -- up to 150K gil, 5 JP in 1/2 hour
-- 46.5/76.8 : 11:20 - 11 JP-

---Intermediate BLU .lua---
--Based off of Spicyryan of Asura's .lua https://pastebin.com/u/Spicyryan

-------------------------------------
---------                   ---------
------                         ------
---         Start of Gear         ---
------                         ------
---------                   ---------
------------------------------------- 
gear = {}                      -- auto-defined when using mote base
include('Raznor-oldglobals.lua')  -- auto-included if using a mote base
define_global_sets()           -- auto-called if using a mote base

send_command('bind f6 sellnpc powder')
send_command('bind @f6 buypowder 3333')               -- win-f6
send_command('bind !f6 sparks buyall acheron shield') -- alt-f6
send_command('bind !f input /follow warwick') -- alt-f

-- Set Macros - auto avail when using mote I believe
function set_macros(sheet,book)
    if book then 
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end
set_macros(2,10)

--Place Augmented Gear here, do //export while wearing it 
--Then find the folder where you store your .luas--
function get_sets()
	maps()     
	
	-- Rosmerta.Crit = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10', } }	
	-- Rosmerta.DA = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10' } }
	-- Rosmerta.DW = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10', } }
	
	-- Rosmerta.Cure = { name = "Rosmerta's Cape", augments = { 'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%' } }
	-- Rosmerta.MagicEva = { name = "Rosmerta's Cape", augments = {'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10' } }
	
	--TP Sets--
	sets.TP = {}
	sets.TP.index = { 'DualWield', 'Acc', 'MEva' }
	TP_ind = 1 --Default set, 1 is DW, 2, Haste, etc

	--DW III, +31 DW needed to cap with only Flutter on--
	sets.TP.DualWield = {
		ammo = "Ginsen",
		head = gear.Adhemar_D_head,
		neck = "Mirage Stole +1",  -- or maybe asperity?  att +*, STP 3, DA 2
		ear1 = "Suppanomimi",
		ear2 = "Brutal Earring",
		body = "Adhemar Jacket +1", -- "Ayanmo Corazza +2", -- RawhideVest.TP,
		hands = gear.Adhemar_B_hands,
		ring1 = "Ilabrat Ring", -- "Rajas Ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.STP, -- gear.BLU_TP_Cape,
		waist = "Reiki Yotai", -- "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1", -- "Herculean Trousers",
		feet="Malignance Boots" -- "Aya. Gambieras +1" -- TaeonBoots.TP
	}
	
	-- \todo Make at least a midacc set w/adhemar hands, maybe head
	
	sets.TP.Acc = set_combine(sets.TP.DualWield, {
		ammo = "Falcon Eye",
		head = "Malignance Chapeau",
		ear1 = "Telos Earring",
		hands = "Malignance Gloves", -- gear.Adhemar_B_hands,
		waist = "Reiki Yotai",  -- grunfeld rope?
		legs = "Malignance Tights" -- "Carmine Cuisses +1", -- "Herculean Trousers",
	})
	
	sets.TP.MEva = {
		ammo = "Falcon Eye",
		head = "Malignance Chapeau",
		neck = "Mirage Stole +1",  -- or maybe asperity?  att +8, STP 3, DA 2
		ear1 = "Telos Earring",
		ear2 = "Brutal Earring",
		body = "Malignance Tabard", -- RawhideVest.TP,
		hands = "Malignance Gloves", -- gear.Adhemar_B_hands,
		ring1 = "Defending Ring", -- "Rajas Ring",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.STP, --gear.BLU_TP_Cape,
		waist = "Kentarch Belt",  -- grunfeld rope?
		legs = "Malignance Tights", -- "Carmine Cuisses +1", -- "Herculean Trousers",
		feet = "Malignance Boots", -- "Aya. Gambieras +1" -- TaeonBoots.TP
	}
	
	--DT Sets--
	sets.DT = {}
	sets.DT.index = { 'DT' }
	DT_ind = 1 

	sets.DT.DT = {
		ammo = "Staunch Tathlum",      --  2/2
		head = gear.Adhemar_D_head,    --  4/0
		neck = "Loricate Torque",      --  5/5
		ear1 = "Impregnable Earring",  
		ear2 = "Brutal Earring",
		body = "Ayanmo Corazza +2",    --  6/6
		hands = "Malignance Gloves",   --  5/5
		ring1 = "Defending Ring",      -- 10/10
		ring2 = "Rajas Ring",             -- todo: gelatinous ring +1, would make 50/30 with current set
		back = Rosmerta.STP,           -- 10/0 -- "Moonbeam cape", -- 5/5
		waist = "Flume Belt +1",       --  4/0
		legs = "Malignance Tights",    --  7/7
		feet = "Ahosi Leggings"        --  4/0
	}  -- 57/34
	
	--Weaponskill Sets--
	sets.WS = {}

	sets.Requiescat = {}

	sets.Requiescat.index = { 'Attack' }
	Requiescat_ind = 1

	sets.Requiescat.Attack = {
		ammo = "Vanir Battery",
		head = "Jhakri Coronal +2",
		neck = "Mirage Stole +1", -- "Soil Gorget"
		ear1 = "Suppanomimi",
		ear2 = "Brutal Earring",
		body = "Jhakri robe +2",
		hands = "Jhakri cuffs +2",
		ring1 = "Enlivened Ring",
		ring2 = "Rajas Ring",
		back = Rosmerta.WSD,
		waist = "Soil Belt",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.CDC = {}

	sets.CDC.index = { 'Mike' }
	CDC_ind = 1

     sets.CDC.Mike = {
		ammo = "Ginsen",
		head = gear.Adhemar_D_head,
		neck = "Snow Gorget",
		ear1 = "Telos Earring",
		ear2 = "Brutal Earring",
		body = "Sayadio's Kaftan",     -- "Ayanmo Corazza +2",
		hands = "Adhemar Wrist. +1",   -- ? maybe jhakri +1 instead for WSD?
		ring1 = "Enlivened Ring",
		ring2 = "Rajas Ring",
		back = Rosmerta.WSD, -- \todo CDC prefers crit hit rate I believe
		waist = "Light Belt",
		legs = "Herculean Trousers",
		feet = "Jhakri Pigaches +1"
	}
	
    -- TODO: Blu WSD Cape, Blu CDC Cape
	sets.SavageBlade = {
	  
	}

	sets.SavageBlade.index = { 'Mike' }
	SavageBlade_ind = 1

     sets.SavageBlade.Mike = set_combine(sets.CDC.Mike, {
	    head="Herculean Helm",
		neck="Mirage Stole +1",
		right_ear="Ishvara Earring",
		left_ear="Moonshade Earring",
		body = "Assim. Jubbah +3",
	    hands="Jhakri cuffs +2",	 
		back=Rosmerta.WSD,
		waist="Grunfeld Rope", -- Sulla belt? more att, but less str/dex, so prob not
	    legs={ name="Herculean Trousers", augments={'Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Pet: STR+11','Weapon skill damage +9%','Accuracy+7 Attack+7',}},
		feet="Herculean Boots"
	})

    sets.Expiacion = {}

	sets.Expiacion.index = { 'Attack' }
	Expiacion_ind = 1

	sets.Expiacion.Attack = set_combine(sets.SavageBlade.Mike, {
	})

	sets.CircleBlade = set_combine(sets.Expiacion.Attack[sets.Expiacion.index[Expiacion_ind]], {
	})

	---------
	--Clubs-- These indexs probably will never need to be toggled,
	--------- but they exist anyway
	sets.Judgement = {}

	sets.Judgement.index = { 'Attack', 'Accuracy' }
	Judgement_ind = 1
	sets.Judgement.Attack = set_combine(sets.Expiacion.Attack, {})

	sets.Judgement.Accuracy = set_combine(sets.Expiacion.Accuracy, {})
	
	sets.BlackHalo = {}

	sets.BlackHalo.index = { 'Attack', 'Accuracy' }
	BlackHalo_ind = 1
	sets.BlackHalo.Attack = set_combine(sets.SavageBlade, {})
	
	sets.BlackHalo.Accuracy = set_combine(sets.SavageBlade.Accuracy, {})
	
	sets.Realmrazer = {}

	sets.Realmrazer.index = { 'Attack', 'Accuracy' }
	Realmrazer_ind = 1
	sets.Realmrazer.Attack = set_combine(sets.CDC.Mike, {
	})


	sets.Realmrazer.Accuracy = set_combine(sets.Realmrazer.Attack, {})

	sets.FlashNova = {}

	sets.FlashNova.index = { 'Attack', 'Accuracy' }
	FlashNova_ind = 1
	sets.FlashNova.Attack = set_combine(sets.CDC.Mike, {
	})

	
	sets.FlashNova.Accuracy = set_combine(sets.FlashNova.Attack, {})

	-------------------
	--Blue Magic Sets--
	-------------------
	sets.BlueMagic = {}

	sets.BlueMagic.STR = set_combine(sets.CDC.Mike, {
	})

	sets.BlueMagic.STRDEX = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRVIT = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRMND = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.AGI = set_combine(sets.BlueMagic.STR, {	})
	--------------------------------------------------
	
	sets.BlueMagic.SelfCures = set_combine(sets.BlueMagic.Cures, {
		-- ammo = "Hydrocera",
		-- neck = "Phalaina Locket",
		-- ear2 = "Calamitous Earring",
		-- body = "Vrikodara Jupon",
		-- hands = "Telchine Gloves",
		-- ring1 = "Kunaji Ring",
		-- ring2 = "Rufescent Ring",
		-- --back = "Aptitude Mantle",
		waist = "Gishdubar Sash",
           -- legs = "Gyve Trousers",
		-- feet = "Medium's Sabots"
	})

	--Conserve MP Gear--
	sets.BlueMagic.Buffs = {
		ammo = "Pemphredo Tathlum",
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Mendicant's Earring",
		ear2 = "Calamitous Earring",
		body = "Vedic Coat",
		hands = "Shrieker's Cuffs",
		ring1 = "Kishar Ring",
		back = "Solemnity Cape",
		waist = "Hachirin-no-Obi",
		legs = "Lengo Pants",
		feet = "Carmine Greaves +1"
	}

	sets.BlueMagic.Battery = set_combine(sets.BlueMagic.Buffs, {
		head = "Amalric Coif",
		waist = "Gishdubar Sash"
	})

	--Telchine Regen+ potency augments--
	sets.BlueMagic.Regeneration = set_combine(sets.BlueMagic.Buffs, {
		-- Body = "Telchine Chasuble",
		-- Feet =  TaeonBoots.TP
	})

	sets.BlueMagic.Stun = {
		ammo = "Pemphredo Tathlum",
		head = "Carmine Mask +1",
		neck = "Erra Pendant",
		ear1 = "Telos Earring",
		ear2 = "Dignitary's Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Etana Ring",
		ring2 = "Stikini Ring",
		back = "Cornflower cape",
		waist = "Eschan Stone",
		legs = "Hashishin Tayt +1",
		--feet = HerculeanFeet.Idle
	}

	sets.BlueMagic.HeavyStrike = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet +1",
		neck = "Caro Necklace",
		ear1 = "Telos Earring",
		ear2 = "Odnowa Earring +1",
		body = "Adhemar Jacket +1",
		--hands = HerculeanGloves.Crit,
		ring1 = "Ifrit Ring +1",
		ring2 = "Rufescent Ring",
		back = "Aptitude Mantle",
		waist = "Prosilio Belt +1",
		legs = "Samnuha Tights",
		--feet = HerculeanFeet.TA
	}

	sets.BlueMagic.WhiteWind = {
		ammo = "Falcon Eye",
		head = "Blistering Sallet +1",
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Ethereal Earring",
		body = "Pinga Tunic", -- "Vrikodara Jupon",
		hands = "Telchine Gloves",
		ring1 = "Kunaji Ring",
		ring2 = "Etana Ring",
		back = "Reiki Cloak",
		waist = "Carrier's Sash",
		legs = "Gyve Trousers",
		feet = "Medium's Sabots"
	}

	sets.BlueMagic.MagicAccuracy = set_combine(sets.BlueMagic.INT.MAB.MACC, {
		ammo = "Pemphredo Tathlum",
		head = "Malignance Chapeau",
		neck = "Mirage Stole +1",
		ear1 = "Regal earring",
		ear2 = "Dignitary's earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Kishar Ring",  -- "Sangoma Ring",
		-- ring2 = "Stikini Ring",
		-- back = "Cornflower Cape",
		waist = "Eschan Stone",
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	})

	--Occultation is every 50 skill, magic barrier equals skill, rest dont matter
	---For example diamondhide caps at 500
	sets.BlueMagic.Skill = {
		ammo = "Pemphredo Tathlum",
		head = "Luhlaza Keffiyeh",
		neck = "Incanter's Torque",
		ear1 = "Suppanomimi",
		ear2 = "Ethereal earring",
		body = "Assim. Jubbah +3",
		hands = "Hashishin Bazubands +1",
		ring1 = "Kishar Ring",
		ring2 = "Stikini Ring",
		back = "Cornflower cape",
		waist = "Gishdubar Sash",
		legs = "Hashishin Tayt +1",
		feet = "Mirage charuqs +2" -- "Luhlaza charuqs +1"
	}

	sets.BlueMagic.Enmity = {
		ammo = "Sapience Orb",
		head = "Rabid Visor",
		neck = "Warder's Charm +1",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "None",
		ring1 = "Supershear Ring",
		ring2 = "Pernicious Ring",
		back = "Aptitude Mantle",
		waist = "Kasiri Belt",
		legs = "Obatala Subligar",
		Feet = "Ahosi Leggings"
	}


	--Enhancing Sets--
	
	sets.Enhancing = set_combine(sets.BlueMagic.Buffs, {
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		body = "Telchine Chasuble",
		back = "Perimede Cape",
		legs = "Carmine Cuisses +1"
	})
	
	sets.Enhancing.Phalanx = set_combine(sets.BlueMagic.Buffs, {
		-- head = "Telchine Cap",
		-- neck = "Incanter's Torque",
		-- ear1 = "Andoaa Earring",
		body="Herculean Vest", -- "Taeon Tabard",
		hands="Taeon Gloves",
		-- back = "Perimede Cape",		
		legs = "Taeon Tights",
		feet = "Taeon Boots"
	})
	
	sets.Enhancing.Aquaveil = set_combine(sets.BlueMagic.Buffs, {
		head = "Amalric Coif",
	})
	
	sets.Enhancing.ProShell = set_combine(sets.BlueMagic.Buffs, {
		ring2 = "Sheltered Ring"
	})

	----------------
	--Utility Sets--
	----------------
	--These sets are either called in rules (like TH or Herp-a-Derp DT) or locked in manually
	--Manual locking macro
	--/console gs equip sets.  <name>
	--/console gs c lockgearindex
	--Hit it again to take it off
	
	sets.Utility = {}
	
	sets.Utility.TH = {
		waist = "Chaac Belt",
		--feet = HerculeanFeet.TH
	}
	--Comes on while terrored, asleep, etc
	sets.Utility.DerpDT = {
		ammo = "Staunch Tathlum",
		head = "Blistering Sallet +1",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Ayanmo Corazza +2",
		-- hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = "Engulfer Cape +1",
		waist = "Flume belt",
		legs = "Ayanmo Cosciales +1",
		feet = "Ahosi Leggings"
	}
	
	--Shell II only, need 36%--
	sets.Utility.MDTII = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Warder's Charm +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Amalric Doublet +1",
-- 		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Shadow Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Carrier's Sash",
		legs = "Ayanmo Cosciales +1",
		feet = "Ahosi Leggings"
	}

	--No Shell--
	sets.Utility.MDTNO = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Ayanmo Corazza +1", 
	--	hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Carrier's Sash",
		legs = "Ayanmo Cosciales +1",
	--	feet = HerculeanFeet.DT
	}
end