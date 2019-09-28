--[[
        Custom commands:
    
        Toggle Function: 
        gs c toggle melee               Toggle Melee mode on / off and locking of weapons
        gs c toggle mb                  Toggles Magic Burst Mode on / off.
        gs c toggle runspeed            Toggles locking on / off Herald's Gaiters
 		gs c toggle idlemode            Toggles between MasterRefresh or MasterDT when no luopan is out
										or between Full Pet Regen+DT or Hybrid PetDT and MasterDT when a Luopan is out.
		
        Casting functions:
        these are to set fewer macros (2 cycle, 5 cast) to save macro space when playing lazily with controler
        
        gs c nuke cycle              	Cycles element type for nuking & SC
		gs c nuke cycledown				Cycles element type for nuking & SC	in reverse order
        gs c nuke t1                    Cast tier 1 nuke of saved element 
        gs c nuke t2                    Cast tier 2 nuke of saved element 
        gs c nuke t3                    Cast tier 3 nuke of saved element 
        gs c nuke t4                    Cast tier 4 nuke of saved element 
        gs c nuke t5                    Cast tier 5 nuke of saved element 
        gs c nuke ra1                   Cast tier 1 -ra nuke of saved element 
        gs c nuke ra2                   Cast tier 2 -ra nuke of saved element 
        gs c nuke ra3                   Cast tier 3 -ra nuke of saved element 	
		
		gs c geo geocycle				Cycles Geomancy Spell
		gs c geo geocycledown			Cycles Geomancy Spell in reverse order
		gs c geo indicycle				Cycles IndiColure Spell
		gs c geo indicycledown			Cycles IndiColure Spell in reverse order
		gs c geo geo					Cast saved Geo Spell
		gs c geo indi					Cast saved Indi Spell
--]]

include('Raznor-oldglobals.lua')
gear = {}             -- define global sets, this would be automatic with Mote base
define_global_sets() 

-- Optional. Swap to your sch macro sheet / book
set_macros(2,12) -- Sheet, Book   

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- to define sets for regen if you add more modes, name them: sets.midcast.regen.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = {'normal', 'dt', 'mdt'}
-- Setting this to true will stop the text spam, and instead display modes in a UI.
-- Currently in construction.
use_UI = true
hud_x_pos = 1400    --important to update these if you have a smaller screen
hud_y_pos = 200     --important to update these if you have a smaller screen
hud_draggable = true
hud_font_size = 10
hud_transparency = 200 -- a value of 0 (invisible) to 255 (no transparency at all)

geoId = 13      -- Geo Spell Default 13 = Frailty (when you first load lua / change jobs the saved spells is this one)
indiId = 16     -- Indi Spell Default 16 = Haste  (when you first load lua / change jobs the saved spells is this one)

-- See below for what number is which spell
--[[
    0       Acumen
    1       Attunement 
    2       Barrier
    3       STR 
    4       DEX 
    5       VIT 
    6       AGI 
    7       INT 
    8       MND 
    9       CHR 
    10      Fade
    11      Fend 
    12      Focus
    13      Frailty 
    14      Fury
    15      Gravit 
    16      Haste
    17      Languor 
    18      Malaise
    19      Paralysis
    20      Poison
    21      Precision
    22      Refresh
    23      Regen 
    24      Slip
    25      Slow
    26      Torpor
    27      Vex
    28      Voidance 
    29      Wilt
]]--

-- Setup your Key Bindings here:  
    windower.send_command('bind home gs c geo geocycle') 			-- home Cycles Geomancy Spell
    windower.send_command('bind end gs c geo geocycledown') 		-- end Cycles Geomancy Spell in reverse order	
    windower.send_command('bind PAGEUP  gs c geo indicycle') 		-- PgUP Cycles IndiColure Spell
    windower.send_command('bind PAGEDOWN  gs c geo indicycledown') 	-- PgDown Cycles IndiColure Spell in reverse order	
    windower.send_command('bind f9 gs c toggle runspeed') 			-- F9 toggles locking on / off Herald's Gaiters
	windower.send_command('bind f10 gs c toggle mb')				-- F10 toggles Magic Burst Mode on / off.
    windower.send_command('bind f12 gs c toggle melee')				-- F12 Toggle Melee mode on / off and locking of weapons
	windower.send_command('bind !` gs c toggle idlemode')			-- Alt-` Toggles between MasterRefresh or MasterDT when no luopan is out
																	-- or between Full Pet Regen+DT or Hybrid PetDT and MasterDT when a Luopan is out
    windower.send_command('bind !q gs c geo geo')			-- Alt-q -- geo spell
	windower.send_command('bind !w gs c geo indi')			-- Alt-w -- indi spell
-- Remember to unbind your keybinds on job change.
function user_unload()
    send_command('unbind home')
    send_command('unbind end')
    send_command('unbind PAGEUP')
    send_command('unbind PAGEDOWN')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind f9')
    send_command('unbind !`')
	send_command('unbind !q')
	send_command('unbind !w')
end

-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my.pan's behaviour or abilities are under .pan', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.pan = {}       -- leave this empty
	sets.me.idle = {}	-- leave this empty    
	sets.pan.idle = {}	-- leave this empty 

	-- sets starting with sets.me means you DONT have a luopan currently out.
	-- sets starting with sets.pan means you DO have a luopan currently out.

	
    -- Your idle set when you DON'T have a luopan out
    sets.me.idle.normal = {
	  feet="Geomancy Sandals", -- movement speed +12%
	  neck="Loricate Torque",
      left_ring="Defending Ring",
    }
	
	-- This or herald gaiters or +1 +2 +3... 
	sets.me.movespeed = {feet="Geomancy Sandals"}	
	
    -- Your idle MasterDT set (Notice the sets.me, means no Luopan is out)
    sets.me.idle.dt = set_combine(sets.me.idle.normal,{
		neck="Twilight Torque",	
		right_ring="Defending Ring",
		back="Moonbeam Cape",
    })
	
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 

    }
	
	sets.me.latent_refresh = {waist="Fucho-no-obi"}
	
	
    -----------------------
    -- Luopan Perpetuation
    -----------------------
      
    -- Luopan's Out --  notice sets.pan 
    -- This is the base for all perpetuation scenarios, as seen below
    sets.pan.idle.normal = set_combine(sets.me.idle.normal, {
      main="Idris",
	  -- missing offhand shield - Genmei/Genbu
      ammo="Staunch Tathlum", -- +1
      head="Azimuth Hood +1", 
      body="jhakri robe +2",    -- Telchine w/+3 pet regen (leaf orb), Meva (snow not orb), duskdim (enhancing magic duration)
      hands="Geo. Mitaines +1", -- +3 these eventually
      legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','Magic burst dmg.+11%','INT+6','Mag. Acc.+15',}},
	   -- Legs - Telchine
      feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}}, -- 3 regen, can +3 for 5.. ~10M for +2, more for +3
       neck="Bagua Charm +1", -- "Loricate Torque",  -- +1, replace with Geo JSE Neck +1
       waist="Fucho-no-Obi",    -- Isa Belt
       left_ear="Regal Earring",  -- Etiolation Earring
       right_ear="Handler's Earring +1", -- Genmei Earring
       left_ring="Defending Ring",       
       right_ring="Thurandaut Ring",     -- Dark Ring / Vocane Ring / Gelatinous Ring
       back="Nantosuelta's Cape", -- Add HP, 5 DT or 10 PDT, TODO: properly add to globals w/augments
    }) -- Master DT: 10 (ring), 2 (ammo), 5 (neck)   PDT: 1(hands), 10 back -- currently 28/17, very low
	
	-- This is when you have a Luopan out but want to sacrifice some slot for master DT, put those slots in.
    sets.pan.idle.dt = set_combine(sets.pan.idle.normal,{

    })     
    -- Combat Related Sets
      
    -- Melee
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
	-- No Luopan out
	-- they end in [idleMode] so it will derive from either the normal or the dt set depending in which mode you are then add the pieces filled in below.
    sets.me.melee = set_combine(sets.me.idle[idleMode],{
	  head="Jhakri Coronal +1",
      legs="Jhakri Slops +1",
	  hands="Jhakri Cuffs +2",
	  feet="Jhakri Pigaches +1",
	  waist="Eschan Stone",
    })
	
    -- Luopan is out
	sets.pan.melee = set_combine(sets.pan.idle[idleMode],{
	  head="Jhakri Coronal +1",
      legs="Jhakri Slops +1",
	  hands="Jhakri Cuffs +2",
	  feet="Jhakri Pigaches +1",
	  waist="Eschan Stone",
    }) 
    
    -- Weapon Skill sets
	-- Example:
    sets.me["Flash Nova"] = {
    	head="Jhakri Coronal +1",
		body="jhakri robe +2",
		hands="Amalric Gages +1",
		legs="Merlinic Shalwar",  -- currently 20+14 macc, 15+28 MAB, 43 int, 11 MBB
		-- legs="Jhakri Slops +1",		
		feet="Amalric Nails +1",
		neck="Sanctity Necklace",
		waist="Eschan Stone", -- "Searing Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Vertigo Ring",
		right_ring="Jhakri Ring",
		back="Refraction Cape"
    }

    sets.me["Realmrazer"] = {

    }
	
    sets.me["Exudation"] = {

    } 
    -- Feel free to add new weapon skills, make sure you spell it the same as in game.
  
    ---------------
    -- Casting Sets
    ---------------
      
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
      
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
	    -- FC/Haste -- 15 Free if /RDM
    sets.precast.casting = {
	  range="Dunna",                --  3/0 
	  head="Merlinic Hood",         --  8/6  -- Augment with up to +7
	  ear1="Malignance Earring",    -- 4
	  ear2="Loquacious Earring",    -- 2
	  body="Zendik Robe",           -- 13/4  
	  hands=gear.Merl_FC_hands,     --  3/3  -- Can get +7 (4 missing)
	  neck="Voltsurge Torque",      --  4    -- Orunmila's is 5 (1 missing)
	  waist="Witful Belt",          --  3/3   
	  legs="Psycloth Lappas",       --  7/5  --  "Geomancy Pants +3" is 15
      feet="Chelona Boots",         --  4/0  -- Merlinic Crackows - 12 max
	  back="Lifestream Cape",       --  7/0  -- Ambuscade can get 10 
    }   -- Current fast cast: 58  (goal: 80/65) need 22/7
	
    sets.precast.geomancy = set_combine(sets.precast.casting,{	  
      back="Lifestream Cape", -- 14 skill, 20 duration
    })   
	
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{
		waist="Siegel Sash",
        neck="Melic Torque",
    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{
		-- waist="Siegel Sash",
    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
		-- back="Pahtli Cape"
    })
    sets.precast.regen = set_combine(sets.precast.casting,{

    })     
    ---------------------
    -- Ability Precasting
    ---------------------
	
	-- Fill up with your JSE! 
    sets.precast["Life Cycle"] = {
    	body = "Geomancy Tunic",
    }
    sets.precast["Bolster"] = {
    	body = "Bagua Tunic",
    }
    sets.precast["Primeval Zeal"] = {
    	head = "Bagua Galero",
    }  
    sets.precast["Cardinal Chant"] = {
    	head = "Geomancy Galero",
    }  
    sets.precast["Full Circle"] = {
    	head = "Azimuth Hood +1",
    }  
    sets.precast["Curative Recantation"] = {
    	hands = "Bagua Mitaines",
    }  
    sets.precast["Mending Halation"] = {
    	legs = "Bagua Pants",
    }
    sets.precast["Radial Arcana"] = {
    	feet = "Bagua Sandals",
    }

    ----------
    -- Midcast
    ----------
            
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
    	head="Jhakri Coronal +1",
		body="jhakri robe +2",
		hands="Amalric Gages +1",
		legs="Merlinic Shalwar",  -- currently 20+14 macc, 15+28 MAB, 43 int, 11 MBB
		-- legs="Jhakri Slops +1",		
		feet="Amalric Nails +1",
		neck="Sanctity Necklace",
		waist="Eschan Stone", -- "Searing Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Vertigo Ring",
		right_ring="Jhakri Ring",
		back="Refraction Cape",
    }
	
	-- For Geo spells 
    sets.midcast.geo = set_combine(sets.midcast.casting,{
	  head="Azimuth Hood +1",  -- 15
	  neck="Bagua Charm +1",   --  
	  body="Bagua Tunic",      -- 10 skill
	  hands="Geo. Mitaines +1",-- 15 skill
      back="Lifestream Cape",  -- 14 skill, 20 indi duration
    })
	-- For Indi Spells
    sets.midcast.indi = set_combine(sets.midcast.geo,{

    })

	sets.midcast.Obi = {
	    waist="Hachirin-no-Obi",
	}
	
	-- Nuking
    sets.midcast.nuking = set_combine(sets.midcast.casting,{        
    })
	
	sets.midcast.MB = set_combine(sets.midcast.nuking, {
	    head="Merlinic Hood",
	    neck="Mizu. Kubikazari",
		body="ea houppelande",
		legs="Merlinic Shalwar",
		left_ring="Locus Ring",
		right_ring="Mujin Band",
		feet="Amalric Nails +1",
	})
	-- Enfeebling
	sets.midcast.IntEnfeebling = set_combine(sets.midcast.casting,{
	  head="Jhakri Coronal +1", 
      hands="Jhakri cuffs +2", --macc
	  feet="Jhakri Pigaches +1", --macc
    })
	sets.midcast.MndEnfeebling = set_combine(sets.midcast.IntEnfeebling,{

    })
	
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{

    })
	
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
		-- waist="Siegel Sash",
    })
    sets.midcast.refresh = set_combine(sets.midcast.enhancing,{
		-- head="Amalric Coif +1",
    })
    sets.midcast.aquaveil = sets.midcast.refresh
	
	sets.midcast["Drain"] = set_combine(sets.midcast.IntEnfeebling, {
    	-- main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},		
		head="Pixie Hairpin +1",
		-- neck="Erra Pendant",
	})

	sets.midcast["Aspir"] = sets.midcast["Drain"]
     
    sets.midcast.cure = set_combine(sets.midcast.casting,{
	   body="Vanya Robe",
	   hands="Vanya Cuffs",
	   legs="Vanya Slops",
       feet="Vanya Clogs",   -- 10 potency, 15 cast time reduction
    }) 

    sets.midcast.regen = set_combine(sets.midcast.enhancing,{

    }) 
   
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have a Luopan pan out?
  
end