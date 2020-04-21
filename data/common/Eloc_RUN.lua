
--==============================================================--
--      __                       ___                            --
--     /  |                     /                               --
--    (___|      ___  ___      (___  ___  ___  ___  ___  ___    --
--    |\   |   )|   )|___)     |    |___)|   )|    |___)|   )   --
--    | \  |__/ |  / |__       |    |__  |  / |__  |__  |       --
--==============================================================--

-- Eloc's rune fencer lua (2020-03-31)


-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
	
	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('organizer-lib')
end

-- Setup vars that are user-independent.
function job_setup()
    -- entry = rune, index, expires
	
    state.Buff.Doom = buffactive.Doom or false

    if player.main_job_level >= 65 then
        max_runes = 3
    elseif player.main_job_level >= 35 then
        max_runes = 2
    elseif player.main_job_level >= 5 then
        max_runes = 1
    else
        max_runes = 0
    end
end

--================================================--
--                                                --
--      |     |        ,---.     |                --
--      |,---.|---.    `---.,---.|--- .   .,---.  --
--      ||   ||   |        ||---'|    |   ||   |  --
--  `---'`---'`---'    `---'`---'`---'`---'|---'  --
--                                         |      --
--================================================--

function user_setup()
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'Resist', 'Hybrid', 'PDT', 'DT')
    state.PhysicalDefenseMode:options('PDT', 'DT', 'Resist')
    state.IdleMode:options('Normal', 'PDT', 'DT')
    -- include("Eloc_Shared.lua")
	select_default_macro_book(6)
    send_command('wait 6;input /lockstyleset 16')
end

function init_gear_sets()

	--Capes
	
	RUN_FC = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
	RUN_Reso = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	RUN_ENM = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Mag. Evasion+15',}}
	RUN_DEX = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    
	sets.enmity = {
    ammo="Sapience Orb",
    head="Rabid Visor",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Moonbeam Necklace",
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Friomisi Earring",
    left_ring="Eihwaz Ring",
    right_ring="Petrov Ring",
	back=RUN_ENM}

--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--

    sets.idle = {
    ammo="Staunch Tathlum",
    head="Meghanada Visor +2",
    body="Futhark Coat +3",
    hands="Regal Gauntlets",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Sheltered Ring",
    right_ring="Shneddick Ring",
    back="Moonbeam Cape",}
	
	sets.idle.Town = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body="Futhark Coat +3",
    hands="Regal Gauntlets",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Twilight Torque",
    waist="Gold Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonbeam Cape"}
    
    sets.idle.Weak = {
    ammo="Staunch Tathlum",
    head="Meghanada Visor +2",
    body="Futhark Coat +3",
    hands="Regal Gauntlets",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Sheltered Ring",
    right_ring="Shneddick Ring",
    back="Moonbeam Cape",}

	sets.idle.PDT = {
    ammo="Staunch Tathlum",
    head="Fu. Bandeau +1",
    body="Futhark Coat +3",
    hands="Turms Mittens",
    legs="Eri. Leg Guards +1",
    feet="Turms Leggings",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Eabani Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back=RUN_Reso}

	sets.idle.DT = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body="Futhark Coat +3",
    hands="Regal Gauntlets",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Twilight Torque",
    waist="Gold Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonbeam Cape"}
		

	sets.latent_refresh = {waist="Fucho-no-obi"}
		
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

    sets.engaged = {
    ammo="Yamarang",
    head="Adhemar Bonnet +1",
	body="Adhemar Jacket +1",
    hands=Adhemar_TP,
    legs="Samnuha Tights",
    feet=Herc_Feet_TP,
    neck="Lissome Necklace",
    waist="Ioskeha Belt",
    left_ear="Cessance Earring",
    right_ear="Sherida Earring",
    left_ring="Epona's Ring",
    right_ring="Niqmaddu Ring",
    back=RUN_Reso}
	
    sets.engaged.Resist = {
    ammo="Yamarang",
    head="Turms Cap",
    body="Runeist's Coat +3",
    hands="Turms Mittens",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Moonbeam Necklace",
    waist="Carrier's Sash",
    left_ear="Flashward Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back=RUN_ENM}
	
	sets.engaged.Hybrid = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body="Futhark Coat +3",
    hands=Adhemar_TP,
    legs="Meg. Chausses +2",
    feet=Herc_Feet_TP,
    neck="Twilight Torque",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back=RUN_Reso}
	
	sets.engaged.PDT = {
    ammo="Staunch Tathlum",
    head="Turms Cap",
    body="Runeist's Coat +3",
    hands="Regal Gauntlets",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back=RUN_Reso}
    
	sets.engaged.DT = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back="Moonbeam Cape",}
	
	sets.Adoulin = {body="Councilor's Garb",}
	
	sets.MoveSpeed = {right_ring="Shneddick Ring",}
	

--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--

	sets.precast.WS = {
    ammo="Knobkierrie",
    head="Adhemar Bonnet +1",
    body=Herc_Body_WSD,
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet=Herc_Feet_STR,
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=RUN_Reso}

    sets.precast.WS['Resolution'] = {
    ammo="Aurgelmir Orb",
    head="Adhemar Bonnet +1",
    body="Ayanmo Corazza +2",
    hands="Adhemar Wristbands",
    legs="Meg. Chausses +2",
    feet=Herc_Feet_STR,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=RUN_Reso}
	
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Normal, {})
	
    sets.precast.WS['Dimidiation'] = {
    ammo="Knobkierrie",
    head="Adhemar Bonnet +1",
    body=Herc_Body_WSD,
    hands=Adhemar_TP,
    legs="Samnuha Tights",
    feet=Herc_Feet_Dex,
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=RUN_DEX}
	
	sets.precast.WS['Ground Slash'] = {
			ammo="Knobkierrie",
			head=Herc_Head_DEX,
			body=Herc_Body_WSD,
			hands="Meg. Gloves +2",
			legs=Herc_Legs_MAB,
			feet=Herc_Feet_Dex,
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Ishvara Earring",
			right_ear="Brutal Earring",
			left_ring="Niqmaddu Ring",
			right_ring="Regal Ring",
			back=RUN_DEX}
	
	sets.precast.WS['Shockwave'] = {
    ammo="Pemphredo Tathlum",
    head="Adhemar Bonnet +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Archon Ring",
    right_ring="Ayanmo Ring",
    back=RUN_DEX}
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {hands="Umuthi Gloves"})
	
	
	
--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--

	-- Precast sets to enhance JAs
    
	sets.precast.JA['Vallation'] = set_combine(sets.enmity, {
    body="Runeist's Coat +3",
	back=RUN_ENM,
	legs="Futhark trousers +1"})
    
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    
	sets.precast.JA['Pflug'] = set_combine(sets.enmity, {
    feet="Runeist's Boots +3",})
    
	sets.precast.JA['Battuta'] = set_combine(sets.enmity, {
	head="Fu. Bandeau +1"})
    
	sets.precast.JA['Liement'] = set_combine(sets.enmity, {
	body="Futhark Coat +3"})
    
	sets.precast.JA['Lunge'] = set_combine(sets.enmity, {})
    
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    
	sets.precast.JA['Gambit'] = set_combine(sets.enmity, {
    hands="Runeist's Mitons +2",})
    
	sets.precast.JA['Rayke'] = set_combine(sets.enmity, {
	feet="Futhark Boots +1"})
    
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.enmity, {
	body="Futhark Coat +3"})
    
	sets.precast.JA['Swordplay'] = set_combine(sets.enmity, {
	hands="Futhark Mitons +1"})
    
	sets.precast.JA['Embolden'] = set_combine(sets.enmity, {
	back="Evasionist's Cape"})
    
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.enmity, {
    legs="Rune. Trousers +1",
	head="Erilaz Galea +1"})
    
	sets.precast.JA['One For All'] = set_combine(sets.enmity, {})
    
	sets.precast.JA['Provoke'] = sets.enmity
		
	sets.midcast.Emnity = {
    ammo="Sapience Orb",
    head="Rabid Visor",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Moonbeam Necklace",
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Friomisi Earring",
    left_ring="Eihwaz Ring",
    right_ring="Vengeful Ring",
	back=RUN_ENM}

	sets.midcast.Provoke = sets.enmity
		
	-- Fast cast sets for spells
	
    sets.precast.FC = {
    ammo="Sapience Orb",
	head="Rune. Bandeau +3",
    body="Taeon Tabard",
    hands="Leyline Gloves",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Voltsurge Torque",
    waist="Hachirin-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back=RUN_FC}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
	
	sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {neck="Magoraga beads", back="Mujin Mantle"})
	
	sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})


--=====================================================================================================================================
--                                               ========== Defense ==============
--=====================================================================================================================================

    
    sets.defense.PDT = {
    ammo="Staunch Tathlum",
    head="Turms Cap",
    body="Runeist's Coat +3",
    hands="Regal Gauntlets",
    legs="Eri. Leg Guards +1",
    feet="Turms Leggings",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back=RUN_Reso}
	
	sets.defense.DT = {
    ammo="Staunch Tathlum",
    head="Turms Cap",
    body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Regal Gauntlets",
    legs="Eri. Leg Guards +1",
    feet="Turms Leggings",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back=RUN_Reso}
	
	sets.defense.Resist = {
    ammo="Yamarang",
    head="Turms Cap",
    body="Runeist's Coat +3",
    hands="Turms Mittens",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Moonbeam Necklace",
    waist="Carrier's Sash",
    left_ear="Flashward Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back=RUN_ENM}



--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--


    sets.midcast.FastRecast = {
    ammo="Staunch Tathlum",
    head=Taeon_SIRD,
    body="Taeon Tabard",
    hands="Taeon Gloves",
    legs="Carmine Cuisses +1",
    feet="Taeon Boots",
    neck="Moonbeam Necklace",
    waist="Resolute Belt",
    left_ear="Cryptic Earring",
    right_ear="Ethereal Earring",
    left_ring="Eihwaz Ring",
    right_ring="Evanescence Ring",
    back=RUN_FC}
	
    sets.midcast['Enhancing Magic'] = {
    ammo="Staunch Tathlum",
    head="Carmine Mask",
    body="Ayanmo Corazza +2",
    hands="Regal Gauntlets",
    legs="Futhark Trousers +1",
    feet="Aya. Gambieras +2",
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Andoaa Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back="Moonbeam Cape",}
    
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
	head="Fu. Bandeau +1",
    body="Taeon Tabard",
    hands="Taeon Gloves",
    legs="Taeon Tights",
    feet="Taeon Boots",})
    
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {head="Rune. Bandeau +3",
		legs="Futhark Trousers +1"})
    
	sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash"})
    
	sets.midcast.Cure = set_combine(sets.midcast.Flash, {
		neck="Phalaina Locket", 
		hands="Buremte Gloves",
		ring1="Ephedra Ring",
		ring2="Ephedra Ring", 
		feet="Futhark Boots +1",
		left_ear="Mendicant's Earring",
		back=RUN_ENM})
	
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
	head="Erilaz Galea +1", 
	waist="Gishdubar Sash"})

	sets.midcast.Flash = {
    ammo="Sapience Orb",
    head="Rabid Visor",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Moonbeam Necklace",
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Friomisi Earring",
    left_ring="Eihwaz Ring",
    right_ring="Petrov Ring",
	back=RUN_ENM}
	
	sets.midcast['Foil'] = set_combine(sets.midcast.Flash, {})
	
    sets.midcast.Stun = set_combine(sets.midcast.Flash, {})
	sets.buff.Doom = {left_ring="Saida Ring",right_ring="Purity Ring"}
	
	end
	
--==================================================================--
--   _____                          _     _                         --
--  |  ___|  _   _   _ __     ___  | |_  (_)   ___    _ __    ___   --
--  | |_    | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|  --
--  |  _|   | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \  --
--  |_|      \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/  --
--==================================================================--


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        local obi = get_obi(get_rune_obi_element())
        if obi then
            equip({waist=obi})
        end
    end
end

function job_buff_change(buff, gain)
  if buff == "Embolden" and gain then
    -- add_to_chat("Gained embolden")
	equip({head="Erilaz Galea +1",hands="Regal Gauntlets",legs="Futhark Trousers +1"})
  end
end

function customize_idle_set(idleSet)    
    if buffactive.embolden then
	    -- add_to_chat(133, "Embolden Active")
        idleSet= set_combine(idleSet, {head="Erilaz Galea +1",hands="Regal Gauntlets",legs="Futhark Trousers +1"})
    end
	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
		end
    
    if buffactive.embolden then
        meleeSet= set_combine(meleeSet, {head="Erilaz Galea +1",hands="Regal Gauntlets",legs="Futhark Trousers +1"})
    end
 
    return meleeSet
end

function customize_defense_set(defenseSet)
    if buffactive.embolden then
        defenseSet= set_combine(defenseSet, {head="Erilaz Galea +1",hands="Regal Gauntlets",legs="Futhark Trousers +1"})
    end
	return defenseSet
end

function job_midcast(spell, action, spellMap, eventArgs)
	if spell.english == 'Jettatura' or spell.english == 'Geist Wall' 
	or spell.english == 'Stun' or spell.english == 'Foil' 
	or spell.english == 'Soporific' or spell.english == 'Blank Gaze' 
	or spell.english == 'Sheep Song' or spell.english == 'Chaotic Eye' 
	or spell.english == 'Cursed Sphere' or spell.english == 'Flash' then
	equip(sets.midcast.Flash)
	end
	end
	

function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
	
    add_to_chat(122, msg)

    eventArgs.handled = true
end
--=-----------------------------=--
--          __   __   __   __    --
--    /|/| /  | /    /  | /  |   --
--   ( / |(___|(    (___|(   |   --
--   |   )|   )|   )|\   |   )   --
--   |  / |  / |__/ | \  |__/    --
--=-----------------------------=--

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(7, 6)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 6)
	elseif player.sub_job == 'SAM' then
		set_macro_page(3, 6)
	else
		set_macro_page(1, 6)
	end
end


function get_rune_obi_element()
    weather_rune = buffactive[elements.rune_of[world.weather_element] or '']
    day_rune = buffactive[elements.rune_of[world.day_element] or '']

    local found_rune_element

    if weather_rune and day_rune then
        if weather_rune > day_rune then
            found_rune_element = world.weather_element
        else
            found_rune_element = world.day_element
        end
    elseif weather_rune then
        found_rune_element = world.weather_element
    elseif day_rune then
        found_rune_element = world.day_element
    end

    return found_rune_element
end

function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end