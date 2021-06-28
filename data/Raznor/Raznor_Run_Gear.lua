-- Casting Mode Cycle - Win-F11
-- Idle Mode Cycle    - Win-F12
-- Engaged Mode       - F9

-- TODO:
--   Add macros for mode swapping which updates ALL relevant modes 
--   e.g.  SuperTank - sets IdleMode, CastingMode, OffenseMode, etc
-- IdleMode(s) with Tank in the name are only used in combat/being attacked, other the mode is ignored and the <Base> set is used
-- CastingMode(s) with DT or SIRD in the name are only used in combat/being attacked <Base> set is used
--    This check happens AFTER the spell specific check

-- Futhark Trousers - still +1?

-- NOTE: Hybrid Mode appears to be used in get_melee_set but NOT in weaponskill sets
--    Might want to define a Tank weaponskill mode
--    Or define a "get_custom_wsmode" function in run gear lua
--  Alternatively, Add 'Hybrid' and 'Tank' to Offense Modes instead
--    and then just use appropriate Idle Mode to correspond


-- NOTE: Idle Set is completely separate from OffenseMode

-- From Sel-Include (set layering) (get_melee_set)
--   sets.engaged
--   if exist:  state.CombatForm               -- unused everywhere at the moment
--   if exist:  state.CombatWeapon
--   if exist:  state.OffenseMode
--   if exist:  state.HybridMode
--   if exist:  group in classes.CustomMeleeGroups 
--   if exist:  user_customize_melee_set function
--   if exist:  job_customize_melee_set function
--   if exist:  user_job_customize_melee_set function
--   if exist:  state.ExtraMeleeMode  (combine with, not layer)
--   combine capacity
--      apply_defense
--      apply_kiting
--   combine reive, sleep, doom
--   if exist:  extra_user_customize_melee_set function

-- get_idle_set
-- Idle set is similar, but also checks weakness (first)             = Win-F12 cycles idle mode
--   Also checks state.IdleMode.current:contains('DT') or ('Tank')
--   Can use state.NonCombatIdleMode also
-- apply_defense / apply_kiting still layers on idle mode


-- get_precast_set  -> calls select_specific_set after selecting a cat (FC/WS/JA/RA/Item)
--   then layer CastingMode or get_weaponskill_set or equipSet[classes.JAMode]...
--   then layers set_elemental_gear

-- get_midcast_set -> only Item/RA have special cat here
--   call select_specific_set  or get_ranged_set

-- Acc Goals:  1200 for w3, 1300-1350 for w3 thf/nin/mnk
-- Sailfi Belt - 

-- Soporific, Geist Wall, Sheep Song -- Blank Gaze, Jettatura 

-- Taeon Tabard - 4 FC base - leafdim can add 1-5 more
--    Cheaper than anothe adhemar jacket +1 probably, but way less HP 

-- https://www.ffxiah.com/forum/topic/54783/destinys-device-a-newupdated-rune-fencer-guide/#equipment
-- https://github.com/Akirane/XIVHotbar

-- DT Dimidiation Set - 4/5 Meg+2, Herc Body
-- 

-- Gear Options:
--    Turms Harness +1 - 52 acc, 12 STP, 128 MEva as an alternative to engaged.t corazza, but DT deficient

-- TODO: Midcast - want 3k hpaw

-- Enmity:  caps at 100 and crusade gives 30
--           Epeolatry: 23
--   futhark torque +2: 10


-- HP: 
--            Utu Grip: 70 hp
--   futhark torque +2: 60

function user_setup()
    -- Offense Modes
    --   Remove SomeAcc, Acc, FullAcc
	--   Add    Hybrid, Tank   -- do we want HyridAcc also?  pre/post AM3?
    -- Hybrid 
	--   Removed hybrid modes.  Unnecessarily complex layering
    -- CastingMode
	--   Add IdleTank - for idle Tank casting
	-- WeaponskillMode
	--   Match only - but that might break?  do we need Normal?
	-- IdleMode
	--   Renamed Tank to SuperTank
	-- >> related to sets.engaged.<OffenseMode>
	state.OffenseMode:options('Normal','HighAcc','Hybrid','Tank','EvasionTank')
	  -- States:  idle, engaged, precast (and ws), midcast, JA
	state.HybridMode:options('Normal')
	-- 'Match' for WS mode requires to have WS mode with SAME name as OffenseMode
	state.WeaponskillMode:options('Match', 'Normal', 'HighAcc', 'Hybrid', 'Tank', 'EvasionTank')
	-- >> sets.precast.FC.[SpellName.]CastingMode
	-- >> sets.midcast.[SpellName.]CastingMode
	-- >> CastingModes with DT and SIRD have special checks 
	state.CastingMode:options('Normal','SIRD','IdleTank', 'TankDT')
	   -- IdleTank - for idle tanking, will always override base precast
	   -- TankDT - for engaged tanking,  override only in combat
	   -- For midcast, both work the same.  Can probably ignore precast
	   --    variants unless HP drops too much
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	-- sets.idle.[IdleMode] -- will ignore <Tank> idle when not in combat
	state.IdleMode:options('Normal','SuperTank','SuperEvasionTank','KiteTank','Sphere')
	state.Weapons:options('Epeolatry', 'Aettir','Lionheart','DualWeapons','DualNaegling', 'EpeoHP', 'EpeoEvasion')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

    gear.enmity_pdt_back = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}}
	gear.enmity_jse_back = gear.enmity_pdt_back
	  -- { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}
	-- TODO: Make an STP back also
	gear.stp_jse_back = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	   -- {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.dimi_jse_back = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.ogma_evasion = { name="Ogma's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}}

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
	
	-- send_command('bind ^q state.CastingMode:set("IdleTank")')
	send_command('bind ^q gs c set CastingMode IdleTank')
	
	send_command('wait 6;input /lockstyle on;wait 6;input /lockstyle 1')
	select_default_macro_book()
	-- lockstyleset = 1
end

function init_gear_sets()

    -- todo: engaged Enmity and IdleTank Enmity sets
	--   only different might be the turms mittens

    sets.EvasionTank = {
	  -- main="Soulcleaver",  -- evasion greatsword - Vagary, will probably stick to Epeo	  
	    -- cycle weapons to EpeoEvasion for now
	  ammo="Yamarang",	  
      head=gear.nyame_head,
	  neck="Futhark Torque +2",    -- \todo Bathy Choker +1 - augmented
	  ear1="Odnowa Earring +1",    -- \todo ear2="Infused Earring", - Zi'Tah - Gulltop
	  ear2="Eabani Earring",
      body=gear.nyame_body,
	  hands=gear.nyame_hands,
	  ring1="Vengeful Ring",
	  ring2="Ilabrat Ring",  -- \note regal has less HP
      back=gear.ogma_evasion,
	  waist="Kasiri Belt",
	  legs=gear.nyame_legs,
	  feet=gear.nyame_feet
	}

    sets.Enmity = {  -- currently 2885 HP
	  -- Epeolotry:               -- 23 Enmity
	  ammo="Sapience Orb",        --  2 Enmity -- "staunch tathlum +1",
	  head="Fu. Bandeau +3",  -- Rabid Visor is +6 enmity
	  neck="Futhark Torque +2",   -- 10 enmity, 60 hp -- "Unmoving Collar +1",
	  ear2="Friomisi Earring",    --  2 enmity, 0 hp
	  -- ear2="Trux Earring",    -- has 5, cryptic earring has 4
	  body=gear.nyame_body,      -- "Emet Harness +1",  -- has 10 enmity
	  hands="Turms Mittens +1",  -- hands="Kurys Gloves", -- TODO: upgrade futhark mitons
	  ring1="Petrov Ring",        --  4 enmity
	  -- ring2="Vengeful Ring",   -- eihwaz ring - 70 hp, 5 enmity
	  back=gear.enmity_pdt_back,  -- 10 enmity
	  waist="Sulla Belt",         --  3 enmity - trance belt has 4 and 14 hp
	  legs="Eri. Leg Guards +1",  -- 11 enmity
	  feet="Ahosi Leggings"       --  7 enmity
    }
		 
    sets.Enmity.SIRD = set_combine(sets.Enmity, {	
		head=gear.meg_head,		--? this doesn't add SIRD, why are we using it?
		-- ear1="Genmei Earring",
		hands=gear.herculean_dt_hands, --?  pretty sure this doens't exist, and has no native SIRD
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
    sets.precast.JA['Vivacious Pulse'] = {
	  head="Erilaz Galea +1",
	  neck="Incanter's Torque",
	  ring1="Stikini Ring",
	  ring2="Stikini Ring",
	  legs="Rune. Trousers +3"
	}
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
		
	-- Fast cast sets for spells  -- need to use priority settings here to fix HP loss
	-- Also, set needs a huge upgrade/rework
    sets.precast.FC = {
	  ammo="Sapience Orb",           --  2,   "Impatiens", -- 0, has QC
      head="Carmine Mask +1",        -- 14 FC -- Ru. Bandeau +3 is also 14 FC, but 70 HP higher
      neck="Voltsurge Torque",       --  4
	  -- ear1="Enchntr. Earring +1", -- need etioliation earring
	  ear2="Loquacious Earring",     -- apparently, can use HP earring here instead with enough FC elsewhere
      -- body="Dread Jupon",  -- Adhemar +1 Path D - is 10FC, 138ish HP
	  hands="Leyline Gloves",        --  6 - need better augment - currently at 6 of 8 possible FC
	  -- ring1="Lebeche Ring",
	  ring2="Kishar Ring",           --  4 - gives 4 FC, no HP, can we change for Moonlight ring for HP?
      -- back="Moonbeam Cape",       -- todo: fast cast cape -- I guess, sux
	  waist={"Flume Belt +1", priority=1},
	  legs="Ayanmo cosciales +2",    --  6 for +2
	  feet="Chelona Boots", -- "Carmine Greaves +1" - carmine give 8 FC, 95 HP - chelona give 4 FC
	}  -- 
	
	-- sets.precast.FC			
			
	sets.precast.FC.DT = {ammo="staunch tathlum +1",
        head="Rune. Bandeau +1",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    -- HighAcc / Hybrid / Tank
	-- Weaponskill sets -- sub="Utu Grip",
	sets.precast.WS = {	  -- setup for dimidation 
	  ammo="Knobkierrie",
      head="Herculean Helm",      -- "Lilitu Headpiece",
	  neck="Anu Torque",          -- "Fotia Gorget",
	  ear1="Moonshade Earring",
	  ear2="Sherida Earring",
      body="Adhemar Jacket +1",
	  hands="Meg. Gloves +2",  -- dimidation
	  ring1="Regal Ring",         -- "Niqmaddu Ring", - regal has +50 HP which is nice
	  ring2="Ilabrat Ring",       
      back=gear.da_jse_back,
	  waist="Fotia Belt",
	  legs="Meg. Chausses +2",
	  feet=gear.herculean_wsd_feet, --TODO: gear.herculean_ta_feet
	}
	
	-- TODO: Verify this works - copy/paste of sets.engaged.Tank right now
	-- TODO: Verify this works with all Acc substances - not sure if we need them also
    sets.precast.WS.Tank =  {
      ammo="staunch tathlum +1",   --  3/3
      head=gear.nyame_head,        --   7/7
	  neck="futhark torque +2",    --  7/7
	  ear1="Odnowa Earring +1",    --  0/2 -- todo: upgrade for 3 dt, 30 def
	  ear2="Odnowa Earring",       --  0/1 -- todo: tuisto earring for 50 more HP, 7 more vit
	  body=gear.nyame_body,        --  9/9
	  hands="Turms Mittens +1",    --       4 haste, parry heal -- gear.herculean_dt_hands,
	  ring1="Moonbeam Ring",       --  4/4   -- moonlight for 5/5
	  ring2="Defending Ring",      -- 10/10
      back=gear.enmity_pdt_back,   -- 10/0  -- (5 parry) "Shadow Mantle",
	  waist="Flume Belt +1",       --  4/0
	  legs=gear.nyame_legs,        --  8/8 -- Meg. Chausses +2 -- 6 PDT, -2 inq, less meva/hp/etc
	                                       -- +9 acc, 5 att, 5 TA, str, agi...
	  feet="Turms Leggings +1",       --   <higher meva/inquartata 4>	  
	}
	
	
	sets.precast.WS.HighAcc = set_combine(sets.precast.WS.Acc, {
            head="Meghanada Visor +2",
			ear1="Telos Earring",
            hands="Meg. Gloves +2",
			body="Ayanmo Corazza +2",          
            -- feet=gear.herculean_acc_feet
		})
	
    -- \todo EvasionTank WS Set	
	sets.precast.WS.EvasionTank = set_combine(sets.precast.WS.Tank, {})	
	-- \todo Hybrid WS Set
	sets.precast.WS.Hybrid = set_combine(sets.precast.WS.Tank, {})	
		
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
	  ring2="Niqmaddu Ring",
	   legs="Meg. Chausses +2",
	})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].Tank = sets.precast.WS.Tank
	sets.precast.WS['Resolution'].EvasionTank = sets.precast.WS.EvasionTank
	sets.precast.WS['Resolution'].Hybrid = sets.precast.WS.Hybrid
	
	sets.precast.WS['Decimation'] = set_combine(sets.precast.WS['Resolution'], {
	})
	sets.precast.WS['Decimation'].Hybrid = sets.precast.WS['Resolution'].Hybrid

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
--    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet,
--	  back=gear.dimi_jse_back})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{
	   legs=gear.herculean_wsd_legs,
	   feet=gear.herculean_wsd_feet,
	   back=gear.dimi_jse_back})
	--sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{
	--  back=gear.dimi_jse_back})
	sets.precast.WS['Dimidiation'].Tank = sets.precast.WS.Tank
	sets.precast.WS['Dimidiation'].EvasionTank = sets.precast.WS.EvasionTank
	-- \todo: Might want to use some WSD get in hybrid set, or maybe even full regular
	--        Dimidiation set here
	sets.precast.WS['Dimidiation'].Hybrid = sets.precast.WS.Hybrid


	
	-- TODO - Tank Dimidiation Set -- andthen double check to make sure it's being used properly with Hybrid mode, not just Defense Mode
	-- sets.precast.WS['Dimidiation'].Tank
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
    sets.precast.WS['Ground Strike'].Tank = sets.precast.WS.Tank
	sets.precast.WS['Ground Strike'].EvasionTank = sets.precast.WS.EvasionTank
	sets.precast.WS['Ground Strike'].Hybrid = sets.precast.WS.Hybrid
	
	-- \todo High Macc Set for Shockwave -- str/mnd mods, no FTP Transfer, 1.0 ftp
	sets.precast.WS['Shockwave'] = set_combine(sets.precast.WS.EvasionTank, {
	  head="Aya. Zucchetto +2",  --  3 DT  	  
      body="Ayanmo Corazza +2",  --  6 DT
	  hands=gear.nyame_hands,   
	  legs="Ayanmo cosciales +2", 
	  feet=gear.nyame_feet  -- ayanmo has more, but one less thing to carry
	})
	-- \todo Ayanmo has more macc
	sets.precast.WS['Shockwave'].EvasionTank = sets.precast.WS.EvasionTank
	
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
	
	sets.midcast['Enhancing Magic'].IdleTank = sets.EvasionTank
    
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
	  head="Fu. Bandeau +3", -- 7 
	  body=gear.herculean_phalanx_body, -- only +4
	  hands=gear.herculean_phalanx_hands,
	  legs="Taeon Tights",
	  feet=gear.herculean_phalanx_feet
	})
	-- sets.midcast['Phalanx'].IdleTank = sets.EvasionTank
	
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +2"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.IdleTank = sets.EvasionTank
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.IdleTank = sets.EvasionTank
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.IdleTank = sets.EvasionTank
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})
	
    sets.midcast['Blue Magic'].IdleTank = sets.EvasionTank


    sets.midcast.Cure = {ammo="staunch tathlum +1",
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
	sets.midcast['Wild Carrot'].IdleTank = sets.EvasionTank
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
    -- 'Normal','SuperTank','SuperEvasionTank','KiteTank','Sphere

	sets.resting = {}

    sets.idle = {
	  	  -- grip - Refined Grip +1 aug'd with Def +20, parry skill +10
	  ammo="Yamarang",	  
      head=gear.nyame_head,
	  neck="Futhark Torque +2",    -- \todo Bathy Choker +1 - augmented
	  ear1="Odnowa Earring +1",    -- \todo ear2="Infused Earring", - Zi'Tah - Gulltop
	  ear2="Eabani Earring",
      body=gear.nyame_body,
	  hands=gear.nyame_hands,
	  ring1="Vengeful Ring",
	  ring2="Ilabrat Ring",  -- \note regal has less HP
      back=gear.ogma_evasion,
	  waist="Kasiri Belt",
	  legs=gear.nyame_legs,
	  feet=gear.nyame_feet
	  
	  -- ammo="staunch tathlum +1",       -- 'Homiliary',  -- refresh +1
	  -- head="Fu. Bandeau +3",           -- "Rawhide Mask",
	  -- neck="futhark torque +2",
	  -- ear1="Odnowa Earring +1",        -- "Genmei Earring",
	  -- ear2="Odnowa Earring",           -- "Ethereal Earring",
	  -- body="Runeist's Coat +3",
	  -- hands="Turms Mittens +1",        -- gear.herculean_refresh_hands,
	  -- ring1="Shneddick Ring",
	  -- ring2="Moonbeam Ring",
	  -- back="Moonbeam Cape",            -- gear.enmity_pdt_back,
	  -- waist="Flume Belt +1",
	  -- legs="Eri. Leg Guards +1",       -- "Rawhide Trousers", -- refresh +1
	  -- feet="Turms Leggings +1",        -- gear.herculean_refresh_feet
	}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	-- Notengaged.e: Switch to EpeoHP weapon set
	-- Note: Switch to EpeoHP weapon set
	sets.idle.SuperTank = set_combine(sets.idle, {
	  -- grip - Refined Grip +1 aug'd with Def +20, parry skill +10
	  ammo="staunch tathlum +1",	  
      head=gear.nyame_head,
	  neck="Futhark Torque +2",    -- loricate torque +1, aug'd with 45 def
	  -- ear1="Genmei Earring",  -- \todo 
	  -- ear2="Tuisto Earring",  -- \todo  Get Tuisto Earring
      body=gear.nyame_body,
	  hands=gear.nyame_hands,
	  ring1="Defending Ring",  -- \todo Gelatinous Ring +1 aug'd wit vit +15, hp +100
	  ring2="Moonbeam Ring", -- \todo:  Moonlight Ring
      back="Moonbeam Cape",  -- \todo: Ogma's With Def/Vit or hp +60, meva, enmity +, 
	  waist="Flume Belt +1", -- \todo: Option:  engraved belt
	  legs=gear.nyame_legs,
	  feet=gear.nyame_feet
	})
	
	sets.idle.SuperEvasionTank = set_combine(sets.idle, {
	  -- main="Soulcleaver",  -- evasion greatsword - Vagary, will probably stick to Epeo	  
	    -- cycle weapons to EpeoEvasion for now
	  ammo="Yamarang",	  
      head=gear.nyame_head,
	  neck="Futhark Torque +2",    -- \todo Bathy Choker +1 - augmented
	  ear1="Odnowa Earring +1",    -- \todo ear2="Infused Earring", - Zi'Tah - Gulltop
	  ear2="Eabani Earring",
      body=gear.nyame_body,
	  hands=gear.nyame_hands,
	  ring1="Vengeful Ring",
	  ring2="Ilabrat Ring",  -- \note regal has less HP
      back=gear.ogma_evasion,
	  waist="Kasiri Belt",
	  legs=gear.nyame_legs,
	  feet=gear.nyame_feet
	})
		
    -- Basically SuperTank with Movement Speed
	sets.idle.KiteTank = set_combine(sets.idle.SuperTank, {
        head="Fu. Bandeau +3",		
        body="Futhark Coat +3",
		hands="Nyame Gauntlets",  -- gear.herculean_dt_hands,
		ring1="Defending Ring",   -- Or Schneddick
		ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",
		legs="Carmine Cuisses +1",
		feet="Hippo. Socks +1"
    })

    -- automatic set used when dead
	sets.idle.Weak = {ammo='Homiliary',
		head="Rawhide Mask",neck="Loricate Torque",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's Coat +3",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet=gear.herculean_refresh_feet}

	sets.Kiting = {
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
	  legs="Eri. Leg Guards +1",      
	  feet="Turms Leggings +1",        -- gear.herculean_refresh_feet
	  -- legs="Carmine Cuisses +1"
	}
	
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
	sets.weapons.EpeoHP = {main="Epeolatry",sub="Refined Grip +1" } 
	sets.weapons.EpeoEvasion = {main="Epeolatry",sub="Kupayopl" } 
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
    -- <normal>, <DW>, HighAcc, Tank, EvasionTank, Hybrid
    

    -- 1166 Accuracy -- super low -- Path A Adehmar set would add 60 acc
	  -- Better herc boots would help too
	  -- Using Str Cape, could have 30 dex version for 22 acc	
    -- sets.engaged = {
	    -- ammo="Yamarang",
        -- head="Adhemar Bonnet +1", -- "Dampening Tam",
		-- neck="Anu Torque",
		-- ear1="Telos Earring", -- "Brutal Earring",
		-- ear2="Sherida Earring",
        -- body="Adhemar Jacket +1",
		-- hands="Adhemar Wrist. +1",
		-- ring1="Niqmaddu Ring",    
		-- ring2="Moonbeam Ring",    -- "Petrov Ring",   -- "Epona's Ring",
        -- back=gear.stp_jse_back,
		-- waist="Windbuffet belt +1",
		-- legs="Samnuha Tights",
		-- feet="Herculean Boots", -- "Turms leggings",       -- gear.herculean_ta_feet
	-- }
	
	sets.engaged = {
	  -- main="Soulcleaver",  -- evasion greatsword
	  -- sub="Kupayopl",     -- evasion grip
	  ammo="Yamarang",	  
      head=gear.nyame_head,
	  neck="Futhark Torque +2",    -- \todo Bathy Choker +1 - augmented
	  ear1="Eabani Earring",
	  ear2="Odnowa Earring +1",    -- \todo "Infused Earring",
      body=gear.nyame_body,
	  hands=gear.nyame_hands,
	  ring1="Vengeful Ring",
	  ring2="Ilabrat Ring",  -- \todo not regal?  I guess regal has less HP
      back="Moonbeam Cape",  -- \todo: Ogma's 20 agil, 45 eva, 20 meva, 10 enmity
	  waist="Kasiri Belt",
	  legs=gear.nyame_legs,
	  feet=gear.nyame_feet
	}
	
	-- Ioskeha Belt +1   - 17 acc, 8 haste, 9 DA
	-- Kentarch +1 aug'd - 3 da, 1-5 STP, 14 acc, 10 dex (so 21ish acc), also 10 str
	-- Windbuffet +1     - 2 acc, 2 TA, 2 QA
	-- Sailfi Belt +1  -- 
	
	sets.engaged.DW = set_combine(sets.engaged, {
	  waist="Reiki Yotai"
	})
		
	-- 1313 acc
	sets.engaged.HighAcc = set_combine(sets.engaged, {	
			  neck="Sanctity Necklace", -- "Combatant's Torque",
	  body="Ayanmo Corazza +2",
	  ammo="Falcon Eye", 
	  ear1="Telos Earring", -- "Cessance Earring",
	  legs="Meg. Chausses +2",
	  feet=gear.meg_feet,
      head="Aya. Zucchetto +2",
	  ear1="Telos Earring",
	  hands="Meg. Gloves +2",
	  ring2="Ilabrat Ring",  -- regal ring - 15 acc, some att vs 5 STP
      waist="Ioskeha Belt +1",
	  -- feet=gear.herculean_acc_feet
	})
	
	-- sets.engaged.FullAcc = set_combine(sets.engaged.HighAcc, {	
      -- -- head="Carmine Mask +1",
	  -- ear2="Zennaroi Earring",
      -- ring1="Ramuh Ring +1",
	  -- ring2="Ramuh Ring +1",
      -- waist="Olseni Belt",
	  -- legs="Carmine Cuisses +1",
	-- })
	  
	-- DT: 29 DT, 16 PDT, 25 PDT II (epeo), 1286 acc
	-- Some inquartata, 479 meva  (572 in tank engaged set) - dnc malig. idle has 674
    sets.engaged.Hybrid = set_combine(sets.engaged, {		  
	  ammo="Yamarang",   -- meva/acc instead of DT
      head="Aya. Zucchetto +2",  --  3 DT  
	  neck="futhark torque +2",	 --  7 DT
      body="Ayanmo Corazza +2",  --  6 DT
	  hands="Turms Mittens +1",  -- "Meg. Gloves +2",
	  ring1="Defending Ring",    -- 10 DT
	  ring2="Moonbeam Ring",     --  4 DT "Patricius Ring",
      -- back="Moonlight Cape",  -- 10 PDT
	  legs="Meg. Chausses +2",   --  6 PDT
	  feet="Turms Leggings +1",      -- "Ahosi Leggings"
	})
	
	-- options: Utu grip (70 hp, offensive stuffs) for Mensch Strap +1 (5 PDT) or Refined Grip +1 (3 dt, 15-35 hp)
	-- options: Back: 10 pdt for 5 parry - with mensch strap +1 and Odnowa Upgrade, puts at 49% PDT with no other changes
	-- options: Moonlight Ring upgrade - 1 dt, 10 hp, 2 stp, 3 acc/att-
	-- options: Head - FU. Bandeau +3 for Turm Cap +1 - gains 36 meva, 38 hp, loses 6 pdt, 2 haste, lots of attack
    sets.engaged.Tank = {          
             -- sub="Refined Grip +1",       --  3/3 (refined +1)
      ammo="staunch tathlum +1",   --  3/3
      head=gear.nyame_head,        --  7/7     -- "Meghanada Visor +2",
	  neck="futhark torque +2",    --  7/7
	  ear1="Odnowa Earring +1",    --  0/2 -- todo: upgrade for 3 dt, 30 def
	  ear2="Odnowa Earring",       --  0/1 -- todo: tuisto earring for 50 more HP, 7 more vit
	  body=gear.nyame_body,        --  9/9
	  hands="Turms Mittens +1",    --       4 haste, parry heal -- gear.herculean_dt_hands,
	  ring1="Moonbeam Ring",       --  4/4   -- moonlight for 5/5
	  ring2="Defending Ring",      -- 10/10
      back=gear.enmity_pdt_back,   -- 10/0  -- (5 parry) "Shadow Mantle",
	  waist="Flume Belt +1",       --  4/0
	  legs="Eri. Leg Guards +1",   --  7/0 -- Meg. Chausses +2 -- 6 PDT, -2 inq, less meva/hp/etc
	                                       -- +49 acc, 45 att, 5 TA, str, agi...
	  feet="Turms Leggings +1",       --   <higher meva/inquartata 4>
	  -- feet="Erilaz Greaves +1"     --  5/0	   -- 107 meva, 25 res. all ele. 26 dex, 0 acc, haste 4	  
	} -- With Nyame, can swap Defending Ring to Gelaninous for HP/VIT, or Back to 
	  -- Def or more evasion instead of PDT
	  -- Consider swapping Utu to Refined Grip for better tanking stats
	
     sets.engaged.EvasionTank = set_combine(sets.engaged, {
	  -- main="Soulcleaver",  -- evasion greatsword
	  -- sub="Kupayopl",     -- evasion grip
	  ammo="Yamarang",	  
      head=gear.nyame_head,
	  neck="Futhark Torque +2",    -- \todo Bathy Choker +1 - augmented
	  ear1="Eabani Earring",
	  ear2="Odnowa Earring +1",    -- \todo "Infused Earring",
      body=gear.nyame_body,
	  hands=gear.nyame_hands,
	  ring1="Vengeful Ring",
	  ring2="Ilabrat Ring",  -- \todo not regal?  I guess regal has less HP
      back=gear.ogma_evasion,
	  waist="Kasiri Belt",
	  legs=gear.nyame_legs,
	  feet=gear.nyame_feet
	})
		
	
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