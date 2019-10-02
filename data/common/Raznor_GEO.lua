
--[[
        Custom commands:
    
        Toggle Function: 
        gs c toggle melee               Toggle Melee mode on / off and locking of weapons
        gs c toggle mb                  Toggles Magic Burst Mode on / off.
        gs c toggle runspeed            Toggles locking on / off Herald's Gaiters
        gs c toggle idlemode            Toggles between Refresh and DT idle mode. Activating Sublimation JA will auto replace refresh set for sublimation set. DT set will superceed both.        
        gs c toggle regenmode           Toggles between Hybrid, Duration and Potency mode for regen set  
        gs c toggle nukemode            Toggles between Normal and Accuracy mode for midcast Nuking sets (MB included)  
        gs c toggle matchsc             Toggles auto swapping element to match the last SC that just happenned.
		
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

        HUD Functions:
        gs c hud hide                   Toggles the Hud entirely on or off
        gs c hud hidemode               Toggles the Modes section of the HUD on or off
        gs c hud hidejob                Toggles the job section of the HUD on or off
        gs c hud hidebattle             Toggles the Battle section of the HUD on or off
        gs c hud lite                   Toggles the HUD in lightweight style for less screen estate usage. Also on ALT-END
        gs c hud keybinds               Toggles Display of the HUD keybindings (my defaults) You can change just under the binds in the Gearsets file.

        // OPTIONAL IF YOU WANT / NEED to skip the cycles...  
        gs c nuke Ice                   Set Element Type to Ice DO NOTE the Element needs a Capital letter. 
        gs c nuke Air                   Set Element Type to Air DO NOTE the Element needs a Capital letter. 
        gs c nuke Dark                  Set Element Type to Dark DO NOTE the Element needs a Capital letter. 
        gs c nuke Light                 Set Element Type to Light DO NOTE the Element needs a Capital letter. 
        gs c nuke Earth                 Set Element Type to Earth DO NOTE the Element needs a Capital letter. 
        gs c nuke Lightning             Set Element Type to Lightning DO NOTE the Element needs a Capital letter. 
        gs c nuke Water                 Set Element Type to Water DO NOTE the Element needs a Capital letter. 
        gs c nuke Fire                  Set Element Type to Fire DO NOTE the Element needs a Capital letter. 
--]]


include('organizer-lib') -- Remove if you dont use Organizer

--------------------------------------------------------------------------------------------------------------
res = require('resources')      -- leave this as is    
texts = require('texts')        -- leave this as is    
include('Modes.lua')            -- leave this as is      
--------------------------------------------------------------------------------------------------------------

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- to define sets for regen if you add more modes, name them: sets.midcast.regen.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('normal', 'dt', 'mdt')
-- To add a new mode to nuking, you need to define both sets: sets.midcast.nuking.mynewmode as well as sets.midcast.MB.mynewmode
nukeModes = M('normal', 'acc')

-- Setting this to true will stop the text spam, and instead display modes in a UI.
-- Currently in construction.
use_UI = true
hud_x_pos = 1400    --important to update these if you have a smaller screen
hud_y_pos = 200     --important to update these if you have a smaller screen
hud_draggable = true
hud_font_size = 10
hud_transparency = 200 -- a value of 0 (invisible) to 255 (no transparency at all)
hud_font = 'Impact'

-- Setup your Key Bindings here:  
    windower.send_command('bind insert gs c nuke cycle')            -- insert Cycles Nuke element
    windower.send_command('bind delete gs c nuke cycledown')        -- delete Cycles Nuke element in reverse order   
    windower.send_command('bind home gs c geo geocycle') 			-- home Cycles Geomancy Spell
    windower.send_command('bind PAGEUP gs c geo geocycledown') 		-- end Cycles Geomancy Spell in reverse order	
    windower.send_command('bind PAGEDOWN gs c geo indicycle') 		-- PgUP Cycles IndiColure Spell
    windower.send_command('bind end gs c geo indicycledown') 	    -- PgDown Cycles IndiColure Spell in reverse order	
    windower.send_command('bind !f9 gs c toggle runspeed') 			-- Alt-F9 toggles locking on / off Herald's Gaiters
	windower.send_command('bind f10 gs c toggle mb')				-- F10 toggles Magic Burst Mode on / off.
    windower.send_command('bind !f10 gs c toggle nukemode')         -- Alt-F10 to change Nuking Mode
    windower.send_command('bind ^F10 gs c toggle matchsc')          -- CTRL-F10 to change Match SC Mode         
    windower.send_command('bind f12 gs c toggle melee')				-- F12 Toggle Melee mode on / off and locking of weapons
	windower.send_command('bind f9 gs c toggle idlemode')			-- F9 Toggles between MasterRefresh or MasterDT when no luopan is out
	
	windower.send_command('bind !q gs c geo geo')			-- Alt-q -- geo spell
	windower.send_command('bind !w gs c geo indi')			-- Alt-w -- indi spell
--[[
    This gets passed in when the Keybinds is turned on.
    Each one matches to a given variable within the text object
    IF you changed the Default Keybind above, Edit the ones below so it can be reflected in the hud using "//gs c hud keybinds" command
]]																	-- or between Full Pet Regen+DT or Hybrid PetDT and MasterDT when a Luopan is out
keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_regen'] = '(END)'
keybinds_on['key_bind_casting'] = '(ALT-F10)'
keybinds_on['key_bind_mburst'] = '(F10)'
keybinds_on['key_bind_matchsc'] = '(CTRL-F10)'

keybinds_on['key_bind_element_cycle'] = '(INS + DEL)'
keybinds_on['key_bind_geo_cycle'] = '(HOME + PgUP)'
keybinds_on['key_bind_indi_cycle'] = '(End + PgDOWN)'
keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_movespeed_lock'] = '(ALT-F9)'


-- Remember to unbind your keybinds on job change.
function user_unload()
    send_command('unbind insert')
    send_command('unbind delete')
    send_command('unbind home')
    send_command('unbind PAGEUP')
    send_command('unbind PAGEDOWN')
    send_command('unbind end')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind f9')
    send_command('unbind !f9')
    send_command('unbind !q')
	send_command('unbind !w')
end

--------------------------------------------------------------------------------------------------------------
include('GEO_Lib.lua')          -- leave this as is     
--------------------------------------------------------------------------------------------------------------

geomancy:set('Geo-Frailty')     -- Geo Spell Default      (when you first load lua / change jobs the saved spells is this one)
indicolure:set('Indi-Haste')    -- Indi Spell Default     (when you first load lua / change jobs the saved spells is this one)
validateTextInformation()

-- Optional. Swap to your geo macro sheet / book
set_macros(2,12) -- Sheet, Book   
    
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
      back="Moonbeam Cape",
    })
    sets.me.idle.mdt = set_combine(sets.me.idle.normal,{

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
    sets.pan.idle.normal = {
      main="Idris",
	  -- missing offhand shield - Genmei/Genbu
      ammo="Staunch Tathlum", -- +1
      head="Azimuth Hood +1", 
      body="jhakri robe +2",    -- Telchine w/+3 pet regen (leaf orb), Meva (snow not orb), duskdim (enhancing magic duration)
      hands="Geo. Mitaines +2", -- +3 these eventually
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
    } -- Master DT: 10 (ring), 2 (ammo), 5 (neck)   PDT: 1(hands), 10 back -- currently 28/17, very low
	
	-- This is when you have a Luopan out but want to sacrifice some slot for master DT, put those slots in.
    sets.pan.idle.dt = set_combine(sets.pan.idle.normal,{

    })   
    sets.pan.idle.mdt = set_combine(sets.pan.idle.normal,{

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
		body="Jhakri robe +2",
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
      
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty    
    sets.midcast.nuking = {}        -- leave this empty
    sets.midcast.MB = {}            -- leave this empty    
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {
      range="Dunna",                --  3/0 
	  head="Merlinic Hood",         --  8/6  -- Augment with up to +7
	  ear1="Malignance Earring",    -- 4
	  ear2="Loquacious Earring",    -- 2
	  body="Zendik Robe",           -- 13/4  
	  -- hands="Merlinic Dastanas",       -- 3/3  -- Can get +7 (4 missing)
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

    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{

    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{

    })
    sets.precast.regen = set_combine(sets.precast.casting,{

    })     
    ---------------------
    -- Ability Precasting
    ---------------------
	
	-- Fill up with your JSE! 
    sets.precast["Life Cycle"] = {
    	body = "Geomancy Tunic +1",
    }
    sets.precast["Bolster"] = {
    	body = "Bagua Tunic +1",
    }
    sets.precast["Primeval Zeal"] = {
    	head = "Bagua Galero +1",
    }  
    sets.precast["Cardinal Chant"] = {
    	head = "Geomancy Galero",
    }  
    sets.precast["Full Circle"] = {
    	head = "Azimuth Hood +1",
    }  
    sets.precast["Curative Recantation"] = {
    	hands = "Bagua Mitaines +1",
    }  
    sets.precast["Mending Halation"] = {
    	legs = "Bagua Pants +1",
    }
    sets.precast["Radial Arcana"] = {
    	feet = "Bagua Sandals +1",
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
	
	-- For Geo spells /
    sets.midcast.geo = set_combine(sets.midcast.casting,{
      head="Azimuth Hood +1",  -- 15
	  neck="Bagua Charm +1",   --  
	  body="Bagua Tunic",      -- 10 skill
	  hands="Geo. Mitaines +2",-- 15 skill
      back="Lifestream Cape",  -- 14 skill, 20 indi duration
    })
	-- For Indi Spells
    sets.midcast.indi = set_combine(sets.midcast.geo,{

    })

	sets.midcast.Obi = {
	    waist="Hachirin-no-Obi",
	}
	
	-- Nuking
    sets.midcast.nuking.normal = set_combine(sets.midcast.casting,{

    })
	sets.midcast.MB.normal = set_combine(sets.midcast.nuking.normal, {
	  -- main="Grioavolr",        -- 7
      head="Merlinic Hood",
	  neck="Mizu. Kubikazari",
	  body="ea houppelande",      -- 8
	  legs="Merlinic Shalwar",
	  left_ring="Locus Ring",
	  right_ring="Mujin Band",
	  feet="Amalric Nails +1",
	})
    sets.midcast.nuking.acc = set_combine(sets.midcast.nuking.normal,{
	   hands="Jhakri Cuffs +2",
	   feet="Jhakri Pigaches +1",
    })
    sets.midcast.MB.acc = set_combine(sets.midcast.MB.normal, {
       hands="Jhakri Cuffs +2",
	   feet="Jhakri Pigaches +1",  -- 5, 7 for +2
    })

	-- Enfeebling
	sets.midcast.IntEnfeebling = set_combine(sets.midcast.casting,{
	  main="Grioavolr",
	  sub="Enki Strap",
	  head="Jhakri Coronal +1", 
	  body="Jhakri Robe +2",
      hands="Jhakri cuffs +2", --macc
	  feet="Jhakri Pigaches +1", --macc
	  legs="Jhakri Slops +1",
	  back="Lifestream Cape",
	  waist="Rumination Sash",
    })
	sets.midcast.MndEnfeebling = set_combine(sets.midcast.IntEnfeebling,{	  
    })
	
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{

    })
	
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{

    })
    sets.midcast.refresh = set_combine(sets.midcast.enhancing,{
    })
    sets.midcast.aquaveil = sets.midcast.refresh
	
	sets.midcast["Drain"] = set_combine(sets.midcast.IntEnfeebling, {
      head="Pixie Hairpin +1",
	  right_ring="Archon Ring",
	})

	sets.midcast["Aspir"] = sets.midcast["Drain"]
     
    sets.midcast.cure = {} -- Leave This Empty
    -- Cure Potency
    sets.midcast.cure.normal = set_combine(sets.midcast.casting,{
	   body="Vanya Robe",
	   hands="Vanya Cuffs",
	   legs="Vanya Slops",
       feet="Vanya Clogs",   -- 10 potency, 15 cast time reduction
    })
    sets.midcast.cure.weather = set_combine(sets.midcast.cure.normal,{

    })    
    sets.midcast.regen = set_combine(sets.midcast.enhancing,{

    }) 
   
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have a Luopan pan out?
  
end
