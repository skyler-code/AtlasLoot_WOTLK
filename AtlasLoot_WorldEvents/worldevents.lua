-- $Id: worldevents.lua 3707 2012-03-03 15:31:59Z hegarol $
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")
local moduleName = "AtlasLoot_WorldEvents"

-- Index
--- Permanent Events
---- Argent Tournament
--- Seasonal Events
---- Brewfest
---- Children's Week
---- Day of the Dead
---- Feast of Winter Veil
---- Hallow's End
---- Harvest Festival
---- Love is in the Air
---- Lunar Festival
---- Midsummer Fire Festival
---- Noblegarden
---- Pilgrim's Bounty
--- Reaccouring Events
---- Bash'ir Landing Skyguard Raid
---- Darkmoon Faire
---- Gurubashi Arena Booty Run
---- Stranglethorn Fishing Extravaganza
--- One-Time Events
--- Triggered Events
---- Abyssal Council
---- Ethereum Prison
---- Skettis

	------------------------
	--- Permanent Events ---
	------------------------

		-------------------------
		--- Argent Tournament ---
		-------------------------

	AtlasLoot_Data["ATArmor"] = {
		["Normal_A"] = {
			{
				{ 2, 45156, "", "=q3=Sash of Shattering Hearts", "=ds=#s10#, #a1#", "#CHAMPSEAL:10#" };
				{ 3, 45181, "", "=q3=Wrap of the Everliving Tree", "=ds=#s10#, #a2#", "#CHAMPSEAL:10#" };
				{ 4, 45159, "", "=q3=Treads of Nimble Evasion", "=ds=#s12#, #a2#", "#CHAMPSEAL:10#" };
				{ 5, 45184, "", "=q3=Cinch of Bonded Servitude", "=ds=#s10#, #a3#", "#CHAMPSEAL:10#" };
				{ 6, 45183, "", "=q3=Treads of the Glorious Spirit", "=ds=#s12#, #a3#", "#CHAMPSEAL:10#" };
				{ 7, 45182, "", "=q3=Gauntlets of Shattered Pride", "=ds=#s9#, #a4#", "#CHAMPSEAL:10#" };
				{ 8, 45160, "", "=q3=Girdle of Valorous Defeat", "=ds=#s10#, #a4#", "#CHAMPSEAL:10#" };
				{ 9, 45163, "", "=q3=Stanchions of Unseatable Furor", "=ds=#s12#, #a4#", "#CHAMPSEAL:10#" };
				{ 10, 45153, "", "=q3=Susurrating Shell Necklace", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 11, 45155, "", "=q3=Choker of Spiral Focus", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 12, 45154, "", "=q3=Necklace of Valiant Blood", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 13, 45152, "", "=q3=Pendant of Azure Dreams", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 14, 45131, "", "=q3=Jouster's Fury", "=ds=#s14#", "#CHAMPSEAL:10#" };
				{ 17, 45078, "", "=q4=Dagger of Lunar Purity", "=ds=#h3#, #w4#", "#CHAMPSEAL:25#" };
				{ 18, 45077, "", "=q4=Dagger of the Rising Moon", "=ds=#h1#, #w4#", "#CHAMPSEAL:25#" };
				{ 19, 45129, "", "=q4=Gnomeregan Bonechopper", "=ds=#h3#, #w10#", "#CHAMPSEAL:25#" };
				{ 20, 45074, "", "=q4=Claymore of the Prophet", "=ds=#h2#, #w10#", "#CHAMPSEAL:25#" };
				{ 21, 45076, "", "=q4=Teldrassil Protector", "=ds=#h1#, #w1#", "#CHAMPSEAL:25#" };
				{ 22, 45075, "", "=q4=Ironforge Smasher", "=ds=#h1#, #w6#", "#CHAMPSEAL:25#" };
				{ 23, 45128, "", "=q4=Silvery Sylvan Stave", "=ds=#w9#", "#CHAMPSEAL:25#" };
				{ 24, 45130, "", "=q4=Blunderbuss of Khaz Modan", "=ds=#w5#", "#CHAMPSEAL:25#" };
			};
		};
		["Normal_H"] = {
			{
				{ 2, 45209, "", "=q3=Sash of Trumpeted Pride", "=ds=#s10#, #a1#", "#CHAMPSEAL:10#" };
				{ 3, 45211, "", "=q3=Waistguard of Equine Fury", "=ds=#s10#, #a2#", "#CHAMPSEAL:10#" };
				{ 4, 45220, "", "=q3=Treads of the Earnest Squire", "=ds=#s12#, #a2#", "#CHAMPSEAL:10#" };
				{ 5, 45215, "", "=q3=Links of Unquenched Savagery", "=ds=#s10#, #a3#", "#CHAMPSEAL:10#" };
				{ 6, 45221, "", "=q3=Treads of Whispering Dreams", "=ds=#s12#, #a3#", "#CHAMPSEAL:10#" };
				{ 7, 45216, "", "=q3=Gauntlets of Mending Touch", "=ds=#s9#, #a4#", "#CHAMPSEAL:10#" };
				{ 8, 45217, "", "=q3=Clinch of Savage Fury", "=ds=#s10#, #a4#", "#CHAMPSEAL:10#" };
				{ 9, 45218, "", "=q3=Blood-Caked Stompers", "=ds=#s12#, #a4#", "#CHAMPSEAL:10#" };
				{ 10, 45206, "", "=q3=Choker of Feral Fury", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 11, 45207, "", "=q3=Necklace of Stolen Skulls", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 12, 45213, "", "=q3=Pendant of Emerald Crusader", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 13, 45223, "", "=q3=Razor's Edge Pendant", "=ds=#s2#", "#CHAMPSEAL:10#" };
				{ 14, 45219, "", "=q3=Jouster's Fury", "=ds=#s14#", "#CHAMPSEAL:10#" };
				{ 17, 45214, "", "=q4=Scalpel of the Royal Apothecary", "=ds=#h3#, #w4#", "#CHAMPSEAL:25#" };
				{ 18, 45222, "", "=q4=Spinal Destroyer", "=ds=#h1#, #w4#", "#CHAMPSEAL:25#" };
				{ 19, 45208, "", "=q4=Blade of the Keening Banshee", "=ds=#h3#, #w10#", "#CHAMPSEAL:25#" };
				{ 20, 45205, "", "=q4=Greatsword of the Sin'dorei", "=ds=#h2#, #w10#", "#CHAMPSEAL:25#" };
				{ 21, 45204, "", "=q4=Axe of the Sen'jin Protector", "=ds=#h1#, #w1#", "#CHAMPSEAL:25#" };
				{ 22, 45203, "", "=q4=Grimhorn Crusher", "=ds=#h1#, #w6#", "#CHAMPSEAL:25#" };
				{ 23, 45212, "", "=q4=Staff of Feral Furies", "=ds=#w9#", "#CHAMPSEAL:25#" };
				{ 24, 45210, "", "=q4=Sen'jin Beakblade Longrifle", "=ds=#w5#", "#CHAMPSEAL:25#" };
			};
		};
		info = {
			name = AL["Argent Tournament"],
			module = moduleName, menu = "ARGENTMENU",
		};
	};

	AtlasLoot_Data["ATMounts"] = {
		["Normal"] = {
			{
				{ 2, 45593, "", "=q4=Darkspear Raptor", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 3, 45597, "", "=q4=Forsaken Warhorse", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 4, 45595, "", "=q4=Orgrimmar Wolf", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 5, 45596, "", "=q4=Silvermoon Hawkstrider", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 6, 45592, "", "=q4=Thunder Bluff Kodo", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 8, 46750, "", "=q4=Great Golden Kodo", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 9, 46749, "", "=q4=Swift Burgundy Wolf", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 10, 46743, "", "=q4=Swift Purple Raptor", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 11, 46751, "", "=q4=Swift Red Hawkstrider", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 12, 46746, "", "=q4=White Skeletal Warhorse", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 17, 45591, "", "=q4=Darnassian Nightsaber", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 18, 45590, "", "=q4=Exodar Elekk", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 19, 45589, "", "=q4=Gnomeregan Mechanostrider", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 20, 45586, "", "=q4=Ironforge Ram", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 21, 45125, "", "=q4=Stormwind Steed", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 23, 46745, "", "=q4=Great Red Elekk", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 24, 46752, "", "=q4=Swift Gray Steed", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 25, 46744, "", "=q4=Swift Moonsaber", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 26, 46748, "", "=q4=Swift Violet Ram", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
				{ 27, 46747, "", "=q4=Turbostrider", "=ds=#e26#", "500 #gold# #CHAMPSEAL:5#"};
			};
			{
				{ 1, 0, "inv_misc_tabardpvp_01", "=q6="..BabbleFaction["The Silver Covenant"], "=ec1=#m7#"};
				{ 2, 46815, "", "=q4=Quel'dorei Steed", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 3, 46813, "", "=q4=Silver Covenant Hippogryph", "=ds=#e27#", "#CHAMPSEAL:150#"};
				{ 5, 0, "INV_Jewelry_Talisman_08", "=q6="..BabbleFaction["Argent Crusade"], "" };
				{ 6, 47179, "", "=q4=Argent Charger", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 7, 47180, "", "=q4=Argent Warhorse", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 8, 45725, "", "=q4=Argent Hippogryph", "=ds=#e27#", "#CHAMPSEAL:150#"};
				{ 16, 0, "inv_misc_tabardpvp_02", "=q6="..BabbleFaction["The Sunreavers"], "=ec1=#m6#"};
				{ 17, 46816, "", "=q4=Sunreaver Hawkstrider", "=ds=#e26#", "#CHAMPSEAL:100#"};
				{ 18, 46814, "", "=q4=Sunreaver Dragonhawk", "=ds=#e27#", "#CHAMPSEAL:150#"};
			};
		};
		info = {
			name = AL["Argent Tournament"],
			module = moduleName, menu = "ARGENTMENU",
		};
	};

	AtlasLoot_Data["ATPets"] = {
		["Normal"] = {
			{
				{ 2, 45022, "", "=q3=Argent Gruntling", "=ds=#e13#", "=ds=#m4#, =ec1=#m6#"};
				{ 3, 44980, "", "=q3=Mulgore Hatchling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 4, 45606, "", "=q3=Sen'jin Fetish", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 5, 44971, "", "=q3=Tirisfal Batling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 6, 44973, "", "=q3=Durotar Scorpion", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 7, 44982, "", "=q3=Enchanted Broom", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 8, 46821, "", "=q3=Shimmering Wyrmling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 10, 0, "INV_Jewelry_Talisman_08", "=q6="..BabbleFaction["Argent Crusade"], "" };
				{ 11, 47541, "", "=q3=Argent Pony Bridle", "=ds=", "#CHAMPSEAL:50#"};
				{ 17, 44998, "", "=q3=Argent Squire", "=ds=#e13#", "=ds=#m4#, =ec1=#m7#"};
				{ 18, 44984, "", "=q3=Ammen Vale Lashling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 19, 44965, "", "=q3=Teldrassil Sproutling", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 20, 44970, "", "=q3=Dun Morogh Cub", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 21, 44974, "", "=q3=Elwynn Lamb", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 22, 45002, "", "=q3=Mechanopeep", "=ds=#e13#", "#CHAMPSEAL:40#"};
				{ 23, 46820, "", "=q3=Shimmering Wyrmling", "=ds=#e13#", "#CHAMPSEAL:40#"};
			};
		};
		info = {
			name = AL["Argent Tournament"],
			module = moduleName, menu = "ARGENTMENU",
		};
	};

	AtlasLoot_Data["ATHeirlooms"] = {
		["Normal"] = {
			{
				{ 1, 42985, "", "=q7=Tattered Dreadmist Mantle", "=ds=#s3#, #a1#",  "#CHAMPSEAL:60#"};
				{ 2, 42984, "", "=q7=Preened Ironfeather Shoulders", "=ds=#s3#, #a2#", "#CHAMPSEAL:60#"};
				{ 3, 42952, "", "=q7=Stained Shadowcraft Spaulders", "=ds=#s3#, #a2#", "#CHAMPSEAL:60#"};
				{ 4, 42950, "", "=q7=Champion Herod's Shoulder", "=ds=#s3#, #a3#", "#CHAMPSEAL:60#"};
				{ 5, 42951, "", "=q7=Mystical Pauldrons of Elements", "=ds=#s3#, #a3#", "#CHAMPSEAL:60#"};
				{ 6, 42949, "", "=q7=Polished Spaulders of Valor", "=ds=#s3#, #a4#", "#CHAMPSEAL:60#"};
				{ 8, 48691, "", "=q7=Tattered Dreadmist Robe", "=ds=#s5#, #a1#", "#CHAMPSEAL:60#"};
				{ 9, 48687, "", "=q7=Preened Ironfeather Breastplate", "=ds=#s5#, #a2#", "#CHAMPSEAL:60#"};
				{ 10, 48689, "", "=q7=Stained Shadowcraft Tunic", "=ds=#s5#, #a2#", "#CHAMPSEAL:60#"};
				{ 11, 48677, "", "=q7=Champion's Deathdealer Breastplate", "=ds=#s5#, #a3#", "#CHAMPSEAL:60#"};
				{ 12, 48683, "", "=q7=Mystical Vest of Elements", "=ds=#s5#, #a3#", "#CHAMPSEAL:60#"};
				{ 13, 48685, "", "=q7=Polished Breastplate of Valor", "=ds=#s5#, #a4#", "#CHAMPSEAL:60#"};
				{ 16, 42992, "", "=q7=Discerning Eye of the Beast", "=ds=#s14#", "#CHAMPSEAL:75#"};
				{ 17, 42991, "", "=q7=Swift Hand of Justice", "=ds=#s14#", "#CHAMPSEAL:75#"};
				{ 19, 42944, "", "=q7=Balanced Heartseeker", "=ds=#h1#, #w4#", "#CHAMPSEAL:60#"};
				{ 20, 42945, "", "=q7=Venerable Dal'Rend's Sacred Charge", "=ds=#h3#, #w10#", "#CHAMPSEAL:60#"};
				{ 21, 42943, "", "=q7=Bloodied Arcanite Reaper", "=ds=#h2#, #w1#", "#CHAMPSEAL:95#"};
				{ 22, 42948, "", "=q7=Devout Aurastone Hammer", "=ds=#h3#, #w6#", "#CHAMPSEAL:75#"};
				{ 23, 48716, "", "=q7=Venerable Mass of McGowan", "=ds=#h1#, #w6#", "#CHAMPSEAL:75#"};
				{ 24, 48718, "", "=q7=Repurposed Lava Dredger", "=ds=#h2#, #w6#", "#CHAMPSEAL:95#"};
				{ 25, 42947, "", "=q7=Dignified Headmaster's Charge", "=ds=#w9#", "#CHAMPSEAL:95#"};
				{ 26, 42946, "", "=q7=Charmed Ancient Bone Bow", "=ds=#w2#", "#CHAMPSEAL:95#"};
			};
		};
		info = {
			name = AL["Argent Tournament"],
			module = moduleName, menu = "ARGENTMENU",
		};
	};

	-----------------------
	--- Seasonal Events ---
	-----------------------

		----------------
		--- Brewfest ---
		----------------

	AtlasLoot_Data["Brewfest"] = {
		["Normal"] = {
			{
				{ 1, 33030, "", "=q1=Barleybrew Clear", "=ds=#e4#"};
				{ 2, 33028, "", "=q1=Barleybrew Light", "=ds=#e4#"};
				{ 3, 33029, "", "=q1=Barleybrew Dark", "=ds=#e4#"};
				{ 5, 33031, "", "=q1=Thunder 45", "=ds=#e4#"};
				{ 6, 33032, "", "=q1=Thunderbrew Ale", "=ds=#e4#"};
				{ 7, 33033, "", "=q1=Thunderbrew Stout", "=ds=#e4#"};
				{ 9, 33034, "", "=q1=Gordok Grog", "=ds=#e4#"};
				{ 10, 33036, "", "=q1=Mudder's Milk", "=ds=#e4#"};
				{ 11, 33035, "", "=q1=Ogre Mead", "=ds=#e4#"};
				{ 13, 34017, "", "=q1=Small Step Brew", "=ds=#e4#"};
				{ 14, 34018, "", "=q1=Long Stride Brew", "=ds=#e4#"};
				{ 15, 34019, "", "=q1=Path of Brew", "=ds=#e4#"};
				{ 16, 34020, "", "=q1=Jungle River Water", "=ds=#e4#"};
				{ 17, 34021, "", "=q1=Brewdoo Magic", "=ds=#e4#"};
				{ 18, 34022, "", "=q1=Stout Shrunken Head", "=ds=#e4#"};
				{ 20, 33929, "", "=q1=Brewfest Brew", "=ds=#e4#"};
				{ 22, 34063, "", "=q1=Dried Sausage", "=ds=#e3#"};
				{ 23, 33024, "", "=q1=Pickled Sausage", "=ds=#e3#"};
				{ 24, 38428, "", "=q1=Rock-Salted Pretzel", "=ds=#e3#"};
				{ 25, 33023, "", "=q1=Savory Sausage", "=ds=#e3#"};
				{ 26, 34065, "", "=q1=Spiced Onion Cheese", "=ds=#e3#"};
				{ 27, 33025, "", "=q1=Spicy Smoked Sausage", "=ds=#e3#"};
				{ 28, 34064, "", "=q1=Succulent Sausage", "=ds=#e3#"};
				{ 29, 33043, "", "=q1=The Essential Brewfest Pretzel", "=ds=#e3#"};
				{ 30, 33026, "", "=q1=The Golden Link", "=ds=#e3#"};
				extraText = ": "..AL["Food and Drinks"];
			};
			{
				{ 1, 37599, "", "=q1=\"Brew of the Month\" Club Membership Form", "=ds=#m2#", "#BREWFEST:200#"};
				{ 3, 37488, "", "=q1=Wild Winter Pilsner", "=ds=#month1#"};
				{ 4, 37489, "", "=q1=Izzard's Ever Flavor", "=ds=#month2#"};
				{ 5, 37490, "", "=q1=Aromatic Honey Brew", "=ds=#month3#"};
				{ 6, 37491, "", "=q1=Metok's Bubble Bock", "=ds=#month4#"};
				{ 7, 37492, "", "=q1=Springtime Stout", "=ds=#month5#"};
				{ 8, 37493, "", "=q1=Blackrock Lager", "=ds=#month6#"};
				{ 18, 37494, "", "=q1=Stranglethorn Brew", "=ds=#month7#"};
				{ 19, 37495, "", "=q1=Draenic Pale Ale", "=ds=#month8#"};
				{ 20, 37496, "", "=q1=Binary Brew", "=ds=#month9#"};
				{ 21, 37497, "", "=q1=Autumnal Acorn Ale", "=ds=#month10#"};
				{ 22, 37498, "", "=q1=Bartlett's Bitter Brew", "=ds=#month11#"};
				{ 23, 37499, "", "=q1=Lord of Frost's Private Label", "=ds=#month12#"};
				extraText = ": "..AL["Brew of the Month Club"];
			};
		};
		info = {
			name = AL["Brewfest"],
			module = moduleName, menu = "BREWFESTMENU",
		};
	};

	AtlasLoot_Data["CorenDirebrew"] = {
		["Normal"] = {
			{
				{ 1, 49078, "", "=q4=Ancient Pickled Egg", "=ds=#s14#"};
				{ 2, 49118, "", "=q4=Bubbling Brightbrew Charm", "=ds=#s14#"};
				{ 3, 49116, "", "=q4=Bitter Balebrew Charm", "=ds=#s14#"};
				{ 4, 49080, "", "=q4=Brawler's Souvenir", "=ds=#s14#"};
				{ 5, 49074, "", "=q4=Coren's Chromium Coaster", "=ds=#s14#"};
				{ 6, 49076, "", "=q4=Mithril Pocketwatch", "=ds=#s14#"};
				{ 8, 38281, "", "=q1=Direbrew's Dire Brew", "=ds=#m2#"};
				{ 16, 54535, "", "=q3=Keg-Shaped Treasure Chest", "=q5="..AL["Daily Reward"]};
				{ 17, 49120, "", "=q4=Direbrew's Bloody Shanker", "=ds=#h1#, #w4#"};
				{ 18, 48663, "", "=q4=Tankard O' Terror", "=ds=#h1#, #w6#"};
				{ 19, 37828, "", "=q4=Great Brewfest Kodo", "=ds=#e26#"};
				{ 20, 33977, "", "=q4=Swift Brewfest Ram", "=ds=#e26#"};
				{ 22, 37863, "", "=q3=Direbrew's Remote", "=ds="};
			};
		};
		info = {
			name = BabbleBoss["Coren Direbrew"],
			module = moduleName, menu = "BREWFESTMENU",
		};
	};

		-----------------------
		--- Children's Week ---
		-----------------------

	AtlasLoot_Data["ChildrensWeek"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..BabbleZone["Azeroth"], "=q5="..BabbleZone["Stormwind"].." / "..BabbleZone["Orgrimmar"]};
				{ 2, 23007, "", "=q1=Piglet's Collar", "=ds=#e13#"};
				{ 3, 23015, "", "=q1=Rat Cage", "=ds=#e13#"};
				{ 4, 23002, "", "=q1=Turtle Box", "=ds=#e13#"};
				{ 5, 23022, "", "=q1=Curmudgeon's Payoff", "=ds="};
				{ 7, 0, "INV_Box_01", "=q6="..BabbleZone["Outland"], "=q5="..BabbleZone["Shattrath"]};
				{ 8, 32616, "", "=q3=Egbert's Egg", "=ds=#e13#"};
				{ 9, 32622, "", "=q3=Elekk Training Collar", "=ds=#e13#"};
				{ 10, 32617, "", "=q3=Sleepy Willy", "=ds=#e13#"};
				{ 16, 0, "INV_Box_01", "=q6="..BabbleZone["Northrend"], "=q5="..BabbleZone["Dalaran"]};
				{ 17, 46545, "", "=q3=Curious Oracle Hatchling", "=ds=#e13#"};
				{ 18, 46544, "", "=q3=Curious Wolvar Pup", "=ds=#e13#"};
			};
		};
		info = {
			name = AL["Children's Week"],
			module = moduleName, menu = "WORLDEVENTMENU",
		};
	};

		-----------------------
		--- Day of the Dead ---
		-----------------------

	AtlasLoot_Data["DayoftheDead"] = {
		["Normal"] = {
			{
				{ 1, 46831, "", "=q1=Macabre Marionette", "=q1=#m4#: =ds=#m20#"};
				{ 3, 46860, "", "=q1=Whimsical Skull Mask", "=ds=#s1#, 5 #copper#"};
				{ 4, 46861, "", "=q1=Bouquet of Orange Marigolds", "=ds=#s15#, 1 #gold#"};
				{ 5, 46690, "", "=q1=Candy Skull", "=ds=#m20#, 5 #copper#"};
				{ 6, 46711, "", "=q1=Spirit Candle", "=ds=#m20#, 30 #copper#"};
				{ 7, 46718, "", "=q1=Orange Marigold", "=ds=#m20#, 10 #copper#"};
				{ 16, 46710, "", "=q1=Recipe: Bread of the Dead", "=ds=#p3# (1), 20 #silver#"};
				{ 17, 46691, "", "=q1=Bread of the Dead", "=ds=#e3#"};
			};
		};
		info = {
			name = AL["Day of the Dead"],
			module = moduleName, menu = "WORLDEVENTMENU",
		};
	};

		----------------------------
		--- Feast of Winter Veil ---
		----------------------------

	AtlasLoot_Data["Winterviel"] = {
		["Normal"] = {
			{
				{ 1, 21525, "", "=q2=Green Winter Hat", "=ds=#s1# =q2="..AL["Various Locations"]};
				{ 2, 21524, "", "=q2=Red Winter Hat", "=ds=#s1# =q2="..AL["Various Locations"]};
				{ 3, 17712, "", "=q1=Winter Veil Disguise Kit", "=q1=#m4#: =ds=#m20#"};
				{ 4, 17202, "", "=q1=Snowball", "=ds=#m20#"};
				{ 5, 34191, "", "=q1=Handful of Snowflakes", "=ds=#m20#"};
				{ 6, 21212, "", "=q1=Fresh Holly", "=ds=#m20#"};
				{ 7, 21519, "", "=q1=Mistletoe", "=ds=#m20#"};
				{ 9, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Smokywood Pastures Vendor"], ""};
				{ 10, 34262, "", "=q2=Pattern: Winter Boots", "=ds=#p7# (285)"};
				{ 11, 34319, "", "=q2=Pattern: Red Winter Clothes", "=ds=#p8# (250)"};
				{ 12, 34261, "", "=q2=Pattern: Green Winter Clothes", "=ds=#p8# (250)"};
				{ 13, 34413, "", "=q1=Recipe: Hot Apple Cider", "#p3# (325)"};
				{ 14, 17201, "", "=q1=Recipe: Egg Nog", "=ds=#p3# (35)"};
				{ 15, 17200, "", "=q1=Recipe: Gingerbread Cookie", "=ds=#p3# (1)"};
				{ 16, 17344, "", "=q1=Candy Cane", "=ds=#e3#"};
				{ 17, 17406, "", "=q1=Holiday Cheesewheel", "=ds=#e3#"};
				{ 18, 17407, "", "=q1=Graccu's Homemade Meat Pie", "=ds=#e3#"};
				{ 19, 17408, "", "=q1=Spicy Beefstick", "=ds=#e3#"};
				{ 20, 34410, "", "=q1=Honeyed Holiday Ham", "=ds=#e3#"};
				{ 21, 17404, "", "=q1=Blended Bean Brew", "=ds=#e4#"};
				{ 22, 17405, "", "=q1=Green Garden Tea", "=ds=#e4#"};
				{ 23, 34412, "", "=q1=Sparkling Apple Cider", "=ds=#e4#"};
				{ 24, 17196, "", "=q1=Holiday Spirits", "=ds=#e4#"};
				{ 25, 17403, "", "=q1=Steamwheedle Fizzy Spirits", "=ds=#e4#"};
				{ 26, 17402, "", "=q1=Greatfather's Winter Ale", "=ds=#e4#"};
				{ 27, 17194, "", "=q1=Holiday Spices", "=ds=#e6#"};
				{ 28, 17303, "", "=q1=Blue Ribboned Wrapping Paper", "=ds=#e6#"};
				{ 29, 17304, "", "=q1=Green Ribboned Wrapping Paper", "=ds=#e6#"};
				{ 30, 17307, "", "=q1=Purple Ribboned Wrapping Paper", "=ds=#e6#"};
			};
			{
				{ 1, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Stolen Present"], "#QUESTID:7043#"};
				{ 2, 34425, "", "=q3=Clockwork Rocket Bot", "#ACHIEVEMENTID:1705#"};
				{ 3, 46709, "", "=q3=MiniZep Controller", ""};
				{ 4, 46725, "", "=q2=Red Rider Air Rifle", ""};
				{ 5, 37710, "", "=q3=Crashin' Thrashin' Racer Controller", ""};
				{ 7, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Winter Veil Gift"], ""};
				{ 8, 37710, "", "=q3=Crashin' Thrashin' Racer Controller", "#ACHIEVEMENTID:1706#"};
				{ 9, 34425, "", "=q3=Clockwork Rocket Bot", "#ACHIEVEMENTID:1705#"};
				{ 16, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Gaily Wrapped Present"], ""};
				{ 17, 21301, "", "=q1=Green Helper Box", "=ds=#e13#"};
				{ 18, 21308, "", "=q1=Jingling Bell", "=ds=#e13#"};
				{ 19, 21305, "", "=q1=Red Helper Box", "=ds=#e13#"};
				{ 20, 21309, "", "=q1=Snowman Kit", "=ds=#e13#"};
				{ 22, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Ticking Present"], ""};
				{ 23, 21325, "", "=q2=Mechanical Greench", "=ds=#e22#"};
				{ 24, 21213, "", "=q2=Preserved Holly", "=ds=#m20#"};
				{ 25, 17706, "", "=q2=Plans: Edge of Winter", "=ds=#p2# (190)"};
				{ 26, 17725, "", "=q2=Formula: Enchant Weapon - Winter's Might", "=ds=#p4# (190)"};
				{ 27, 17720, "", "=q2=Schematic: Snowmaster 9000", "=ds=#p5# (190)"};
				{ 28, 17722, "", "=q2=Pattern: Gloves of the Greatfather", "=ds=#p7# (190)"};
				{ 29, 17709, "", "=q1=Recipe: Elixir of Frost Power", "=ds=#p1# (190)"};
				{ 30, 17724, "", "=q1=Pattern: Green Holiday Shirt", "=ds=#p8# (190)"};
			};
			{
				{ 1, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Festive Gift"], ""};
				{ 2, 21328, "", "=q1=Wand of Holiday Cheer", "=ds=#m20#"};
				{ 4, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Gently Shaken Gift"], ""};
				{ 5, 21235, "", "=q1=Winter Veil Roast", "=ds=#e3#"};
				{ 6, 21241, "", "=q1=Winter Veil Eggnog", "=ds=#e4#"};
				{ 16, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Carefully Wrapped Present"], ""};
				{ 17, 21254, "", "=q1=Winter Veil Cookie", "=ds=#e3#"};
				{ 19, 0, "INV_Holiday_Christmas_Present_01", "=q6="..AL["Smokywood Pastures Extra-Special Gift"], ""};
				{ 20, 21215, "", "=q1=Graccu's Mince Meat Fruitcake", "=ds=#e3#"};
			};
		};
		info = {
			name = AL["Feast of Winter Veil"],
			module = moduleName, menu = "WORLDEVENTMENU",
		};
	};

		--------------------
		--- Hallow's End ---
		--------------------

	AtlasLoot_Data["Halloween"] = {
		["Normal"] = {
			{
				{ 2, 20410, "", "=q1=Hallowed Wand - Bat", "=ds=#m20#", "#HALLOWSEND:2#"};
				{ 3, 20409, "", "=q1=Hallowed Wand - Ghost", "=ds=#m20#", "#HALLOWSEND:2#"};
				{ 4, 20399, "", "=q1=Hallowed Wand - Leper Gnome", "=ds=#m20#", "#HALLOWSEND:2#"};
				{ 5, 20398, "", "=q1=Hallowed Wand - Ninja", "=ds=#m20#", "#HALLOWSEND:2#"};
				{ 17, 20397, "", "=q1=Hallowed Wand - Pirate", "=ds=#m20#", "#HALLOWSEND:2#"};
				{ 18, 20413, "", "=q1=Hallowed Wand - Random", "=ds=#m20#", "#HALLOWSEND:2#"};
				{ 19, 20411, "", "=q1=Hallowed Wand - Skeleton", "=ds=#m20#", "#HALLOWSEND:2#"};
				{ 20, 20414, "", "=q1=Hallowed Wand - Wisp", "=ds=#m20#", "#HALLOWSEND:2#"};
			};
			{
				{ 2, 34003, "", "=q1=Draenei Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 3, 20561, "", "=q1=Dwarf Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 4, 20391, "", "=q1=Gnome Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 5, 20566, "", "=q1=Human Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 6, 20564, "", "=q1=Night Elf Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 7, 34002, "", "=q1=Blood Elf Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 8, 20570, "", "=q1=Orc Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 9, 20572, "", "=q1=Tauren Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 10, 20568, "", "=q1=Troll Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 11, 20573, "", "=q1=Undead Male Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 17, 34001, "", "=q1=Draenei Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 18, 20562, "", "=q1=Dwarf Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 19, 20392, "", "=q1=Gnome Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 20, 20565, "", "=q1=Human Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 21, 20563, "", "=q1=Night Elf Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 22, 34000, "", "=q1=Blood Elf Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 23, 20569, "", "=q1=Orc Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 24, 20571, "", "=q1=Tauren Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 25, 20567, "", "=q1=Troll Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
				{ 26, 20574, "", "=q1=Undead Female Mask", "=ds=#s1#", "#HALLOWSEND:2#"};
			};
		};
		info = {
			name = AL["Hallow's End"],
			module = moduleName, menu = "HALLOWSENDMENU",
		};
	};

	AtlasLoot_Data["HeadlessHorseman"] = {
		["Normal"] = {
			{
				{ 1, 49121, "", "=q4=Ring of Ghoulish Glee", "=ds=#s13#"};
				{ 2, 49123, "", "=q4=The Horseman's Seal", "=ds=#s13#"};
				{ 3, 49124, "", "=q4=Wicked Witch's Band", "=ds=#s13#"};
				{ 5, 34068, "", "=q1=Weighted Jack-o'-Lantern", "=ds=#m20#", "", "100%"};
				{ 6, 33226, "", "=q1=Tricky Treat", "=ds=#m20#"};
				{ 16, 54516, "", "=q3=Loot-Filled Pumpkin", "=q5="..AL["Daily Reward"]};
				{ 17, 49126, "", "=q4=The Horseman's Horrific Helm", "=ds=#s1#, #a4#"};
				{ 18, 49128, "", "=q4=The Horseman's Baleful Blade", "=ds=#h3#, #w10#"};
				{ 19, 37012, "", "=q4=The Horseman's Reins", "=ds=#e12#"};
				{ 20, 33292, "", "=q3=Hallowed Helm", "=ds=#s1#, #a1#"};
				{ 21, 37011, "", "=q3=Magic Broom", "=ds=#e12#"};
				{ 22, 33154, "", "=q3=Sinister Squashling", "=ds=#e13#"};
			};
		};
		info = {
			name = BabbleBoss["Headless Horseman"],
			module = moduleName, menu = "HALLOWSENDMENU",
		};
	};

		------------------------
		--- Harvest Festival ---
		------------------------

	AtlasLoot_Data["HarvestFestival"] = {
		["Normal"] = {
			{
				{ 2, 19995, "", "=q1=Harvest Boar", "=ds=#e3#"};
				{ 3, 19996, "", "=q1=Harvest Fish", "=ds=#e3#"};
				{ 4, 19994, "", "=q1=Harvest Fruit", "=ds=#e3#"};
				{ 5, 19997, "", "=q1=Harvest Nectar", "=ds=#e4#"};
				{ 17, 19697, "", "=q1=Bounty of the Harvest", "=q1=#m4#: =ds=#m20#"};
				{ 18, 20009, "", "=q1=For the Light!", "=q1=#m4#: =ds=#e10# =ec1=#m7#"};
				{ 19, 20010, "", "=q1=The Horde's Hellscream", "=q1=#m4#: =ds=#e10# =ec1=#m6#"};
			};
		};
		info = {
			name = AL["Harvest Festival"],
			module = moduleName, menu = "WORLDEVENTMENU", 
		};
	};

		--------------------------
		--- Love is in the Air ---
		--------------------------
		
	AtlasLoot_Data["Valentineday"] = {
		["Normal"] = {
			{
				{ 1, 34480, "", "=q3=Romantic Picnic Basket", "=ds=#m20#", "#VALENTINEDAY:10#"};
				{ 2, 21815, "", "=q1=Love Token", "=ds=#m20#", "1 #valentineday2#"};
				{ 3, 50163, "", "=q1=Lovely Rose", "=ds=#m20#", "#VALENTINEDAY:5#"};
				{ 4, 22218, "", "=q1=Handful of Rose Petals", "=ds=#m20#", "#VALENTINEDAY:2#"};
				{ 5, 22200, "", "=q1=Silver Shafted Arrow", "=ds=#e13#", "#VALENTINEDAY:5#"};
				{ 6, 22235, "", "=q1=Truesilver Shafted Arrow", "=ds=#e13#", "#VALENTINEDAY:40#"};
				{ 7, 21813, "", "=q1=Bag of Heart Candies", "=ds=#m20#", "#VALENTINEDAY:2#"};
				{ 8, 21812, "", "=q1=Box of Chocolates", "=ds=#m20#", "#VALENTINEDAY:10#"};
				{ 9, 50160, "", "=q1=Lovely Dress Box", "=ds=#m20#", "#VALENTINEDAY:20#"};
				{ 10, 50161, "", "=q1=Dinner Suit Box", "=ds=#m20#", "#VALENTINEDAY:20#"};
				{ 11, 34258, "", "=q1=Love Rocket", "=ds=#e23#", "#VALENTINEDAY:5#"};
				{ 12, 22261, "", "=q1=Love Fool", "=ds=#e22#", "#VALENTINEDAY:10#"};
				{ 16, 49859, "", "=q1=\"Bravado\" Cologne", "=ds=#m20#", "#VALENTINEDAY:1#"};
				{ 17, 49861, "", "=q1=\"STALWART\" Cologne", "=ds=#m20#", "#VALENTINEDAY:1#"};
				{ 18, 49860, "", "=q1=\"Wizardry\" Cologne", "=ds=#m20#", "#VALENTINEDAY:1#"};
				{ 19, 49856, "", "=q1=\"VICTORY\" Perfume", "=ds=#m20#", "#VALENTINEDAY:1#"};
				{ 20, 49858, "", "=q1=\"Forever\" Perfume", "=ds=#m20#", "#VALENTINEDAY:1#"};
				{ 21, 49857, "", "=q1=\"Enchantress\" Perfume", "=ds=#m20#", "#VALENTINEDAY:1#"};
				{ 24, 49916, "", "=q1=Lovely Charm Bracelet", "=ds=#m17#"};
			};
			{
				{ 1, 0, "INV_Box_02", "=q6="..AL["Lovely Dress Box"], "#ACHIEVEMENTID:1694#"};
				{ 2, 22279, "", "=q1=Lovely Black Dress", "=ds=#s5#"};
				{ 3, 22276, "", "=q1=Lovely Red Dress", "=ds=#s5#"};
				{ 4, 22278, "", "=q1=Lovely Blue Dress", "=ds=#s5#"};
				{ 5, 22280, "", "=q1=Lovely Purple Dress", "=ds=#s5#"};	
				{ 7, 0, "INV_Box_01", "=q6="..AL["Dinner Suit Box"], ""};
				{ 8, 22277, "", "=q1=Red Dinner Suit", "=q1=#m4#: =ds=#s5#"};
				{ 9, 22281, "", "=q1=Blue Dinner Suit", "=q1=#m4#: =ds=#s5#"};
				{ 10, 22282, "", "=q1=Purple Dinner Suit", "=q1=#m4#: =ds=#s5#"};	
				{ 16, 0, "INV_ValentinesBoxOfChocolates02", "=q6="..AL["Box of Chocolates"], "#ACHIEVEMENTID:1702#"};
				{ 17, 22237, "", "=q1=Dark Desire", "=ds=#e3#"};
				{ 18, 22238, "", "=q1=Very Berry Cream", "=ds=#e3#"};
				{ 19, 22236, "", "=q1=Buttermilk Delight", "=ds=#e3#"};
				{ 20, 22239, "", "=q1=Sweet Surprise ", "=ds=#e3#"};		
				{ 22, 0, "inv_valentinescandysack", "=q6="..AL["Bag of Heart Candies"], "#ACHIEVEMENTID:1701#"};
				{ 23, 21816, "", "=q1=Heart Candy", "=ds=#m20#"};
				{ 24, 21817, "", "=q1=Heart Candy", "=ds=#m20#"};
				{ 25, 21818, "", "=q1=Heart Candy", "=ds=#m20#"};
				{ 26, 21819, "", "=q1=Heart Candy", "=ds=#m20#"};
				{ 27, 21820, "", "=q1=Heart Candy", "=ds=#m20#"};
				{ 28, 21821, "", "=q1=Heart Candy", "=ds=#m20#"};
				{ 29, 21822, "", "=q1=Heart Candy", "=ds=#m20#"};
				{ 30, 21823, "", "=q1=Heart Candy", "=ds=#m20#"};
			};
			{
				{ 1, 51804, "", "=q4=Winking Eye of Love", "=ds=#s2#"};
				{ 2, 51805, "", "=q4=Heartbreak Charm", "=ds=#s2#"};
				{ 3, 51806, "", "=q4=Shard of Pirouetting Happiness", "=ds=#s2#"};
				{ 4, 51807, "", "=q4=Sweet Perfume Broach", "=ds=#s2#"};
				{ 5, 51808, "", "=q4=Choker of the Pure Heart", "=ds=#s2#"};
				{ 16, 54537, "", "=q3=Heart-Shaped Box", "=q5="..AL["Daily Reward"]};
				{ 17, 50250, "", "=q4=Big Love Rocket", "=ds=#e12#"};
				{ 18, 50446, "", "=q3=Toxic Wasteling", "=ds=#e13#"};
				{ 19, 50471, "", "=q3=The Heartbreaker", "=ds=#m20#"};
				{ 21, 49715, "", "=q3=Forever-Lovely Rose", "=ds=#s1#"};
				{ 22, 50741, "", "=q3=Vile Fumigator's Mask", "=ds=#s1#, #a1#"};
			};
		};
		info = {
			name = AL["Love is in the Air"],
			module = moduleName, menu = "WORLDEVENTMENU", 
		};
	};

		----------------------
		--- Lunar Festival ---
		----------------------

	AtlasLoot_Data["LunarFestival"] = {
		["Normal"] = {
			{
				{ 1, 21540, "", "=q2=Elune's Lantern", "=q1=#m4#: =ds=#m20#"};
				{ 3, 21157, "", "=q1=Festive Green Dress", "=ds=#s5#"};
				{ 4, 21538, "", "=q1=Festive Pink Dress", "=ds=#s5#"};
				{ 5, 21539, "", "=q1=Festive Purple Dress", "=ds=#s5#"};
				{ 7, 21541, "", "=q1=Festive Black Pant Suit", "=ds=#s5#"};
				{ 8, 21544, "", "=q1=Festive Blue Pant Suit", "=ds=#s5#"};
				{ 9, 21543, "", "=q1=Festive Teal Pant Suit", "=ds=#s5#"};
				{ 11, 21537, "", "=q1=Festival Dumplings", "=ds=#e3#"};
				{ 13, 21713, "", "=q1=Elune's Candle", "=ds=#m20#"};
				{ 15, 21100, "", "=q1=Coin of Ancestry", "=ds=#m17#"};
				{ 16, 0, "INV_Box_02", "=q6="..AL["Lunar Festival Fireworks Pack"], "=ds=#e23#"};
				{ 17, 21558, "", "=q1=Small Blue Rocket", "=ds=#e23#"};
				{ 18, 21559, "", "=q1=Small Green Rocket", "=ds=#e23#"};
				{ 19, 21557, "", "=q1=Small Red Rocket", "=ds=#e23#"};
				{ 20, 21561, "", "=q1=Small White Rocket", "=ds=#e23#"};
				{ 21, 21562, "", "=q1=Small Yellow Rocket", "=ds=#e23#"};
				{ 22, 21589, "", "=q1=Large Blue Rocket", "=ds=#e23#"};
				{ 23, 21590, "", "=q1=Large Green Rocket", "=ds=#e23#"};
				{ 24, 21592, "", "=q1=Large Red Rocket", "=ds=#e23#"};
				{ 25, 21593, "", "=q1=Large White Rocket", "=ds=#e23#"};
				{ 26, 21595, "", "=q1=Large Yellow Rocket", "=ds=#e23#"};
				{ 28, 0, "INV_Misc_LuckyMoneyEnvelope", "=q6="..AL["Lucky Red Envelope"], ""};
				{ 29, 21744, "", "=q1=Lucky Rocket Cluster", "=ds=#e23#"};
				{ 30, 21745, "", "=q1=Elder's Moonstone", "=ds=#m20#"};
			};
			{
				{ 1, 21738, "", "=q2=Schematic: Firework Launcher ", "=ds=#p5# (225)"};
				{ 3, 0, "INV_Scroll_03", "=q6="..AL["Small Rocket Recipes"], ""};
				{ 4, 21724, "", "=q2=Schematic: Small Blue Rocket", "=ds=#p5# (125)"};
				{ 5, 21725, "", "=q2=Schematic: Small Green Rocket", "=ds=#p5# (125)"};
				{ 6, 21726, "", "=q2=Schematic: Small Red Rocket", "=ds=#p5# (125)"};
				{ 8, 0, "INV_Scroll_04", "=q6="..AL["Large Rocket Recipes"], ""};
				{ 9, 21727, "", "=q2=Schematic: Large Blue Rocket", "=ds=#p5# (175)"};
				{ 10, 21728, "", "=q2=Schematic: Large Green Rocket", "=ds=#p5# (175)"};
				{ 11, 21729, "", "=q2=Schematic: Large Red Rocket", "=ds=#p5# (175)"};
				{ 13, 44916, "", "=q2=Pattern: Festival Dress", "=ds=#p8# (250)"};
				{ 16, 21737, "", "=q2=Schematic: Cluster Launcher", "=ds=#p5# (275)"};
				{ 18, 0, "INV_Scroll_05", "=q6="..AL["Cluster Rocket Recipes"], ""};
				{ 19, 21730, "", "=q2=Schematic: Blue Rocket Cluster", "=ds=#p5# (225)"};
				{ 20, 21731, "", "=q2=Schematic: Green Rocket Cluster", "=ds=#p5# (225)"};
				{ 21, 21732, "", "=q2=Schematic: Red Rocket Cluster", "=ds=#p5# (225)"};
				{ 23, 0, "INV_Scroll_06", "=q6="..AL["Large Cluster Rocket Recipes"], ""};
				{ 24, 21733, "", "=q2=Schematic: Large Blue Rocket Cluster", "=ds=#p5# (275)"};
				{ 25, 21734, "", "=q2=Schematic: Large Green Rocket Cluster", "=ds=#p5# (275)"};
				{ 26, 21735, "", "=q2=Schematic: Large Red Rocket Cluster", "=ds=#p5# (275)"};
				{ 28, 44917, "", "=q2=Pattern: Festival Suit", "=ds=#p8# (250)"};
			};
		};
		info = {
			name = AL["Lunar Festival"],
			module = moduleName, menu = "WORLDEVENTMENU", 
		};
	};

		-------------------------------
		--- Midsummer Fire Festival ---
		-------------------------------

	AtlasLoot_Data["MidsummerFestival"] = {
		["Normal"] = {
			{
				{ 1, 34686, "", "=q3=Brazier of Dancing Flames", "", "#MIDSUMMER:350#"};
				{ 2, 23083, "", "=q3=Captured Flame", "=ds=#e13#", "#MIDSUMMER:350#"};
				{ 4, 23379, "", "=q2=Cinder Bracers", "=ds=#e22#"};
				{ 6, 23246, "", "=q1=Fiery Festival Brew", "", "#MIDSUMMER:2#"};
				{ 7, 23435, "", "=q1=Elderberry Pie", "", "#MIDSUMMER:5#"};
				{ 8, 23327, "", "=q1=Fire-Toasted Bun", "", "#MIDSUMMER:5#"};
				{ 9, 23326, "", "=q1=Midsummer Sausage", "", "#MIDSUMMER:5#"};
				{ 10, 23211, "", "=q1=Toasted Smorc", "", "#MIDSUMMER:5#"};
				{ 11, 34684, "", "=q1=Handful of Summer Petals", "", "#MIDSUMMER:2#"};
				{ 12, 23215, "", "=q1=Bag of Smorc Ingredients", "", "#MIDSUMMER:5#"};
				{ 13, 34599, "", "=q1=Juggling Torch", "", "#MIDSUMMER:5#"};
				{ 15, 23247, "", "=q1=Burning Blossom", "=ds=#m17#"};
				{ 16, 23323, "", "=q1=Crown of the Fire Festival", "=ds=#s1#, #a1#, #m4#"};
				{ 17, 23324, "", "=q1=Mantle of the Fire Festival", "=ds=#s3#", "#MIDSUMMER:100#"};
				{ 18, 34685, "", "=q1=Vestment of Summer", "=ds=#s5#", "#MIDSUMMER:100#"};
				{ 19, 34683, "", "=q1=Sandals of Summer", "=ds=#s11#", "#MIDSUMMER:200#"};
			};
		};
		info = {
			name = AL["Midsummer Fire Festival"],
			module = moduleName, menu = "WORLDEVENTMENU", instance = "MidsummerFestival",
		};
	};

	AtlasLoot_Data["LordAhune"] = {
		["Normal"] = {
			{
				{ 1, 54805, "", "=q4=Cloak of the Frigid Winds", "=ds=#s4#"};
				{ 2, 54801, "", "=q4=Icebound Cloak", "=ds=#s4#"};
				{ 3, 54804, "", "=q4=Shroud of Winter's Chill", "=ds=#s4#"};
				{ 4, 54803, "", "=q4=The Frost Lord's Battle Shroud", "=ds=#s4#"};
				{ 5, 54802, "", "=q4=The Frost Lord's War Cloak", "=ds=#s4#"};
				{ 7, 35498, "", "=q3=Formula: Enchant Weapon - Deathfrost", "=ds=#p4# (350)"};
				{ 9, 35723, "", "=q1=Shards of Ahune", "=ds=#m2#"};
				{ 10, 35279, "", "=q3=Tabard of Summer Skies", "=q1=#m4#: =ds=#s7#"};
				{ 11, 35280, "", "=q3=Tabard of Summer Flames", "=q1=#m4#: =ds=#s7#"};
				{ 16, 54536, "", "=q3=Satchel of Chilled Goods", "=q5="..AL["Daily Reward"]};
				{ 17, 54806, "", "=q4=Frostscythe of Lord Ahune", "=ds=#w9#"};
				{ 18, 53641, "", "=q3=Ice Chip", "=ds=#e13#"};
			};
		};
		info = {
			name = BabbleBoss["Ahune"],
			module = moduleName, menu = "WORLDEVENTMENU", instance = "MidsummerFestival",
		};
	};

		-------------------
		--- Noblegarden ---
		-------------------

	AtlasLoot_Data["Noblegarden"] = {
		["Normal"] = {
			{
				{ 2, 44793, "", "=q3=Tome of Polymorph: Rabbit", "=ds=#e10#", "#NOBLEGARDEN:100#"};
				{ 3, 44794, "", "=q3=Spring Rabbit's Foot", "=ds=#e13#", "#NOBLEGARDEN:100#"};
				{ 4, 45073, "", "=q1=Spring Flowers", "=ds=#h1#", "#NOBLEGARDEN:50#"};
				{ 5, 44792, "", "=q1=Blossoming Branch", "=ds=", "#NOBLEGARDEN:10#"};
				{ 6, 44818, "", "=q1=Noblegarden Egg", "=ds=", "#NOBLEGARDEN:5#"};
				{ 8, 45067, "", "=q1=Egg Basket", "=q1=#m4#: =ds=#s15#"};
				{ 9, 44791, "", "=q1=Noblegarden Chocolate", "=ds=#e3#"};
				{ 17, 44803, "", "=q1=Spring Circlet", "=ds=#s1#", "#NOBLEGARDEN:50#"};
				{ 18, 19028, "", "=q1=Elegant Dress", "=ds=#s5#", "#NOBLEGARDEN:50#"};
				{ 19, 44800, "", "=q1=Spring Robes", "=ds=#s5#", "#NOBLEGARDEN:50#"};
				{ 20, 6833, "", "=q1=White Tuxedo Shirt", "=ds=#s6#", "#NOBLEGARDEN:25#"};
				{ 21, 6835, "", "=q1=Black Tuxedo Pants", "=ds=#s11#", "#NOBLEGARDEN:25#"};
			};
		};
		info = {
			name = AL["Noblegarden"],
			module = moduleName, menu = "WORLDEVENTMENU"
		};
	};

		------------------------
		--- Pilgrim's Bounty ---
		------------------------

	AtlasLoot_Data["PilgrimsBounty"] = {
		["Normal_A"] = {
			{
				{ 1, 46809, "", "=q2=Bountiful Cookbook", "=ds=#p3# #e10# (1)"};
				{ 2, 44860, "", "=q1=Recipe: Spice Bread Stuffing", "=ds=#p3# (1)"};
				{ 3, 44862, "", "=q1=Recipe: Pumpkin Pie", "=ds=#p3# (100)"};
				{ 4, 44858, "", "=q1=Recipe: Cranberry Chutney", "=ds=#p3# (160)"};
				{ 5, 44859, "", "=q1=Recipe: Candied Sweet Potato", "=ds=#p3# (220)"};
				{ 6, 44861, "", "=q1=Recipe: Slow-Roasted Turkey", "=ds=#p3# (280)"};
				{ 7, 46888, "", "=q1=Bountiful Basket", "=ds=#e3#, #p3# (350)"};
				{ 8, 44855, "", "=q1=Teldrassil Sweet Potato", "=ds=#e3#"};
				{ 9, 44854, "", "=q1=Tangy Wetland Cranberries", "=ds=#e3#"};
				{ 10, 46784, "", "=q1=Ripe Elwynn Pumpkin", "=ds=#e3#"};
				{ 11, 44835, "", "=q1=Autumnal Herbs", "=ds=#e6#"};
				{ 12, 44853, "", "=q1=Honey", "=ds=#e6#"};
				{ 16, 44810, "", "=q3=Turkey Cage", "=q1=#m32#: =ds=#e13#"};
				{ 17, 46723, "", "=q1=Pilgrim's Hat", "=q1=#m4#: =ds=#s1#"};
				{ 18, 46800, "", "=q1=Pilgrim's Attire", "=q1=#m4#: =ds=#s5#"};
				{ 19, 44785, "", "=q1=Pilgrim's Dress", "=q1=#m4#: =ds=#s5#"};
				{ 20, 46824, "", "=q1=Pilgrim's Robe", "=q1=#m4#: =ds=#s5#"};
				{ 21, 44788, "", "=q1=Pilgrim's Boots", "=q1=#m4#: =ds=#s12#"};
				{ 22, 44844, "", "=q1=Turkey Caller", "=q1=#m4#: =ds="};
				{ 23, 44812, "", "=q1=Turkey Shooter", "=q1=#m4#: =ds="};
			};
		};
		["Normal_H"] = {
			{
				{ 1, 46810, "", "=q2=Bountiful Cookbook", "=ds=#p3# #e10# (1)"};
				{ 2, 46803, "", "=q1=Recipe: Spice Bread Stuffing", "=ds=#p3# (1)"};
				{ 3, 46804, "", "=q1=Recipe: Pumpkin Pie", "=ds=#p3# (100)"};
				{ 4, 46805, "", "=q1=Recipe: Cranberry Chutney", "=ds=#p3# (160)"};
				{ 5, 46806, "", "=q1=Recipe: Candied Sweet Potato", "=ds=#p3# (220)"};
				{ 6, 46807, "", "=q1=Recipe: Slow-Roasted Turkey", "=ds=#p3# (280)"};
				{ 7, 46888, "", "=q1=Bountiful Basket", "=ds=#e3#, #p3# (350)"};
				{ 8, 46797, "", "=q1=Mulgore Sweet Potato", "=ds=#e3#"};
				{ 9, 46793, "", "=q1=Tangy Southfury Cranberries ", "=ds=#e3#"};
				{ 10, 46796, "", "=q1=Ripe Tirisfal Pumpkin ", "=ds=#e3#"};
				{ 11, 44835, "", "=q1=Autumnal Herbs", "=ds=#e6#"};
				{ 12, 44853, "", "=q1=Honey", "=ds=#e6#"};
				{ 16, 44810, "", "=q3=Turkey Cage", "=q1=#m32#: =ds=#e13#"};
				{ 17, 46723, "", "=q1=Pilgrim's Hat", "=q1=#m4#: =ds=#s1#"};
				{ 18, 46800, "", "=q1=Pilgrim's Attire", "=q1=#m4#: =ds=#s5#"};
				{ 19, 44785, "", "=q1=Pilgrim's Dress", "=q1=#m4#: =ds=#s5#"};
				{ 20, 46824, "", "=q1=Pilgrim's Robe", "=q1=#m4#: =ds=#s5#"};
				{ 21, 44788, "", "=q1=Pilgrim's Boots", "=q1=#m4#: =ds=#s12#"};
				{ 22, 44844, "", "=q1=Turkey Caller", "=q1=#m4#"};
				{ 23, 44812, "", "=q1=Turkey Shooter", "=q1=#m4#"};
			};
		};
		info = {
			name = AL["Pilgrim's Bounty"],
			module = moduleName, menu = "WORLDEVENTMENU"
		};
	};

	--------------------------
	--- Reaccouring Events ---
	--------------------------

		-------------------------------------
		--- Bash'ir Landing Skyguard Raid ---
		-------------------------------------

	AtlasLoot_Data["BashirLanding"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Phase 1"], "=q1="..AL["Aether-tech Assistant"]};
				{ 2, 32596, "", "=q1=Unstable Flask of the Elder", "=ds=#e2#", "", ""};
				{ 3, 32600, "", "=q1=Unstable Flask of the Physician", "=ds=#e2#", "", ""};
				{ 4, 32599, "", "=q1=Unstable Flask of the Bandit", "=ds=#e2#", "", ""};
				{ 5, 32597, "", "=q1=Unstable Flask of the Soldier", "=ds=#e2#", "", ""};
				{ 7, 0, "INV_Box_01", "=q6="..AL["Phase 2"], "=q1="..AL["Aether-tech Adept"]};
				{ 8, 32634, "", "=q3=Shifting Amethyst", "=ds=#e7#", "", ""};
				{ 9, 32637, "", "=q3=Deadly Citrine", "=ds=#e7#", "", ""};
				{ 10, 32638, "", "=q3=Reckless Citrine", "=ds=#e7#", "", ""};
				{ 11, 32635, "", "=q3=Timeless Peridot", "=ds=#e7#", "", ""};
				{ 12, 32636, "", "=q3=Purified Sapphire", "=ds=#e7#", "", ""};
				{ 13, 32639, "", "=q3=Jagged Mossjewel", "=ds=#e7#", "", ""};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Phase 3"], "=q1="..AL["Aether-tech Master"]};
				{ 17, 32641, "", "=q3=Imbued Unstable Diamond", "=ds=#e7#", "", ""};
				{ 18, 32640, "", "=q3=Tense Unstable Diamond", "=ds=#e7#", "", ""};
				{ 19, 32759, "", "=q1=Accelerator Module", "=ds=", "", ""};
				{ 20, 32630, "", "=q1=Small Gold Metamorphosis Geode", "=ds=", "", ""};
				{ 21, 32631, "", "=q1=Small Silver Metamorphosis Geode", "=ds=", "", ""};
				{ 22, 32627, "", "=q1=Small Copper Metamorphosis Geode", "=ds=", "", ""};
				{ 23, 32625, "", "=q1=Small Iron Metamorphosis Geode", "=ds=", "", ""};
				{ 24, 32629, "", "=q1=Large Gold Metamorphosis Geode", "=ds=", "", ""};
				{ 25, 32628, "", "=q1=Large Silver Metamorphosis Geode", "=ds=", "", ""};
				{ 26, 32626, "", "=q1=Large Copper Metamorphosis Geode", "=ds=", "", ""};
				{ 27, 32624, "", "=q1=Large Iron Metamorphosis Geode", "=ds=", "", ""};
			};
		};
		info = {
			name = AL["Bash'ir Landing Skyguard Raid"],
			module = moduleName, menu = "WORLDEVENTMENU"
		};
	};

		----------------------
		--- Darkmoon Faire ---
		----------------------

	AtlasLoot_Data["Darkmoon"] = {
		["Normal"] = {
			{
				{ 2, 11026, "", "=q1=Tree Frog Box", "=ds=#e13#"};
				{ 3, 11027, "", "=q1=Wood Frog Box", "=ds=#e13#"};
				{ 4, 19450, "", "=q1=A Jubling's Tiny Home", "=q1=#m4#: =ds=#e13#"};
				{ 17, 19295, "", "=q1=Darkmoon Flower", "=ds=#s15#" },
    			{ 18, 19291, "", "=q1=Darkmoon Storage Box", "=ds=#e1#" },
			};
			{
				{ 2, 19223, "", "=q1=Darkmoon Dog", "=ds=#e3#"};
				{ 3, 19304, "", "=q1=Spiced Beef Jerky", "=ds=#e3#"};
				{ 4, 19305, "", "=q1=Pickled Kodo Foot", "=ds=#e3#"};
				{ 5, 19224, "", "=q1=Red Hot Wings", "=ds=#e3#"};
				{ 6, 19306, "", "=q1=Crunchy Frog", "=ds=#e3#"};
				{ 7, 19225, "", "=q1=Deep Fried Candybar", "=ds=#e3#"};
				{ 8, 33246, "", "=q1=Funnel Cake", "=ds=#e3#"};
				{ 9, 33254, "", "=q1=Forest Strider Drumstick", "=ds=#e3#"};
				{ 10, 44940, "", "=q1=Corn-Breaded Sausage", "=ds=#e3#"};
				{ 17, 19222, "", "=q1=Cheap Beer", "=ds=#e4#"};
				{ 18, 19221, "", "=q1=Darkmoon Special Reserve", "=ds=#e4#"};
				{ 19, 19299, "", "=q1=Fizzy Faire Drink", "=ds=#e4#"};
				{ 20, 19300, "", "=q1=Bottled Winterspring Water", "=ds=#e4#"};
				{ 21, 33234, "", "=q1=Iced Berry Slush", "=ds=#e4#"};
				{ 22, 33236, "", "=q1=Fizzy Faire Drink 'Classic'", "=ds=#e4#"};
				{ 23, 44941, "", "=q1=Fresh-Squeezed Limeade", "=ds=#e4#"};
			};
		};
		info = {
			name = BabbleFaction["Darkmoon Faire"],
			module = moduleName, menu = "DARKMOONMENU"
		};
	};

	AtlasLoot_Data["DarkmoonDeck"] = {
		["Normal"] = {
			{
				{ 1, 44276, "", "=q4=Chaos Deck", "=ds=#m2#"};
				{ 2, 42989, "", "=q4=Darkmoon Card: Berserker!", "=q1=#m4#: =ds=#s14#"};
				{ 4, 44259, "", "=q4=Prisms Deck", "=ds=#m2#"};
				{ 5, 42988, "", "=q4=Darkmoon Card: Illusion", "=q1=#m4#: =ds=#s14#"};
				{ 7, 44294, "", "=q4=Undeath Deck", "=ds=#m2#"};
				{ 8, 42990, "", "=q4=Darkmoon Card: Death", "=q1=#m4#: =ds=#s14#"};
				{ 16, 44326, "", "=q4=Nobles Deck", "=ds=#m2#"};
				{ 17, 44253, "", "=q4=Darkmoon Card: Greatness", "=q1=#m4#: =ds=#s14#"};
				{ 18, 42987, "", "=q4=Darkmoon Card: Greatness", "=q1=#m4#: =ds=#s14#"};
				{ 19, 44254, "", "=q4=Darkmoon Card: Greatness", "=q1=#m4#: =ds=#s14#"};
				{ 20, 44255, "", "=q4=Darkmoon Card: Greatness", "=q1=#m4#: =ds=#s14#"};
				extraText = ": "..AL["Level 80 Trinkets"];
			};
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Level 60 Trinkets"], ""};
				{ 2, 19228, "", "=q4=Beasts Deck", "=ds=#m2#"};
				{ 3, 19288, "", "=q4=Darkmoon Card: Blue Dragon", "=q1=#m4#: =ds=#s14#"};
				{ 5, 19267, "", "=q4=Elementals Deck", "=ds=#m2#"};
				{ 6, 19289, "", "=q4=Darkmoon Card: Maelstrom", "=q1=#m4#: =ds=#s14#"};
				{ 8, 19277, "", "=q4=Portals Deck", "=ds=#m2#"};
				{ 9, 19290, "", "=q4=Darkmoon Card: Twisting Nether", "=q1=#m4#: =ds=#s14#"};
				{ 11, 19257, "", "=q4=Warlords Deck", "=ds=#m2#"};
				{ 12, 19287, "", "=q4=Darkmoon Card: Heroism", "=q1=#m4#: =ds=#s14#"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Level 70 Trinkets"], ""};
				{ 17, 31890, "", "=q4=Blessings Deck", "=ds=#m2#"};
				{ 18, 31856, "", "=q4=Darkmoon Card: Crusade", "=q1=#m4#: =ds=#s14#"};
				{ 20, 31907, "", "=q4=Furies Deck", "=ds=#m2#"};
				{ 21, 31858, "", "=q4=Darkmoon Card: Vengeance", "=q1=#m4#: =ds=#s14#"};
				{ 23, 31914, "", "=q4=Lunacy Deck", "=ds=#m2#"};
				{ 24, 31859, "", "=q4=Darkmoon Card: Madness", "=q1=#m4#: =ds=#s14#"};
				{ 26, 31891, "", "=q4=Storms Deck", "=ds=#m2#"};
				{ 27, 31857, "", "=q4=Darkmoon Card: Wrath", "=q1=#m4#: =ds=#s14#"};
				extraText = ": "..AL["Level 60 & 70 Trinkets"];
			};
			{
				{ 1, 37163, "", "=q2=Rogues Deck", "=ds=#m2#"};
				{ 2, 38318, "", "=q2=Darkmoon Robe", "=q1=#m4#: =ds=#s5#, #a1#"};
				{ 3, 39509, "", "=q2=Darkmoon Vest", "=q1=#m4#: =ds=#s5#, #a2#"};
				{ 4, 39507, "", "=q2=Darkmoon Chain Shirt", "=q1=#m4#: =ds=#s5#, #a3#"};
				{ 6, 37164, "", "=q3=Swords Deck", "=ds=#m2#"};
				{ 7, 39894, "", "=q3=Darkcloth Shoulders", "=q1=#m4#: =ds=#s3#, #a1#"};
				{ 8, 39895, "", "=q3=Cloaked Shoulderpads", "=q1=#m4#: =ds=#s3#, #a2#"};
				{ 9, 39897, "", "=q3=Azure Shoulderguards", "=q1=#m4#: =ds=#s3#, #a3#"};
				{ 16, 44148, "", "=q3=Mages Deck", "=ds=#m2#"};
				{ 17, 44215, "", "=q3=Darkmoon Necklace", "=q1=#m4#: =ds=#s2#"};
				{ 18, 44213, "", "=q3=Darkmoon Pendant", "=q1=#m4#: =ds=#s2#"};
				{ 21, 44158, "", "=q3=Demons Deck", "=ds=#m2#"};
				{ 22, 44217, "", "=q3=Darkmoon Dirk", "=q1=#m4#: =ds=#h1#, #w4#"};
				{ 23, 44218, "", "=q3=Darkmoon Executioner", "=q1=#m4#: =ds=#h2#, #w1#"};
				{ 24, 44219, "", "=q3=Darkmoon Magestaff", "=q1=#m4#: =ds=#w9#"};
				extraText = ": "..AL["Low Level Decks"];
			};
		};
		info = {
			name = BabbleFaction["Darkmoon Faire"],
			module = moduleName, menu = "DARKMOONMENU"
		};
	};

		---------------------------------
		--- Gurubashi Arena Booty Run ---
		---------------------------------

	AtlasLoot_Data["GurubashiArena"] = {
		["Normal"] = {
			{
				{ 2, 18709, "", "=q3=Arena Wristguards", "=ds=#s8#, #a1#", "", "5.0%"};
				{ 3, 18710, "", "=q3=Arena Bracers", "=ds=#s8#, #a2#", "", "6.4%"};
				{ 4, 18711, "", "=q3=Arena Bands", "=ds=#s8#, #a3#", "", "6.0%"};
				{ 5, 18712, "", "=q3=Arena Vambraces", "=ds=#s8#, #a4#", "", "6.8%"};
				{ 17, 18706, "", "=q2=Arena Master", "=ds=#s14#, =q1=#m2#", "", "100%"};
				{ 18, 19024, "", "=q3=Arena Grand Master", "=q1=#m4#: =ds=#s14#"};
			};
		};
		info = {
			name = AL["Gurubashi Arena Booty Run"],
			module = moduleName, menu = "WORLDEVENTMENU"
		};
	};

		------------------------------------------
		--- Stranglethorn Fishing Extravaganza ---
		------------------------------------------

	AtlasLoot_Data["FishingExtravaganza"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["First Prize"], "=q1="..AL["Stranglethorn Fishing Extravaganza"]};
				{ 2, 19970, "", "=q3=Arcanite Fishing Pole", "=ds=#e20#"};
				{ 3, 19979, "", "=q3=Hook of the Master Angler", "=ds=#s14#"};
				{ 5, 0, "INV_Box_01", "=q6="..AL["Rare Fish"], "=q1="..AL["Stranglethorn Fishing Extravaganza"]};
				{ 6, 19805, "", "=q2=Keefer's Angelfish", "=ds=#e21#", "", ""};
				{ 7, 19803, "", "=q2=Brownell's Blue Striped Racer", "=ds=#e21#", "", ""};
				{ 8, 19806, "", "=q2=Dezian Queenfish", "=ds=#e21#", "", ""};
				{ 9, 19808, "", "=q2=Rockhide Strongfish", "=ds=#h1#, #w6#", "", ""};
				{ 16, 0, "INV_Box_01", "=q6="..AL["First Prize"], "=q1="..AL["Kalu'ak Fishing Derby"]};
				{ 17, 50287, "", "=q3=Boots of the Bay", "=ds=#s12#"};
				{ 18, 50255, "", "=q7=Dread Pirate Ring", "=ds=#s13#"};
				{ 20, 0, "INV_Box_01", "=q6="..AL["Rare Fish Rewards"], "=q1="..AL["Stranglethorn Fishing Extravaganza"]};
				{ 21, 19972, "", "=q2=Lucky Fishing Hat", "=ds=#s1#, #a1#"};
				{ 22, 19969, "", "=q2=Nat Pagle's Extreme Anglin' Boots", "=ds=#s12#, #a1#"};
				{ 23, 19971, "", "=q2=High Test Eternium Fishing Line", "=ds=#e20# #e17#"};
			};
		};
		info = {
			name = AL["Fishing Contests"],
			module = moduleName, menu = "WORLDEVENTMENU"
		};
	};

	-----------------------
	--- One-Time Events ---
	-----------------------

	------------------------
	--- Triggered Events ---
	------------------------

		-----------------------
		--- Abyssal Council ---
		-----------------------

	AtlasLoot_Data["Templars"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Crimson Templar"], "=q1=#j19#"};
				{ 2, 20657, "", "=q3=Crystal Tipped Stiletto", "=ds=#h1#, #w4#", "", "2.31%"};
				{ 3, 20655, "", "=q2=Abyssal Cloth Handwraps", "=ds=#s9#, #a1#", "", "13.03%"};
				{ 4, 20656, "", "=q2=Abyssal Mail Sabatons", "=ds=#s12#, #a3#", "", "12.89%"};
				{ 5, 20513, "", "=q2=Abyssal Crest", "=ds=#m3#", "", "100%"};
				{ 7, 0, "INV_Box_01", "=q6="..AL["Azure Templar"], "=q1=#j20#"};
				{ 8, 20654, "", "=q3=Amethyst War Staff", "=ds=#w9#", "", "2.38%"};
				{ 9, 20652, "", "=q2=Abyssal Cloth Slippers", "=ds=#s12#, #a1#", "", "12.94%"};
				{ 10, 20653, "", "=q2=Abyssal Plate Gauntlets", "=ds=#s9#, #a4#", "", "13.61%"};
				{ 11, 20513, "", "=q2=Abyssal Crest", "=ds=#m3#", "", "100%"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Hoary Templar"], "=q1=#j21#"};
				{ 17, 20660, "", "=q3=Stonecutting Glaive", "=ds=#w7#", "", "2.22%"};
				{ 18, 20658, "", "=q2=Abyssal Leather Boots", "=ds=#s12#, #a2#", "", "13.16%"};
				{ 19, 20659, "", "=q2=Abyssal Mail Handguards", "=ds=#s9#, #a3#", "", "12.64%"};
				{ 20, 20513, "", "=q2=Abyssal Crest", "=ds=#m3#", "", "100%"};
				{ 22, 0, "INV_Box_01", "=q6="..AL["Earthen Templar"], "=q1=#j22#"};
				{ 23, 20663, "", "=q3=Deep Strike Bow", "=ds=#w2#", "", "2.55%"};
				{ 24, 20661, "", "=q2=Abyssal Leather Gloves", "=ds=#s9#, #a2#", "", "13.16%"};
				{ 25, 20662, "", "=q2=Abyssal Plate Greaves", "=ds=#s12#, #a4#", "", "12.93%"};
				{ 26, 20513, "", "=q2=Abyssal Crest", "=ds=#m3#", "", "100%"};
			};
		};
		info = {
			name = AL["Abyssal Council"].." - "..AL["Templars"],
			module = moduleName, menu = "ABYSSALMENU"
		};
	};

	AtlasLoot_Data["Dukes"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["The Duke of Cynders"], "=q1=#j19#"};
				{ 2, 20665, "", "=q3=Abyssal Leather Leggings", "=ds=#s11#, #a2#", "", "22.50%"};
				{ 3, 20666, "", "=q3=Hardened Steel Warhammer", "=ds=#h3#, #w6#", "", "30.47%"};
				{ 4, 20514, "", "=q3=Abyssal Signet", "=ds=#m3#", "", "100%"};
				{ 5, 20664, "", "=q2=Abyssal Cloth Sash", "=ds=#s10#, #a1#", "", "27.08%"};
				{ 6, 21989, "", "=q1=Cinder of Cynders", "=ds=#m3#", "", "100%"};
				{ 8, 0, "INV_Box_01", "=q6="..AL["The Duke of Fathoms"], "=q1=#j20#"};
				{ 9, 20668, "", "=q3=Abyssal Mail Legguards", "=ds=#s11#, #a3#", "", "22.40%"};
				{ 10, 20669, "", "=q3=Darkstone Claymore", "=ds=#h2#, #w10#", "", "29.62%"};
				{ 11, 20514, "", "=q3=Abyssal Signet", "=ds=#m3#", "", "100%"};
				{ 12, 20667, "", "=q2=Abyssal Leather Belt", "=ds=#s10#, #a2#", "", "29.04%"};
				{ 16, 0, "INV_Box_01", "=q6="..AL["The Duke of Zephyrs"], "=q1=#j21#"};
				{ 17, 20674, "", "=q3=Abyssal Cloth Pants", "=ds=#s11#, #a1#", "", "21.83%"};
				{ 18, 20675, "", "=q3=Soulrender", "=ds=#h1#, #w1#", "", "29.73%"};
				{ 19, 20514, "", "=q3=Abyssal Signet", "=ds=#m3#", "", "100%"};
				{ 20, 20673, "", "=q2=Abyssal Plate Girdle", "=ds=#s10#, #a4#", "", "27.11%"};
				{ 23, 0, "INV_Box_01", "=q6="..AL["The Duke of Shards"], "=q1=#j22#"};
				{ 24, 20671, "", "=q3=Abyssal Plate Legplates", "=ds=#s11#, #a4#", "", "22.63%"};
				{ 25, 20672, "", "=q3=Sparkling Crystal Wand", "=ds=#w12#", "", "28.90%"};
				{ 26, 20514, "", "=q3=Abyssal Signet", "=ds=#m3#", "", "100%"};
				{ 27, 20670, "", "=q2=Abyssal Mail Clutch", "=ds=#s10#, #a3#", "", "28.16%"};
			};
		};
		info = {
			name = AL["Abyssal Council"].." - "..AL["Dukes"],
			module = moduleName, menu = "ABYSSALMENU"
		};
	};

		-----------------------
		--- Ethereum Prison ---
		-----------------------

	AtlasLoot_Data["ArmbreakerHuffaz"] = {
		["Normal"] = {
			{
				{ 1, 31943, "", "=q3=Ethereum Band", "=ds=#s13#", "", "10.7%"};
				{ 3, 31939, "", "=q3=Dark Cloak", "=ds=#s4#", "", "1.36%"};
				{ 4, 31938, "", "=q3=Enigmatic Cloak", "=ds=#s4#", "", "0.4%"};
				{ 5, 31936, "", "=q3=Fiery Cloak", "=ds=#s4#", "", "0.36%"};
				{ 6, 31935, "", "=q3=Frigid Cloak", "=ds=#s4#", "", "1.1%"};
				{ 7, 31937, "", "=q3=Living Cloak", "=ds=#s4#", "", "0.6%"};
				{ 9, 31957, "", "=q2=Ethereum Prisoner I.D. Tag", "=ds=#m3#", "", "100%"};
				{ 18, 31928, "", "=q3=Dark Band", "=ds=#s13#", "", "0.7%"};
				{ 19, 31929, "", "=q3=Enigmatic Band", "=ds=#s13#", "", "0.8%"};
				{ 20, 31925, "", "=q3=Fiery Band", "=ds=#s13#", "", "0.5%"};
				{ 21, 31926, "", "=q3=Frigid Band", "=ds=#s13#", "", "1.0%"};
				{ 22, 31927, "", "=q3=Living Band", "=ds=#s13#", "", "1.3%"};
			};
		};
		info = {
			name = AL["Armbreaker Huffaz"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

	AtlasLoot_Data["FelTinkererZortan"] = {
		["Normal"] = {
			{
				{ 1, 31573, "", "=q3=Mistshroud Boots", "=ds=#s12#, #a3#", "", "9.7%"};
				{ 3, 31939, "", "=q3=Dark Cloak", "=ds=#s4#", "", "0.94%"};
				{ 4, 31938, "", "=q3=Enigmatic Cloak", "=ds=#s4#", "", "1.0%"};
				{ 5, 31936, "", "=q3=Fiery Cloak", "=ds=#s4#", "", "0.94%"};
				{ 6, 31935, "", "=q3=Frigid Cloak", "=ds=#s4#", "", "0.4%"};
				{ 7, 31937, "", "=q3=Living Cloak", "=ds=#s4#", "", "0.7%"};
				{ 9, 31957, "", "=q2=Ethereum Prisoner I.D. Tag", "=ds=#m3#", "", "100%"};
				{ 18, 31928, "", "=q3=Dark Band", "=ds=#s13#", "", "1.0%"};
				{ 19, 31929, "", "=q3=Enigmatic Band", "=ds=#s13#", "", "1.3%"};
				{ 20, 31925, "", "=q3=Fiery Band", "=ds=#s13#", "", "1.2%"};
				{ 21, 31926, "", "=q3=Frigid Band", "=ds=#s13#", "", "1.0%"};
				{ 22, 31927, "", "=q3=Living Band", "=ds=#s13#", "", "1.2%"};
			};
		};
		info = {
			name = AL["Fel Tinkerer Zortan"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

	AtlasLoot_Data["Forgosh"] = {
		["Normal"] = {
			{
				{ 1, 31565, "", "=q3=Skystalker's Boots", "=ds=#s12#, #a2#", "", "8.5%"};
				{ 3, 31939, "", "=q3=Dark Cloak", "=ds=#s4#", "", "2.63%"};
				{ 4, 31938, "", "=q3=Enigmatic Cloak", "=ds=#s4#", "", "0.29%"};
				{ 5, 31936, "", "=q3=Fiery Cloak", "=ds=#s4#", "", "0.9%"};
				{ 6, 31935, "", "=q3=Frigid Cloak", "=ds=#s4#", "", "0.7%"};
				{ 7, 31937, "", "=q3=Living Cloak", "=ds=#s4#", "", "1.0%"};
				{ 9, 31957, "", "=q2=Ethereum Prisoner I.D. Tag", "=ds=#m3#", "", "100%"};
				{ 18, 31928, "", "=q3=Dark Band", "=ds=#s13#", "", "0.9%"};
				{ 19, 31929, "", "=q3=Enigmatic Band", "=ds=#s13#", "", "1.9%"};
				{ 20, 31925, "", "=q3=Fiery Band", "=ds=#s13#", "", "0.5%"};
				{ 21, 31926, "", "=q3=Frigid Band", "=ds=#s13#", "", "1.0%"};
				{ 22, 31927, "", "=q3=Living Band", "=ds=#s13#", "", "0.7%"};
			};
		};
		info = {
			name = AL["Forgosh"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

	AtlasLoot_Data["Gulbor"] = {
		["Normal"] = {
			{
				{ 1, 31940, "", "=q3=Ethereum Torque", "=ds=#s2#", "", "9.5%"};
				{ 3, 31939, "", "=q3=Dark Cloak", "=ds=#s4#", "", "0.66%"};
				{ 4, 31938, "", "=q3=Enigmatic Cloak", "=ds=#s4#", "", "0.66%"};
				{ 5, 31936, "", "=q3=Fiery Cloak", "=ds=#s4#", "", "1.1%"};
				{ 6, 31935, "", "=q3=Frigid Cloak", "=ds=#s4#", "", "1.1%"};
				{ 7, 31937, "", "=q3=Living Cloak", "=ds=#s4#", "", "0.8%"};
				{ 9, 31957, "", "=q2=Ethereum Prisoner I.D. Tag", "=ds=#m3#", "", "100%"};
				{ 18, 31928, "", "=q3=Dark Band", "=ds=#s13#", "", "0.7%"};
				{ 19, 31929, "", "=q3=Enigmatic Band", "=ds=#s13#", "", "0.9%"};
				{ 20, 31925, "", "=q3=Fiery Band", "=ds=#s13#", "", "0.8%"};
				{ 21, 31926, "", "=q3=Frigid Band", "=ds=#s13#", "", "0.8%"};
				{ 22, 31927, "", "=q3=Living Band", "=ds=#s13#", "", "2.0%"};
			};
		};
		info = {
			name = AL["Gul'bor"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

	AtlasLoot_Data["MalevustheMad"] = {
		["Normal"] = {
			{
				{ 1, 31581, "", "=q3=Slatesteel Boots", "=ds=#s12#, #a4#", "", "10.5%"};
				{ 3, 31939, "", "=q3=Dark Cloak", "=ds=#s4#", "", "2.46%"};
				{ 4, 31938, "", "=q3=Enigmatic Cloak", "=ds=#s4#", "", "0.70%"};
				{ 5, 31936, "", "=q3=Fiery Cloak", "=ds=#s4#", "", "1.5%"};
				{ 6, 31935, "", "=q3=Frigid Cloak", "=ds=#s4#", "", "0.7%"};
				{ 7, 31937, "", "=q3=Living Cloak", "=ds=#s4#", "", "1.3%"};
				{ 9, 31957, "", "=q2=Ethereum Prisoner I.D. Tag", "=ds=#m3#", "", "100%"};
				{ 18, 31928, "", "=q3=Dark Band", "=ds=#s13#", "", "0.5%"};
				{ 19, 31929, "", "=q3=Enigmatic Band", "=ds=#s13#", "", "0.8%"};
				{ 20, 31925, "", "=q3=Fiery Band", "=ds=#s13#", "", "1.75%"};
				{ 21, 31926, "", "=q3=Frigid Band", "=ds=#s13#", "", "0.6%"};
				{ 22, 31927, "", "=q3=Living Band", "=ds=#s13#", "", "1.8%"};
			};
		};
		info = {
			name = AL["Malevus the Mad"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

	AtlasLoot_Data["PorfustheGemGorger"] = {
		["Normal"] = {
			{
				{ 1, 31557, "", "=q3=Windchanneller's Boots", "=ds=#s12#, #a1#", "", "7.9%"};
				{ 3, 31939, "", "=q3=Dark Cloak", "=ds=#s4#", "", "1.89%"};
				{ 4, 31938, "", "=q3=Enigmatic Cloak", "=ds=#s4#", "", "0.81%"};
				{ 5, 31936, "", "=q3=Fiery Cloak", "=ds=#s4#", "", "1.0%"};
				{ 6, 31935, "", "=q3=Frigid Cloak", "=ds=#s4#", "", "0.7%"};
				{ 7, 31937, "", "=q3=Living Cloak", "=ds=#s4#", "", "1.1%"};
				{ 9, 31957, "", "=q2=Ethereum Prisoner I.D. Tag", "=ds=#m3#", "", "100%"};
				{ 18, 31928, "", "=q3=Dark Band", "=ds=#s13#", "", "0.7%"};
				{ 19, 31929, "", "=q3=Enigmatic Band", "=ds=#s13#", "", "0.6%"};
				{ 20, 31925, "", "=q3=Fiery Band", "=ds=#s13#", "", "1.8%"};
				{ 21, 31926, "", "=q3=Frigid Band", "=ds=#s13#", "", "1.0%"};
				{ 22, 31927, "", "=q3=Living Band", "=ds=#s13#", "", "1.1%"};
			};
		};
		info = {
			name = AL["Porfus the Gem Gorger"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

	AtlasLoot_Data["WrathbringerLaztarash"] = {
		["Normal"] = {
			{
				{ 1, 32520, "", "=q3=Manaforged Sphere", "=ds=#s15#", "", "10.4%"};
				{ 3, 31939, "", "=q3=Dark Cloak", "=ds=#s4#", "", "1.06%"};
				{ 4, 31938, "", "=q3=Enigmatic Cloak", "=ds=#s4#", "", "1.06%"};
				{ 5, 31936, "", "=q3=Fiery Cloak", "=ds=#s4#", "", "0.8%"};
				{ 6, 31935, "", "=q3=Frigid Cloak", "=ds=#s4#", "", "1.5%"};
				{ 7, 31937, "", "=q3=Living Cloak", "=ds=#s4#", "", "0.3%"};
				{ 9, 31957, "", "=q2=Ethereum Prisoner I.D. Tag", "=ds=#m3#", "", "100%"};
				{ 18, 31928, "", "=q3=Dark Band", "=ds=#s13#", "", "0.7%"};
				{ 19, 31929, "", "=q3=Enigmatic Band", "=ds=#s13#", "", "0.7%"};
				{ 20, 31925, "", "=q3=Fiery Band", "=ds=#s13#", "", "1.2%"};
				{ 21, 31926, "", "=q3=Frigid Band", "=ds=#s13#", "", "1.1%"};
				{ 22, 31927, "", "=q3=Living Band", "=ds=#s13#", "", "1.1%"};
			};
		};
		info = {
			name = AL["Wrathbringer Laz-tarash"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

	AtlasLoot_Data["BashirStasisChambers"] = {
		["Normal"] = {
			{
				{ 1, 0, "INV_Box_01", "=q6="..AL["Trelopades"], ""};
				{ 2, 32522, "", "=q3=Demonic Bulwark", "=ds=#w8#", "", ""};
				{ 3, 31941, "", "=q2=Mark of the Nexus-King", "=ds=#m3#", "", ""};
				{ 5, 0, "INV_Box_01", "=q6="..AL["King Dorfbruiser"], ""};
				{ 6, 31577, "", "=q3=Slatesteel Shoulders", "=ds=#s3#, #a4#", "", ""};
				{ 7, 31941, "", "=q2=Mark of the Nexus-King", "=ds=#m3#", "", ""};
				{ 9, 0, "INV_Box_01", "=q6="..AL["Gorgolon the All-seeing"], ""};
				{ 10, 31569, "", "=q3=Mistshroud Shoulders", "=ds=#s3#, #a3#", "", ""};
				{ 11, 31941, "", "=q2=Mark of the Nexus-King", "=ds=#m3#", "", ""};
				{ 16, 0, "INV_Box_01", "=q6="..AL["Matron Li-sahar"], ""};
				{ 17, 31553, "", "=q3=Windchanneller's Mantle", "=ds=#s3#, #a1#", "", ""};
				{ 18, 31941, "", "=q2=Mark of the Nexus-King", "=ds=#m3#", "", ""};
				{ 20, 0, "INV_Box_01", "=q6="..AL["Solus the Eternal"], ""};
				{ 21, 31561, "", "=q3=Skystalker's Shoulders", "=ds=#s3#, #a2#", "", ""};
				{ 22, 31941, "", "=q2=Mark of the Nexus-King", "=ds=#m3#", "", ""};
			};
		};
		info = {
			name = AL["Bash'ir Landing Stasis Chambers"],
			module = moduleName, menu = "ETHEREUMMENU"
		};
	};

		---------------
		--- Skettis ---
		---------------

	AtlasLoot_Data["DarkscreecherAkkarai"] = {
		["Normal"] = {
			{
				{ 1, 32529, "", "=q3=Heretic's Gauntlets", "=ds=#s9#, #a4#", "", "17.3%"};
				{ 2, 32715, "", "=q2=Akkarai's Talons", "=ds=#m3#", "", "100%"};
				{ 4, 31558, "", "=q3=Windchanneller's Bindings", "=ds=#s8#, #a1#", "", "5.3%"};
				{ 5, 31555, "", "=q3=Windchanneller's Ceinture", "=ds=#s10#, #a1#", "", "4.3%"};
				{ 6, 31566, "", "=q3=Skystalker's Bracers", "=ds=#s8#, #a2#", "", "6.8%"};
				{ 7, 31563, "", "=q3=Skystalker's Cord", "=ds=#s10#, #a2#", "", "6.2%"};
				{ 8, 31574, "", "=q3=Mistshroud Bracers", "=ds=#s8#, #a3#", "", "4.1%"};
				{ 9, 31571, "", "=q3=Mistshroud Belt", "=ds=#s10#, #a3#", "", "4.5%"};
				{ 10, 31582, "", "=q3=Slatesteel Bracers", "=ds=#s8#, #a4#", "", "6.7%"};
				{ 11, 31579, "", "=q3=Slatesteel Girdle", "=ds=#s10#, #a4#", "", "5.5%"};
				{ 12, 32514, "", "=q3=Skettis Band", "=ds=#s13#", "", "31.5%"};
			};
		};
		info = {
			name = AL["Darkscreecher Akkarai"],
			module = moduleName, menu = "SKETTISMENU"
		};
	};

	AtlasLoot_Data["Karrog"] = {
		["Normal"] = {
			{
				{ 1, 32533, "", "=q3=Karrog's Shard", "=ds=#s15#", "", "15.0%"};
				{ 2, 32717, "", "=q2=Karrog's Spine", "=ds=#m3#", "", "100%"};
				{ 4, 31558, "", "=q3=Windchanneller's Bindings", "=ds=#s8#, #a1#", "", "5.6%"};
				{ 5, 31555, "", "=q3=Windchanneller's Ceinture", "=ds=#s10#, #a1#", "", "6.8%"};
				{ 6, 31566, "", "=q3=Skystalker's Bracers", "=ds=#s8#, #a2#", "", "6.0%"};
				{ 7, 31563, "", "=q3=Skystalker's Cord", "=ds=#s10#, #a2#", "", "8.0%"};
				{ 8, 31574, "", "=q3=Mistshroud Bracers", "=ds=#s8#, #a3#", "", "5.6%"};
				{ 9, 31571, "", "=q3=Mistshroud Belt", "=ds=#s10#, #a3#", "", "3.6%"};
				{ 10, 31582, "", "=q3=Slatesteel Bracers", "=ds=#s8#, #a4#", "", "4.3%"};
				{ 11, 31579, "", "=q3=Slatesteel Girdle", "=ds=#s10#, #a4#", "", "5.3%"};
				{ 12, 32514, "", "=q3=Skettis Band", "=ds=#s13#", "", "24.9%"};
			};
		};
		info = {
			name = AL["Karrog"],
			module = moduleName, menu = "SKETTISMENU"
		};
	};

	AtlasLoot_Data["GezzaraktheHuntress"] = {
		["Normal"] = {
			{
				{ 1, 32531, "", "=q3=Gezzarak's Fang", "=ds=#s2#", "", "16.9%"};
				{ 2, 32716, "", "=q2=Gezzarak's Claws", "=ds=#m3#", "", "100%"};
				{ 4, 31558, "", "=q3=Windchanneller's Bindings", "=ds=#s8#, #a1#", "", "5.2%"};
				{ 5, 31555, "", "=q3=Windchanneller's Ceinture", "=ds=#s10#, #a1#", "", "6.9%"};
				{ 6, 31566, "", "=q3=Skystalker's Bracers", "=ds=#s8#, #a2#", "", "5.2%"};
				{ 7, 31563, "", "=q3=Skystalker's Cord", "=ds=#s10#, #a2#", "", "4.9%"};
				{ 8, 31574, "", "=q3=Mistshroud Bracers", "=ds=#s8#, #a3#", "", "5.8%"};
				{ 9, 31571, "", "=q3=Mistshroud Belt", "=ds=#s10#, #a3#", "", "5.4%"};
				{ 10, 31582, "", "=q3=Slatesteel Bracers", "=ds=#s8#, #a4#", "", "6.2%"};
				{ 11, 31579, "", "=q3=Slatesteel Girdle", "=ds=#s10#, #a4#", "", "4.6%"};
				{ 12, 32514, "", "=q3=Skettis Band", "=ds=#s13#", "", "25.7%"};
			};
		};
		info = {
			name = AL["Gezzarak the Huntress"],
			module = moduleName, menu = "SKETTISMENU"
		};
	};

	AtlasLoot_Data["VakkiztheWindrager"] = {
		["Normal"] = {
			{
				{ 1, 32532, "", "=q3=Windrager's Coils", "=ds=#s8#, #a3#", "", "18.1%"};
				{ 2, 32718, "", "=q2=Vakkiz's Scale", "=ds=#m3#", "", "100%"};
				{ 4, 31558, "", "=q3=Windchanneller's Bindings", "=ds=#s8#, #a1#", "", "5.0%"};
				{ 5, 31555, "", "=q3=Windchanneller's Ceinture", "=ds=#s10#, #a1#", "", "4.4%"};
				{ 6, 31566, "", "=q3=Skystalker's Bracers", "=ds=#s8#, #a2#", "", "4.1%"};
				{ 7, 31563, "", "=q3=Skystalker's Cord", "=ds=#s10#, #a2#", "", "3.9%"};
				{ 8, 31574, "", "=q3=Mistshroud Bracers", "=ds=#s8#, #a3#", "", "5.7%"};
				{ 9, 31571, "", "=q3=Mistshroud Belt", "=ds=#s10#, #a3#", "", "6.3%"};
				{ 10, 31582, "", "=q3=Slatesteel Bracers", "=ds=#s8#, #a4#", "", "5.8%"};
				{ 11, 31579, "", "=q3=Slatesteel Girdle", "=ds=#s10#, #a4#", "", "2.7%"};
				{ 12, 32514, "", "=q3=Skettis Band", "=ds=#s13#", "", "28.7%"};
			};
		};
		info = {
			name = AL["Vakkiz the Windrager"],
			module = moduleName, menu = "SKETTISMENU"
		};
	};

	AtlasLoot_Data["Terokk"] = {
		["Normal"] = {
			{
				{ 1, 32540, "", "=q4=Terokk's Might", "=ds=#s4#", "", "4.6%"};
				{ 2, 32541, "", "=q4=Terokk's Wisdom", "=ds=#s4#", "", "4.6%"};
				{ 3, 31556, "", "=q3=Windchanneller's Leggings", "=ds=#s11#, #a1#", "", "14.3%"};
				{ 4, 31564, "", "=q3=Skystalker's Leggings", "=ds=#s11#, #a2#", "", "13.9%"};
				{ 5, 31572, "", "=q3=Mistshroud Pants", "=ds=#s11#, #a3#", "", "10.7%"};
				{ 6, 31580, "", "=q3=Slatesteel Leggings", "=ds=#s11#, #a4#", "", "11.6%"};
				{ 7, 32535, "", "=q3=Gift of the Talonpriests", "=ds=#s13#", "", "7.9%"};
				{ 8, 32534, "", "=q3=Brooch of the Immortal King", "=ds=#s14#", "", "11.2%"};
				{ 9, 32782, "", "=q3=Time-Lost Figurine", "=ds=#s14#", "", ""};
				{ 10, 32536, "", "=q3=Terokk's Gavel", "=ds=#h1#, #w6#", "", "6.7%"};
				{ 11, 32537, "", "=q3=Terokk's Gavel", "=ds=#h1#, #w6#", "", "7.9%"};
			};
		};
		info = {
			name = AL["Terokk"],
			module = moduleName, menu = "SKETTISMENU"
		};
	};

	AtlasLoot_Data["SkettisTalonpriestIshaal"] = {
		["Normal"] = {
			{
				{ 1, 32523, "", "=q1=Ishaal's Almanac", "=ds=#m2#"};
			};
		};
		info = {
			name = "Talonpriest Ishaal",
			module = moduleName, menu = "SKETTISMENU"
		};
	};

	AtlasLoot_Data["SkettisHazziksPackage"] = {
		["Normal"] = {
			{
				{ 1, 32687, "", "=q1=Hazzik's Package", "=ds=#m3#"};
			};
		};
		info = {
			name = "Hazzik's Package",
			module = moduleName, menu = "SKETTISMENU"
		};
	};