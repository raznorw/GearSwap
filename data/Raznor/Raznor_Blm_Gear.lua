-- Blm Modes:
--   * OccultAcumen - don't swap weapon/sub/ranged to preserve TP
--                  - Used with Myrkr / Other MP tools to cast indefinitely (needs testing)
--                  - Consider a Khatvanga - less damage, more TP
--                  - Use "Oneiros Rope" for more TP
--                  - Perdition Slops are aother possibility, but at a very large MAB/Macc cost
--   * Refresh Idle - Max refresh/sublimation
--   * Defensive Idle - Max DT/MEva -- could separate into two defense poses I suppose

-- Lathi C   - 27 int, 15 Macc, 63 MAB, 232 Magic Damage, Enmity -10, Refresh +1
-- Khatvanga - Magic Damage 279, Occult Acument 30, Macc 30 if R15

-- Grio ties lathi C with: 
--   8 int (27 total)
--  33 MAB (63 total)
--   1 Macc (15 total)
-- Loses -10 enmity, 1 refresh
-- Gain ConMP 5, FC 4, whatever bonsu stats

-- Current grio:
--   int 9, macc 24, mab 14, MBB 7, magic dmg 5

function user_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal','Resistant','Fodder','Proc','OccultAcumen')
	state.OffenseMode:options('Normal')
	state.IdleMode:options('Normal', 'PDT', 'TPEat','DTHippo')
	state.Weapons:options('None','NukeWeapons','Khatvanga','Malevolence')

	gear.obi_cure_waist = "Witful Belt"
	gear.obi_low_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	gear.nuke_jse_back = {name="Taranus's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.stp_jse_back = {name="Taranus's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode') 
	send_command('bind ~^` gs c cycleback ElementalMode') --Robbiewobbie's idea
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons Default;gs c reset CastingMode;gs c reset DeathMode;gs c reset MagicBurstMode')
	-- send_command('bind !r gs c set DeathMode Single;gs c set MagicBurstMode Single')
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` input /ma "Aspir III" <t>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f9 gs c cycle DeathMode')
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace input /ja "Enmity Douse" <t>')
	send_command('bind @backspace input /ja "Alacrity" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind @= input /ja "Addendum: White" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
    
	select_default_macro_book()
end

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.NukeWeapons = {main="Lathi", sub="Enki Strap"} -- gear.grioavolr_nuke_staff,sub="Niobid Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
	sets.weapons.Malevolence = {main="Malevolence",sub="Ammurapi Shield"}
	
	-- Treasure Hunter
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back=gear.nuke_jse_back,feet="Wicce Sabots +1"}

    sets.precast.JA.Manafont = {} --body="Sorcerer's Coat +2"
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
	  main="Lathi", -- gear.grioavolr_fc_staff,
	  sub="Clerisy Strap",            -- 2, +1 for 3
	  ammo="Impatiens",
	  head="Merlinic Hood",           -- 8 unaug'd  -- "Amalric Coif +1",
	  neck="Voltsurge Torque",        -- 4
	  ear1="Malignance Earring",      -- 4 "Enchntr. Earring +1",  -- don't have
	  ear2="Loquacious Earring",      -- 2?
	  body="Zendik Robe",             -- 13
	  hands="Volte Gloves",      -- nothing good, I have merlinic gloves with +3 I can use      
	  ring1="Kishar Ring",            -- 4
	  ring2="Lebeche Ring",      -- don't have
	  back="Swith Cape +1",           -- 4   -- "Perimede Cape",
	  waist="Witful Belt",
	  legs="Psycloth Lappas",         -- 7
	  feet="Amalric Nails +1"         -- 6 -- "Regal Pumps +1"
	} -- 54 current FC, 30% from elemtental Celerity for elemental spells
	  -- +8 more celerity avail via gifts
	  
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ammo="staunch tathlum +1",
	  -- ear1="Barkaro. Earring",
	  ring2="Prolix Ring",back="Swith Cape +1",waist="Siegel Sash"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1",body="Heka's Kalasiris"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Death = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Impatiens",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
        body=gear.merlinic_nuke_body,hands="Volte Gloves",ring1="Mephitas's Ring +1",ring2="Lebeche Ring",
        back="Perimede Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Dosis Tathlum",
		head="Hagondes Hat +1",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Dosis Tathlum",
		head="Hagondes Hat +1",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Zendik Robe",hands="Hagondes Cuffs +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Fotia Belt",legs="Hagondes Pants +1",feet=gear.merlinic_nuke_feet}


    -- went from 860 to 1317 at abotu 1000 TP (457)
	-- currently have 1695 max MP in myrkr set with locked main/sub lathi
	--   1715 - swapped ammo
	--   1868 - fixed body to +1
	--   1886 - swapped gloves to vanya, don't have regal
	--   1956 - changed ring2 to sangoma, don't have either mephitas's
	--   1974 - changed feet to telchine pigaches, no medium's sabots
	--   2004 - changed waist to Fucho-no-Obi, don't have other options
	-- ** 1000 TP should be work 500ish base, plus another 5% from moonshade, so 600 mp return
    sets.precast.WS['Myrkr'] = {
	  ammo="Vanir Battery",
	  head="Pixie Hairpin +1",
	  neck="Sanctity Necklace",
	  ear1="Moonshade Earring",
	  ear2="Loquacious earring",  -- "Etiolation Earring",
	  body="Amalric Doublet +1",
	  hands="Vanya Cuffs",     -- "Regal Cuffs",
	  ring1="Mephitas's Ring +1",
	  ring2="Sangoma Ring",      -- "Mephitas's Ring",
	  back="Aurist's Cape +1",  -- "Bane Cape" -- 90 MP
	  waist="Fucho-no-Obi",      -- "Yamabuki-no-Obi",  -- "Shinjutsu-no-obi +1" -- 85 MP vs 35 for yamabuki
	  legs="Amalric Slops +1", 
	  feet="Telchine Pigaches",  -- "Medium's Sabots"    -- Max Aug +50 MP, for 70 mp total, Amalric NAils +1 (A) is 106 mp total
	}
		
	sets.MaxTPMyrkr = {ear1="Evans Earring",ear2="Etiolation Earring"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Malignance Earring",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    sets.midcast.Cure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Zendik Robe",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Tempered Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Phalaina Locket",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Heka's Kalasiris",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Phalaina Locket",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Zendik Robe",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Psycloth Lappas",feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Marin Staff +1",sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring","Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast['Enfeebling Magic'] = {
	  main="Grioavolr",              -- "Oranyan"
	  sub="Kaja Grip",               -- "Enki Strap",
	  ammo="Pemphredo Tathlum",
      head="Jhakri Coronal +2",      -- Befouled Crown",
	  neck="Erra Pendant",
	  ear1="Malignance Earring",
	  ear2="Regal Earring",
      body="Spaekona's Coat +3",     -- "Vanya Robe",
	  hands="Jhakri Cuffs +2",       -- "Regal Cuffs",
	  ring1="Kishar Ring",
	  ring2="Jhakri Ring",           -- "Stikini Ring",
      back=gear.nuke_jse_back,
	  waist="Eschan Stone",          -- "Luminary Sash",
	  legs="Psycloth Lappas",
	  feet="Jhakri Pigaches +1",     -- "Uk'uxkaj Boots"
	}
		
    sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Digni. Earring",ear2="Regal Earring",
        body="Vanya Robe",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear1="Barkaro. Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear1="Barkaro. Earring",waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Malignance Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Malignance Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
	
	sets.midcast.Death = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ear1="Malignance Earring",ear2="Etiolation Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Mujin Band",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast.Stun = {main="Oranyan",sub="Enki Strap",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Zendik Robe",hands="Volte Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Stun.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
        body="Zendik Robe",hands="Volte Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Witful Belt",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}

    sets.midcast.BardSong = {main="Oranyan",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Regal Earring",
        body="Zendik Robe",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Merlinic Shalwar",feet="Medium's Sabots"}
		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
	    main="Lathi", -- gear.grioavolr_nuke_staff,
		sub="Alber Strap", -- "Zuuxowu Grip",		
		ammo="Pamphredo Tathlum", -- "Dosis Tathlum",        
		head="Jhakri Coronal +2", -- gear.merlinic_nuke_head,
		neck="Saevus Pendant +1",
		ear1="Regal Earring", 
		ear2="Malignance Earring",
        body="Amalric Doublet +1",  -- gear.merlinic_nuke_body,
		hands="Amalric Gages +1", -- "Mallquis Cuffs +2",
		ring1="Jhakri Ring", -- "Shiva Ring +1",
		ring2="Vertigo Ring", -- "Shiva Ring +1",
        -- back=gear.nuke_jse_back,
		waist=gear.ElementalObi,
		legs="Amalric Slops +1",   -- legs="Merlinic Shalwar",
		feet="Amalric Nails +1" -- gear.merlinic_nuke_feet
		}
		
		-- set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
	    sub="Enki Strap", -- "Niobid Strap"
	    ammo="Pemphredo Tathlum",        
		neck="Sanctity Necklace",
		waist="Yamabuki-no-Obi",		
	})
	   
		
    sets.midcast['Elemental Magic'].Fodder = {main=gear.grioavolr_nuke_staff,sub="Zuuxowu Grip",  ammo="Dosis Tathlum",
      head=gear.merlinic_nuke_head,
	  neck="Saevus Pendant +1",
	  ear1="Malignance Earring",
	  ear2="Friomisi Earring",
      body=gear.merlinic_nuke_body,
	  hands="Mallquis Cuffs +2",
	  ring1="Shiva Ring +1",
	  ring2="Shiva Ring +1",
      back=gear.nuke_jse_back,
	  waist=gear.ElementalObi,
	  legs="Merlinic Shalwar",
	  feet=gear.merlinic_nuke_feet
	}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
	  sub="Niobid Strap",
	  ammo="Pemphredo Tathlum",
	  hands="Amalric Gages +1",
    })
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {sub="Niobid Strap",ammo="Pemphredo Tathlum",hands="Amalric Gages +1",back=gear.nuke_jse_back})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {sub="Alber Strap",ammo="Pemphredo Tathlum",hands="Amalric Gages +1",back=gear.nuke_jse_back,feet=gear.merlinic_nuke_feet})
	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="spaekona's coat +3",hands="Hagondes Cuffs +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Assid. Pants +1",feet="Regal Pumps +1"}
	
    -- Benefits from STP	
	-- thunder 6 - 437 base MP, 394 Dark Arts MP, 214 TP (in regular gear)
	-- Expected:  Blm has 50% OA base - so would have expected 218 TP
    sets.midcast['Elemental Magic'].OccultAcumen = {
	  main="Khatvanga",
	  sub="Bloodrain Strap",
	  ammo="Seraphic Ampulla",
      head="Mall. Chapeau +2",
	  neck="Combatant's Torque",
	  ear1="Dedition Earring",
	  ear2="Telos Earring",
      body=gear.merlinic_occult_body,
	  hands=gear.merlinic_occult_hands,
	  ring1="Rajas Ring",
	  ring2="Petrov Ring",
      back=gear.stp_jse_back,
	  waist="Oneiros Rope",
	  legs="Perdition Slops",
	  feet=gear.merlinic_occult_feet
	}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Ethereal Earring",ear2="Sanare Earring",
		body="Vrikodara Jupon",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Refoccilation Stone",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {
	  main="Bolelabunga",
	  sub="Genmei Shield",
	  ammo="staunch tathlum +1",
	  head="Volte Beret", -- "Befouled Crown",
	  neck="Loricate Torque",
	  ear1="Ethereal Earring",
	  ear2="Etiolation Earring",
	  body="Jhakri Robe +2",
	  hands=gear.merlinic_refresh_hands,
	  ring1="Defending Ring",
	  ring2="Schneddick Ring",
	  back="Umbra Cape",
	  waist="Flax Sash",
	  legs="Assid. Pants +1",
	  feet=gear.merlinic_refresh_feet
	}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {
	  main="Terra's Staff",
	  sub="Oneiros Grip",
	  ammo="staunch tathlum +1",
      head="Hagondes Hat +1",
	  neck="Loricate Torque +1",
	  ear1="Genmei Earring",
	  ear2="Etiolation Earring",
      body="Vrikodara Jupon",
	  hands=gear.merlinic_refresh_hands,
	  ring1="Defending Ring",
	  ring2="Dark Ring",
      back="Shadow Mantle",
	  waist="Flax Sash",
	  legs="Assid. Pants +1",
	  feet="Mallquis Clogs +2"
	}
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

	sets.idle.Death = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="staunch tathlum +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="staunch tathlum +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

    -- Defense sets

    sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",ammo="staunch tathlum +1",
        head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Flax Sash",legs="Hagondes Pants +1",feet="Mallquis Clogs +2"}

    sets.defense.MDT = {main="Terra's Staff",sub="Umbra Strap",ammo="staunch tathlum +1",
        head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Shadow Ring",
        back="Solemnity Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Mallquis Clogs +2"}
		
    sets.defense.MEVA = {main="Terra's Staff",sub="Enki Strap",ammo="staunch tathlum +1",
        head=gear.merlinic_nuke_head,neck="Warder's Charm +1",ear1="Sanare Earring",ear2="Etiolation Earring",
		body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Hagondes Pants +1",feet=gear.merlinic_nuke_feet}

	sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {feet=gear.merlinic_refresh_feet}
	sets.NightIdle = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Genmei Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
	sets.HPCure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
		head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Tempered Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = {back=gear.nuke_jse_back,feet="Wicce Sabots +1"}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="spaekona's coat +3"}
	-- Gear for Magic Burst mode.
    sets.MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
	  -- Grioavolr -- 7 MBB
	    head="Merlinic Hood", -- "Ea Hat",  11 MBB
		neck="Mizu. Kubikazari",          -- 10 MBB
		body="Ea Houppelande",           -- 8/8 MBB/2
		hands="Amalric Gages +1",
		ring1="Mujin Band",
		ring2="Locus Ring",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar", -- "Ea Slops",    -- 11 MBB
		feet="Amalric Nails +1", -- "Jhakri Pigaches +2"
		-- Taranus's Cape            -- 5 MBB
	})
	
	sets.ResistantMagicBurst = set_combine(sets.MagicBurst, {})	
	sets.RecoverBurst = set_combine(sets.MagicBurst, {
	   body="spaekona's coat +3",
	})
	sets.ResistantRecoverBurst = set_combine(sets.MagicBurst, {
	  body="spaekona's coat +3",
	  feet="Jhakri Pigaches +2"
	})
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Earth = {neck="Quanpur Necklace"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="staunch tathlum +1",
        head="Jhakri Coronal +2",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Jhakri Robe +2",hands="Jhakri Cufs +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Olseni Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(2, 2)
end