-- Setup your Key Bindings here:  
    windower.send_command('bind f7 gs c toggle mb')
    windower.send_command('bind f9 gs c avatar mode')
    windower.send_command('bind f10 gs c toggle auto')
    windower.send_command('bind f12 gs c toggle melee')
     
	 send_command('wait 6;input /lockstyleset 4')
     
-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.avatar = {}    -- leave this empty
      
    -- Your idle set when you DON'T have an avatar out
    
    sets.me.idle = {
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Lamassu Mitts +1",
    legs="Assid. Pants +1",
    feet="Baayami Sabots",
    neck="Caller's Pendant",
    waist="Lucidity Sash",
    left_ear="Gifted Earring",
    right_ear="Evan's Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
}
      
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Lamassu Mitts +1",
    legs="Assid. Pants +1",
    feet="Baayami Sabots",
    neck="Caller's Pendant",
    waist="Lucidity Sash",
    left_ear="Gifted Earring",
    right_ear="Evan's Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
}
      
    -----------------------
    -- Perpetuation Related
    -----------------------
      
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
    sets.avatar.perp = { ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Beckoner's Bracers +1",
    legs="Assid. Pants +1",
    feet="Baayami Sabots",
    neck="Caller's Pendant",
    waist="Regal Belt",
    left_ear="Gifted Earring",
    right_ear="Evans Earring",
    left_ring="Varar Ring +1",
    right_ring="Karieyh Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
	}
  
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
    sets.avatar["Carbuncle"] = {hands="Asteria Mitts +1"}
    sets.avatar["Cait Sith"] = {hands="Lamassu Mitts +1"}
    -- When we want our avatar to stay alive
    sets.avatar.tank = set_combine(sets.avatar.perp,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
      
    -- When we want our avatar to shred
    sets.avatar.melee = set_combine(sets.avatar.perp,{
        ammo="Sancus Sachet +1",
		head="Apogee Crown",
		body="Con. Doublet +3",
		hands="Apogee Mitts",
		legs={ name="Enticer's Pants", augments={'MP+40','Pet: Mag. Acc.+9','Pet: Damage taken -2%',}},
		feet="Con. Pigaches +1",
		neck="Smn. Collar +1",
		waist="Regal Belt",
		left_ear="Evans Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
    })
      
    -- When we want our avatar to hit
    sets.avatar.acc = set_combine(sets.avatar.perp,{
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +1",
		body="Con. Doublet +3",
		hands="Apogee Mitts",
		legs={ name="Enticer's Pants", augments={'MP+40','Pet: Mag. Acc.+9','Pet: Damage taken -2%',}},
		feet="Con. Pigaches +1",
		neck="Smn. Collar +1",
		waist="Regal Belt",
		left_ear="Evans Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
    })
      
    -- When Avatar's Favor is active
    sets.avatar.favor = set_combine(sets.avatar.perp,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
      
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
      
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = { 
    ammo="Sancus Sachet +1",
    head="Con. Horn +1",
    body="Beckoner's Doublet +1",
    hands="Lamassu Mitts +1",
    legs="Beckoner's Spats +1",
    feet="Baayami Sabots",
    neck="Caller's Pendant",
    waist="Lucidity Sash",
    left_ear="Gifted Earring",
    right_ear="Andoaa Earring",
    right_ring="Evoker's Ring",
    left_ring="Globidonta Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+2','Blood Pact ab. del. II -3',}},
}
      
    -------------------------
    -- Individual Blood Pacts
    -------------------------
      
    -- Physical damage
    sets.avatar.atk ={ 
    ammo="Sancus Sachet +1",
    head="Apogee Crown",
    body="Con. Doublet +3",
    hands="Apogee Mitts",
    legs={ name="Enticer's Pants", augments={'MP+40','Pet: Mag. Acc.+9','Pet: Damage taken -2%',}},
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Smn. Collar +1",
    waist="Regal Belt",
    left_ear="Kyrene's Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
	}
    
    sets.avatar.pacc = set_combine(sets.avatar.atk,{
		ammo="Sancus Sachet +1",
		head="Apogee Crown",
		body="Con. Doublet +3",
		hands="Apogee Mitts",
		legs={ name="Enticer's Pants", augments={'MP+40','Pet: Mag. Acc.+9','Pet: Damage taken -2%',}},
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		neck="Smn. Collar +1",
		waist="Regal Belt",
		left_ear="Kyrene's Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
	})
      
    -- Magic Attack
    sets.avatar.mab = {
    ammo="Sancus Sachet +1",
    head="Apogee Crown +1",
    body="Con. Doublet +3",
    hands="Merlinic Dastanas",
    legs={ name="Enticer's Pants", augments={'MP+40','Pet: Mag. Acc.+9','Pet: Damage taken -2%',}},
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Smn. Collar +1",
    waist="Regal Belt",
    left_ear="Kyrene's Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+8','Pet: "Regen"+10',}},
}
    -- Hybrid
    sets.avatar.hybrid = {
        ammo="Sancus Sachet +1",
        head="Apogee Crown +1",
        neck="Smn. Collar +1",
        lear="Kyrene's Earring",
        rear="Gelos Earring",
        body="Con. Doublet +3",
        hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+24 Pet: "Mag.Atk.Bns."+24','Blood Pact Dmg.+8','Pet: MND+3','Pet: Mag. Acc.+9','Pet: "Mag.Atk.Bns."+11',}},
        lring="Varar Ring +1",
        rring="Varar Ring +1",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
        waist="Regal Belt",
        legs={ name="Enticer's Pants", augments={'MP+40','Pet: Mag. Acc.+9','Pet: Damage taken -2%',}},
        feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	
    }
   
   -- Magic Accuracy
    sets.avatar.macc = sets.avatar.skill
      
    -- Buffs
    sets.avatar.buff = sets.avatar.skill
       
      
    -- Other
    sets.avatar.other = set_combine(sets.avatar.skill,{})
      
    -- Combat Related Sets
      
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = set_combine(sets.avatar.perp,{
		head="Tali'ah Turban +1",
		body="Con. Doublet +3",
		hands="Tali'ah Gages +1",
		legs="Beck. Spats +1",
		feet="Tali'ah Crackows +1",
		neck="Smn. Collar +1",
		waist="Windbuffet Belt",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Petrov Ring",
		right_ring="Karieyh Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
    })
	
	sets.engaged = {head="Tali'ah Turban +1",
		body="Con. Doublet +3",
		hands="Tali'ah Gages +1",
		legs="Beck. Spats +1",
		feet="Tali'ah Crackows +1",
		neck="Smn. Collar +1",
		waist="Windbuffet Belt",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Petrov Ring",
		right_ring="Karieyh Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},}
		
      
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
    sets.me["Garland of Bliss"] = {
        head="Welkin Crown",
		body="Artsieq Jubbah",
		hands={ name="Helios Gloves", augments={'Mag. Acc.+5','"Fast Cast"+3','Mag. crit. hit dmg. +3%',}},
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+27',}},
		feet={ name="Helios Boots", augments={'"Fast Cast"+5',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Friomisi Earring",
		right_ear="Ishvara Earring",
		left_ring="Strendu Ring",
		right_ring="Karieyh Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
    }
      
	  
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though
  
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
    sets.precast.casting = {
    ammo="Sancus Sachet +1",
    head="Welkin Crown",
    body={ name="Helios Jacket", augments={'"Fast Cast"+5',}},
    hands="Lamassu mitts +1",
    legs="Assid. Pants +1",
    feet={ name="Helios Boots", augments={'"Fast Cast"+5',}},
    neck="Smn. Collar +1",
    waist="Lucidity Sash",
    left_ear="Gifted Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},}   
      
    -- Summoning Magic Cast time - gear
    sets.precast.summoning ={} 
      
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.casting,{waist="Siegel Sash"})
       
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = sets.precast.casting
 
      
    ---------------------
    -- Ability Precasting
    ---------------------
      
    -- Blood Pact Ability Delay
    sets.precast.bp = {
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Con. Doublet +3",
		hands="Lamassu Mitts +1",
		legs="Beck. Spats +1",
		feet="Baayami Sabots",
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Andoaa Earring",
		right_ear="Evans Earring",
		left_ring="Globidonta Ring",
		right_ring="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+2','Blood Pact ab. del. II -3',}},
}
      
    -- Mana Cede
    sets.precast["Mana Cede"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="Beck. Bracers +1",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    -- Astral Flow  
    sets.precast["Astral Flow"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head={ name="Glyphic Horn+1", augments={'Enhances "Astral Flow" effect',}},
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
    -- Elemental Siphon
    
    sets.precast["Elemental Siphon"] = {
        ranged="",
        ammo="Sancus Sachet +1",
        head="Con. Horn +1",
        neck="Caller's Pendant",
        lear="",
        rear="",
        body="Beckoner's Doublet +1",
        hands="Lamassu Mitts +1",
        lring="Evoker's Ring",
        rring="Globidonta Ring",
        back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+2','Blood Pact ab. del. II -3',}},
        waist="Lucidity Sash",
        legs="Beckoner's Spats +1",
        feet="Beck. Pigaches +1"
    }
    
      
    ----------
    -- Midcast
    ----------
      
    -- We handle the damage and etc. in Pet Midcast later
      
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
		ammo="Sancus Sachet +1",
		head="Welkin Crown",
		body="Beck. Doublet +1",
		hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
		legs="Beck. Spats +1",
		feet="Beck. Pigaches +1",
		neck="Smn. Collar +1",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear="Gifted Earring",
		left_ring="Evoker's Ring",
		right_ring="Globidonta Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+2','Blood Pact ab. del. II -3',}},
}
      
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
        ammo="Sancus Sachet +1",
        head="Telchine Cape",
        neck="Smn. Collar +1",
        lear="Strophadic Earring",
        rear="Loquac. Earring",
        body="Telchine Chas.",
        hands={ name="Helios Gloves", augments={'Mag. Acc.+5','"Fast Cast"+3','Mag. crit. hit dmg. +3%',}},
        lring="Karka Ring",
        rring="Kishar Ring",
        back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+2','Blood Pact ab. del. II -3',}},
        waist="Lucidity Sash",
        legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+27',}},
        feet="Regal Pumps"
    })
      
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="Nodens gorget",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.midcast.siphon = set_combine(sets.avatar.skill,{
        ranged="",
        ammo="Sancus Sachet +1",
        head="Con. Horn +1",
        neck="Caller's Pendant",
        lear="Gifted Earring",
        rear="",
        body="Beckoner's Doublet +1",
        hands="Lamassu Mitts +1",
        lring="Evoker's Ring",
        rring="Globidonta Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+2','Blood Pact ab. del. II -3',}},
        waist="Lucidity Sash",
        legs="Beckoner's Spats +1",
        feet="Beck. Pigaches +1"
    })
        
    -- Cure Potency
    sets.midcast.cure = {
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Beck. Bracers +1",
    legs="Assid. Pants +1",
    feet="Medium's Sabots",
    neck="Nodens Gorget",
    waist="Luminary Sash",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Evoker's Ring",
    back="Solemnity cape"}
    
      
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
  
end