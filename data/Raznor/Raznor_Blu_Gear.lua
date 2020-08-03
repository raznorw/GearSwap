function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Fodder','Normal','Acc','FullAcc')
	state.HybridMode:options('Normal','DTLite')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder','Proc')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Savage', 'SavageAcc', 'MagicWeapons', 'Tizalmace','Sequence','None','Almace','MeleeClubs')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

    gear.fc_jse_back = { name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}
	gear.wsd_jse_back = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}}	
	gear.mab_jse_back  = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	gear.stp_jse_back  = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+8','"Store TP"+10','Phys. dmg. taken-10%',}}

	gear.da_jse_back = gear.stp_jse_back
	  -- {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.crit_jse_back = gear.stp_jse_back
	  -- {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}

	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_cure_back = "Tempered Cape +1"

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	-- send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +2"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Mirage Charuqs +2"} -- "Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Dampening Tam",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	-- Fast cast sets for spells
    -- COPIED
	sets.precast.FC = {
	  ammo = "Sapience Orb",      --  2        "Impatiens",
      head = "Carmine Mask +1",   -- 14	  	
	  neck = "Voltsurge Torque",  --  4  @20   "Orunmila's Torque",
	  ear1 = "Loquac. Earring",   --  2
	  -- ear2 = "Etiolation Earring", -- "Enchntr. Earring +1"
	  body = "Pinga Tunic",       -- 13  @35
	  hands = "Leyline Gloves",   --  6  -- only +1 aug, can get better aug'd version
	  ring1 = "Kishar Ring",      --  4
	  -- ring2 = "Prolix Ring",  -- "Lebeche Ring"		
	  back = gear.fc_jse_back,    -- 10  @55  -- "Perimede Cape"
	  -- waist = "Witful Belt", -- occ. quickens is BAD for DD spells
      legs ="Psycloth Lappas",    --  7
	  feet = "Chelona Boots"      --  4  @66  -- "Carmine Greaves +1"
	} -- @66, +15(20) from Fast Cast Trait - 1-6 over capped depending on sets		  		

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {waist = "Witful Belt"})

	sets.precast.FC['Blue Magic'] = sets.precast.FC  -- already capped, don't need blu body
	  -- set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
	  ammo="Ginsen",
	  head=gear.herculean_wsd_head,         -- "Adhemar Bonnet +1",
	  neck="Mirage Stole +1",        -- "Fotia Gorget",
	  ear1="Moonshade Earring",      -- "Cessance Earring",
	  ear2="Ishvara Earring",        -- "Brutal Earring",
      body="Assim. Jubbah +3",       -- "Adhemar Jacket +1",
	  hands="Jhakri Cuffs +2",
	  -- ring1="Epona's Ring",
	  -- ring2="Apate Ring",
      back=gear.wsd_jse_back,        -- gear.da_jse_back,
	  waist="Grunfeld Rope",         -- "Fotia Belt",
	  legs={ name="Herculean Trousers", augments={'Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Pet: STR+11','Weapon skill damage +9%','Accuracy+7 Attack+7',}},  -- "Samnuha Tights",
	  feet="Herculean Boots",        -- gear.herculean_ta_feet
	}

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
	  --ammo="Falcon Eye",
		--		  head="Carmine Mask +1",neck="Fotia Gorget",ear1="Regal Earring",ear2="Telos Earring",
			--	  body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Epona's Ring",ring2="Ilabrat Ring",
			  --    back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet
				  })

	sets.precast.WS.FullAcc = {ammo="Falcon Eye",
				  head="Carmine Mask +1",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
				  body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
			      back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
				  
    sets.precast.WS.DT = {ammo="Ginsen",
				  head="Malignance Chapeau",neck="Loricate Torque",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Malignance Tabard",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Ilabrat Ring",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.precast.WS.Fodder = {ammo="Ginsen",
				  head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket +1",hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Apate Ring",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Falcon Eye",head="Adhemar Bonnet +1",ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Adhemar Wrist. +1",ring2="Begrudging Ring",back=gear.crit_jse_back,feet="Thereoid Greaves"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Moonshade Earring",ring2="Begrudging Ring",body="Sayadio's Kaftan",back=gear.crit_jse_back,legs="Carmine Cuisses +1"})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
	  head=gear.herculean_wsd_head,
	  neck="Mirage Stole +1",     -- "Caro Necklace",
	  ear1="Moonshade Earring",
	  ear2="Ishvara Earring",
	  body="Assim. Jubbah +3",
	  hands="Jhakri Cuffs +2",
	  ring1="Ilabrat Ring",        -- "Ifrit Ring +1",
	  ring2="Rajas Ring",          -- "Rufescent Ring",
	  back=gear.wsd_jse_back,
	  waist="Metalsinger belt",  -- "Grunfeld Rope",
	  legs=gear.herculean_wsd_legs,
	  feet=gear.herculean_wsd_feet
	})
	
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {
	  -- legs="Carmine Cuisses +1"
	})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",ear1="Cessance Earring", ear2="Brutal Earring",ring2="Begrudging Ring",back=gear.crit_jse_back,feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Rufescent Ring",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Moonshade Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Assim. Jubbah +3",hands="Jhakri Cuffs +2"})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

    -- COPIED
	sets.precast.WS['Sanguine Blade'] = {
	  ammo = "Pemphredo Tathlum",
	  head = "Pixie Hairpin +1",
	  neck = "Sanctity Necklace",   -- "Baetyl Pendant"
	  ear1 = "Friomisi Earring",
	  ear2 = "Regal earring",
	  body = "Amalric Doublet +1",   -- gear.jhakri_body,
	  hands = gear.Amalric_D_hands, -- "Jhakri Cuffs +2" ? for macc?
	  ring1 = "Archon Ring",
	  -- ring2 = "Rufescent Ring", -- "Shiva Ring +1"
	  back = gear.mab_jse_back,
	  waist = "Eschan Stone",       -- "Yamabuki-no-Obi"
	  legs = "Amalric Slops +1",    -- "Jhakri Slops +1",
	  feet = "Amalric Nails +1",    -- gear.Amalric_D_feet  -- gear.jhakri_feet ?  for macc?
	}
	
	sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS['Sanguine Blade'], {
      head=gear.jhakri_head,
	  -- ring1="Shiva Ring +1",
	})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Helios Jacket",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		head="Lilitu Headpiece",neck="Caro Necklace",ear1="Suppanomimi",ear2="Telos Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet=gear.herculean_acc_feet}

	sets.midcast['Blue Magic'].Physical.Resistant = {main="Sequence",sub="Colada",ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet=gear.herculean_acc_feet}

	sets.midcast['Blue Magic'].Physical.Fodder = {main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",neck="Caro Necklace",ear1="Suppanomimi",ear2="Telos Earring",
		body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back="Cornflower Cape",waist="Grunfeld Rope",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +1"}

	sets.midcast['Blue Magic'].PhysicalAcc = {main="Sequence",sub="Colada",ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet=gear.herculean_acc_feet}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})


	-- Magical Spells --

    -- COPIED
	sets.midcast['Blue Magic'].Magical = {
	  ammo="Pemphredo Tathlum",
	  head="Jhakri Coronal +2",
	  neck="Sanctity Necklace",     -- "Baetyl Pendant",
	  ear1="Regal Earring",
	  ear2="Friomisi Earring",
	  body="Amalric Doublet +1",    -- "Jhakri Robe +2",
	  hands="Amalric Gages +1",
	  ring1="Kishar Ring",          -- "Shiva Ring +1",
	  ring2="Jhakri Ring",          -- "Shiva Ring +1",
      back=gear.mab_jse_back,
	  waist="Eschan Stone",         -- gear.ElementalObi,
	  legs="Amalric Slops +1",      -- "Jhakri Slops +2",
	  feet="Amalric Nails +1",      -- "Jhakri Pigaches +2"
	}
					 
	sets.midcast['Blue Magic'].Magical.Proc = {
	  ammo="Hasty Pinion +1",
	  head="Carmine Mask +1",
	  ear1="Enchntr. Earring +1",
	  ear2="Loquacious Earring",
	  body="Helios Jacket",
	  hands="Leyline Gloves",
	  ring1="Kishar Ring",
	  ring2="Prolix Ring",
	  back="Swith Cape +1",
	  waist="Witful Belt",
	  legs="Psycloth Lappas",
	  feet="Carmine Greaves +1"
	}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
	  neck="Sanctity Necklace",
	  hands="Jhakri Cuffs +2",
	  -- ring1="Stikini Ring",
	  -- ring2="Stikini Ring",
	  -- waist="Yamabuki-no-Obi"
	  legs=gear.jhakri_legs,
	  feet=gear.jhakri_feet
	})

	sets.midcast['Blue Magic'].Magical.Fodder = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
					 head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
					 body="Jhakri Robe +2",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
				     back=gear.ElementalCape,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {neck="Sanctity Necklace",ring1="Stikini Ring",ring2="Stikini Ring"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {main="Iris",sub="Iris",ammo="Pemphredo Tathlum",
			        head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
				    body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Stikini Ring",ring1="Stikini Ring",
					back="Cornflower Cape",waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Enfeebling Magic'] = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
			        head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
				    body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
					back=gear.mab_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}

	sets.midcast['Dark Magic'] = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
			        head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
				    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
					back=gear.mab_jse_back,waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Vampirism",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
			        head="Jhakri Coronal +2",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
				    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
					back=gear.mab_jse_back,waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Elemental Magic'] = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Dosis Tathlum",
					 head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
					 body="Jhakri Robe +2",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
				     back=gear.mab_jse_back,waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Jhakri Pigaches +2"}

	sets.midcast['Elemental Magic'].Resistant = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
					 head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
					 body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
				     back=gear.mab_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {
	  ammo="Pemphredo Tathlum",   -- ammo = "Hydrocera",
	  head="Carmine Mask +1",
	  -- neck="Incanter's Torque",  "Phalaina Locket", 
	  ear1="Regal Earring",       -- "Etiolation Earring", -- "Calamitous Earring",
	  ear2="Mendi. Earring",
	  body="Pinga Tunic",         -- "Vrikodara Jupon",
	  -- hands="Telchine Gloves",
	  -- ring1="Janniston Ring",  -- ring2 = "Rufescent Ring", "Stikini Ring",
	  ring2="Menelaus's Ring",
	  back=gear.ElementalCape,
	  waist=gear.ElementalObi,     -- waist = "Luminary Sash",
	  legs="Carmine Cuisses +1",   -- legs = "Gyve Trousers",
	  -- feet="Medium's Sabots"
	}

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",neck="Mavi Scarf",ear1="Regal Earring",ear2="Digni. Earring",
		body="Assim. Jubbah +3",hands="Luh. Bazubands +1",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +1"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {main="Iris",sub="Iris",ammo="Pemphredo Tathlum",
			       head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
			       back="Cornflower Cape",waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Stun.Resistant = {main="Iris",sub="Iris",ammo="Falcon Eye",
			       head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum",
					head="Carmine Mask +1",neck="Phalaina Locket",ear1="Gifted Earring",ear2="Loquac. Earring",
			        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
			        back=gear.ElementalCape,waist=gear.ElementalObi,legs="Gyve Trousers",feet="Medium's Sabots"}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="staunch tathlum +1",
					head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
			        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
			        back=gear.ElementalCape,waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Medium's Sabots"}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquac. Earring",
		body="Assim. Jubbah +3",hands="Rawhide Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Witful Belt",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +1"}

	sets.midcast['Blue Magic'].Buff = {main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquac. Earring",
		body="Assim. Jubbah +3",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Dark Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Falcon Eye",
			      head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
			      back="Bleating Mantle",waist="Flume Belt",legs="Lengo Pants",feet=gear.herculean_refresh_feet}

	-- Idle sets
	-- COPIED
	sets.idle =  set_combine(sets.malignance, {
	  -- main="Bolelabunga",       -- refresh +1
	  -- sub="Genmei Shield",
	  ammo="staunch tathlum +1",
	  -- head="Rawhide Mask",   -- refresh +1
	  neck="Loricate Torque",
	  -- ear1="Etiolation Earring", 
	  -- ear2="Ethereal Earring",
      body="Jhakri Robe +2",
	  -- hands=gear.herculean_refresh_hands,
	  ring1="Defending Ring",
	  ring2="Schneddick Ring",   -- could use Dark Ring or similar
      back="Moonbeam Cape",  -- 250 HP
	  waist="Flume Belt +1",
	  -- legs="Lengo Pants",  -- can get refresh +1
	  -- feet=gear.herculean_refresh_feet
	})

	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = set_combine(sets.malignance, { -- 31% DT, high meva	  
	  ammo="staunch tathlum +1",  -- 3 DT
	  neck="Loricate Torque",     -- 5 DT
	  -- ear1="Etiolation Earring", 
	  -- ear2="Genmei Earring",
      ring1="Defending Ring",     -- 10 DT
	  ring2="Schneddick Ring",    -- 18% movement speed
	  back="Moonbeam Cape",       -- 250 hp/5 DT, could use Meva cape instead?
	  waist="Flume Belt +1",      -- 4 PDT        other options here?
    })

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",ammo="staunch tathlum +1",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Brutal Earring",
		        body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Dark Ring",
				back="Moonlight Cape",waist="Windbuffet Belt +1",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="staunch tathlum +1",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Sanare Earring",
		        body="Ayanmo Corazza +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
				back="Engulfer Cape +1",waist="Flax Sash",legs="Hagondes Pants +1",feet="Ahosi Leggings"}

    sets.defense.MEVA = {main="Bolelabunga",sub="Genmei Shield",ammo="staunch tathlum +1",
        head="Amalric Coif +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Hashishin Mintan +1",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.mab_jse_back,waist="Luminary Sash",legs="Telchine Braconi",feet="Ahosi Leggings"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = { ring2="Schneddick Ring" }
	  -- legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	-- TODO: Herculean Treasure Hunter
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Assault = {ring1="Balrahn's Ring"}
	
	-- Weapons sets
	sets.weapons.Savage = {main="Naegling",sub="Machaera +2"}
	sets.weapons.SavageAcc = {main="Naegling",sub="Kaja Rod"}
	sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.MeleeClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.Almace = {main="Almace",sub="Sequence"}
	sets.weapons.Sequence = {main="Sequence",sub="Almace"}
	sets.weapons.MagicWeapons = {main="Naegling",sub="Kaja Rod"}
	
	-- Engaged sets

	sets.engaged = {
	  ammo="Ginsen",
	  head="Adhemar bonnet +1",
	  neck="Mirage Stole +1",
	  ear1="Telos Earring",        -- "Cessance Earring",
	  ear2="Brutal Earring",
	  body="Adhemar Jacket +1",
	  hands="Adhemar Wrist. +1",
	  ring1="Ilabrat Ring",        -- "Epona's Ring",
	  ring2="Petrov Ring",
	  back=gear.da_jse_back,
	  waist="Reiki Yotai", -- "Windbuffet Belt +1",
	  legs="Samnuha Tights", 
	  feet="Malignance Boots"     -- gear.herculean_ta_feet
	}

	sets.engaged.AM = {main="Tizona",sub="Almace",ammo="Ginsen",
			    head="Dampening Tam",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.Acc = set_combine(sets.engaged, {
	  -- ammo="Falcon Eye",
	  head="Malignance Chapeau",
	  -- neck="Combatant's Torque",
	  -- ear1="Cessance Earring",
	  -- ear2="Telos Earring",
	  body="Malignance Tabard",   -- "Ayanmo Corazza +2",
	  hands="Malignance Gloves",
	  -- ring1="Epona's Ring",
	  ring2="Petrov Ring",
	  back=gear.da_jse_back,
	  waist="Reiki Yotai",        -- "Windbuffet Belt +1",
	  legs="Malignance Tights",   -- "Carmine Cuisses +1",	  
	})
	

	sets.engaged.Acc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Dampening Tam",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.engaged.HighAcc = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Carmine Mask +1",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
				body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
				back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.engaged.HighAcc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Carmine Mask +1",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
			    body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.engaged.FullAcc = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Carmine Mask +1",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
				body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
				back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.engaged.FullAcc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Carmine Mask +1",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
			    body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
			    back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.engaged.Fodder = set_combine(sets.engaged, {
	  -- main="Tizona",sub="Almace",ammo="Ginsen",
		--	    head="Dampening Tam",neck="Ainia Collar",ear1="Dedition Earring",ear2="Brutal Earring",
		--	    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		--	    back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet
	  })

	sets.engaged.Fodder.AM = {main="Tizona",sub="Almace",ammo="Ginsen",
			    head="Dampening Tam",neck="Ainia Collar",ear1="Dedition Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.DTLite = set_combine(sets.engaged, {
	  ammo="staunch tathlum +1",    -- 2 DT
	  head="Malignance Chapeau", -- 6 DT
	  body="Ayanmo Corazza +2",  -- 6 DT
	  hands="Malignance Gloves", -- 5 DT
	  ring1="Defending Ring",    -- 10 dt
	  -- back=gear.da_jse_back,  -- 10 PDT
	  -- waist="Reiki Yotai",
	  legs="Malignance Tights",  -- 7 DT
	  feet="Malignance Boots"    -- 4 DT - other stuff "Ahosi Leggings" 
	}) -- 40 DT, 10 PDT - capped, skip neck, etc 
	  -- options: tiers - ie, don't use malig hands for adhemar +1, maybe head
	  -- options: flume belt: 4 pdt, loricate torque (+1): 5(6) DT

	sets.engaged.DTLite.AM = sets.engaged.DTLite 

	sets.engaged.PDT = sets.engaged.DTLite

	sets.engaged.Acc.DTLite = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Dampening Tam",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Ahosi Leggings"}

	sets.engaged.Acc.PDT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
				body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
				back="Moonlight Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Ahosi Leggings"}

	sets.engaged.HighAcc.DTLite = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Ahosi Leggings"}

	sets.engaged.HighAcc.PDT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
				body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
				back="Moonlight Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Ahosi Leggings"}

	sets.engaged.FullAcc.DTLite = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Telos Earring",
			    body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet=gear.herculean_acc_feet}

	sets.engaged.FullAcc.PDT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Telos Earring",
		        body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
				back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.engaged.Fodder.DTLite = {main="Tizona",sub="Almace",ammo="Ginsen",
			    head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
			    body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
			    back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Ahosi Leggings"}

	sets.engaged.Fodder.DTLite.AM = {main="Tizona",sub="Almace",ammo="Ginsen",
			    head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
			    body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
			    back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Ahosi Leggings"}

	sets.engaged.Fodder.PDT = {main="Tizona",sub="Almace",ammo="staunch tathlum +1",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
		        body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Patricius Ring",
				back="Moonlight Cape",waist="Windbuffet Belt +1",legs=gear.herculean_dt_legs,feet="Ahosi Leggings"}

	sets.engaged.MDT = {main="Tizona",sub="Almace",ammo="Ginsen",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
		        body="Adhemar Jacket +1",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Dark Ring",
				back="Engulfer Cape +1",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Ahosi Leggings"}

	sets.engaged.Acc.MDT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Telos Earring",
		        body="Adhemar Jacket +1",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Dark Ring",
				back="Engulfer Cape +1",waist="Olseni Belt",legs="Samnuha Tights",feet="Ahosi Leggings"}

	sets.engaged.HighAcc.MDT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Telos Earring",
		        body="Adhemar Jacket +1",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Dark Ring",
				back="Engulfer Cape +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Ahosi Leggings"}

	sets.engaged.FullAcc.MDT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Telos Earring",
		        body="Adhemar Jacket +1",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Dark Ring",
				back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.engaged.Fodder.MDT = {main="Tizona",sub="Almace",ammo="Ginsen",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Telos Earring",
		        body="Adhemar Jacket +1",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Dark Ring",
				back="Engulfer Cape +1",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Ahosi Leggings"}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Healing_Club = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Healing_DWClub = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Healing_Club = {}
	sets.Healing_DWClub = {}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 10)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 10)
	elseif player.sub_job == 'WAR' then
		set_macro_page(2, 10)
	elseif player.sub_job == 'RUN' then
		set_macro_page(2, 10)
	elseif player.sub_job == 'THF' then
		set_macro_page(2, 10)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 10)
	else
		set_macro_page(2, 10)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end