-- $Id: BossTooltipMatch.lua 3697 2012-01-31 15:17:37Z lag123 $
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")

AtlasLoot_BossTooltipMatch = {}

-------------------------------------------------------------------
-- These matches uses unit IDs and need no further localizations
-------------------------------------------------------------------

-----------------------
-- Wrath Raids
-----------------------
AtlasLoot_BossTooltipMatch[37970]					= BabbleBoss["Blood Prince Council"]
AtlasLoot_BossTooltipMatch[37972]					= BabbleBoss["Blood Prince Council"]
AtlasLoot_BossTooltipMatch[37973]					= BabbleBoss["Blood Prince Council"]
AtlasLoot_BossTooltipMatch[34496]					= BabbleBoss["The Twin Val'kyr"]
AtlasLoot_BossTooltipMatch[34497]					= BabbleBoss["The Twin Val'kyr"]
AtlasLoot_BossTooltipMatch[34796]					= BabbleBoss["The Beasts of Northrend"]
AtlasLoot_BossTooltipMatch[34797]					= BabbleBoss["The Beasts of Northrend"]
AtlasLoot_BossTooltipMatch[32857]					= BabbleBoss["The Iron Council"]
AtlasLoot_BossTooltipMatch[32927]					= BabbleBoss["The Iron Council"]
AtlasLoot_BossTooltipMatch[32867]					= BabbleBoss["The Iron Council"]
AtlasLoot_BossTooltipMatch[16063]					= BabbleBoss["The Four Horsemen"]
AtlasLoot_BossTooltipMatch[16064]					= BabbleBoss["The Four Horsemen"]
AtlasLoot_BossTooltipMatch[16065]					= BabbleBoss["The Four Horsemen"]
AtlasLoot_BossTooltipMatch[30549]					= BabbleBoss["The Four Horsemen"]

-----------------------
-- Wrath Dungeons
-----------------------
AtlasLoot_BossTooltipMatch[36477]					= BabbleBoss["Krick and Ick"]
AtlasLoot_BossTooltipMatch[36476]					= BabbleBoss["Krick and Ick"]
AtlasLoot_BossTooltipMatch[29573]					= BabbleBoss["Drakkari Colossus"]
AtlasLoot_BossTooltipMatch[26798]					= BabbleBoss["Commander Kolurg"].." / "..BabbleBoss["Commander Stoutbeard"]
AtlasLoot_BossTooltipMatch[26796]					= BabbleBoss["Commander Kolurg"].." / "..BabbleBoss["Commander Stoutbeard"]
AtlasLoot_BossTooltipMatch[24200]					= BabbleBoss["Skarvald the Constructor"].." / "..BabbleBoss["Dalronn the Controller"]
AtlasLoot_BossTooltipMatch[24201]					= BabbleBoss["Skarvald the Constructor"].." / "..BabbleBoss["Dalronn the Controller"]

-----------------------
-- BC Raids
-----------------------
AtlasLoot_BossTooltipMatch[25166]					= BabbleBoss["The Eredar Twins"]
AtlasLoot_BossTooltipMatch[25165]					= BabbleBoss["The Eredar Twins"]
AtlasLoot_BossTooltipMatch[22952]					= BabbleBoss["The Illidari Council"]
AtlasLoot_BossTooltipMatch[22951]					= BabbleBoss["The Illidari Council"]
AtlasLoot_BossTooltipMatch[22950]					= BabbleBoss["The Illidari Council"]
AtlasLoot_BossTooltipMatch[22949]					= BabbleBoss["The Illidari Council"]
AtlasLoot_BossTooltipMatch[23420]					= BabbleBoss["Reliquary of Souls"]
AtlasLoot_BossTooltipMatch[16151]					= BabbleBoss["Attumen the Huntsman"]

-----------------------
-- BC Dungeons
-----------------------

-----------------------
-- Classic Raids
-----------------------
AtlasLoot_BossTooltipMatch[15276]					= BabbleBoss["The Twin Emperors"]
AtlasLoot_BossTooltipMatch[15275]					= BabbleBoss["The Twin Emperors"]
AtlasLoot_BossTooltipMatch[15544]					= BabbleBoss["The Bug Family"]
AtlasLoot_BossTooltipMatch[15543]					= BabbleBoss["The Bug Family"]
AtlasLoot_BossTooltipMatch[15511]					= BabbleBoss["The Bug Family"]

-----------------------
-- Classic Dungeons
-----------------------



---------------------------------------------------------------
-- These matches uses Object Names and need to be translated
---------------------------------------------------------------

-----------------------
-- Wrath Raids
-----------------------
AtlasLoot_BossTooltipMatch["Cache of the Dreamwalker"]	= BabbleBoss["Valithria Dreamwalker"]
AtlasLoot_BossTooltipMatch["Deathbringer's Cache"]		= BabbleBoss["Deathbringer Saurfang"]
AtlasLoot_BossTooltipMatch["Gunship Armory"]			= BabbleBoss["Icecrown Gunship Battle"]
AtlasLoot_BossTooltipMatch["Champions' Cache"]			= BabbleBoss["Faction Champions"]
AtlasLoot_BossTooltipMatch["Gift of the Observer"]		= BabbleBoss["Algalon the Observer"]
AtlasLoot_BossTooltipMatch["Cache of Innovation"]		= BabbleBoss["Mimiron"]
AtlasLoot_BossTooltipMatch["Freya's Gift"]			= BabbleBoss["Freya"]
AtlasLoot_BossTooltipMatch["Cache of Storms"]			= BabbleBoss["Thorim"]
AtlasLoot_BossTooltipMatch["Cache of Winter"]			= BabbleBoss["Hodir"]
AtlasLoot_BossTooltipMatch["Cache of Living Stone"]		= BabbleBoss["Kologarn"]
AtlasLoot_BossTooltipMatch["Alexstrasza's Gift"]		= BabbleBoss["Malygos"]
AtlasLoot_BossTooltipMatch["Four Horsemen Chest"]		= BabbleBoss["The Four Horsemen"]

-----------------------
-- Wrath Dungeons
-----------------------
AtlasLoot_BossTooltipMatch["The Captain's Chest"]		= BabbleBoss["The Lich King"]
AtlasLoot_BossTooltipMatch["Eadric's Cache"]			= BabbleBoss["Eadric the Pure"]
AtlasLoot_BossTooltipMatch["Confessor's Cache"]			= BabbleBoss["Argent Confessor Paletress"]
AtlasLoot_BossTooltipMatch["Champion's Cache"]			= BabbleBoss["Faction Champions"]
AtlasLoot_BossTooltipMatch["Cache of Eregos"]			= BabbleBoss["Ley-Guardian Eregos"]
AtlasLoot_BossTooltipMatch["Tribunal Chest"]			= BabbleBoss["The Tribunal of Ages"]
AtlasLoot_BossTooltipMatch["Dark Runed Chest"]			= BabbleBoss["Mal'Ganis"]

-----------------------
-- BC Raids
-----------------------
AtlasLoot_BossTooltipMatch["Dust Covered Chest"]		= BabbleBoss["Chess Event"]

-----------------------
-- BC Dungeons
-----------------------
AtlasLoot_BossTooltipMatch["Reinforced Fel Iron Chest"]	= BabbleBoss["Vazruden"]
AtlasLoot_BossTooltipMatch["Cache of the Legion"]		= BabbleBoss["Cache of the Legion"]

-----------------------
-- Classic Raids
-----------------------
AtlasLoot_BossTooltipMatch["Cache of the Firelord"]		= BabbleBoss["Majordomo Executus"]

-----------------------
-- Classic Dungeons
-----------------------
AtlasLoot_BossTooltipMatch["Gordok Tribute"]			= AL["DM North Tribute Chest"]
AtlasLoot_BossTooltipMatch["Chest of The Seven"]		= AL["Summoner's Tomb"]
AtlasLoot_BossTooltipMatch["Secret Safe"]				= AL["The Vault"]
