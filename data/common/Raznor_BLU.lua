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
		
	Rosmerta = {}
	Rosmerta.WSD = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}}
	Rosmerta.FC = { name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}
	Rosmerta.Nuke = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	Rosmerta.STP = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+8','"Store TP"+10','Phys. dmg. taken-10%',}}
	
	-- Rosmerta.Crit = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10', } }	
	-- Rosmerta.DA = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10' } }
	-- Rosmerta.DW = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10', } }
	
	-- Rosmerta.Cure = { name = "Rosmerta's Cape", augments = { 'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%' } }
	-- Rosmerta.MagicEva = { name = "Rosmerta's Cape", augments = {'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10' } }
	
	
	
	sets.Idle = {}
	--Idle Sets--
	sets.Idle.index = { 'Standard', 'DT' }
	Idle_ind = 1
	sets.Idle.Standard = {
		ammo = "Staunch Tathlum",      -- +1
		head = gear.Adhemar_D_head,    -- HerculeanHelm.Refresh
		neck = "Loricate Torque",      -- +1
		ear1 = "Impregnable Earring",  -- Genmei Earring
		ear2 = "Brutal Earring",       -- Etiolation Earring
		body = "Jhakri robe +2",       -- Jhakri Robe +2 (refresh)
		hands = "Malignance Gloves",   -- heculeanGloves.refresh
		ring1 = "Defending Ring",      -- Karieyh Ring +1 -- regain?
		ring2 = "Sheltered Ring",
		back = "Moonbeam Cape",
		waist = "Flume Belt +1",
		legs = "Carmine Cuisses +1",
		feet = "Ahosi Leggings"
	}

	--TP Sets--
	sets.TP = {}
	sets.TP.index = { 'DualWield', 'Acc' }
	TP_ind = 1 --Default set, 1 is DW, 2, Haste, etc

	--DW III, +31 DW needed to cap with only Flutter on--
	sets.TP.DualWield = {
		ammo = "Ginsen",
		head = gear.Adhemar_D_head,
		neck = "Mirage Stole +1",  -- or maybe asperity?  att +*, STP 3, DA 2
		ear1 = "Suppanomimi",
		ear2 = "Brutal Earring",
		body = "Ayanmo Corazza +2", -- RawhideVest.TP,
		hands = gear.Adhemar_B_hands,
		ring1 = "Ilabrat Ring", -- "Rajas Ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.STP, -- gear.BLU_TP_Cape,
		waist = "Windbuffet Belt +1",
		legs = "Carmine Cuisses +1", -- "Herculean Trousers",
		feet="Malignance Boots" -- "Aya. Gambieras +1" -- TaeonBoots.TP
	}
	
	-- \todo Make at least a midacc set
	
	sets.TP.Acc = {
		ammo = "Falcon Eye",
		head = "Malignance Chapeau",
		neck = "Mirage Stole +1",  -- or maybe asperity?  att +*, STP 3, DA 2
		ear1 = "Telos Earring",
		ear2 = "Brutal Earring",
		body = "Ayanmo Corazza +2", -- RawhideVest.TP,
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
		head = "Jhakri Coronal +1",
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
		body = "Ayanmo Corazza +2",
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
		body = "Assim. Jubbah +2",
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


	sets.SanguineBlade = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi Earring",
		ear2 = "Hecate's earring",
		body = "jhakri robe +2",
		hands = gear.Amalric_D_hands,
		ring1 = "Archon Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.Nuke, 
		waist = "Eschan Stone", -- todo: don't have
		legs = "Jhakri Slops +1",
		feet = gear.Amalric_D_feet
	}

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
	sets.BlueMagic.INT = {}
	sets.BlueMagic.INT.index = { "MAB", "MACC" }
	MAB_ind = 1

	sets.BlueMagic.INT.MAB = {
		ammo = "Staunch Tathlum", -- "Pemphredo Tathlum",
		head = "Jhakri Coronal +1",
		neck = "Sanctity Necklace",
		ear1 = "Regal Earring",
		ear2 = "Friomisi earring",
		body = "jhakri robe +2",
		hands = gear.Amalric_D_hands,
		ring1 = {name = "Diamond Ring", augments={'INT+1','Ice resistance+1',}},
		ring2 = "Jhakri Ring",
		back = Rosmerta.Nuke, -- gear.BLU_MAB_Cape,
		waist = "Hyorin obi",
		legs = "Jhakri Slops +1",
		feet = gear.Amalric_D_feet
	}
	
	sets.BlueMagic.INT.MACC = set_combine(sets.BlueMagic.INT.MAB, {
		-- ammo = "Pemphredo Tathlum",
		-- neck = "Erra Pendant",
		-- ear1 = "Hermetic Earring",
		-- ear2 = "Friomisi earring",
		-- ring1 = "Shiva Ring +1",
		-- ring2 = "Acumen Ring",
		-- back = "Aptitude Mantle",
		-- waist = "Eschan Stone",
	})
	-----------------------------------------
	
	--CP cap 50%, CP Received cap 30%--
	sets.BlueMagic.Cures = {
		-- ammo = "Hydrocera",
		-- head = "Carmine Mask",
		-- neck = "Phalaina Locket",
		-- ear1 = "Mendicant's Earring",
		-- ear2 = "Calamitous Earring",
		body = "Pinga Tunic", -- "Vrikodara Jupon",
		-- hands = "Hashishin Bazubands +1",
		-- ring1 = "Stikini Ring",
		-- ring2 = "Rufescent Ring",
		-- --back = "Aptitude Mantle",
		-- waist = "Luminary Sash",
		-- legs = "Gyve Trousers",
		-- feet = "Medium's Sabots"
	}
	
	sets.BlueMagic.SelfCures = {
		-- ammo = "Hydrocera",
		-- head = "Carmine Mask",
		-- neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		-- ear2 = "Calamitous Earring",
		-- body = "Vrikodara Jupon",
		-- hands = "Telchine Gloves",
		-- ring1 = "Kunaji Ring",
		-- ring2 = "Rufescent Ring",
		-- --back = "Aptitude Mantle",
		-- waist = "Gishdubar Sash",
           -- legs = "Gyve Trousers",
		-- feet = "Medium's Sabots"
	}

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

	sets.BlueMagic.MagicAccuracy = {
		ammo = "Pemphredo Tathlum",
		head = "Carmine Mask +1",
		neck = "Erra Pendant",
		ear1 = "Hermetic earring",
		ear2 = "Dignitary's earring",
		body = "Jhakri Robe +2",
		hands = "Rawhide Gloves",
		ring1 = "Sangoma Ring",
		ring2 = "Stikini Ring",
		back = "Cornflower Cape",
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	--Occultation is every 50 skill, magic barrier equals skill, rest dont matter
	---For example diamondhide caps at 500
	sets.BlueMagic.Skill = {
		ammo = "Pemphredo Tathlum",
		head = "Luhlaza Keffiyeh",
		neck = "Incanter's Torque",
		ear1 = "Suppanomimi",
		ear2 = "Ethereal earring",
		body = "Assim. Jubbah +2",
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
		body="Taeon Tabard",
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
		body = "Amalric Doublet",
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

	--Job Ability Sets--

	sets.JA = {}

	sets.JA.ChainAffinity = { feet = "Assim. charuqs +1" }

	sets.JA.BurstAffinity = { feet = "Hashishin Basmak +1" }

	sets.JA.Efflux = { legs = "Hashishin Tayt +1" }

	sets.JA.AzureLore = { hands = "Luhlaza bazubands" }

	sets.JA.Diffusion = set_combine(sets.BlueMagic.Buffs, { feet = "Mirage Charuqs +2" })

	sets.JA.Provoke = set_combine(sets.BlueMagic.Enmity, {})

	sets.JA.Warcry = set_combine(sets.BlueMagic.Enmity, {})


	--Precast Sets--
	sets.precast = {}

	sets.precast.FastCast = {}

	sets.precast.FastCast.Standard = {
		-- ammo = "Impatiens", -- don't have
		head = "Carmine Mask +1",   -- 14		
		neck = "Voltsurge Torque",  -- 4 
		-- "Orunmila's Torque",
		ear1 = "Loquac. Earring",                                                              -- 2
		-- ear2 = "Etiolation Earring", -- don't have
		body = "Pinga Tunic",                                                                  -- 13
		hands = "Leyline Gloves",                                                              -- 6, 
		-- only +1 aug, can get better aug'd version
		ring1 = "Kishar Ring",  -- 4
		-- ring2 = "Prolix Ring",  -- don't have		
		back = Rosmerta.FC,                                                                    -- 10
		-- waist = "Witful Belt", -- occ. quickens is BAD for DD spells
        legs = { name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},  -- 7
		feet = "Chelona Boots"                                                                 -- 4
	} -- @64, +15(20) from Fast Cast Trait - 79/80 -- need 1
	  -- carmine mask +1 is +7, 25 left

	--Empy body stacks with FC, 80% cap, empy hands must be on at time of casting (mid) for effect--
	sets.precast.FastCast.Blue = set_combine(sets.precast.FastCast.Standard, {
		--body = "Hashishin Mintan"       --remove the -- in order to make active
	})
end

---End of Gear---------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------
---------                   ---------
------                         ------
---         Start of Maps         ---
------                         ------
---------                   ---------
------------------------------------- 

-------------------------
--   BLU Spells List   --
-------------------------

--Place spells into either Physical or Magical, and then further seperate them into type--
--Anything In Physical or Magical is only for making a rule, it won't swap simply for being in that category--
function maps()
	--All physical spells go here then they are filtered specifically. Add accordingly.
	PhysicalSpells = S {
		'Asuran Claws', 'Bilgestorm', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
		'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
		'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch', 'Battle Dance', 'Bloodrake',
		'Death Scissors', 'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion',
		'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Amorphic Spikes', 'Barbed Crescent',
		'Claw Cyclone', 'Disseverment', 'Foot Kick', 'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage',
		'Paralyzing Triad', 'Seedspray', 'Sinker Drill', 'Vanity Dive', 'Cannonball', 'Delta Thrust',
		'Glutinous Dart', 'Grand Slam', 'Quad. Continuum', 'Sprout Smack', 'Benthic Typhoon', 'Helldive',
		'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats', 'Heavy Strike'
	}

	PhysicalBlueMagic_STR = S {
		'Asuran Claws', 'Bilgestorm', 'Battle Dance', 'Bludgeon', 'Bloodrake', 'Death Scissors', 
		'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill', 
		'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Saurian Slide', 'Sinal Cleave', 
		'Paralyzing Triad'
	}

	PhysicalBlueMagic_DEX = S {
		'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
		'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Seedspray',
		'Vanity Dive'
	}

	PhysicalBlueMagic_VIT = S {
		'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
		'Sprout Smack', 'Sweeping Gouge'
	}

	PhysicalBlueMagic_AGI = S {
		'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats',
		'Spiral Spin'
	}
	--Heavy Strike has -100 acc penalty--
	BlueMagic_PhysicalAcc = S {
		'Heavy Strike'
	}
	--All nuking spells go here then they are filtered specifically. Add accordingly.
	MagicalSpells = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind',
		'Firespit', 'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Magic Barrier', 'Nectarous Deluge',
		'Polar Roar', 'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm',
		'Spectral Floe', 'Subduction', 'Sudden Lunge', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot',
		'Water Bomb', 'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me', 'Blazing Bound',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush', 'Blinding Fulgor', 'Diffusion Ray', 'Ice Break',
		'Magic Hammer', 'Rail Cannon', 'Retinal Glare', 'Embalming Earth', 'Entomb', 'Sandspin', 'Vapor Spray',
	}
	--Any nuking spell that doesnt have certain armor to enhance it like the pixie hairpin +1 for dark nukes--
	BlueMagic_INT = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind', 'Firespit',
		'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge', 'Polar Roar',
		'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm', 'Spectral Floe',
		'Subduction', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Water Bomb'
	}

	BlueMagic_Dark = S {
		'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush'
	}

	BlueMagic_Light = S {
		'Blinding Fulgor', 'Diffusion Ray', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare'
	}

	--- here if you need it for earth spells but down below, nuking these spells goes to the same int nuke set at others. I don't carry the neck
	BlueMagic_Earth = S {
		'Embalming Earth', 'Entomb', 'Sandspin'
	}

	BlueMagic_Accuracy = S {
		'1000 Needles', 'Absolute Terror', 'Auroral Drape', 'Awful Eye', 'Blastbomb', 'Blank Gaze', 'Blistering Roar', 'Blitzstrahl',
		'Blood Drain', 'Blood Saber', 'Chaotic Eye', 'Cimicine Discharge', 'Cold Wave', 'Digest', 'Corrosive Ooze',
		'Demoralizing Roar', 'Dream Flower', 'Enervation', 'Feather Tickle', 'Filamented Hold', 'Frightful Roar',
		'Geist Wall', 'Hecatomb Wave', 'Infrasonics', 'Light of Penance', 'Lowing', 'Mind Blast', 'Mortal Ray',
		'MP Drainkiss', 'Osmosis', 'Reaving Wind', 'Sheep Song', 'Soporific', 'Sound Blast', 'Stinking Gas',
		'Venom Shell', 'Voracious Trunk', 'Yawn'
	}

	BlueMagic_Breath = S {
		'Bad Breath', 'Flying Hip Press', 'Final Sting', 'Frost Breath', 'Heat Breath', 'Magnetite Cloud',
		'Poison Breath', 'Radiant Breath', 'Self Destruct', 'Thunder Breath', 'Vapor Spray', 'Wind Breath'
	}

	BlueMagic_Buffs = S {
		'Barrier Tusk', 'Cocoon', 'Erratic Flutter', 'Harden Shell', 'Orcish Counterstance',
		'Plasma Charge', 'Pyric Bulwark', 'Memento Mori', 'Nat. Meditation', 'Reactor Cool', 'Saline Coat', 
		'Feather Barrier','Refueling','Warm-Up', 'Zephyr Mantle', 'Reactor Cool', 'Plasma Charge', 'Amplification'
	}

	BlueMagic_Skill = S {
		'Diamondhide', 'Metallic Body', 'Magic Barrier', 'Occultation', 'Atra. Libations'
	}

	BlueMagic_Healing = S {
		'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace', 'Pollen', 'Restoral', 'Wild Carrot'
	}
--- Acc + Macc "Stun" set ---
	BlueMagic_Stun = S {
		'Frypan', 'Head Butt', 'Sudden Lunge', 'Tail slap', 'Sub-zero Smash'
	}
	BlueMagic_Enmity = S {
		'Actinic Burst', 'Exuviation', 'Fantod', 'Jettatura', 'Temporal Shift'
	}
	BlueMagic_Diffusion = S {
		 'Harden Shell', 'Mighty Guard', 'Carcharian Verve', 'Magic Barrier'
	}
end

---End of Maps----------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------
---------                    ---------
------                          ------
---         Start of Rules         ---
------                          ------
---------                    ---------
-------------------------------------- 

-------------------------------
--         Variables         --
-------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
TargetDistance = 0
TH = false
DT = false

--TH rule description--
--TH in this GS works as follows. alt T or macro the command in the toggle to turn it on and off
--It will not equip in your idle set, or while casting buffs, enhancing, cures, skill based BLU spells, diffusion based spells, or blue cures
--It will equip when engaging, and after an action is performed by you it comes off until you re-engage or toggle it on and off.
---You can change this, but I found it silly to full time it.
--If you are idle, and cast either physical blue spells or offensive magical blue spells it will equip on top of your sets
---Diaga and stuff don't apply. Feel free to add it.
--When you return to being strictly idle, it doesn't equip either, becuase that would be pointless.

--So basically, TH gear (add yours in where applicable) comes on when engaging unti a new action is performed, and while idle using physical or offensive magical nukes.

------------------------------------
--         Windower Hooks         --
------------------------------------

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"terror","petrification","sleep","stun"}:contains(name) then
        if gain then
            ChangeGear(sets.Utility.DerpDT) -- Put this set on when terrored etc
        elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
				elseif not LockGearIndex then
					if DT == true then
						ChangeGear(sets.DT[sets.DT.index[DT_ind]])
					else
						ChangeGear(sets.TP[sets.TP.index[TP_ind]])
					end
				end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif name == "doom" then
        if gain then
            send_command('@input /p Doomed {~o~:} !')
        else
			send_command('@input /p Doom is off {^_^}')
        end
	elseif name == "charm" then
		if gain then
			send_command('@input /p Charmed {<3_<3:} !')
		else
			send_command('@input /p Charm is off {~_^}')
		end
	end
	
end

function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end
---------------------------
--         Binds         --
---------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind f10 gs c toggle CDC set')
send_command('bind f11 gs c toggle Other Sword sets')
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 input /ws "Sanguine Blade" <t>')
send_command('bind ^f9 input /ws "Chant du Cygne" <t>') -- ^ means cntrl, so hit cntrl + f9
send_command('bind ^f10 input /ws "Expiacion" <t>')
send_command('bind ^f11 input /ws "Requiescat" <t>')
send_command('bind ^f12 input /ws "Savage Blade" <t>')
send_command('bind !f7 gs c toggle DT set') -- ! means alt
send_command('bind !f8 gs c toggle DT') -- DT on or off
send_command('bind !f9 gs c toggle backwards')
send_command('bind !f10 gs c changemaccmab') -- Toggles macc and mab nuke sets
send_command('bind !f11 gs c toggle Club sets')
send_command('bind !f12 gs c lockgearindex') -- locks your gear in, but allows midcast changes.

send_command('bind !e input /item "Echo Drops" <me>')
-- send_command('bind !r input /item "Remedy" <me>')
send_command('bind !p input /item "Panacea" <me>')
send_command('bind !h input /item "Holy Water" <me>')
send_command('bind !w input /equip ring2 "Warp Ring"; /echo Warping; wait 11; input /item "Warp Ring" <me>;')
send_command('bind !q input /equip ring2 "Dim. Ring (Holla)"; /echo Reisenjima; wait 11; input /item "Dim. Ring (Holla)" <me>;')
send_command('bind !t gs c toggle TH') -- alt + t toggles TH mode

-- Select default macro book on initial load or subjob change.
-- from mote-include?  not defined here
-- set_macro_page(2, 10)

--Unload Binds
function file_unload()
	send_command('unbind ^f8')
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind !f8')
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
	
	send_command('unbind !e')
	send_command('unbind !r')
	send_command('unbind !p')
	send_command('unbind !h')
	send_command('unbind !w')
	send_command('unbind !q')
	send_command('unbind !t')
end
--------------------------------------
--         Console Commands         --
--------------------------------------
function self_command(command)
	if command == 'togglelock' then
		if SetLocked == false then
			SetLocked = true
		msg("Equipment Set LOCKED !!!")
		else
			SetLocked = false
			msg("Equipment Set UNLOCKED!")
		end
	elseif command == 'lockgearindex' then
		if LockGearIndex == false then
			LockGearIndex = truedd
			LockGearSet = {
				ammo = player.equipment.ammo,
				head = player.equipment.head,
				neck = player.equipment.neck,
				ear1 = player.equipment.left_ear,
				ear2 = player.equipment.right_ear,
				body = player.equipment.body,
				hands = player.equipment.hands,
				ring1 = player.equipment.left_ring,
				ring2 = player.equipment.right_ring,
				back = player.equipment.back,
				waist = player.equipment.waist,
				legs = player.equipment.legs,
				feet = player.equipment.feet
			}
			msg("Gear Index Locked")
		else
			LockGearIndex = false
			msg("Gear Index Unlocked")
			if player.status == 'Engaged' then
				if DT == true then
					ChangeGear(sets.DT[sets.DT.index[DT_ind]])
				else
					ChangeGear(sets.TP[sets.TP.index[TP_ind]])
				end
			else
				ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
			end
		end
	end
	if command == 'toggle TP set' then
		if DT == true then
			DT_ind = DT_ind + 1
			if DT_ind > #sets.DT.index then DT_ind = 1 end
			send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
			ChangeGear(sets.DT[sets.DT.index[DT_ind]])
		elseif DT == false then
			TP_ind = TP_ind + 1
			if TP_ind > #sets.TP.index then TP_ind = 1 end
			send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
			if player.status == 'Engaged' then
				ChangeGear(sets.TP[sets.TP.index[TP_ind]])
			end
		end
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
		if player.status == 'Idle' then
			ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
		end
	elseif command == 'toggle CDC set' then
		CDC_ind = CDC_ind + 1
		if CDC_ind > #sets.CDC.index then CDC_ind = 1 end
		send_command('@input /echo <----- CDC Set changed to ' .. sets.CDC.index[CDC_ind] .. ' ----->')
	elseif command == 'toggle Other Sword sets' then
		SavageBlade_ind = SavageBlade_ind + 1
		Expiacion_ind = Expiacion_ind + 1
		Requiescat_ind = Requiescat_ind + 1
		if SavageBlade_ind > #sets.SavageBlade.index then SavageBlade_ind = 1 end
		if Expiacion_ind > #sets.Expiacion.index then Expiacion_ind = 1 end
		if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
		send_command('@input /echo <----- Savage/Expiacion/Req Set changed to ' .. sets.SavageBlade.index[SavageBlade_ind] .. ' ----->')
	elseif command == 'toggle Club sets' then
		BlackHalo_ind = BlackHalo_ind + 1
		Realmrazer_ind = Realmrazer_ind + 1
		Judgement_ind = Judgement_ind + 1
		FlashNova_ind = FlashNova_ind + 1
		if BlackHalo_ind > #sets.BlackHalo.index then BlackHalo_ind = 1 end
		if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
		if Judgement_ind > #sets.Judgement.index then Judgement_ind = 1 end
		if FlashNova_ind > #sets.FlashNova.index then FlashNova_ind = 1 end
		send_command('@input /echo <----- All Club WS Sets changed to ' .. sets.BlackHalo.index[BlackHalo_ind] .. ' ----->')
	elseif command == 'toggle DT set' then
		DT_ind = DT_ind + 1
		if DT_ind > #sets.DT.index then DT_ind = 1 end
		send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
			if DT == true then
				ChangeGear(sets.DT[sets.DT.index[DT_ind]])
			end
	elseif command == 'toggle DT' then
		if DT == true then
			DT = false
			send_command('@input /echo <----- DT TP: [Off] ----->')
        else
			DT = true
			send_command('@input /echo <----- DT TP: [On] ----->')
		end
		status_change(player.status)
	elseif command == 'toggle TH' then
		if TH == true then
			TH = false
			send_command('@input /echo <----- Treasure Hunter TP: [Off] ----->')
        else
			TH = true
			send_command('@input /echo <----- Treasure Hunter TP: [On] ----->')
		end
		status_change(player.status)
	elseif command == 'toggle backwards' then
		if DT == true then
			DT_ind = DT_ind -1
        if DT_ind == 0 then
            DT_ind = #sets.DT.index
        end
        send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
        ChangeGear(sets.DT[sets.DT.index[DT_ind]])
    elseif DT == false then
        TP_ind = TP_ind -1
        if TP_ind == 0 then
            TP_ind = #sets.TP.index
        end
		send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
        if player.status == 'Engaged' then
            ChangeGear(sets.TP[sets.TP.index[TP_ind]])
        end
    end
	elseif command == 'changemaccmab' then
		MAB_ind = MAB_ind + 1
		if MAB_ind > #sets.BlueMagic.INT.index then MAB_ind = 1 end
		send_command('@input /echo <-----Blue Magic INT Type Changed To: ' .. sets.BlueMagic.INT.index[MAB_ind] .. '----->')
	elseif string.sub(command, 0, 4) == '-cd ' then     --If the first 4 characters of the command are '-cd '
        add_to_chat (30, string.sub(command, 5, string.len(command)))      --add everything after '-cd ' to a message in the chat
	end
	
end

--------------------------------------
--         Character States         --
--------------------------------------
function IdleState()
    if LockGearIndex then
		ChangeGear(LockGearSet)
	elseif DT == true then
		ChangeGear(sets.DT[sets.DT.index[DT_ind]])
	else
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
	end
	
	if player.mpp <= 50 and Idle_ind == 1 then
        ChangeGear({waist = "Fucho-no-obi"})
    end
	
end

function RestingState()

end

function EngagedState()
    if LockGearIndex then
        ChangeGear(LockGearSet)
	elseif not LockGearIndex then
		if DT == true then
			ChangeGear(sets.DT[sets.DT.index[DT_ind]])
		else
			ChangeGear(sets.TP[sets.TP.index[TP_ind]])
		end
    end
end

-----------------------------
--      Spell control      --
-----------------------------
unusable_buff = {
	spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
    ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}
  --check_recast('ability',spell.recast_id)  check_recast('spell',spell.recast_id)
function check_recast(typ,id) --if spell can be cast(not in recast) return true
    local recasts = windower.ffxi['get_'..typ..'_recasts']()
    if id and recasts[id] and recasts[id] == 0 then
        return true
    else
        return false
    end
end

 --return true if spell/ability is unable to be used at this time
function spell_control(spell)
	if spell.type == "Item" then
		return false
	--Stops spell if you do not have a target
	elseif spell.target.name == nil and not spell.target.raw:contains("st") then
		return true
	--Stops spell if a blocking buff is active
	elseif spell.action_type == 'Ability' and spell.type ~= 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability) or not check_recast('ability',spell.recast_id)) then
		return true
	elseif spell.type == 'WeaponSkill' and player.tp < 1000 then
		return true
	elseif spell.type == 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability)) then
		msg("Weapon Skill Canceled, Can't")
		return true
	elseif spell.action_type == 'Magic' and (has_any_buff_of(unusable_buff.spell)
      or not check_recast('spell',spell.recast_id)) then
		return true
    --Stops spell if you do not have enuf mp/tp to use
	elseif spell.mp_cost and spell.mp_cost > player.mp and not has_any_buff_of({'Manawell','Manafont'}) then
        msg("Spell Canceled, Not Enough MP")
		return true
	end
    --Calculate how many finishing moves your char has up to 6
	local fm_count = 0
	for i, v in pairs(buffactive) do
		if tostring(i):startswith('finishing move') or tostring(i):startswith('?????????') then
			fm_count = tonumber(string.match(i, '%d+')) or 1
		end
	end
    --Stops flourishes if you do not have enough finishing moves
	local min_fm_for_flourishes = {['Animated Flourish']=1,['Desperate Flourish']=1,['Violent Flourish']=1,['Reverse Flourish']=1,['Building Flourish']=1,
                                   ['Wild Flourish']=2,['Climactic Flourish']=1,['Striking Flourish']=2,['Ternary Flourish']=3,}
	if min_fm_for_flourishes[spell.en] then
		if min_fm_for_flourishes[spell.en] > fm_count and not buffactive[507] then
			return true
		end
	end
	--Reomves Sneak when casting Spectral Jig
	if spell.en == 'Spectral Jig' then
		send_command('cancel 71')
	end
	if player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 7 and spell.type == 'WeaponSkill' then
		msg("Weapon Skill Canceled  Target Out of Range")
		return true
	end
end

-----------------------------
--         Precast         --
-----------------------------
function pc_JA(spell, act)
	if spell.english == 'Azure Lore' then
		ChangeGear(sets.JA.AzureLore)
	elseif spell.english == 'Provoke' then
		ChangeGear(sets.JA.Provoke)
	elseif spell.english == 'Warcry' then
		ChangeGear(sets.JA.Warcry)
	end
	
	IgnoreWS = S { "Sanguine Blade", "Red Lotus Blade", "Seraph Blade", "Flash Nova", "Realmrazer" } -- Excluded from Moonshade TP override rule.
	
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Requiescat' then
			ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
		elseif spell.english == 'Chant du Cygne' or spell.english == 'Vorpal Blade' then
			ChangeGear(sets.CDC[sets.CDC.index[CDC_ind]])
		elseif spell.english == 'Expiacion' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Savage Blade' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'True Strike' or spell.english == 'Judgment' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Realmrazer' then
			ChangeGear(sets.Realmrazer[sets.Realmrazer.index[Realmrazer_ind]])
		elseif spell.english == 'Judgement' then
			ChangeGear(sets.Judgement[sets.Judgement.index[Judgement_ind]])
		elseif spell.english == 'Black Halo' then
			ChangeGear(sets.BlackHalo[sets.BlackHalo.index[BlackHalo_ind]])
		elseif spell.english == 'Flash Nova' or spell.english == 'Red Lotus Blade' or spell.english == 'Seraph Blade' then
			ChangeGear(sets.FlashNova[sets.FlashNova.index[FlashNova_ind]])
		elseif spell.english == 'Circle Blade' then
			ChangeGear(sets.CircleBlade)
		elseif spell.english == 'Sanguine Blade' then
			ChangeGear(sets.SanguineBlade)
		end
		if player.tp > 2025 and player.equipment.main == 'Sequence' and buffactive['TP Bonus'] then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !!!!")
			end
		elseif player.tp > 2275 and player.equipment.main == 'Sequence' then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !!!")
			end
		elseif player.tp > 2550 and buffactive['TP Bonus'] then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !!")
			end
		elseif player.tp > 2775 then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !")
			end
		end
	elseif player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 8 and spell.type == 'WeaponSkill' then
		cancel_spell()
		msg("Weapon Skill Canceled  Target Out of Range")
	end

    if spell.type == 'Step' then
        ChangeGear(set_combine(sets.TP.AccuracyFull, sets.Utility.TH))
    elseif spell.english == 'Animated Flourish' then
        ChangeGear(sets.BlueMagic.Enmity)
    end
end

function pc_Magic(spell, act)
	if spell.skill == 'Blue Magic' then
		ChangeGear(sets.precast.FastCast.Blue)
	else
		ChangeGear(sets.precast.FastCast.Standard)
	end
end

function pc_Item(spell, act)
end


-----------------------------
--         Midcast         --
-----------------------------
function mc_JA(spell, act)
end

function mc_Magic(spell, act)
	if spell.skill == 'Healing Magic' then
		if spell.target and spell.target.type == 'SELF' then
			ChangeGear(sets.BlueMagic.SelfCures)
		else
			ChangeGear(sets.BlueMagic.Cures)
		end
	end
	if spell.skill == 'Enhancing Magic' then
		if spell.english == 'Refresh' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
			ChangeGear(sets.Enhancing.ProShell)
		elseif spell.english=="Phalanx" then
			ChangeGear(sets.Enhancing.Phalanx)
		elseif spell.english=="Aquaveil" then
			ChangeGear(sets.Enhancing.Aquaveil)
		else
			ChangeGear(sets.Enhancing)
		end
	end
	if spell.skill == 'Divine Magic' then
		if spell.english == 'Flash' then
			ChangeGear(sets.BlueMagic.Enmity)
		else
			ChangeGear(sets.BlueMagicMagicAccuracy)
		end
	end
	if spell.skill == 'Enfeebling Magic' then
		ChangeGear(sets.BlueMagic.MagicAccuracy)
	end
	if spell.skill == 'Dark Magic' then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
	elseif spell.skill == 'Elemental Magic' then
		ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
	end
	if spell.skill == 'Blue Magic' then
		if spell.english == 'Battery Charge' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif spell.english == 'Regeneration' or string.find(spell.english,'Regen') then
			ChangeGear(sets.BlueMagic.Regeneration)
		else
			ChangeGear(sets.precast.FastCast.Blue)
		end
	end
		if BlueMagic_Diffusion:contains(spell.english) then
			ChangeGear(sets.JA.Diffusion)
		end
		
		if PhysicalSpells:contains(spell.english) then
			if PhysicalBlueMagic_STR:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STR)
			elseif PhysicalBlueMagic_DEX:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRDEX)
			elseif PhysicalBlueMagic_VIT:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRVIT)
			elseif PhysicalBlueMagic_AGI:contains(spell.english) then
				ChangeGear(sets.BlueMagic.AGI)
			elseif BlueMagic_PhysicalAcc:contains(spell.english) then
				ChangeGear(sets.BlueMagic.HeavyStrike)
			end
			if buffactive['Chain Affinity'] then
				ChangeGear(sets.JA.ChainAffinity)
			end
			if buffactive['Efflux'] then
				ChangeGear(sets.JA.Efflux)
			end
		end
		
		        if MagicalSpells:contains(spell.english) then
            if BlueMagic_INT:contains(spell.english) then
                ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
            elseif BlueMagic_Dark:contains(spell.english) then
                ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]],{head = "Pixie Hairpin +1", ring1 = "Archon Ring", waist="Anrin obi"}))
            elseif BlueMagic_Light:contains(spell.english) then
					ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]],{
					--	ring2 = "Weatherspoon Ring"
					}))
            elseif BlueMagic_Earth:contains(spell.english) then
                ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]],{
				--	neck = "Quanpur Necklace"
				}))
            end
			
            if buffactive['Burst Affinity'] then
                ChangeGear(sets.JA.BurstAffinity)
            end
            if world.day_element == spell.element or world.weather_element == spell.element then
                ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], { waist = 'Hachirin-no-Obi' }))
            end
        end

		if BlueMagic_Accuracy:contains(spell.english) then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
		elseif BlueMagic_Stun:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Stun)
		elseif BlueMagic_Enmity:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Enmity)
		elseif BlueMagic_Buffs:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Buffs)
		elseif BlueMagic_Skill:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Skill)
		elseif buffactive.Diffusion then
			ChangeGear(sets.JA.Diffusion)
		elseif spell.english == 'White Wind' then
			ChangeGear(sets.BlueMagic.WhiteWind)
		elseif BlueMagic_Healing:contains(spell.english) then 
			if spell.target and spell.target.type == 'SELF' then
				ChangeGear(sets.BlueMagic.SelfCures)
			else
				ChangeGear(sets.BlueMagic.Cures)
			end
		end
	end	


function mc_Item(spell, act)
end


------------------------------------------
-- After Cast               --
------------------------------------------
function ac_JA(spell)
end

function ac_Magic(spell)
end

function ac_Item(spell)
end

function ac_Global()
    if LockGearIndex == true then
        ChangeGear(LockGearSet)
        msg("Lock Gear is ON -- Swapping Gear")
    else
        if player.status == 'Engaged' then
            EngagedState()
        else
            IdleState()
        end
    end
end
---Based off of Spicyryan of Asura's .lua https://pastebin.com/u/Spicyryan
------------------------------------------
-- Framework Core            --
------------------------------------------
function status_change(new, old)
	if new == 'Idle' then
		IdleState()
	elseif new == 'Resting' then
		RestingState()
	elseif new == 'Engaged' then
		EngagedState();
	end
	
	if player.status == 'Engaged' and TH == true then
		ChangeGear(set_combine(equipSet, sets.Utility.TH))			
	end
	
	if DT == true then
		ChangeGear(sets.DT[sets.DT.index[DT_ind]])
	end
end

function precast(spell, act)
    if spell_control(spell) then
        cancel_spell()
        return
    end
    if spell.action_type == 'Ability' then 
        pc_JA(spell, act)
    elseif spell.action_type == 'Magic' then
        pc_Magic(spell, act)
    else
        pc_Item(spell, act)
    end
end

function midcast(spell, act)
	if spell.action_type == 'Ability' then
		mc_JA(spell, act)
	elseif spell.action_type == 'Magic' then 
		if TH == true and player.status == 'Idle' then
			if BlueMagic_Buffs:contains(spell.english) or BlueMagic_Diffusion:contains(spell.english) or BlueMagic_Healing:contains(spell.english) or BlueMagic_Skill:contains(spell.english) or spell.skill == 'Enhancing Magic' or spell.skill == 'Healing Magic' then
				mc_Magic(spell, act)
			elseif PhysicalSpells:contains(spell.english) then
				ChangeGear(set_combine(sets.BlueMagic.STR, sets.Utility.TH))
			elseif MagicalSpells:contains(spell.english) then
				ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], sets.Utility.TH))
			end
		else 
			mc_Magic(spell, act)
		end
	else
		mc_Item(spell, act)
	end

end

function aftercast(spell, act, spellMap, eventArgs)
	if spell.action_type == 'Ability' then
		ac_JA(spell)
	elseif spell.action_type == 'Magic' then
		ac_Magic(spell)
	else
		ac_Item(spell)
	end
	ac_Global()
	
	--Countdowns--
	if not spell.interrupted then
        if spell.english == "Sheep Song" then
            send_command('wait 30;gs c -cd '..spell.name..': [Off In 10~30 Seconds!];wait 10;gs c -cd '..spell.name..': [Off In 0~20 Seconds!]')
            send_command('timers create "Sheep Song" 40 down')
        elseif spell.english == "Yawn" then
            send_command('wait 60;gs c -cd '..spell.name..': [Off In 10~30 Seconds!];wait 10;gs c -cd '..spell.name..': [Off In 0~20 Seconds!]')
            send_command('timers create "Yawn" 70 down')
        elseif spell.english == "Dream Flower" then
            send_command('wait 80;gs c -cd '..spell.name..': [Off In 10~40 Seconds!];wait 10;gs c -cd '..spell.name..': [Off In 0~30 Seconds!]')
            send_command('timers create "Dream Flower" 90 down')
       elseif spell.english == "Entomb" then
            send_command('timers create "Entomb Petrification" 60 down')
        end 
    end
	
end

function ChangeGear(GearSet)
	equipSet = GearSet
	equip(GearSet)
end

function LockGearSet(GearSet)
	LockedEquipSet = GearSet
	equip(GearSet)
	SetLocked = true
end

function UnlockGearSet()
	locked = false
	equip(equipSet)
end

function msg(str)
	send_command('@input /echo <----- ' .. str .. ' ----->')
end

---End of Rules---------------------------------------------------------------------------------------------------------------------------------------------------------