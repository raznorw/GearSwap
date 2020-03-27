----- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Khatvanga')

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {}   -- legs="Peda. Pants +1"}
	sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells

    sets.precast.FC = {
	  main="Grioavolr",            -- gear.grioavolr_fc_staff,
	  sub="Clerisy Strap",         -- 2
	  ammo="Incantor Stone",       -- 2  -- "Impatiens",
	  -- ammo="Hasty Pinion +1",  (Haste)				
	  head="Merlinic Hood",           -- 8 unaug'd  -- "Amalric Coif +1",
	  neck="Voltsurge Torque",        -- 4
	  ear1="Malignance Earring",     -- "Enchntr. Earring +1",
	  ear2="Loquacious Earring",      -- 2?
	  body="Zendik Robe",             -- 13
	  hands="Volte Gloves",      -- nothing good, I have merlinic gloves with +3 I can use      
	  -- hands="Gende. Gages +1",
	  ring1="Kishar Ring",            -- 4
	  -- ring2="Lebeche Ring",      -- don't have
	  back="Swith Cape +1",           -- 4   -- "Perimede Cape",
	  waist="Witful Belt",
	  legs="Psycloth Lappas",         -- 7
	  feet="Amalric Nails +1"         -- 6 -- "Regal Pumps +1"
    }
			
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	  main="Pedagogy Staff",
	  sub="Enki Strap"
	--   waist="Siegel Sash"
	})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
	--  ear1="Barkaro. Earring"
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
	  main="Serenity",	  
	  body="Heka's Kalasiris"
	})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
	--   body="Twilight Cloak"
	})

-- TODO: HERE

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {
	    ammo="staunch tathlum +1",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Evans Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet +1",
		hands="Regal Cuffs",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Aurist's Cape +1",
		waist="Yamabuki-no-Obi",
		legs="Psycloth Lappas",
		feet="Medium's Sabots"
	}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
	  -- feet=gear.chironic_treasure_feet
	})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
	  main="Akademos",
	  sub="Enki Strap",
	  ammo="Pemphredo Tathlum",
	  head="Merlinic Hood",
	  neck="Mizu. Kubikazari",
	  ear1="Regal Earring",
	  ear2="Malignance Earring", -- "Friomisi Earring", -- 2 more mab, less macc / int
	  body="Amalric Doublet +1",
	  hands="Amalric Gages +1",
	  ring1="Mujin Band",
	  ring2="Locus Ring",
	  back="Bookworm's Cape",
	  waist="Eschan Stone",
	  legs="Merlinic Shalwar",
	  feet="Amalric Nails +1", -- "Jhakri Pigaches +2"
	}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
	  -- ring2="Prolix Ring",
	})
		
    -- looking for 1.5K cure iv on non-tank, 2k on tank
    sets.midcast.Cure = {
	  main="Serenity",
	  sub="Enki Strap",            -- "Curatio Grip",
	  ammo="Hasty Pinion +1",
     --  head="Gende. Caubeen +1",
	  neck="Incanter's Torque",
	  ear1="Mendi. Earring",       -- "Enchntr. Earring +1",
	  ear2="Loquacious Earring",
      body="Vanya Robe",           -- "Kaykaus Bliaut",
	  hands="Vanya Cuffs",         -- "Kaykaus Cuffs",
	 --  ring1="Janniston Ring",
	 --  ring2="Lebeche Ring",
     --  back="Tempered Cape +1",
	 --  waist="Luminary Sash",
	  legs="Vanya Slops",          -- "Chironic Hose",
	  feet="Vanya Clogs"           -- "Kaykaus Boots"
	}

    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
	  main="Chatoyant Staff",        	  
     -- back="Twilight Cape",
	  waist="Hachirin-no-Obi"
	})
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
	 --  back="Twilight Cape",
	  waist="Hachirin-no-Obi"
	})

    sets.midcast.Curaga = sets.midcast.LightWeatherCure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {
	  -- main="Oranyan",
	  -- sub="Clemency Grip",
	  -- ammo="Hasty Pinion +1",
	  head="Merlinic Hood",           -- "Amalric Coif +1",
	  -- neck="Debilis Medallion",
	  -- ear1="Enchntr. Earring +1",
	  -- ear2="Loquacious Earring",
	  body="Zendik Robe",
	  -- hands="Hieros Mittens",
	  -- ring1="Haoma's Ring",
	  ring2="Menelaus's Ring",
	  -- back="Swith Cape +1",
	  -- waist="Witful Belt",
	  -- legs="Psycloth Lappas",
	  feet="Vanya Clogs"
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {
	  main=gear.gada_enhancing_club,
	  sub="Ammurapi Shield",
	  ammo="Hasty Pinion +1",
	  head="Telchine Cap",
	  neck="Incanter's Torque",
	  ear1="Andoaa Earring",
	  ear2="Gifted Earring",
	  body="Telchine Chas.",
	  hands="Telchine Gloves",
	  ring1="Stikini Ring",
	  ring2="Stikini Ring",
	  back="Perimede Cape",
	  waist="Olympus Sash",
	  legs="Telchine Braconi",
	  feet="Telchine Pigaches"
	}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	  main="Pedagogy Staff",
	  back="Bookworm's Cape",
	})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
	  main="Akademos",           -- "Oranyan",
	  sub="Enki Strap",
	  ammo="Pemphredo Tathlum",
      head="Jhakri Coronal +1",  -- "Befouled Crown",
	  neck="Erra Pendant",
	  ear1="Regal Earring",
	  ear2="Malignance Earring",  -- "Digni. Earring",
      body="Zendik Robe",        -- "Chironic Doublet",
	  hands="Jhakri Cuffs +2",   --"Regal Cuffs",
	  ring1="Kishar Ring",
	  ring2="Stikini Ring",
      back=gear.nuke_jse_back,
	  waist="Luminary Sash",
	  legs="Jhakri Slops +1",    -- "Chironic Hose",
	  feet="Jhakri Pigaches +1"  -- "Uk'uxkaj Boots"
	}
	
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
	    -- head="Befouled Crown",
        -- body="Chironic Doublet",
		-- hands=gear.chironic_enfeeble_hands,
		-- ring1="Stikini Ring",		
		-- feet="Medium's Sabots"
	})	
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear1="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring",feet=gear.chironic_nuke_feet})

    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    sets.midcast.Kaustra = {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Kaustra.Resistant = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Crematio Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Zendik Robe",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
	  main="Akademos",
	  sub="Alber Strap",
	  ammo="Elis Tome",
	  head="Merlinic Hood",
	  neck="Mizu. Kubikazari",
	  ear1="Regal Earring",
	  ear2="Malignance Earring", -- "Friomisi Earring", -- 2 more mab, less macc / int
	  body="Amalric Doublet +1",
	  hands="Amalric Gages +1",
	  ring1="Mujin Band",
	  ring2="Locus Ring",
	  back="Bookworm's Cape",
	  waist="Eschan Stone",
	  legs="Amalric Slops +1",
	  feet="Amalric Nails +1", -- "Jhakri Pigaches +2"
	}
	  -- sub="Zuuxowu Grip",
	  -- ammo="Dosis Tathlum",
      -- head=gear.merlinic_nuke_head,
	  -- neck="Saevus Pendant +1",
	  -- ear1="Crematio Earring",
	
    sets.midcast['Elemental Magic'].Resistant = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",
		ear1="Malignance Earring", -- "Crematio Earring",
		ear2="Regal Earring",      -- "Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Akademos",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back=gear.nuke_jse_back,waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",
	  ear2="Malignance Earring", -- "Barkaro. Earring",
	  hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",
	  ear2="Malignance Earring", -- "Barkaro. Earring",
	  hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {sub="Alber Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages +1"})

	sets.midcast.Helix = {main="Akademos",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Malignance Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
	
	sets.midcast.Helix.Resistant = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",
		  ear1="Malignance Earring", -- "Barkaro. Earring",
		  ear2="Regal Earring", -- "Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric Doublet",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
	  main="Bolelabunga",
	  sub="Genmei Shield",
	  ammo="staunch tathlum +1",  -- "Homiliary",
      head="Volte Beret",      -- "Befouled Crown",
	  neck="Loricate Torque",
	  ear1="Etiolation Earring",
	  ear2="Ethereal Earring",
      body="Jhakri Robe +2",
	  hands=gear.merlinic_refresh_hands,
	  ring1="Defending Ring",
	  ring2="Dark Ring",
      back="Umbra Cape",
	  waist="Flax Sash",
	  legs="Assid. Pants +1",
	  feet=gear.chironic_refresh_feet
	}

    sets.idle.PDT = {
	  main="Malignance Pole",
	  sub="Oneiros Grip",
	  ammo="staunch tathlum +1",
        head="Gende. Caubeen +1",
	  neck="Loricate Torque",
	    ear1="Etiolation Earring",
	    ear2="Ethereal Earring",
        body="Vrikodara Jupon",
	    hands="Gende. Gages +1",
	  ring1="Defending Ring",
	    ring2="Dark Ring",
        back="Umbra Cape",
	    waist="Flax Sash",
	    legs="Hagondes Pants +1",
	    feet=gear.chironic_refresh_feet
	}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = set_combine(sets.idle.PDT, {
	  main="Bolelabunga",
	    sub="Genmei Shield",
	    ammo="Homiliary",
        head="Befouled Crown",	  
      body=gear.jhakri_body,
	    hands=gear.merlinic_refresh_hands,
        legs="Assid. Pants +1",
	    feet=gear.chironic_refresh_feet
	})
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

    -- Defense sets

    sets.defense.PDT = set_combine(sets.idle.PDT, {
	    sub="Umbra Strap",        
        body="Mallquis Saio +2",
        feet="Battlecast Gaiters"
	})

    sets.defense.MDT = set_combine(sets.defense.PDT, {	
    })
		
    sets.defense.MEVA = {main="Oranyan",sub="Umbra Strap",ammo="staunch tathlum +1",
        head=gear.merlinic_nuke_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.merlinic_nuke_body,hands="Gende. Gages +1",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
	sets.engaged.PDT = {main="Malignance Pole", sub="Oneiros Grip",ammo="staunch tathlum +1",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet=gear.chironic_refresh_feet}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Akademos = {
	  main="Akademos",
	  sub="Alber Strap" -- "Niobid Strap"
	}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end