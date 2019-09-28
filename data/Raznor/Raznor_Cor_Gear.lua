-- Setup vars that are user-dependent.  Can override this function in a sidecar file.

-- General TODO:
--   Loricate Torque +1
--   Moonlight Cape
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
	state.HybridMode:options('Normal', 'Hybrid')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualWeapons','DualSavageWeapons','DualLeadenRanged','DualLeadenMelee','DualLeadenMeleeAcc','DualKustawi','None')
	state.CompensatorMode:options('300','1000','Never','Always')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Chrono Bullet" -- "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Chrono Bullet" -- "Animikii Bullet"
	
    options.ammo_warning_limit = 15

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20',}}
	      -- {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = "Navarch's Mantle" -- TODO: {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}} --*
	                   -- currently reusing wsd cape instead of custom
	                   -- {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = gear.tp_ranger_jse_back -- {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	
	gear.str_wsd_jse_back = {name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}} --*

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	windower.send_command('bind PAGEUP  gs c cycle weapons')
	windower.send_command('bind PAGEDOWN  gs c cycle weapons')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	-- send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons DualKustawi;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}

    sets.precast.CorsairRoll = {
	    range="Compensator",
        --TODO: head="Lanun Tricorne +1",
		neck="Regal Necklace",
		-- TODO: ear1="Etiolation Earring",
		-- TODO: ear2="Sanare Earring",
        -- TODO: body="Lanun Frac +1",
		-- TODO: hands="Chasseur's Gants +1",
		ring1="Defending Ring",
		-- TODO: ring2="Dark Ring",
        -- TODO: back=gear.tp_jse_back,
		waist="Flume Belt +1",
		legs="Desultor Tassets",
		-- TODO: feet=gear.herculean_dt_feet
	}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
	-- TODO -- STP version
    sets.precast.CorsairShot = {
	  ammo=gear.QDbullet,
      head=gear.herculean_nuke_head,
	  neck="Iskur Gorget",
	  ear1="Dedition Earring",
	  ear2="Telos Earring",
      body="Mummu Jacket +2",
	  hands="Adhemar Wristbands +1",
	  ring1="Ilabrat Ring",
	  ring2="Petrov Ring",
      back=gear.tp_ranger_jse_back,
	  waist="Goading Belt",
	  legs="Chas. Culottes +1",
	  feet="Carmine Greaves +1"
	}
		
	-- TODO
	sets.precast.CorsairShot.Damage = set_combine(sets.precast.CorsairShot, {
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Dingir Ring",
        back=gear.ranger_wsd_jse_back,waist="Eschan Stone",legs="Mummu Kecks +2",feet="Chass. Bottes +1"})
	
	-- TODO
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        head="Wh. Rarab Cap +1",neck="Loricate Torque",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Chass. Bottes +1"}

	-- TODO
	sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.ranger_wsd_jse_back,waist="Eschan Stone",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",
		neck="Loricate Torque",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
        body=gear.herculean_waltz_body,
		hands=gear.herculean_waltz_hands,
		ring1="Defending Ring",
		ring2="Valseur's Ring",
        back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Dashing Subligar",
		feet=gear.herculean_waltz_feet
	}
		
	sets.Self_Waltz = {
	   head="Mummu Bonnet +1",
	   -- TODO: body="Passion Jacket",
	   ring1="Asklepian Ring"
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		head="Carmine Mask +1",        -- 14
		-- neck="Baetyl Pendant",
		-- ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
        -- body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		-- ring2="Lebeche Ring",
        back="Moonbeam Cape",
		waist="Flume Belt +1",
		-- legs="Rawhide Trousers",
		-- feet="Carmine Greaves +1"
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        -- TODO: head= "Chass. Tricorne +1", or Taeon w/snapshot for when flurry I instead of II
		neck="Comm. Charm +1",
        body="Laksa. Frac +3",
		hands="Carmine Fin. Ga. +1",
        back=gear.snapshot_jse_back,
		waist="Impulse Belt",
		legs="Oshosi Trousers", -- "Laksa. Trews +3",
		feet=gear.meg_feet
		}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	-- TODO: all weapon skill sets
    sets.precast.WS = {
	    ammo=gear.WSbullet,
        head=gear.meg_head,
		neck="Comm. Charm +1",    -- "Fotia Gorget",
		ear1="Moonshade Earring",    
		ear2="Ishvara Earring",
        body="Laksa. Frac +3",
		hands=gear.meg_hands,
		ring1="Petrov Ring",      -- "Regal Ring",
		ring2="Dingir Ring",      -- "Ifrit Ring +1",
        back=gear.str_wsd_jse_back,
		waist="Grunfeld Rope",    -- "Fotia Belt",
		legs=gear.meg_legs,
		feet="Herculean Boots",   -- "Lanun Bottes +3"
	}
		
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        -- head="Carmine Mask +1",
		-- neck="Combatant's Torque",
		-- ear1="Digni. Earring",
		ear1="Telos Earring",
		-- body=gear.meg_body,
		ring2="Ilabrat Ring",
        -- waist="Grunfeld Rope",
		legs="Carmine Cuisses +1",
		})		
		
    sets.precast.WS.Proc = set_combine(sets.precast.WS.Acc, {
        ear2="Zennaroi Earring",
        body="Mummu Jacket +2",
		hands="Floral Gauntlets",
		ring1="Ramuh Ring +1",
		ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,
		waist="Olseni Belt",feet=gear.herculean_acc_feet
		})
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
	    -- ammo=gear.WSbullet,
        -- head="Adhemar Bonnet +1",
		-- neck="Fotia Gorget",
		-- ear1="Moonshade Earring",
		-- ear2="Telos Earring",        
		-- body=gear.meg_body,
		-- hands="Adhemar Wrist. +1",
		-- ring1="Regal Ring",
		-- ring2="Ifrit Ring +1",
        -- back=gear.str_wsd_jse_back,
		-- waist="Fotia Belt",
		-- legs=gear.meg_legs,
		-- feet="Lanun Bottes +3"
	})

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
	    head="Carmine Mask +1",
		ring2="Rufescent Ring",
		legs="Carmine Cuisses +1",
		feet="Carmine Greaves +1"})
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
	    head="Herculean Helm",
		ear1="Mooonshade Earring",
		ear2="Ishvara Earring",
        hands="Meg. Gloves +2",
        -- legs=gear.Herc_WS_legs,
        -- ring1="Regal Ring",
        -- ring2="Shukuyu Ring",
        back=gear.COR_WS2_Cape,
        -- waist="Prosilio Belt +1",
	    -- ammo=gear.WSbullet,
        -- head="Lilitu Headpiece",
		-- neck="Caro Necklace",
		
		-- waist="Grunfeld Rope",
		-- legs=gear.herculean_wsd_legs,
	})

    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {	
        -- head="Carmine Mask +1",
		ear2="Telos Earring",
        body=gear.meg_body,
		-- ring2="Rufescent Ring",
        legs="Carmine Cuisses +1"
	})
	
    sets.precast.WS['Last Stand'] = {
	    ammo=gear.WSbullet,
        head=gear.meg_head, 
		neck="Iskur Gorget", -- "Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Telos Earring",
        body="Laksa. Frac +3",
		hands=gear.meg_hands,
		ring1="Regal Ring",
		ring2="Dingir Ring",
        back=gear.ranger_wsd_jse_back,
		waist="Light Belt", -- "Fotia Belt",
		legs=gear.meg_legs,
		feet="Herculean Boots", -- "Lanun Bottes +3"
		}

    sets.precast.WS['Last Stand'].Acc = 
	    set_combine(sets.precast.WS['Last Stand'], {	
          neck="Iskur Gorget"})
        
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",
		neck="Comm. Charm +1", -- TODO: "Baetyl Pendant",
		ear1="Moonshade Earring",
		ear2="Friomisi Earring",
        body="Laksa. Frac +3",
		hands="Carmine Fin. Ga. +1",
		ring1="Archon Ring",
		ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,
		waist="Eschan Stone",
		legs="Herculean Trousers", -- TODO: "Laksa. Trews +3",
		feet="Herculean Boots", -- TODO: "Lanun Bottes +3"
		}

    sets.precast.WS['Leaden Salute'].Acc = set_combine(sets.precast.WS['Leaden Salute'], {
		neck="Comm. Charm +1",
        hands="Leyline Gloves"        
	})        

    sets.precast.WS['Wildfire'] = set_combine(sets.precast.WS['Leaden Salute'], {
        head=gear.herculean_nuke_head,
		ear1="Crematio Earring",
        ring1="Regal Ring"        
	})

    sets.precast.WS['Wildfire'].Acc = set_combine(sets.precast.WS['Wildfire'], {
        neck="Comm. Charm +1",
        hands="Leyline Gloves"
    })
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque",ear1="Genmei Earring",ear2="Sanare Earring",
        body=gear.meg_body,hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs=gear.meg_legs,feet=gear.meg_feet}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {        
	})
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- TODO: Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head=gear.meg_head,
		neck="Iskur Gorget",
		ear1="Enervating Earring",
		ear2="Telos Earring",
        body="Laksa. Frac +3", -- "Nisroch Jerkin",
		hands="Carmine Fin. Ga. +1",
		ring1="Dingir Ring",
		ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,
		waist="Eschan Stone", -- "Yemaya Belt",
		legs=gear.meg_legs, -- "Adhemar Kecks",
		feet=gear.meg_feet
		}

    sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {           		
        body="Laksa. Frac +3",
		hands=gear.meg_hands,
		-- ring2="Dingir Ring",
        -- legs="Laksa. Trews +3"
		})
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +1"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {
	  ammo=gear.RAbullet,      
	  head="Malignance Chapeau",      -- 6/6	   
	  neck="Loricate Torque",         --  5/5
	  ear1="Odnowa earring",          --  0/1   "Genmei Earring",
	  ear2="Odnowa earring +1",       --  0/2  "Sanare Earring",
      body=gear.meg_body,             --  7/0
	  hands="Malignance Gloves",      --  5/5   112 Meva
	  ring1="Defending Ring",         -- 10/10
	  ring2="meghanada Ring",         --  2/0    "Dark Ring",
      back=gear.str_wsd_jse_back,     -- 10/0    "Moonlight Cape",
	  waist="Flume Belt +1",          --  4/0
	  legs="Carmine Cuisses +1",
	  feet="Malignance Boots"
	}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Loricate Torque",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Mekosu. Harness",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet=gear.herculean_dt_feet}
    
    -- Defense sets
    sets.defense.PDT = {
	    ammo=gear.RAbullet,
        head=gear.meg_head,             --  4/0  (+1)
		neck="Loricate Torque",         --  5/5  (NQ)
	    
        body=gear.meg_body,             --  7/0  (+1)
		hands="Malignance Gloves",      --  5/5  112 Meva
		ring1="Defending Ring",         -- 10/10
		ring2="meghanada Ring",         --  2/0    "Dark Ring",   
        back=gear.str_wsd_jse_back,     -- 10/0    "Moonlight Cape",
		waist="Flume Belt +1",          --  4/0
		legs=gear.meg_legs,             --  6/0  (+2)
		feet="Ahosi Leggings"           --  4/0  107 meva
	}  -- overcap on PDT  57/23

    sets.defense.MDT = set_combine(sets.defense.PDT, {
	   ammo=gear.RAbullet,
        head=gear.meg_head,
		neck="Loricate Torque",
		ear1="Odnowa earring",          --  0/1   "Etiolation Earring",
	    ear2="Odnowa earring +1",       --  0/2  "Sanare Earring"
        body=gear.meg_body,		
		ring2="Dark Ring",
        back="Moonlight Cape",
		waist="Flume Belt +1", 
		legs="Malignance Tights",       -- 7/7  150 meva
		feet="Ahosi Leggings"
    })
		
    sets.defense.MEVA = set_combine(sets.defense.PDT, {
        head=gear.meg_head,
		neck="Loricate Torque",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
        body=gear.meg_body,
		ring2="Dark Ring",
        back="Moonlight Cape",
		waist="Flume Belt +1",	
		feet="Ahosi Leggings"
    })

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets
	sets.weapons.Default = {main="Lanun Knife",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Lanun Knife",range="Fomalhaut"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Demersal Degen",range="Anarchy +2"}
	sets.weapons.DualLeadenRanged = {main="Lanun Knife",sub="Naegling",range="Fomalhaut"}
	sets.weapons.DualLeadenMelee = {main="Naegling",sub="Atoyac",range="Fomalhaut"}
	sets.weapons.DualLeadenMeleeAcc = {main="Naegling",sub="Lanun Knife",range="Fomalhaut"}
	sets.weapons.DualKustawi = {main="Kaja Knife",sub="Naegling",range="Anarchy +2"} -- "Fomalhaut"} -- "Kustawi +1"
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1", -- "Dampening Tam",
		neck="Iskur Gorget",
		ear1="Telos Earring", -- "Cessance Earring",
		ear2="Brutal Earring",
		body="Rawhide Vest", -- "Meg. Cuirie +2", nice PDT, but no multi-attack/STP
		hands="Adhemar Wrist. +1",
		ring1="Ilabrat Ring", -- "Epona's Ring",
		ring2="Petrov Ring",
		back=gear.tp_jse_back,
		waist="Windbuffet Belt +1",  -- "Reiki Yotai"-- needDW somewhere
		legs="Samnuha Tights",
		feet="Herculean Boots", -- gear.herculean_ta_feet
	}
    
    sets.engaged.Acc = {
		head="Malignance Chapeau", -- gear.meg_head, -- "Carmine Mask +1", Lanun Tricore +3
		neck="Sanctity Necklace", -- "Combatant's Torque",
		ear1="Matanki Earring", -- "Cessance Earring",
		ear2="Telos Earring",
		body=gear.meg_body,
		hands="Malignance Gloves", -- gear.meg_hands, -- "Adhemar Wrist. +1",
		ring1="Ilabrat Ring", -- "Epona's Ring",
		ring2="Mummu Ring",   -- "Petrov Ring",
		-- back=gear.tp_jse_back,
		-- waist="Olseni Belt",
		legs="Malignance Tights",  -- gear.meg_legs, 
		feet="Malignance Boots"
	}

    sets.engaged.Hybrid = set_combine(sets.engaged, {	
	   head="Malignance Chapeau",
	   hands="Malignance Gloves",
	   legs="Malignance Tights",
	   feet="Malignance Boots"
		-- body="Adhemar Jacket +1",
		-- waist="Reiki Yotai" 
	})

    sets.engaged.DW = set_combine(sets.engaged, {	
		-- body="Adhemar Jacket +1",
		-- waist="Reiki Yotai"
	})
    
    sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {
		-- ear1="Digni. Earring",
		-- hands="Floral Gauntlets",
		-- ring1="Ramuh Ring +1",
		-- ring2="Ramuh Ring +1",
		waist="Olseni Belt"
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 14)
    elseif player.sub_job == 'DNC' then
		set_macro_page(2, 14)
    elseif player.sub_job == 'RNG' then
        set_macro_page(2, 14)
    else
        set_macro_page(2, 14)
    end   


end


-- -- Mike - add handler to put roll value in second chat window
-- -- There's probably an easier way to do this
-- windower.register_event('action', function(act)
    -- if act.category == 6 then -- and table.containskey(rollInfo, act.param) then
        -- --This is used later to allow/disallow busting
        -- --If you are not the rollActor you will not be disallowed to bust.
        -- rollActor = act.actor_id
        -- local rollID = act.param
        -- local rollNum = act.targets[1].actions[1].param

        -- -- anonymous function that checks if the player.id is in the targets without wrapping it in another layer of for loops.
        -- if
            -- function(act)
                -- for i = 1, #act.targets do
                    -- if act.targets[i].id == player.id then
                        -- return true
                    -- end
                -- end
                -- return false
            -- end(act)
        -- then
            -- local party = windower.ffxi.get_party()
            -- rollMembers = {}
            -- for partyMem in pairs(party) do
                -- for effectedTarget = 1, #act.targets do
                    -- --if mob is nil then the party member is not in zone, will fire an error.
                    -- if type(party[partyMem]) == 'table' and party[partyMem].mob and act.targets[effectedTarget].id == party[partyMem].mob.id then
                        -- rollMembers[effectedTarget] = partyColour[partyMem] .. party[partyMem].name .. chat.controls.reset
                    -- end
                -- end
            -- end

            -- local membersHit = table.concat(rollMembers, ', ')
            -- --fake 'ternary' assignment. if settings.effected is 1 then it'll show numbers, otherwise it won't.
            -- local rollBonus = RollEffect(rollID, rollNum+1)
            -- local luckChat = ''
            -- isLucky = false
            -- if rollNum == rollInfo[rollID][15] or rollNum == 11 then
                -- isLucky = true
                -- windower.add_to_chat(158,'Lucky roll!')
                -- luckChat = string.char(31,158).." (Lucky!)"
            -- elseif rollNum == rollInfo[rollID][16] then
                -- luckChat = string.char(31,167).." (Unlucky!)"
            -- end


            -- if rollNum == 12 and #rollMembers > 0 then
                -- windower.add_to_chat(1, string.char(31,167)..amountHit..'Bust! '..chat.controls.reset..chars.implies..' '..membersHit..' '..chars.implies..' ('..rollInfo[rollID][rollNum+1]..rollInfo[rollID][14]..')')
            -- else
                -- windower.add_to_chat(1, amountHit..membersHit..chat.controls.reset..' '..chars.implies..' '..rollInfo[rollID][1]..' Roll '..chars['circle' .. rollNum]..luckChat..string.char(31,13)..' (+'..rollBonus..')'..BustRate(rollNum, rollActor)..ReportRollInfo(rollID, rollActor))
            -- end
        -- end
    -- end
-- end)
