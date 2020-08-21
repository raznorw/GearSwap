-- Gear Options:
--    Turms Harness +1 - 52 acc, 12 STP, 128 MEva as an alternative to ayanmo corazza, but DT deficient

-- TODO: Midcast - want 3k hpaw

-- Enmity:  caps at 100 and crusade gives 30
--           Epeolatry: 23
--   futhark torque +2: 10


-- HP: 
--            Utu Grip: 70 hp
--   futhark torque +2: 60

function user_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('Epeolatry', 'Aettir','Lionheart','DualWeapons','DualNaegling')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

    gear.enmity_pdt_back = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}}
	gear.enmity_jse_back = gear.enmity_pdt_back
	  -- { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}
	-- TODO: Make an STP back also
	gear.stp_jse_back = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	   -- {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.dimi_jse_back = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')   --- alt
	send_command('bind @` gs c cycle RuneElement')   --- win
	send_command('bind ^` gs c RuneElement')         -- ctrl
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	-- send_command('bind !r gs c weapons Lionheart;gs c update')
	
	send_command('wait 6;input /lockstyle on;wait 6;input /lockstyle 1')
	select_default_macro_book()
	-- lockstyleset = 1
end

function init_gear_sets()

    sets.Enmity = {  -- currently 2885 HP
	  -- Epeolotry:               -- 23 Enmity
	  ammo="Sapience Orb",        --  2 Enmity -- "staunch tathlum +1",
	  head="Fu. Bandeau +3",  -- Rabid Visor is +6 enmity
	  neck="Futhark Torque +2",   -- 10 enmity, 60 hp -- "Unmoving Collar +1",
	  ear1="Friomisi Earring",    --  2 enmity, 0 hp
	  -- ear2="Trux Earring",
	  -- body="Emet Harness +1",
	  -- hands="Kurys Gloves", -- TODO: upgrade futhark mitons
	  ring1="Petrov Ring",        --  4 enmity
	  -- ring2="Vengeful Ring",
	  back=gear.enmity_pdt_back,  -- 10 enmity
	  waist="Sulla Belt",         --  3 enmity
	  legs="Eri. Leg Guards +1",  -- 11 enmity
	  feet="Ahosi Leggings"       --  7 enmity
    }
		 
    sets.Enmity.SIRD = set_combine(sets.Enmity, {	
		head="Meghanada Visor +1",		
		-- ear1="Genmei Earring",
		hands=gear.herculean_dt_hands,
		-- back=gear.enmity_jse_back,
		-- waist="Rumination Sash",
		legs="Carmine Cuisses +1",
		-- feet="Erilaz Greaves +1"
		})

    sets.Enmity.DT = set_combine(sets.Enmity, {	
        ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
	  ring1="Defending Ring", -- "Moonbeam Ring",
	  ring2="Moonbeam Ring",
      waist="Flume Belt +1",
	  legs="Eri. Leg Guards +1",
	  feet="Erilaz Greaves +1"
	})

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{
	   body="Runeist's Coat +3",
	   legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{
	    feet="Runeist's Boots +2" -- TODO: "Runeist's Boots +3"
		})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Fu. Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{
	  hands="Runeist's mitons +1" -- "Runeist's Mitons +3"}
	 })
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Fu. Bandeau +3"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Eschan Stone",legs=gear.herculean_nuke_legs,feet=gear.herculean_nuke_feet}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	sets.element.Earth = {neck="Quanpur Necklace"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +3"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",
		neck="Unmoving Collar +1",
		ear1="Enchntr. Earring +1",
		ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,
		hands=gear.herculean_waltz_hands,
		ring1="Defending Ring",
		ring2="Valseur's Ring",
        back="Moonlight Cape",
		waist="Chaac Belt",
		legs="Dashing Subligar",
		feet=gear.herculean_waltz_feet
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
	  ammo="Impatiens",
      head="Carmine Mask +1",        -- 14 FC
      neck="Voltsurge Torque",
	  -- ear1="Enchntr. Earring +1",
	  ear2="Loquacious Earring",
      -- body="Dread Jupon",
	  hands="Leyline Gloves",
	  -- ring1="Lebeche Ring",
	  ring2="Kishar Ring", 
      -- back="Moonbeam Cape",
	  waist="Flume Belt +1",
	  legs="Ayanmo cosciales", -- "Rawhide Trousers", - 5 FC
	  feet="Chelona Boots", -- "Carmine Greaves +1"
	}
			
	sets.precast.FC.DT = {ammo="staunch tathlum +1",
        head="Rune. Bandeau +1",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets -- sub="Utu Grip",
	sets.precast.WS = {	  -- setup for dimidation 
	  ammo="Knobkierrie",
      head="Herculean Helm",      -- "Lilitu Headpiece",
	  neck="Anu Torque",          -- "Fotia Gorget",
	  ear1="Moonshade Earring",
	  ear2="Sherida Earring",
      body="Adhemar Jacket +1",
	  hands="Meg. Gloves +2",  -- dimidation
	  ring1="Niqmaddu Ring",
	  ring2="Ilabrat Ring",       -- TODO: "Regal Ring",			
      back=gear.da_jse_back,
	  waist="Fotia Belt",
	  legs="Meg. Chausses +2",
	  feet=gear.herculean_wsd_feet, --TODO: gear.herculean_ta_feet
	}
	
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {
	        -- ammo="Seeth. Bomblet +1",
            -- head="Adhemar Bonnet +1",									
            body="Ayanmo Corazza +2",            
		})
	sets.precast.WS.Acc = set_combine(sets.precast.WS.SomeAcc, {
            -- head="Dampening Tam",
        })
	sets.precast.WS.HighAcc = set_combine(sets.precast.WS.Acc, {
            head="Meghanada Visor +2",
			ear1="Telos Earring",
            hands="Meg. Gloves +2",
            -- feet=gear.herculean_acc_feet
		})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS.HighAcc, {
	        -- ammo="Seeth. Bomblet +1",
            -- head="Carmine Mask +1",
			-- neck="Combatant's Torque",
			-- ear2="Zennaroi Earring",
            -- body="Meg. Cuirie +2",
			-- ring1="Ramuh Ring +1",
			-- ring2="Ramuh Ring +1",
            -- back=gear.stp_jse_back,
		})

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
	  ammo="Yamarang",
	  head="Adhemar Bonnet +1", 
	  neck="Futhark Torque +2",   -- TODO: "Fotia Gorget"	  
	  hands="Adhemar Wrist. +1",
	  ring2="Petrov Ring",        -- for the str 3, or ilabat for the attack and higehr dex?
	   legs="Meg. Chausses +2",
	})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
	sets.precast.WS['Decimation'] = set_combine(sets.precast.WS['Resolution'], {
	  
	})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{ 	  
	  -- utu grip
	  -- neck="Caro Necklace",
	  -- herc vest: acc, att, dex, wsd+	  
	  ear1="Ishvara Earring",
	  ear2="Moonshade Earring",
	  head=gear.herculean_wsd_head,
	  legs=gear.herculean_wsd_legs,
	  feet=gear.herculean_wsd_feet,
	  waist="Grunfeld Rope",
	  back=gear.dimi_jse_back
	})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet,
	  back=gear.dimi_jse_back})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet,
	  back=gear.dimi_jse_back})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{
	  back=gear.dimi_jse_back})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Impatiens",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo="staunch tathlum +1",
        head="Fu. Bandeau +3",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    -- TODO: get more +enh. skill (and duration) for temper.  example: exclore has 550 skill
	--    Mimir earring from Domain Invasion (600 points) - +10 enhancing skill
	--    Andoaa Earring from Delve  -- +5 skill
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
	  head="Erilaz Galea +1",
	  neck="Incanter's Torque",
	  ear1="Andoaa Earring",
	  hands="Runeist's Mitons +1",
	  back="Merciful Cape",
	  waist="Olympus Sash",
	  legs="Futhark Trousers +1"
	})
    
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
	  head="Fu. Bandeau +3", -- 7 
	  body="Herculean Vest", -- +4 "Taeon Tabard",
	  hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+25','Attack+7','Phalanx +5',}},
	  legs="Taeon Tights",
	  feet="Taeon Boots"}
    )
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +1"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="staunch tathlum +1",
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
	  ammo="staunch tathlum +1",       -- 'Homiliary',  -- refresh +1
	  head="Fu. Bandeau +3",           -- "Rawhide Mask",
	  neck="futhark torque +2",
	  ear1="Odnowa Earring +1",        -- "Genmei Earring",
	  ear2="Odnowa Earring",           -- "Ethereal Earring",
	  body="Runeist's Coat +3",
	  hands="Turms Mittens +1",        -- gear.herculean_refresh_hands,
	  ring1="Shneddick Ring",
	  ring2="Moonbeam Ring",
	  back="Moonbeam Cape",            -- gear.enmity_pdt_back,
	  waist="Flume Belt +1",
	  legs="Eri. Leg Guards +1",       -- "Rawhide Trousers", -- refresh +1
	  feet="Turms Leggings +1",        -- gear.herculean_refresh_feet
	}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = set_combine(sets.idle, {
	  ammo="staunch tathlum +1",
      head="Fu. Bandeau +3",
	  neck="Futhark Torque +2",
	  -- ear1="Genmei Earring",ear2="Ethereal Earring",
      body="Runeist's Coat +3",
	  hands="Turms Mittens +1",
	  ring1="Defending Ring",
	  ring2="Moonbeam Ring",
      back="Moonbeam Cape",
	  waist="Flume Belt +1",
	  legs="Eri. Leg Guards +1",
	  feet="Turm Leggings +1"
	})
		
	sets.idle.KiteTank = {ammo="staunch tathlum +1",
        head="Fu. Bandeau +3",neck="Vim Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Futhark Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.idle.Weak = {ammo='Homiliary',
		head="Rawhide Mask",neck="Loricate Torque",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's Coat +3",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet=gear.herculean_refresh_feet}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Refined Grip +1"}
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip" } -- "Refined Grip +1"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Kaja Axe", sub="Naegling"} -- {main="Firangi",sub="Reikiko"}
	sets.weapons.DualNaegling = {main="Naegling", sub="Kaja Axe"} -- {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	-- \todo - defense sets
	sets.defense.PDT = {            -- 3/3 grip
	  ammo="staunch tathlum +1",       -- 2/2
      head="Fu. Bandeau +3",        -- 5/0     -- "Meghanada Visor +2",
	  neck="futhark torque +2",        -- 4/4
	  ear1="Genmei Earring",        -- odnowa+1 0/2
	  ear2="Ethereal Earring",      -- odnowa   0/1
      body="Futhark Coat +3",      --  7/7
	  hands="Turms Mittens +1", -- gear.herculean_dt_hands,
	  ring1="Moonbeam Ring",       --  4/4
	  ring2="Defending Ring",      -- 10/10
      back=gear.enmity_pdt_back,   -- 10/0 -- "Shadow Mantle",
	  waist="Flume Belt +1",       --  4/0
	  legs="Eri. Leg Guards +1",   --  7/0
	  feet="Erilaz Greaves +1"     --  5/0 -- "Turms Leggings"    -- None
	 }
		
		
	sets.defense.PDT_HP = {ammo="staunch tathlum +1",
        head="Fu. Bandeau +3",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.defense.MDT = {ammo="Yamarang",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	sets.defense.MDT_HP = {ammo="staunch tathlum +1",
        head="Erilaz Galea +1",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.BDT = {ammo="staunch tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	sets.defense.BDT_HP = {ammo="staunch tathlum +1",
        head="Erilaz Galea +1",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.MEVA = {
	  ammo="staunch tathlum +1",
      head="Erilaz Galea +1",
	  neck="Warder's Charm +1",
	  ear1="Odnowa Earring +1",
	  ear2="Sanare Earring",
      body="Runeist's Coat +3",
	  hands="Turms Mittens +1",
	  ring1="Purity Ring",
	  ring2="Vengeful Ring",
      back=gear.enmity_pdt_back,
	  waist="Engraved Belt",
	  legs="Rune. Trousers +3",
	  feet="Erilaz Greaves +1"
	}
	sets.defense.MEVA_HP = {ammo="staunch tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {ammo="staunch tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {ammo="staunch tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {ammo="staunch tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
	    ammo="Yamarang",
        head="Adhemar Bonnet +1", -- "Dampening Tam",
		neck="Anu Torque",
		ear1="Telos Earring", -- "Brutal Earring",
		ear2="Sherida Earring",
        body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		ring1="Niqmaddu Ring",    
		ring2="Moonbeam Ring",    -- "Petrov Ring",   -- "Epona's Ring",
        back=gear.stp_jse_back,
		waist="Windbuffet belt +1",
		legs="Samnuha Tights",
		feet="Herculean Boots", -- "Turms leggings",       -- gear.herculean_ta_feet
	}
	
	sets.engaged.DW = set_combine(sets.engaged, {
	  waist="Reiki Yotai"
	})
	
    sets.engaged.SomeAcc = set_combine(sets.engaged, {	
	  neck="Sanctity Necklace", -- "Combatant's Torque",
	  body="Ayanmo Corazza +2",
	}) 
			
	sets.engaged.Acc = set_combine(sets.engaged.SomeAcc, {	
	  ammo="Falcon Eye", 
	  ear1="Telos Earring", -- "Cessance Earring",
	  legs="Meg. Chausses +2",
	}) 
	
	sets.engaged.HighAcc = set_combine(sets.engaged.Acc, {	
      head="Aya. Zucchetto +1",
	  ear1="Telos Earring",
	  hands="Meg. Gloves +2",
	  ring2="Ilabrat Ring",
      waist="Grunfeld Rope",
	  feet=gear.herculean_acc_feet
	})
	
	sets.engaged.FullAcc = set_combine(sets.engaged.HighAcc, {	
      -- head="Carmine Mask +1",
	  ear2="Zennaroi Earring",
      ring1="Ramuh Ring +1",
	  ring2="Ramuh Ring +1",
      waist="Olseni Belt",
	  legs="Carmine Cuisses +1",
	})
	  
	-- DT: 29 DT, 16 PDT, 25 PDT II (epeo)
    sets.engaged.DTLite = set_combine(sets.engaged, {		  
	  ammo="Yamarang",   -- meva/acc instead of DT
      head="Aya. Zucchetto +1",  --  2 \todo +2, 3 DT at +2  
	  neck="futhark torque +2",	 --  7 DT
      body="Ayanmo Corazza +2",  --  6 DT
	  hands="Turms Mittens +1",  -- "Meg. Gloves +2",
	  ring1="Defending Ring",    -- 10 DT
	  ring2="Moonbeam Ring",     --  4 DT "Patricius Ring",
      -- back="Moonlight Cape",  -- 10 PDT
	  legs="Meg. Chausses +2",   --  6 PDT
	  feet="Turms Leggings +1",      -- "Ahosi Leggings"
	})
	
    sets.engaged.SomeAcc.DTLite = set_combine(sets.engaged.DTLite, {
	  ammo="Falcon Eye",
      ear1="Cessance Earring",            
    })
	
	sets.engaged.Acc.DTLite = set_combine(sets.engaged.SomeAcc.DTLite, {	
      ear1="Telos Earring",
      waist="Grunfeld Rope",
	})
	
	sets.engaged.HighAcc.DTLite = set_combine(sets.engaged.Acc.DTLite, {	      	  
	  waist="Olseni Belt",
    })
			
	sets.engaged.FullAcc.DTLite = set_combine(sets.engaged.Acc.DTLite, {
      ear2="Zennaroi Earring",
    })
	
    sets.engaged.Tank = {          
             -- sub="Refined Grip +1",       --  3/3 (refined +1)
      ammo="staunch tathlum +1",   --  3/3
      head="Fu. Bandeau +3",       --  5/0     -- "Meghanada Visor +2",
	  neck="futhark torque +2",    --  7/7
	  ear1="Odnowa Earring +1",    --  0/2
	  ear2="Odnowa Earring",       --  0/1
	  body="Runeist's Coat +3",    --    <higher meva/hp>
               -- body="Futhark Coat +3",   --  7/7
	  hands="Turms Mittens +1",    --       4 haste, parry heal -- gear.herculean_dt_hands,
	  ring1="Moonbeam Ring",       --  4/4   -- moonlight for 5/5
	  ring2="Defending Ring",      -- 10/10
      back=gear.enmity_pdt_back,   -- 10/0  -- (5 parry) "Shadow Mantle",
	  waist="Flume Belt +1",       --  4/0
	  legs="Eri. Leg Guards +1",   --  7/0 -- Meg. Chausses +2 -- 6 PDT, -2 inq, less meva/hp/etc
	                                       -- +49 acc, 45 att, 5 TA, str, agi...
	  feet="Turms Leggings +1",       --   <higehr meva/inquartata 4>
	  -- feet="Erilaz Greaves +1"     --  5/0	   -- 107 meva, 25 res. all ele. 26 dex, 0 acc, haste 4	  
	} -- assuming refined grip (3/3), and swapping futhark coat for runeist coat (50 meva)
	-- DT 24, PDT 21, coat 7, 3 MDT -- 45 total, need 5 to lose coat
	-- ideally lose 15, cape 10 PDT -> 5 parry.  feet 5 pdt to 4(5) parry
	-- Options: Khonsu grip 6/6 (lose 5 enmity), gain 25 acc/macc, 4% haste
	--          Kaja grip   5/5 (lose 4 enmity), gain 25 acc/macc
	--       PDT Back - gain 10 PDT, lose 5 parry
	--       Turms leggings    - 137 meva, 4 parry, regen 4, 38 acc, 34 dex, haste 3
	--       Turms leggings +1 - 147 meva, 5 parry, regen 5, 48 acc, 39 dex, haste 3
    
	-- swap back, feet, body -- +5 net PDT (capped), +4 inq. (-1 net), +74 net meva, +bunch acc, +HP 
	--    -- numbers change for +3 relic body, which has 40 acc, 65 att, but still less meva/hp
    
	sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 13)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 13)
	elseif player.sub_job == 'SCH' then
		set_macro_page(2, 13)
	elseif player.sub_job == 'BLU' then
		set_macro_page(2, 13)
	elseif player.sub_job == 'WAR' then
		set_macro_page(2, 13)
	elseif player.sub_job == 'SAM' then
		set_macro_page(2, 13)
	elseif player.sub_job == 'DRK' then
		set_macro_page(2, 13)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 13)
	else
		set_macro_page(2, 13)
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
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
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