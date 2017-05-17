// ******************************************************************************************

// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost
// empty name = name is extracted from class config

pistolArray = compileFinal str
[
	// Handguns
	["P07 Pistol", "hgun_P07_F", 50],
	["P07 9 mm (Khaki)","hgun_P07_khk_F", 50],
	["Rook-40 Pistol", "hgun_Rook40_F", 50],
	["ACP-C2 Pistol", "hgun_ACPC2_F", 75],
	["Zubr Revolver", "hgun_Pistol_heavy_02_F", 75],
	["4-Five Pistol", "hgun_Pistol_heavy_01_F", 100],
	["Starter Pistol", "hgun_Pistol_Signal_F", 25],
	//CUP
	["Scorpion", "CUP_hgun_SA61", 150],
	["Uzi", "CUP_hgun_MicroUzi", 150]
];

smgArray = compileFinal str
[
	["PDW2000 SMG", "hgun_PDW2000_F", 100],
	["Sting SMG", "SMG_02_F", 125],
	["Vermin SMG", "SMG_01_F", 125],
	["Protector 9 mm","SMG_05_F", 125],
	// CUP
	["MP5A5", "CUP_smg_MP5A5", 150],
	["MP5 SD6", "CUP_smg_MP5SD6", 150],
	["PP-19 Bizon", "CUP_smg_bizon_snds", 150]
];

rifleArray = compileFinal str
[
// Assault Rifles
	["MX Carbine", "arifle_MXC_F", 150],
	["MX Carbine (Black)", "arifle_MXC_Black_F", 175],
	["MX Rifle", "arifle_MX_F", 200],
	["MX Rifle (Black)", "arifle_MX_Black_F", 225],
	["MX 3GL Rifle", "arifle_MX_GL_F", 250],
	["MX 3GL Rifle (Black)", "arifle_MX_GL_Black_F", 275],
	["Katiba Carbine", "arifle_Katiba_C_F", 150],
	["Katiba Rifle", "arifle_Katiba_F", 200],
	["Katiba GL Rifle", "arifle_Katiba_GL_F", 250],
	["Mk20 Carbine", "arifle_Mk20C_plain_F", 150],
	["Mk20 Carbine (Camo)", "arifle_Mk20C_F", 150],
	["Mk20 Rifle", "arifle_Mk20_plain_F", 200],
	["Mk20 Rifle (Camo)", "arifle_Mk20_F", 200],
	["Mk20 EGLM Rifle", "arifle_Mk20_GL_plain_F", 250],
	["Mk20 EGLM Rifle (Camo)", "arifle_Mk20_GL_F", 250],

	["TRG-20 Carbine", "arifle_TRG20_F", 150],
	["TRG-21 Rifle ", "arifle_TRG21_F", 200],
	["TRG-21 EGLM Rifle", "arifle_TRG21_GL_F", 250],

	["Katiba Carbine", "arifle_Katiba_C_F", 150],
	["Katiba Rifle", "arifle_Katiba_F", 200],
	["Katiba GL Rifle", "arifle_Katiba_GL_F", 250],

	["MX Carbine", "arifle_MXC_F", 150],
	["MX Carbine (Black)", "arifle_MXC_Black_F", 150],
	["MX Carbine (Khaki)", "arifle_MXC_khk_F", 150, "noDLC"],
	["MX Rifle", "arifle_MX_F", 200],
	["MX Rifle (Black)", "arifle_MX_Black_F", 200],
	["MX Rifle (Khaki)", "arifle_MX_khk_F", 200, "noDLC"],
	["MX 3GL Rifle", "arifle_MX_GL_F", 250],
	["MX 3GL Rifle (Black)", "arifle_MX_GL_Black_F", 250],
	["MX 3GL Rifle (Khaki)", "arifle_MX_GL_khk_F", 250, "noDLC"],

	["SPAR-16 Rifle", "arifle_SPAR_01_blk_F", 200],
	["SPAR-16 Rifle (Khaki)", "arifle_SPAR_01_khk_F", 200],
	["SPAR-16 Rifle (Sand)", "arifle_SPAR_01_snd_F", 200],
	["SPAR-16 GL Rifle", "arifle_SPAR_01_GL_blk_F", 250],
	["SPAR-16 GL Rifle (Khaki)", "arifle_SPAR_01_GL_khk_F", 250],
	["SPAR-16 GL Rifle (Sand)", "arifle_SPAR_01_GL_snd_F", 250],

	["CAR-95 Rifle", "arifle_CTAR_blk_F", 200],
	["CAR-95 GL Rifle", "arifle_CTAR_GL_blk_F", 250],
	["Type 115 Rifle", "arifle_ARX_blk_F", 300],
	["Type 115 Rifle (Hex)", "arifle_ARX_hex_F", 300],
	["Type 115 Rifle (G Hex)", "arifle_ARX_ghex_F", 300],

	["AKS-74U Carbine", "arifle_AKS_F", 150],
	["AKM Rifle", "arifle_AKM_F", 200],
	["AK-12 Rifle", "arifle_AK12_F", 250],
	["AK-12 GL Rifle", "arifle_AK12_GL_F", 300],

	// Marksman Rifles
	["MXM Rifle", "arifle_MXM_F", 300],
	["MXM Rifle (Black)", "arifle_MXM_Black_F", 300],
	["Rahim DMR Rifle", "srifle_DMR_01_F", 375],
	["Mk18 ABR Rifle", "srifle_EBR_F", 450],

	["M320 LRR Sniper", "srifle_LRR_LRPS_F", 1800],
	["M320 LRR Sniper (Camo)", "srifle_LRR_camo_LRPS_F", 1850],
	["GM6 Lynx Sniper", "srifle_GM6_LRPS_F", 1700],
	["GM6 Lynx Sniper (Camo)", "srifle_GM6_camo_LRPS_F", 1750],
	// Underwater Gun
	["SDAR Underwater Rifle", "arifle_SDAR_F", 100],

	//DLC Rifles
	["Mk14 7.62 mm (Camo)", "srifle_DMR_06_camo_F", 450],
	["Mk14 7.62 mm (Olive)", "srifle_DMR_06_olive_F", 450],
	["Mk-1 EMR 7.62 mm (Black)", "srifle_DMR_03_F", 500],
	["Mk-1 EMR 7.62 mm (Camo)", "srifle_DMR_03_multicam_F", 500],
	["Mk-1 EMR 7.62 mm (Khaki)", "srifle_DMR_03_khaki_F", 500],
	["Mk-1 EMR 7.62 mm (Sand)", "srifle_DMR_03_tan_F", 500],
	["Mk-1 EMR 7.62 mm (Woodland)", "srifle_DMR_03_woodland_F", 500],
	["MAR-10 .338 (Black)", "srifle_DMR_02_F", 1400],
	["MAR-10 .338 (Camo)", "srifle_DMR_02_camo_F", 1400],
	["MAR-10 .338 (Sand)", "srifle_DMR_02_sniper_F", 1400],
	["Cyrus 9.3 mm (Black)", "srifle_DMR_05_blk_F", 1400],
	["Cyrus 9.3 mm (Hex)", "srifle_DMR_05_hex_F", 1400],
	["Cyrus 9.3 mm (Tan)", "srifle_DMR_05_tan_f", 1400],
	["ASP-1 Kir 12.7 mm (Black)", "srifle_DMR_04_F", 1850],
	["ASP-1 Kir 12.7 mm (Tan)", "srifle_DMR_04_Tan_F", 1850],

	// APEX
	["MX Carbine (Khaki)", "arifle_MXC_khk_F", 150],
	["MX Rifle (Khaki)", "arifle_MX_khk_F", 200],
	["MX 3GL Rifle (Khaki)", "arifle_MX_GL_khk_F", 250],
	["MXM Rifle (Khaki)", "arifle_MXM_khk_F", 300],
	["M320 LRR Sniper (Tropic)", "srifle_LRR_tna_F", 1800],
	["GM6 Lynx Sniper (Green Hex)", "srifle_GM6_ghex_F", 1900],
	["SPAR-16 5.56 mm (Black)","arifle_SPAR_01_blk_F", 300],
	["SPAR-16 5.56 mm (Khaki)","arifle_SPAR_01_khk_F", 300],
	["SPAR-16 5.56 mm (Sand)","arifle_SPAR_01_snd_F", 300],
	["SPAR-16 GL 5.56 mm (Black)","arifle_SPAR_01_GL_blk_F", 350],
	["SPAR-16 GL 5.56 mm (Khaki)","arifle_SPAR_01_GL_khk_F", 350],
	["SPAR-16 GL 5.56 mm (Sand)","arifle_SPAR_01_GL_snd_F", 350],
	["SPAR-17 7.62 mm (Black)","arifle_SPAR_03_blk_F", 450],
	["SPAR-17 7.62 mm (Khaki)","arifle_SPAR_03_khk_F", 450],
	["SPAR-17 7.62 mm (Sand)","arifle_SPAR_03_snd_F", 450],
	["AK-12 7.62 mm","arifle_AK12_F", 300],
	["AK-12 GL 7.62 mm","arifle_AK12_GL_F", 350],
	["AKM 7.62 mm","arifle_AKM_F", 200],
	["AKS-74U 5.45 mm","arifle_AKS_F", 200],
	["CAR-95 5.8 mm (Black)","arifle_CTAR_blk_F", 300],
	["CAR-95 GL 5.8 mm (Black)","arifle_CTAR_GL_blk_F", 350],
	["CMR-76 6.5 mm (Black)","srifle_DMR_07_blk_F", 450],
	["CMR-76 6.5 mm (Green Hex)","srifle_DMR_07_ghex_F", 450],
	["CMR-76 6.5 mm (Hex)","srifle_DMR_07_hex_F", 450],
	["Type 115 6.5 mm (Black)","arifle_ARX_blk_F", 500],
	["Type 115 6.5 mm (Green Hex)","arifle_ARX_ghex_F", 500],
	["Type 115 6.5 mm (Hex)","arifle_ARX_hex_F", 500],

	// CUP
	["M16A4", "CUP_arifle_M16A4_Base", 300],
	["M16A4 GL", "CUP_arifle_M16A4_GL", 300],
	["M4A1", "CUP_arifle_M4A1_black", 300],
	["M4A1 (Camo)", "CUP_arifle_M4A1_camo", 300],
	["M4A1 (Desert)", "CUP_arifle_M4A1_desert", 300],
	["M4A1 GL", "CUP_arifle_M4A1_BUIS_GL", 300],
	["M4A1 GL (Camo)", "CUP_arifle_M4A1_BUIS_camo_GL", 300],
	["M4A1 GL (Desert)", "CUP_arifle_M4A1_BUIS_desert_GL", 300],
	["Mk12 SPR", "CUP_srifle_Mk12SPR", 300],
	["M14 DMR", "CUP_srifle_DMR", 300],
	["M110", "CUP_srifle_M110", 300],
	["M24 (Desert)", "CUP_srifle_M24_des", 300],
	["M24 (Woodland)", "CUP_srifle_M24_wdl", 300],
	["M40A3	", "CUP_srifle_M40A3", 300],
	["M107", "CUP_srifle_M107_Base", 300],
	["G36A", "CUP_arifle_G36A", 300],
	["G36A (Desert)", "CUP_arifle_G36A_camo", 300],
	["G36K", "CUP_arifle_G36K", 300],
	["G36K (Desert)", "CUP_arifle_G36K_camo", 300],
	["G36C", "CUP_arifle_G36C", 300],
	["G36C (Desert)", "CUP_arifle_G36C_camo", 300],
	["Mk16 Mod 0", "CUP_arifle_Mk16_STD", 300],
	["Mk16 Mod 0 EGLM", "CUP_arifle_Mk16_STD_EGLM", 300],
	["Mk16 Mod 0 Foregrip", "CUP_arifle_Mk16_STD_FG", 300],
	["Mk17 Mod 0", "CUP_arifle_Mk17_STD", 300],
	["Mk17 Mod 0 Foregrip", "CUP_arifle_Mk17_STD_FG", 300],
	["Mk17 Mod 0 EGLM", "CUP_arifle_Mk17_STD_EGLM", 300],
	["Mk20 Mod 0", "CUP_arifle_Mk20", 300],
	["CZ805 A1", "CUP_arifle_CZ805_A1", 300],
	["CZ805 A1 GL", "CUP_arifle_CZ805_GL", 300],
	["CZ805 A2", "CUP_arifle_CZ805_A2", 300],
	["CZ805 B", "CUP_arifle_CZ805_B", 300],
	["CZ805 B GL", "CUP_arifle_CZ805_B_GL", 300],
	["FN FAL", "CUP_arifle_FNFAL_railed", 300],
	["AWM (Desert)", "CUP_srifle_AWM_des", 400],
	["AWM (Woodland)", "CUP_srifle_AWM_wdl", 400],
	["LeeEnfield", "CUP_srifle_LeeEnfield", 300],
	["AK-74", "CUP_arifle_AK74", 150],
	["AK-74 GP-25", "CUP_arifle_AK74_GL", 150],
	["AKS-74","CUP_arifle_AKS74", 150],
	["AKS-74U", "CUP_arifle_AKS74U", 150],
	["AKM", "CUP_arifle_AKM", 150],
	["AK-74M", "CUP_arifle_AK74M", 150],
	["AK-107", "CUP_arifle_AK107", 150],
	["AK-107 GL", "CUP_arifle_AK107_GL", 150],
	["VSS", "CUP_srifle_VSSVintorez", 200],
	["SVD", "CUP_srifle_SVD", 400],
	["SVD (Desert)", "CUP_srifle_SVD_des", 400],
	["KSVK", "CUP_srifle_ksvk", 1000]

];

lmgArray = compileFinal str
[
	["MX SW LMG", "arifle_MX_SW_F", 300],
	["MX SW LMG (Black)", "arifle_MX_SW_Black_F", 325],
	["Mk200 LMG", "LMG_Mk200_F", 375],
	["Zafir LMG", "LMG_Zafir_F", 450],

	["SPAR-16S LMG", "arifle_SPAR_02_blk_F", 300],
	["SPAR-16S LMG (Khaki)", "arifle_SPAR_02_khk_F", 300],
	["SPAR-16S LMG (Sand)", "arifle_SPAR_02_snd_F", 300],
	["CAR-95-1 LMG", "arifle_CTARS_blk_F", 300],
	["LIM-85 LMG", "LMG_03_F", 350],

	// Apex
	["SPAR-16S 5.56 mm (Black)","arifle_SPAR_02_blk_F", 450],
	["SPAR-16S 5.56 mm (Khaki)","arifle_SPAR_02_khk_F", 450],
	["SPAR-16S 5.56 mm (Sand)","arifle_SPAR_02_snd_F", 450],
	["CAR-95-1 5.8mm (Black)","arifle_CTARS_blk_F", 450],
	["LIM-85 5.56 mm","LMG_03_F", 500],

	// CUP
	["M249", "CUP_lmg_M249", 450],
	["M249 Para", "CUP_lmg_M249_para", 450],
	["M240", "CUP_lmg_M240", 450],
	["M60E4", "CUP_lmg_M60E4", 450],
	["Mk48 Mod 0 (Desert)", "CUP_lmg_Mk48_des", 450],
	["Mk48 Mod 0 (Woodland)", "CUP_lmg_Mk48_wdl", 450],
	["RPK-74", "CUP_arifle_RPK74", 450],
	["PKP Pecheneg", "CUP_lmg_Pecheneg", 450]
];

shotgunArray = compileFinal str
[
	// Currently unused
];

launcherArray = compileFinal str
[
	["RPG-42 Alamut", "launch_RPG32_F", 400],
	["RPG-42 Alamut (G Hex)", "launch_RPG32_ghex_F", 400, "noDLC"],
	["PCML", "launch_NLAW_F", 600],
	["Titan MPRL Compact (Tan)", "launch_Titan_short_F", 1000],
	["Titan MPRL Compact (Brown)", "launch_O_Titan_short_F", 1000],
	["Titan MPRL Compact (Olive)", "launch_I_Titan_short_F", 1000],
	["Titan MPRL Compact (Tropic)", "launch_B_Titan_short_tna_F", 1000, "noDLC"],
	["Titan MPRL Compact (G Hex)", "launch_O_Titan_short_ghex_F", 1000, "noDLC"],
	["Titan MPRL AA (Desert)", "launch_Titan_F", 1000],
	["Titan MPRL AA (Hex)", "launch_O_Titan_F", 1000],
	["Titan MPRL AA (Digi)", "launch_I_Titan_F", 1000],
	["Titan MPRL AA (Tropic)", "launch_B_Titan_tna_F", 1000, "noDLC"],
	["Titan MPRL AA (G Hex)", "launch_O_Titan_ghex_F", 1000, "noDLC"]
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call shotgunArray + call launcherArray);

staticGunsArray = compileFinal str
[
	// ["Vehicle Ammo Crate", "Box_NATO_AmmoVeh_F", 2500],
	["Static Titan AT 4Rnd (NATO)", "B_static_AT_F", 2500], // Static launchers only have 4 ammo, hence the low price
	["Static Titan AT 4Rnd (CSAT)", "O_static_AT_F", 2500],
	["Static Titan AT 4Rnd (AAF)", "I_static_AT_F", 2500],
	["Static Titan AA 4Rnd (NATO)", "B_static_AA_F", 3000],
	["Static Titan AA 4Rnd (CSAT)", "O_static_AA_F", 3000],
	["Static Titan AA 4Rnd (AAF)", "I_static_AA_F", 3000],
	["Mk30 HMG .50 Low tripod (NATO)", "B_HMG_01_F", 2000],
	["Mk30 HMG .50 Low tripod (CSAT)", "O_HMG_01_F", 2000],
	["Mk30 HMG .50 Low tripod (AAF)", "I_HMG_01_F", 2000],
	// ["Mk30A HMG .50 Sentry (NATO)", "B_HMG_01_A_F", 5000], // "A" = Autonomous = Overpowered
	// ["Mk30A HMG .50 Sentry (CSAT)", "O_HMG_01_A_F", 5000],
	// ["Mk30A HMG .50 Sentry (AAF)", "I_HMG_01_A_F", 5000],
	["Mk30 HMG .50 High tripod (NATO)", "B_HMG_01_high_F", 3000],
	["Mk30 HMG .50 High tripod (CSAT)", "O_HMG_01_high_F", 3000],
	["Mk30 HMG .50 High tripod (AAF)", "I_HMG_01_high_F", 3000],
	["Mk32 GMG 20mm Low tripod (NATO)", "B_GMG_01_F", 5000],
	["Mk32 GMG 20mm Low tripod (CSAT)", "O_GMG_01_F", 5000],
	["Mk32 GMG 20mm Low tripod (AAF)", "I_GMG_01_F", 5000],
	// ["Mk32A GMG 20mm Sentry (NATO)", "B_GMG_01_A_F", 10000],
	// ["Mk32A GMG 20mm Sentry (CSAT)", "O_GMG_01_A_F", 10000],
	// ["Mk32A GMG 20mm Sentry (AAF)", "I_GMG_01_A_F", 10000],
	["Mk32 GMG 20mm High tripod (NATO)", "B_GMG_01_high_F", 6000],
	["Mk32 GMG 20mm High tripod (CSAT)", "O_GMG_01_high_F", 6000],
	["Mk32 GMG 20mm High tripod (AAF)", "I_GMG_01_high_F", 6000],
	["Mk6 Mortar (NATO)", "B_Mortar_01_F", 12500],
	["Mk6 Mortar (CSAT)", "O_Mortar_01_F", 12500],
	["Mk6 Mortar (AAF)", "I_Mortar_01_F", 12500]
];

throwputArray = compileFinal str
[
	["Mini Grenade", "MiniGrenade", 50],
	["Frag Grenade", "HandGrenade", 100],
	["APERS Tripwire Mine", "APERSTripMine_Wire_Mag", 200],
	["APERS Bounding Mine", "APERSBoundingMine_Range_Mag", 250],
	["APERS Mine", "APERSMine_Range_Mag", 300],
	["Claymore Charge", "ClaymoreDirectionalMine_Remote_Mag", 350],
	["M6 SLAM Mine", "SLAMDirectionalMine_Wire_Mag", 350],
	["AT Mine", "ATMine_Range_Mag", 400],
	["Explosive Charge", "DemoCharge_Remote_Mag", 450],
	["Explosive Satchel", "SatchelCharge_Remote_Mag", 500],
	["Smoke Grenade (White)", "SmokeShell", 50],
	["Smoke Grenade (Purple)", "SmokeShellPurple", 50],
	["Smoke Grenade (Blue)", "SmokeShellBlue", 50],
	["Smoke Grenade (Green)", "SmokeShellGreen", 50],
	["Smoke Grenade (Yellow)", "SmokeShellYellow", 50],
	["Smoke Grenade (Orange)", "SmokeShellOrange", 50],
	["Smoke Grenade (Red)", "SmokeShellRed", 50]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
	["6Rnd Signal Cylinder (Green)", "6Rnd_GreenSignal_F", 10],
	["6Rnd Signal Cylinder (Red)", "6Rnd_RedSignal_F", 10],
	["9mm 16Rnd Mag", "16Rnd_9x21_Mag", 10],
	["9mm 30Rnd Mag", "30Rnd_9x21_Mag", 15],
	[".45 ACP 6Rnd Cylinder", "6Rnd_45ACP_Cylinder", 5],
	[".45 ACP 9Rnd Mag", "9Rnd_45ACP_Mag", 10],
	[".45 ACP 11Rnd Mag", "11Rnd_45ACP_Mag", 15],
	[".45 ACP 30Rnd Vermin Mag", "30Rnd_45ACP_MAG_SMG_01", 20],
	[".45 ACP 30Rnd Tracer (Green) Mag", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 15],
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 10],
	["5.56mm 30Rnd STANAG Mag", "30Rnd_556x45_Stanag", 20],
	["5.56mm 30Rnd Tracer (Green) Mag", "30Rnd_556x45_Stanag_Tracer_Green", 15],
	["5.56mm 30Rnd Tracer (Yellow) Mag", "30Rnd_556x45_Stanag_Tracer_Yellow", 15],
	["5.56mm 30Rnd Tracer (Red) Mag", "30Rnd_556x45_Stanag_Tracer_Red", 15],
	["6.5mm 30Rnd STANAG Mag", "30Rnd_65x39_caseless_mag", 20],
	["6.5mm 30Rnd Tracer (Red) Mag", "30Rnd_65x39_caseless_mag_Tracer", 15],
	["6.5mm 30Rnd Caseless Mag", "30Rnd_65x39_caseless_green", 20],
	["6.5mm 30Rnd Tracer (Green) Mag", "30Rnd_65x39_caseless_green_mag_Tracer", 15],
	["6.5mm 100Rnd Belt Case", "100Rnd_65x39_caseless_mag", 75],
	["6.5mm 100Rnd Tracer (Red) Belt Case", "100Rnd_65x39_caseless_mag_Tracer", 50],
	["6.5mm 200Rnd Belt Case", "200Rnd_65x39_cased_Box", 150],
	["6.5mm 200Rnd Tracer (Yellow) Belt Case", "200Rnd_65x39_cased_Box_Tracer", 125],
	["7.62mm 10Rnd Mag", "10Rnd_762x54_Mag", 15],
	["7.62mm 20Rnd Mag", "20Rnd_762x51_Mag", 25],
	["7.62mm 150Rnd Box", "150Rnd_762x54_Box", 150],
	["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x54_Box_Tracer", 125],
	[".408 7Rnd Cheetah Mag", "7Rnd_408_Mag", 50],
	["12.7mm 5Rnd Mag", "5Rnd_127x108_Mag", 50],
	["12.7mm 5Rnd Armor-Piercing Mag", "5Rnd_127x108_APDS_Mag", 60],
	["RPG-42 Anti-Tank Rocket", "RPG32_F", 250],              // Direct damage: high      | Splash damage: low    | Guidance: none
	["RPG-42 High-Explosive Rocket", "RPG32_HE_F", 250],      // Direct damage: medium    | Splash damage: medium | Guidance: none
	["PCML Anti-Tank Missile", "NLAW_F", 500],                // Direct damage: very high | Splash damage: low    | Guidance: laser, ground vehicles
	["Titan Anti-Tank Missile", "Titan_AT", 1000],             // Direct damage: high      | Splash damage: low    | Guidance: mouse, laser, ground vehicles
	["Titan Anti-Personnel Missile", "Titan_AP", 1000],        // Direct damage: low       | Splash damage: high   | Guidance: mouse, laser
	["Titan Anti-Air Missile", "Titan_AA",1000],              // Direct damage: low       | Splash damage: medium | Guidance: aircraft
	//CUP Ammo
	["5.56mm 30rnd STANAG Mag", "CUP_30Rnd_556x45_Stanag", 20],
	["20 Rnd STANAG 556x45", "CUP_20Rnd_556x45_Stanag", 20],
	["30 Rnd G36", "CUP_30Rnd_556x45_G36", 20],
	["30 Rnd G36 Red Tracer", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36", 20],
	["30 Rnd G36 Green Tracer", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36", 20],
	["30 Rnd G36 Yellow Tracer", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36", 20],
	["100 Rnd Beta-C Magazine", "CUP_100Rnd_556x45_BetaCMag", 50],
	["100 Rnd Beta-C Red Tracer", "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag", 50],
	["100 Rnd Beta-C Green Tracer", "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag", 50],
	["100 Rnd Beta-C Yellow Tracer", "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag", 50],
	["200 Rnd M249 Belt (Tracer)", "CUP_200Rnd_TE1_Red_Tracer_556x45_M249", 150],
	["200 Rnd M249 Belt", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 150],
	["200 Rnd M249 Belt", "CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249", 150],
	["20 Rnd M110", "CUP_20Rnd_762x51_B_M110", 20],
	["20 Rnd M110 Yellow Tracer", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110", 20],
	["20 Rnd M110 Red Tracer", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110", 20],
	["20 Rnd M110 Green Tracer", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110", 20],
	["20 Rnd M110 White Tracer", "CUP_20Rnd_TE1_White_Tracer_762x51_M110", 20],
	["20 Rnd Mk17", "CUP_20Rnd_762x51_B_SCAR", 20],
	["20 Rnd Mk17 Yellow Tracer", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR", 20],
	["20 Rnd Mk17 Red Tracer", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR", 20],
	["20 Rnd Mk17 Green Tracer", "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR", 20],
	["20 Rnd Mk17 White Tracer", "CUP_20Rnd_TE1_White_Tracer_762x51_SCAR", 20],
	["20 Rnd FN FAL Magazine", "CUP_20Rnd_762x51_FNFAL_M", 20],
	["20 Rnd CZ805B", "CUP_20Rnd_762x51_CZ805B", 20],
	["20 Rnd CZ805B Yellow Tracer", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_CZ805B", 20],
	["20 Rnd CZ805B Red Tracer", "CUP_20Rnd_TE1_Red_Tracer_762x51_CZ805B", 20],
	["20 Rnd CZ805B Green Tracer", "CUP_20Rnd_TE1_Green_Tracer_762x51_CZ805B", 20],
	["20 Rnd CZ805B White Tracer", "CUP_20Rnd_TE1_White_Tracer_762x51_CZ805B", 20],
	["5 Rnd M24", "CUP_5Rnd_762x51_M24", 20],
	["7.62x51mm 100 Rnd 240 Belt (white tracers)", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 50],
	["7.62x51mm 100 Rnd 240 Belt (red tracers)", "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 50],
	["5 Rnd .338 Lapua Magnum", "CUP_5Rnd_86x70_L115A1", 20],
	["Lee Enfield 10 Rnd Mag.", "CUP_10x_303_M", 20],
	["10 Rnd M107", "CUP_10Rnd_127x99_M107", 20],
	["30 Rnd MP5", "CUP_30Rnd_9x19_MP5", 20],
	["20 Rnd 765x17 SA-61", "CUP_20Rnd_B_765x17_Ball_M", 20],
	["30 Rnd 9x19 MicroUzi", "CUP_30Rnd_9x19_UZI", 20],
	["30Rnd AK Magazine", "CUP_30Rnd_545x39_AK_M", 20],
	["30Rnd AK Magazine (Green Tracer)", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", 20],
	["30Rnd AK Magazine (Red Tracer)", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", 20],
	["30Rnd AK Magazine (White Tracer)", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", 20],
	["30Rnd AK Magazine (Yellow Tracer)", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M", 20],
	["75 Rnd RPK Magazine", "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 30],
	["10 Rnd VSS SP5", "CUP_10Rnd_9x39_SP5_VSS_M", 20],
	["20 Rnd VSS SP5", "CUP_20Rnd_9x39_SP5_VSS_M", 20],
	["10 Rnd SVD Mag", "CUP_10Rnd_762x54_SVD_M", 20],
	["5 Rnd KSVK 1.27x108", "CUP_5Rnd_127x108_KSVK_M", 20],
	["100 Rnd PK", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", 50],
	["64 Rnd Bizon Magazine", "CUP_64Rnd_9x19_Bizon_M", 20],
	["64 Rnd Bizon Magazine (Green Tracers)", "CUP_64Rnd_Green_Tracer_9x19_Bizon_M", 20],
	["64 Rnd Bizon Magazine (Red Tracers)", "CUP_64Rnd_Red_Tracer_9x19_Bizon_M", 20],
	["64 Rnd Bizon Magazine (White Tracers)", "CUP_64Rnd_White_Tracer_9x19_Bizon_M", 20],
	["64 Rnd Bizon Magazine (Yellow Tracers)", "CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M", 20],
	["VOG-25 (HE)", "CUP_1Rnd_HE_GP25_M", 50],
	["GP-25 Flare (White)", "CUP_FlareWhite_GP25_M", 50],
	["GP-25 Flare (Green)", "CUP_FlareGreen_GP25_M", 50],
	["GP-25 Flare (Red)", "CUP_FlareRed_GP25_M", 50],
	["GP-25 Flare (Yellow)", "CUP_FlareYellow_GP25_M", 50],
	["GP-25 Smoke Shell (White)", "CUP_1Rnd_SMOKE_GP25_M", 50],
	["GP-25 Smoke Shell (Red)", "CUP_1Rnd_SmokeRed_GP25_M", 50],
	["GP-25 Smoke Shell (Green)", "CUP_1Rnd_SmokeGreen_GP25_M", 50],
	["GP-25 Smoke Shell (Yellow)", "CUP_1Rnd_SmokeYellow_GP25_M", 50],


	//DLC Ammo
	["12.7mm 10Rnd Mag", "10Rnd_127x54_Mag", 50],
	["9.3mm 10Rnd Mag", "10Rnd_93x64_DMR_05_Mag", 50],
	[".338 LM 10Rnd Mag", "10Rnd_338_Mag", 50],
	["9.3mm 150Rnd Belt", "150Rnd_93x64_Mag", 150],
	[".338 NM 130Rnd Belt", "130Rnd_338_Mag", 150],

	["40mm HE Grenade Round", "1Rnd_HE_Grenade_shell", 125],
	["40mm 3Rnd HE Grenades", "3Rnd_HE_Grenade_shell", 250],
	["40mm Smoke Round (White)", "1Rnd_Smoke_Grenade_shell", 50],
	["40mm Smoke Round (Purple)", "1Rnd_SmokePurple_Grenade_shell", 50],
	["40mm Smoke Round (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 50],
	["40mm Smoke Round (Green)", "1Rnd_SmokeGreen_Grenade_shell", 50],
	["40mm Smoke Round (Yellow)", "1Rnd_SmokeYellow_Grenade_shell", 50],
	["40mm Smoke Round (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 50],
	["40mm Smoke Round (Red)", "1Rnd_SmokeRed_Grenade_shell", 50],
	["40mm 3Rnd Smokes (White)", "3Rnd_Smoke_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Purple)", "3Rnd_SmokePurple_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Blue)", "3Rnd_SmokeBlue_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Green)", "3Rnd_SmokeGreen_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Yellow)", "3Rnd_SmokeYellow_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Orange)", "3Rnd_SmokeOrange_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Red)", "3Rnd_SmokeRed_Grenade_shell", 100],
	["40mm Flare Round (White)", "UGL_FlareWhite_F", 25],
	["40mm Flare Round (Green)", "UGL_FlareGreen_F", 25],
	["40mm Flare Round (Yellow)", "UGL_FlareYellow_F", 25],
	["40mm Flare Round (Red)", "UGL_FlareRed_F", 25],
	["40mm Flare Round (IR)", "UGL_FlareCIR_F", 25],
	["40mm 3Rnd Flares (White)", "3Rnd_UGL_FlareWhite_F", 50],
	["40mm 3Rnd Flares (Green)", "3Rnd_UGL_FlareGreen_F", 50],
	["40mm 3Rnd Flares (Yellow)", "3Rnd_UGL_FlareYellow_F", 50],
	["40mm 3Rnd Flares (Red)", "3Rnd_UGL_FlareRed_F", 50],
	["40mm 3Rnd Flares (IR)", "3Rnd_UGL_FlareCIR_F", 50]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	["Suppressor 9mm", "muzzle_snds_L", 50, "item"],
	["Suppressor .45 ACP", "muzzle_snds_acp", 75, "item"],
	["Suppressor 5.56mm", "muzzle_snds_M", 100, "item"],
	["Suppressor 6.5mm", "muzzle_snds_H", 100, "item"],
	["Suppressor 6.5mm LMG", "muzzle_snds_H_MG", 125, "item"],
	["Suppressor 7.62mm", "muzzle_snds_B", 125, "item"],
	["Flashlight", "acc_flashlight", 25, "item"],
	["Pistol Flashlight" ,"acc_flashlight_pistol", 25, "item"],
	["IR Laser Pointer", "acc_pointer_IR", 25, "item"],
	["Yorris Sight (Zubr Revolver)", "optic_Yorris", 50, "item"],
	["MRD Sight (4-Five Pistol)", "optic_MRD", 50, "item"],
	["ACO SMG (Red)", "optic_aco_smg", 50, "item"],
	["ACO SMG (Green)", "optic_ACO_grn_smg", 50, "item"],
	["ACO (Red)", "optic_Aco", 75, "item"],
	["ACO (Green)", "optic_Aco_grn", 75, "item"],
	["Holosight SMG", "optic_Holosight_smg", 50, "item"],
	["Holosight", "optic_Holosight", 75, "item"],
	["MRCO", "optic_MRCO", 100, "item"],
	["ARCO", "optic_Arco", 125, "item"],
	["RCO", "optic_Hamr", 150, "item"],
	["DMS", "optic_DMS", 175, "item"],
	["LRPS", "optic_LRPS", 175, "item"],
	["MOS", "optic_SOS", 200, "item"],
	["NVS", "optic_NVS", 500, "item"],
	["TWS", "optic_tws", 7000, "item"],
	["TWS MG", "optic_tws_mg", 5000, "item"],
	["Nightstalker", "optic_Nightstalker", 10000, "item"],
	// DLC Items
	["Sound Suppressor (9.3 mm Black)", "muzzle_snds_93mmg", 125, "item"],
	["Sound Suppressor (9.3 mm Tan)", "muzzle_snds_93mmg_tan", 125, "item"],
	["Sound Suppressor (.338 Black)", "muzzle_snds_338_black", 125, "item"],
	["Sound Suppressor (.338 Green)", "muzzle_snds_338_green", 125, "item"],
	["Sound Suppressor (.338 Sand)", "muzzle_snds_338_sand", 125, "item"],
	["AMS (Black)", "optic_AMS", 200, "item"],
	["AMS (Khaki)", "optic_AMS_khk", 200, "item"],
	["AMS (Sand)", "optic_AMS_snd", 200, "item"],
	["Kahlia (Black)", "optic_KHS_blk", 200, "item"],
	["Kahlia (Hex)", "optic_KHS_hex", 200, "item"],
	["Kahlia (Old)", "optic_KHS_old", 200, "item"],
	["Kahlia (Tan)", "optic_KHS_tan", 200, "item"],
	["Bipod (Black) (NATO)", "bipod_01_F_blk", 500, "item"],
	["Bipod (Black) (CSAT)", "bipod_02_F_blk", 500, "item"],
	["Bipod (Black) (AAF)", "bipod_03_F_blk", 500, "item"],
	["Bipod (MTP) (NATO)", "bipod_01_F_mtp", 500, "item"],
	["Bipod (Hex) (CSAT)", "bipod_02_F_hex", 500, "item"],
	["Bipod (Olive) (AAF)", "bipod_03_F_oli", 500, "item"],
	["Bipod (Sand) (NATO)", "bipod_01_F_snd", 500, "item"],
	["Bipod (Tan) (CSAT)", "bipod_02_F_tan", 500, "item"],
	// Apex DLC
	["ARCO (Green Hex)","optic_Arco_ghex_F", 125, "item"],
	["RCO (Khaki)","optic_Hamr_khk_F", 150, "item"],
	["DMS (Green Hex)","optic_DMS_ghex_F", 175, "item"],
	["ERCO (Black)","optic_ERCO_blk_F", 150, "item"],
	["ERCO (Khaki)","optic_ERCO_khk_F", 150, "item"],
	["ERCO (Sand)","optic_ERCO_snd_F", 150, "item"],
	["LRPS (Green Hex)","optic_LRPS_ghex_F", 200, "item"],
	["LRPS (Tropic)","optic_LRPS_tna_F", 200, "item"],
	["MOS (Khaki)","optic_SOS_khk_F", 175, "item"],
	["Bipod (Khaki) [NATO]","bipod_01_F_khk", 500, "item"],
	["Sound Suppressor (7.62 mm, Khaki)","muzzle_snds_B_khk_F", 125, "item"],
	["Sound Suppressor (7.62 mm, Sand)","muzzle_snds_B_snd_F", 125, "item"],
	["Sound Suppressor (6.5 mm, Khaki)","muzzle_snds_H_khk_F", 125, "item"],
	["Sound Suppressor (5.8 mm, Black)","muzzle_snds_58_blk_F", 125, "item"],
	["Sound Suppressor (5.8 mm, Green Hex)","muzzle_snds_58_wdm_F", 125, "item"],
	["Stealth Sound Suppressor (6.5 mm, Black)","muzzle_snds_65_TI_blk_F", 150, "item"],
	["Stealth Sound Suppressor (6.5 mm, Green Hex)","muzzle_snds_65_TI_ghex_F", 150, "item"],
	["Stealth Sound Suppressor (6.5 mm, Hex)","muzzle_snds_65_TI_hex_F", 150, "item"],
	// CUP
	["M16 / M4 Silencer (black)", "CUP_muzzle_snds_M16", 150, "item"],
	["M16 / M4 Silencer (camo)", "CUP_muzzle_snds_M16_camo", 150, "item"],
	["G36 Silencer (black)", "CUP_muzzle_snds_G36_black", 150, "item"],
	["G36 Silencer (desert)", "CUP_muzzle_snds_G36_desert", 150, "item"],
	["Mk16 Flash Hider", "CUP_muzzle_mfsup_SCAR_L", 150, "item"],
	["Mk16 Silencer", "CUP_muzzle_snds_SCAR_L", 150, "item"],
	["Mk17 Flash Hider", "CUP_muzzle_mfsup_SCAR_H", 150, "item"],
	["Mk17 Silencer", "CUP_muzzle_snds_SCAR_H", 150, "item"],
	["Silencer M110", "CUP_muzzle_snds_M110", 150, "item"],
	["Silencer M14", "CUP_muzzle_snds_M14", 150, "item"],
	["Silencer L115A1/AWM", "CUP_muzzle_snds_AWM", 150, "item"],
	["PB 6P9 silencer", "CUP_muzzle_PB6P9", 150, "item"],
	["PBS4 silencer", "CUP_muzzle_PBS4", 150, "item"],
	["Aimpoint CompM4 (black)", "CUP_optic_CompM4", 150, "item"],
	["Kobra Reflex Sight", "CUP_optic_Kobra", 150, "item"],
	["Elcan M145", "CUP_optic_ElcanM145", 150, "item"],
	["Elcan SpecterDR", "CUP_optic_ELCAN_SpecterDR", 150, "item"],
	["SUSAT L9A1", "CUP_optic_SUSAT", 150, "item"],
	["Trijicon ACOG", "CUP_optic_RCO", 150, "item"],
	["Trijicon ACOG (desert)", "CUP_optic_RCO_desert", 150, "item"],
	["Trijicon ACOG TA31F", "CUP_optic_ACOG", 150, "item"],
	["Trijicon Rx01 Red Dot sight (black)", "CUP_optic_TrijiconRx01_black", 150, "item"],
	["Trijicon Rx01 Red Dot sight (desert)", "CUP_optic_TrijiconRx01_desert", 150, "item"],
	["M68 CCO (Black)", "CUP_optic_CompM2_Black", 150, "item"],
	["M68 CCO (Desert)", "CUP_optic_CompM2_Desert", 150, "item"],
	["M68 CCO (Woodland 2)", "CUP_optic_CompM2_Woodland2", 150, "item"],
	["M68 CCO (Woodland)", "CUP_optic_CompM2_Woodland", 150, "item"],
	["Meopta Rapid Acquisition Dot", "CUP_optic_MRad", 150, "item"],
	["Leupold Mark 4 10x40mm LR/T (Desert)", "CUP_optic_LeupoldMk4_10x40_LRT_Desert", 150, "item"],
	["Leupold Mark 4 10x40mm LR/T (Woodland)", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", 150, "item"],
	["Leupold Mark 4 3-9x36mm MR/T", "CUP_optic_LeupoldM3LR", 150, "item"],
	["Leupold Mk4", "CUP_optic_LeupoldMk4", 150, "item"],
	["Leupold Mk4 CQ/T 1-3x14mm", "CUP_optic_LeupoldMk4_CQ_T", 150, "item"],
	["Leupold Mk4 MR/T (tan)", "CUP_optic_LeupoldMk4_MRT_tan", 150, "item"],
	["Leupold VX-3 4.5-14x50mm", "CUP_optic_Leupold_VX3", 150, "item"],
	["Pecheneg Scope", "CUP_optic_PechenegScope", 150, "item"],
	["PSO-1 Scope", "CUP_optic_PSO_1", 150, "item"],
	["PSO-3 Scope", "CUP_optic_PSO_3", 150, "item"],
	["Schmidt & Bender 1.1-4x20 PM ShortDot", "CUP_optic_SB_11_4x20_PM", 150, "item"],
	["Schmidt & Bender 3-12x60 PM II", "CUP_optic_SB_3_12x50_PMII", 150, "item"]
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	["Combat Helmet", "H_HelmetB", 50, "hat"],
	["Combat Helmet (Black)", "H_HelmetB_black", 50, "hat"],
	["Combat Helmet (Camonet)", "H_HelmetB_camo", 50, "hat"],
	["Enhanced Combat Helmet", "H_HelmetSpecB", 75, "hat"],
	["Enhanced Combat Helmet (Black)", "H_HelmetSpecB_blk", 75, "hat"],
	["Enhanced Combat Helmet (Snakeskin)", "H_HelmetSpecB_snakeskin", 75, "hat"],
	["Enhanced Combat Helmet (Tropic)", "H_HelmetB_Enh_tna_F", 75, "hat", "noDLC"],
	["Combat Helmet (Black)", "H_HelmetB_plain_blk", 50, "hat"],
	["Protector Helmet (Hex)", "H_HelmetO_ocamo", 50, "hat"],
	["Protector Helmet (Urban)", "H_HelmetO_oucamo", 50, "hat"],
	["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 75, "hat"],
	["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 75, "hat"],
	["Defender Helmet (Hex)", "H_HelmetLeaderO_ocamo", 50, "hat"],
	["Defender Helmet (Urban)", "H_HelmetLeaderO_oucamo", 50, "hat"],
	["Defender Helmet (G Hex)", "H_HelmetLeaderO_ghex_F", 100, "hat", "noDLC"],
	// ["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 50, "hat"],
	["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 50, "hat"],
	["MICH", "H_HelmetIA", 50, "hat"],
	// ["MICH (Camo)", "H_HelmetIA_net", 50, "hat"],
	// ["MICH 2 (Camo)", "H_HelmetIA_camo", 50, "hat"],
	["Heli Crew Helmet (NATO)", "H_CrewHelmetHeli_B", 50, "hat"],
	["Heli Crew Helmet (CSAT)", "H_CrewHelmetHeli_O", 50, "hat"],
	["Heli Crew Helmet (AAF)", "H_CrewHelmetHeli_I", 50, "hat"],
	["Heli Pilot Helmet (NATO)", "H_PilotHelmetHeli_B", 50, "hat"],
	["Heli Pilot Helmet (CSAT)", "H_PilotHelmetHeli_O", 50, "hat"],
	["Heli Pilot Helmet (AAF)", "H_PilotHelmetHeli_I", 50, "hat"],
	["Crew Helmet (NATO)", "H_HelmetCrew_B", 50, "hat"],
	["Crew Helmet (CSAT)", "H_HelmetCrew_O", 50, "hat"],
	["Crew Helmet (AAF)", "H_HelmetCrew_I", 50, "hat"],
	["Pilot Helmet (NATO)", "H_PilotHelmetFighter_B", 50, "hat"],
	["Pilot Helmet (CSAT)", "H_PilotHelmetFighter_O", 50, "hat"],
	["Pilot Helmet (AAF)", "H_PilotHelmetFighter_I", 50, "hat"],
	["Military Cap (Blue)", "H_MilCap_blue", 25, "hat"],
	["Military Cap (Gray)", "H_MilCap_gry", 25, "hat"],
	["Military Cap (Urban)", "H_MilCap_oucamo", 25, "hat"],
	["Military Cap (Russia)", "H_MilCap_rucamo", 25, "hat"],
	["Military Cap (MTP)", "H_MilCap_mcamo", 25, "hat"],
	["Military Cap (Hex)", "H_MilCap_ocamo", 25, "hat"],
	["Military Cap (AAF)", "H_MilCap_dgtl", 25, "hat"],
	["Rangemaster Cap", "H_Cap_headphones", 25, "hat"],
	["Bandanna (Coyote)", "H_Bandanna_cbr", 10, "hat"],
	["Bandanna (Camo)", "H_Bandanna_camo", 10, "hat"],
	["Bandanna (Gray)", "H_Bandanna_gry", 10, "hat"],
	["Bandanna (Khaki)", "H_Bandanna_khk", 10, "hat"],
	["Bandanna (MTP)", "H_Bandanna_mcamo", 10, "hat"],
	["Bandanna (Sage)", "H_Bandanna_sgg", 10, "hat"],
	["Bandanna (Surfer)", "H_Bandanna_surfer", 10, "hat"],
	// ["Bandanna Mask (Black)", "H_BandMask_blk", 10, "hat"],
	// ["Bandanna Mask (Demon)", "H_BandMask_demon", 10, "hat"],
	// ["Bandanna Mask (Khaki)", "H_BandMask_khk", 10, "hat"],
	// ["Bandanna Mask (Reaper)", "H_BandMask_reaper", 10, "hat"],
	["Beanie (Black)", "H_Watchcap_blk", 10, "hat"],
	["Beanie (Dark blue)", "H_Watchcap_sgg", 10, "hat"],
	["Beanie (Dark brown)", "H_Watchcap_cbr", 10, "hat"],
	["Beanie (Dark khaki)", "H_Watchcap_khk", 10, "hat"],
	["Beanie (Dark green)", "H_Watchcap_camo", 10, "hat"],
	["Beret (Black)", "H_Beret_blk", 10, "hat"],
	["Beret (Colonel)", "H_Beret_Colonel", 10, "hat"],
	["Beret (NATO)", "H_Beret_02", 10, "hat"],
	// ["Beret (Green)", "H_Beret_grn", 10, "hat"],
	// ["Beret (Police)", "H_Beret_blk_POLICE", 10, "hat"],
	// ["Beret (Red)", "H_Beret_red", 10, "hat"],
	// ["Beret (SAS)", "H_Beret_brn_SF", 10, "hat"],
	// ["Beret (SF)", "H_Beret_grn_SF", 10, "hat"],
	// ["Beret (RED)", "H_Beret_ocamo", 10, "hat"],
	// ["Black Turban", "H_TurbanO_blk", 50, "hat"],
	// ["Booniehat (Dirty)", "H_Booniehat_dirty", 10, "hat"],
	// ["Booniehat (Green)", "H_Booniehat_grn", 10, "hat"],
	// ["Booniehat (Khaki)", "H_Booniehat_indp", 10, "hat"],
	["Booniehat (Khaki)", "H_Booniehat_khk", 10, "hat"],
	["Booniehat (Tan)", "H_Booniehat_tan", 10, "hat"],
	["Booniehat (MTP)", "H_Booniehat_mcamo", 10, "hat"],
	["Booniehat (Digi)", "H_Booniehat_dgtl", 10, "hat"],
	["Fedora (Blue)", "H_Hat_blue", 10, "hat"],
	["Fedora (Brown)", "H_Hat_brown", 10, "hat"],
	["Fedora (Camo)", "H_Hat_camo", 10, "hat"],
	["Fedora (Checker)", "H_Hat_checker", 10, "hat"],
	["Fedora (Gray)", "H_Hat_grey", 10, "hat"],
	["Fedora (Tan)", "H_Hat_tan", 10, "hat"],
	["Cap (Black)", "H_Cap_blk", 10, "hat"],
	["Cap (Blue)", "H_Cap_blu", 10, "hat"],
	["Cap (Green)", "H_Cap_grn", 10, "hat"],
	["Cap (Olive)", "H_Cap_oli", 10, "hat"],
	["Cap (Red)", "H_Cap_red", 10, "hat"],
	["Cap (Tan)", "H_Cap_tan", 10, "hat"],
	["Cap (BI)", "H_Cap_grn_BI", 10, "hat"],
	["Cap (CMMG)", "H_Cap_blk_CMMG", 10, "hat"],
	["Cap (ION)", "H_Cap_blk_ION", 10, "hat"],
	["Cap (Raven Security)", "H_Cap_blk_Raven", 10, "hat"],
	["Cap (SAS)", "H_Cap_khaki_specops_UK", 10, "hat"],
	["Cap (SF)", "H_Cap_tan_specops_US", 10, "hat"],
	["Cap (SPECOPS)", "H_Cap_brn_SPECOPS", 10, "hat"],
	["Shemag (White)", "H_ShemagOpen_khk", 25, "hat"],
	["Shemag (Brown)", "H_ShemagOpen_tan", 25, "hat"],
	["Shemag mask (Khaki)", "H_Shemag_khk", 25, "hat"],
	["Shemag mask (Olive)", "H_Shemag_olive", 25, "hat"],
	// ["Shemag mask (Tan)", "H_Shemag_tan", 25, "hat"],
	["Racing Helmet (Black)", "H_RacingHelmet_1_black_F", 25, "hat"],
	["Racing Helmet (Blue)", "H_RacingHelmet_1_blue_F", 25, "hat"],
	["Racing Helmet (Green)", "H_RacingHelmet_1_green_F", 25, "hat"],
	["Racing Helmet (Yellow)", "H_RacingHelmet_1_yellow_F", 25, "hat"],
	["Racing Helmet (Orange)", "H_RacingHelmet_1_orange_F", 25, "hat"],
	["Racing Helmet (Red)", "H_RacingHelmet_1_red_F", 25, "hat"],
	["Racing Helmet (White)", "H_RacingHelmet_1_white_F", 25, "hat"],
	["Racing Helmet (Fuel)", "H_RacingHelmet_1_F", 25, "hat"],
	["Racing Helmet (Bluking)", "H_RacingHelmet_2_F", 25, "hat"],
	["Racing Helmet (Redstone)", "H_RacingHelmet_3_F", 25, "hat"],
	["Racing Helmet (Vrana)", "H_RacingHelmet_4_F", 25, "hat"],
	// Apex DLC
	["Special Purpose Helmet (Green Hex)","H_HelmetO_ViperSP_ghex_F", 5000, "hat"],
	["Special Purpose Helmet (Hex)","H_HelmetO_ViperSP_hex_F", 5000, "hat"],
	["Stealth Combat Helmet","H_HelmetB_TI_tna_F", 50, "hat"]
];

uniformArray = compileFinal str
[
	["Ghillie Suit (NATO)", "U_B_GhillieSuit", 300, "uni"],
	["Ghillie Suit (CSAT)", "U_O_GhillieSuit", 300, "uni"],
	["Ghillie Suit (AAF)", "U_I_GhillieSuit", 300, "uni"],
	//DLC Uniforms
	["Full Ghillie (Arid) (NATO)", "U_B_FullGhillie_ard", 500, "uni"],
	["Full Ghillie (Arid) (CSAT)", "U_O_FullGhillie_ard", 500, "uni"],
	["Full Ghillie (Arid) (AAF)", "U_I_FullGhillie_ard", 500, "uni"],
	["Full Ghillie (Lush) (NATO)", "U_B_FullGhillie_lsh", 500, "uni"],
	["Full Ghillie (Lush) (CSAT)", "U_O_FullGhillie_lsh", 500, "uni"],
	["Full Ghillie (Lush) (AAF)", "U_I_FullGhillie_lsh", 500, "uni"],
	["Full Ghillie (Semi-Arid) (NATO)", "U_B_FullGhillie_sard", 500, "uni"],
	["Full Ghillie (Semi-Arid) (CSAT)", "U_O_FullGhillie_sard", 500, "uni"],
	["Full Ghillie (Semi-Arid) (AAF)", "U_I_FullGhillie_sard", 500, "uni"],

	["Wetsuit (NATO)", "U_B_Wetsuit", 200, "uni"],
	["Wetsuit (CSAT)", "U_O_Wetsuit", 200, "uni"],
	["Wetsuit (AAF)", "U_I_Wetsuit", 200, "uni"],
	["Default Uniform (NATO)", "U_B_CombatUniform_mcam", 50, "uni"],
	["Default Uniform (CSAT)", "U_O_CombatUniform_ocamo", 50, "uni"],
	["Default Uniform (AAF)", "U_I_CombatUniform", 50, "uni"],
	["Combat Fatigues (MTP) (Tee)", "U_B_CombatUniform_mcam_tshirt", 50, "uni"],
	["Recon Fatigues (MTP)", "U_B_CombatUniform_mcam_vest", 50, "uni"],
	["Recon Fatigues (Sage)", "U_B_SpecopsUniform_sgg", 50, "uni"],
	["CTRG Combat Uniform (UBACS)", "U_B_CTRG_1", 50, "uni"],
	["CTRG Combat Uniform (UBACS2)", "U_B_CTRG_2", 50, "uni"],
	["CTRG Combat Uniform (Tee)", "U_B_CTRG_3", 50, "uni"],
	["Recon Fatigues (Hex)", "U_O_SpecopsUniform_ocamo", 50, "uni"],
	["Fatigues (Urban)", "U_O_CombatUniform_oucamo", 50, "uni"],
	["Combat Fatigues Short (Digi)", "U_I_CombatUniform_shortsleeve", 50, "uni"],
	["Combat Fatigues Shirt (Digi)", "U_I_CombatUniform_tshirt", 50, "uni"],
	["Officer Fatigues (Hex)", "U_O_OfficerUniform_ocamo", 50, "uni"],
	["Officer Fatigues (Digi)", "U_I_OfficerUniform", 50, "uni"],
	["Pilot Coveralls (NATO)", "U_B_PilotCoveralls", 50, "uni"],
	["Pilot Coveralls (CSAT)", "U_O_PilotCoveralls", 50, "uni"],
	["Pilot Coveralls (AAF)", "U_I_pilotCoveralls", 50, "uni"],
	["Heli Pilot Coveralls (NATO)", "U_B_HeliPilotCoveralls", 50, "uni"],
	["Heli Pilot Coveralls (AAF)", "U_I_HeliPilotCoveralls", 50, "uni"],
	["Guerilla Smocks 1", "U_BG_Guerilla1_1", 25, "uni"], // BLUFOR
	["Guerilla Smocks 2", "U_BG_Guerilla2_1", 25, "uni"],
	["Guerilla Smocks 3", "U_BG_Guerilla2_2", 25, "uni"],
	["Guerilla Smocks 4", "U_BG_Guerilla2_3", 25, "uni"],
	["Guerilla Smocks 5", "U_BG_Guerilla3_1", 25, "uni"],
	["Guerilla Smocks 6", "U_BG_Guerilla3_2", 25, "uni"],
	["Guerilla Smocks 7", "U_BG_leader", 25, "uni"],
	["Guerilla Smocks 1", "U_OG_Guerilla1_1", 25, "uni"], // OPFOR
	["Guerilla Smocks 2", "U_OG_Guerilla2_1", 25, "uni"],
	["Guerilla Smocks 3", "U_OG_Guerilla2_2", 25, "uni"],
	["Guerilla Smocks 4", "U_OG_Guerilla2_3", 25, "uni"],
	["Guerilla Smocks 5", "U_OG_Guerilla3_1", 25, "uni"],
	["Guerilla Smocks 6", "U_OG_Guerilla3_2", 25, "uni"],
	["Guerilla Smocks 7", "U_OG_leader", 25, "uni"],
	["Guerilla Smocks 1", "U_IG_Guerilla1_1", 25, "uni"], // Independent
	["Guerilla Smocks 2", "U_IG_Guerilla2_1", 25, "uni"],
	["Guerilla Smocks 3", "U_IG_Guerilla2_2", 25, "uni"],
	["Guerilla Smocks 4", "U_IG_Guerilla2_3", 25, "uni"],
	["Guerilla Smocks 5", "U_IG_Guerilla3_1", 25, "uni"],
	["Guerilla Smocks 6", "U_IG_Guerilla3_2", 25, "uni"],
	["Guerilla Smocks 7", "U_IG_leader", 25, "uni"],
	/*["Worker Coveralls", "U_C_WorkerCoveralls", 25, "uni"], // can only be worn by civilian units
	["T-Shirt (Blue)", "U_C_Poor_1", 25, "uni"],
	["Polo (Red/white)", "U_C_Poloshirt_redwhite", 25, "uni"],
	["Polo (Salmon)", "U_C_Poloshirt_salmon", 25, "uni"],
	["Polo (Tri-color)", "U_C_Poloshirt_tricolour", 25, "uni"],
	["Polo (Navy)", "U_C_Poloshirt_blue", 25, "uni"],
	["Polo (Burgundy)", "U_C_Poloshirt_burgundy", 25, "uni"],
	["Polo (Blue/green)", "U_C_Poloshirt_stripped", 25, "uni"],*/
	["Polo (Competitor)", "U_Competitor", 25, "uni"],
	["Polo (Rangemaster)", "U_Rangemaster", 25, "uni"],
	["Marshal Clothes", "U_Marshal", 25, "uni"],
	/*["Racing Suit (Black)", "U_C_Driver_1_black", 25, "uni"], // can only be worn by civilian units
	["Racing Suit (Blue)", "U_C_Driver_1_blue", 25, "uni"],
	["Racing Suit (Green)", "U_C_Driver_1_green", 25, "uni"],
	["Racing Suit (Yellow)", "U_C_Driver_1_yellow", 25, "uni"],
	["Racing Suit (Orange)", "U_C_Driver_1_orange", 25, "uni"],
	["Racing Suit (Red)", "U_C_Driver_1_red", 25, "uni"],
	["Racing Suit (White)", "U_C_Driver_1_white", 25, "uni"],
	["Racing Suit (Fuel)", "U_C_Driver_1", 25, "uni"],
	["Racing Suit (Bluking)", "U_C_Driver_2", 25, "uni"],
	["Racing Suit (Redstone)", "U_C_Driver_3", 25, "uni"],
	["Racing Suit (Vrana)", "U_C_Driver_4", 25, "uni"],*/
	["Tron Light Suit (Blue)", "U_B_Protagonist_VR", 5000, "uni"],
	["Tron Light Suit (Red)", "U_O_Protagonist_VR", 5000, "uni"],
	["Tron Light Suit (Green)", "U_I_Protagonist_VR", 5000, "uni"],
	// Apec DLC
	["Bandit Clothes (Checkered)","U_I_C_Soldier_Bandit_4_F", 25, "uni"],
	["Bandit Clothes (Polo Shirt)","U_I_C_Soldier_Bandit_1_F", 25, "uni"],
	["Bandit Clothes (Skull)","U_I_C_Soldier_Bandit_2_F", 25, "uni"],
	["Bandit Clothes (Tank Top)","U_I_C_Soldier_Bandit_5_F", 25, "uni"],
	["Bandit Clothes (Tee)","U_I_C_Soldier_Bandit_3_F", 25, "uni"],
	["Paramilitary Garb (Jacket)","U_I_C_Soldier_Para_2_F", 25, "uni"],
	["Paramilitary Garb (Shirt)","U_I_C_Soldier_Para_3_F", 25, "uni"],
	["Paramilitary Garb (Shorts)","U_I_C_Soldier_Para_5_F", 25, "uni"],
	["Paramilitary Garb (Tank Top)","U_I_C_Soldier_Para_4_F", 25, "uni"],
	["Paramilitary Garb (Tee)","U_I_C_Soldier_Para_1_F", 25, "uni"],
	["Syndikat Uniform","U_I_C_Soldier_Camo_F", 25, "uni"],
	["Combat Fatigues (Tropic)","U_B_T_Soldier_F", 50, "uni"],
	["Combat Fatigues (Tropic, Tee)","U_B_T_Soldier_AR_F", 50, "uni"],
	["CTRG Stealth Uniform","U_B_CTRG_Soldier_F", 50, "uni"],
	["CTRG Stealth Uniform (Rolled-up)","U_B_CTRG_Soldier_3_F", 50, "uni"],
	["CTRG Stealth Uniform (Tee)","U_B_CTRG_Soldier_2_F", 50, "uni"],
	["CTRG Urban Uniform","U_B_CTRG_Soldier_urb_1_F", 50, "uni"],
	["CTRG Urban Uniform (Rolled-up)","U_B_CTRG_Soldier_urb_3_F", 50, "uni"],
	["CTRG Urban Uniform (Tee)","U_B_CTRG_Soldier_urb_2_F", 50, "uni"],
	["Fatigues (Green Hex) [CSAT]","U_O_T_Soldier_F", 50, "uni"],
	["Full Ghillie (Jungle) [CSAT]","U_O_T_FullGhillie_tna_F", 500, "uni"],
	["Full Ghillie (Jungle) [NATO]","U_B_T_FullGhillie_tna_F", 500, "uni"],
	["Ghillie Suit (Green Hex) [CSAT]","U_O_T_Sniper_F", 300, "uni"],
	["Ghillie Suit (Tropic) [NATO]","U_B_T_Sniper_F", 300, "uni"],
	["Gendarmerie Commander Uniform","U_B_GEN_Commander_F", 50, "uni"],
	["Gendarmerie Uniform","U_B_GEN_Soldier_F", 50, "uni"],
	["Officer Fatigues (Green Hex) [CSAT]","U_O_T_Officer_F", 50, "uni"],
	["Recon Fatigues (Tropic)","U_B_T_Soldier_SL_F", 50, "uni"],
	["Special Purpose Suit (Green Hex)","U_O_V_Soldier_Viper_F", 200, "uni"],
	["Special Purpose Suit (Hex)","U_O_V_Soldier_Viper_hex_F", 200, "uni"]
];

vestArray = compileFinal str
[
	["Rebreather (NATO)", "V_RebreatherB", 200, "vest"],
	["Rebreather (CSAT)", "V_RebreatherIR", 200, "vest"],
	["Rebreather (AAF)", "V_RebreatherIA", 200, "vest"],
	["Carrier Lite (Green)", "V_PlateCarrier1_rgr", -1, "vest"],
	["Carrier Lite (Black)", "V_PlateCarrier1_blk", -1, "vest"],
	["Carrier Rig (Green)", "V_PlateCarrier3_rgr", -1, "vest"],
	["Carrier GL Rig (Green)", "V_PlateCarrierGL_rgr", -1, "vest"],
	["Carrier GL Rig (Black)", "V_PlateCarrierGL_blk", -1, "vest"], // DLC Vest
	["Carrier GL Rig (MTP)", "V_PlateCarrierGL_mtp", -1, "vest"], // DLC Vest
	["CTRG Plate Carrier Rig Mk.1 (Light)", "V_PlateCarrierL_CTRG", -1, "vest"],
	["CTRG Plate Carrier Rig Mk.2 (Heavy)", "V_PlateCarrierH_CTRG", -1, "vest"],
	["GA Carrier Lite (Digi)", "V_PlateCarrierIA1_dgtl", -1, "vest"],
	["GA Carrier Rig (Digi)", "V_PlateCarrierIA2_dgtl", -1, "vest"],
	["GA Carrier GL Rig (Digi)", "V_PlateCarrierIAGL_dgtl", -1, "vest"],
	["GA Carrier GL Rig (Olive)", "V_PlateCarrierIAGL_oli", -1, "vest"], // DLC Vest
	["LBV Harness", "V_HarnessO_brn", -1, "vest"],
	["LBV Harness (Gray)", "V_HarnessO_gry", -1, "vest"],
	["LBV Grenadier Harness", "V_HarnessOGL_brn", -1, "vest"],
	["LBV Grenadier Harness (Gray)", "V_HarnessOGL_gry", -1, "vest"],
	["ELBV Harness", "V_HarnessOSpec_brn", -1, "vest"],
	["ELBV Harness (Gray)", "V_HarnessOSpec_gry", -1, "vest"],
	["Slash Bandolier (Black)", "V_BandollierB_blk", -1, "vest"],
	["Slash Bandolier (Coyote)", "V_BandollierB_cbr", -1, "vest"],
	["Slash Bandolier (Green)", "V_BandollierB_rgr", -1, "vest"],
	["Slash Bandolier (Khaki)", "V_BandollierB_khk", -1, "vest"],
	["Slash Bandolier (Olive)", "V_BandollierB_oli", -1, "vest"],
	["Chest Rig (Khaki)", "V_Chestrig_khk", -1, "vest"],
	["Chest Rig (Green)", "V_Chestrig_rgr", -1, "vest"],
	["Fighter Chestrig (Black)", "V_Chestrig_blk", -1, "vest"],
	["Fighter Chestrig (Olive)", "V_Chestrig_oli", -1, "vest"],
	["Tactical Vest (Black)", "V_TacVest_blk", -1, "vest"],
	["Tactical Vest (Brown)", "V_TacVest_brn", -1, "vest"],
	["Tactical Vest (Camo)", "V_TacVest_camo", -1, "vest"],
	["Tactical Vest (Khaki)", "V_TacVest_khk", -1, "vest"],
	["Tactical Vest (Olive)", "V_TacVest_oli", -1, "vest"],
	["Tactical Vest (Police)", "V_TacVest_blk_POLICE", -1, "vest"],
	["Tactical Vest (Stavrou)", "V_I_G_resistanceLeader_F", -1, "vest"],
	["Carrier Special Rig (Green)", "V_PlateCarrierSpec_rgr", -1, "vest"],
	["Carrier Special Rig (MTP)", "V_PlateCarrierSpec_mtp", -1, "vest"], // DLC Vest
	["Carrier Special Rig (Black)", "V_PlateCarrierSpec_blk", -1, "vest"], // DLC Vest
	["Raven Night Vest", "V_TacVestIR_blk", -1, "vest"],
	["Press Vest", "V_Press_F", -1, "vest"],
	["Deck Crew Vest (Blue)", "V_DeckCrew_blue_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (Green)", "V_DeckCrew_green_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (Yellow)", "V_DeckCrew_yellow_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (Red)", "V_DeckCrew_red_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (Brown)", "V_DeckCrew_brown_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (Violet)", "V_DeckCrew_violet_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (White)", "V_DeckCrew_white_F", -1, "vest", "noDLC"]
];

backpackArray = compileFinal str
[
	//["Parachute", "B_Parachute", 200, "backpack"],

	["Assault Pack (Black)", "B_AssaultPack_blk", 100, "backpack"],
	["Assault Pack (Green)", "B_AssaultPack_rgr", 100, "backpack"],
	["Assault Pack (MTP)", "B_AssaultPack_mcamo", 100, "backpack"],
	["Assault Pack (Hex)", "B_AssaultPack_ocamo", 100, "backpack"],

	["Field Pack (Black)", "B_FieldPack_blk", 200, "backpack"],
	["Field Pack (Coyote)", "B_FieldPack_cbr", 200, "backpack"],
	["Field Pack (Hex)", "B_FieldPack_ocamo", 200, "backpack"],
	["Field Pack (Khaki)", "B_FieldPack_khk", 200, "backpack"],
	["Field Pack (Olive)", "B_FieldPack_oli", 200, "backpack"],
	["Field Pack (Urban)", "B_FieldPack_oucamo", 200, "backpack"],

	["Kitbag (Coyote)", "B_Kitbag_cbr", 350, "backpack"],
	["Kitbag (Green)", "B_Kitbag_rgr", 350, "backpack"],
	["Kitbag (MTP)", "B_Kitbag_mcamo", 350, "backpack"],
	["Kitbag (Sage)", "B_Kitbag_sgg", 350, "backpack"],

	["Bergen (Black)", "B_Bergen_blk", 350, "backpack"],
	["Bergen (Green)", "B_Bergen_rgr", 350, "backpack"],
	["Bergen (MTP)", "B_Bergen_mcamo", 350, "backpack"],
	["Bergen (Sage)", "B_Bergen_sgg", 350, "backpack"],

	["Carryall (Coyote)", "B_Carryall_cbr", 500, "backpack"],
	["Carryall (Hex)", "B_Carryall_ocamo", 500, "backpack"],
	["Carryall (Khaki)", "B_Carryall_khk", 500, "backpack"],
	["Carryall (MTP)", "B_Carryall_mcamo", 500, "backpack"],
	["Carryall (Olive)", "B_Carryall_oli", 500, "backpack"],
	["Carryall (Urban)", "B_Carryall_oucamo", 500, "backpack"],

	//Apex DLC
	["Carryall Backpack (Green Hex)","B_Carryall_ghex_F", 500, "backpack"],
	["Assault Pack (Tropic)","B_AssaultPack_tna_F", 150, "backpack"],
	["Field Pack (Green Hex)","B_FieldPack_ghex_F", 200, "backpack"],
	["Bergen Backpack (MTP)","B_Bergen_mcamo_F", 600, "backpack"],
	["Bergen Backpack (Digital)","B_Bergen_dgtl_F", 600, "backpack"],
	["Bergen Backpack (Hex)","B_Bergen_hex_F", 600, "backpack"],
	["Bergen Backpack (Tropic)","B_Bergen_tna_F", 600, "backpack"],
	["Viper Harness (Black)","B_ViperHarness_blk_F", 400, "backpack"],
	["Viper Harness (Green Hex)","B_ViperHarness_ghex_F", 400, "backpack"],
	["Viper Harness (Hex)","B_ViperHarness_hex_F", 400, "backpack"],
	["Viper Harness (Khaki)","B_ViperHarness_khk_F", 400, "backpack"],
	["Viper Harness (Olive)","B_ViperHarness_oli_F", 400, "backpack"],
	["Viper Light Harness (Black)","B_ViperLightHarness_blk_F", 350, "backpack"],
	["Viper Light Harness (Green Hex)","B_ViperLightHarness_ghex_F", 350, "backpack"],
	["Viper Light Harness (Hex)","B_ViperLightHarness_hex_F", 350, "backpack"],
	["Viper Light Harness (Khaki)","B_ViperLightHarness_khk_F", 350, "backpack"],
	["Viper Light Harness (Olive)","B_ViperLightHarness_oli_F", 350, "backpack"]
];

genItemArray = compileFinal str
[
	["Remote Designator Bag (NATO)", "B_Static_Designator_01_weapon_F", 2000, "backpack"],
	["Remote Designator Bag (CSAT)", "O_Static_Designator_02_weapon_F", 2000, "backpack"],
	["Quadrotor UAV (NATO)", "B_UAV_01_backpack_F", 20000, "backpack"],
	["Quadrotor UAV (CSAT)", "O_UAV_01_backpack_F", 20000, "backpack"],
	["Quadrotor UAV (AAF)", "I_UAV_01_backpack_F", 20000, "backpack"],
	["UAV Terminal (NATO)", "B_UavTerminal", 150, "gps"],
	["UAV Terminal (CSAT)", "O_UavTerminal", 150, "gps"],
	["UAV Terminal (AAF)", "I_UavTerminal", 150, "gps"],
	["GPS", "ItemGPS", 100, "gps"],
	["First Aid Kit", "FirstAidKit", 25, "item"],
	["Medikit", "Medikit", 150, "item"],
	["Toolkit", "ToolKit", 150, "item"],
	["Mine Detector", "MineDetector", 100, "item"],
	["NV Goggles", "NVGoggles", 100, "nvg"],
	["Binoculars", "Binocular", 50, "binoc"],
	["Rangefinder", "Rangefinder", 150, "binoc"],
	["Laser Designator (NATO)", "Laserdesignator", 1000, "binoc", "WEST"],
	["Laser Designator (CSAT)", "Laserdesignator_02", 1000, "binoc", "EAST"],
	["Laser Designator (AAF)", "Laserdesignator_03", 1000, "binoc", "GUER"],
	["IR Grenade (NATO)", "B_IR_Grenade", 50, "mag", "WEST"],
	["IR Grenade (CSAT)", "O_IR_Grenade", 50, "mag", "EAST"],
	["IR Grenade (AAF)", "I_IR_Grenade", 50, "mag", "GUER"],
	["Chemlight (Blue)", "Chemlight_blue", 25, "mag"],
	["Chemlight (Green)", "Chemlight_green", 25, "mag"],
	["Chemlight (Yellow)", "Chemlight_yellow", 25, "mag"],
	["Chemlight (Red)", "Chemlight_red", 25, "mag"],
	["Aviator Glasses", "G_Aviator", 25, "gogg"],
	["Diving Goggles", "G_Diving", 100, "gogg"],
	["Balaclava (Black)", "G_Balaclava_blk", 100, "gogg"],
	["Balaclava (Olive)", "G_Balaclava_oli", 100, "gogg"],
	["Balaclava (Combat Goggles)", "G_Balaclava_combat", 100, "gogg"],
	["Balaclava (Low Profile Goggles)", "G_Balaclava_lowprofile", 100, "gogg"],
	["Bandanna (Aviator)", "G_Bandanna_aviator", 100, "gogg"],
	["Bandanna (Beast)", "G_Bandanna_beast", 100, "gogg"],
	["Bandanna (Black)", "G_Bandanna_blk", 100, "gogg"],
	["Bandanna (Khaki)", "G_Bandanna_khk", 100, "gogg"],
	["Bandanna (Olive)", "G_Bandanna_oli", 100, "gogg"],
	["Bandanna (Shades)", "G_Bandanna_shades", 100, "gogg"],
	["Bandanna (Sport)", "G_Bandanna_sport", 100, "gogg"],
	["Bandanna (Tan)", "G_Bandanna_tan", 100, "gogg"],
	["Combat Goggles", "G_Combat", 100, "gogg"],
	["VR Goggles", "G_Goggles_VR", 100, "gogg"],
	["Ladies Shades (ICE)", "G_Lady_Blue", 100, "gogg"],
	["Ladies Shades (Sea)", "G_Lady_Dark", 100, "gogg"],
	["Ladies Shades (Iridium)", "G_Lady_Mirror", 100, "gogg"],
	["Ladies Shades (Fire)", "G_Lady_Red", 100, "gogg"],
	["Low Profile Goggles", "G_Lowprofile", 100, "gogg"],
	["Shades (Black)", "G_Shades_Black", 100, "gogg"],
	["Shades (Blue)", "G_Shades_Blue", 100, "gogg"],
	["Shades (Green)", "G_Shades_Green", 100, "gogg"],
	["Shades (Red)", "G_Shades_Red", 100, "gogg"],
	["Spectacle Glasses", "G_Spectacles", 100, "gogg"],
	["Tinted Spectacles", "G_Spectacles_Tinted", 100, "gogg"],
	["Sport Shades (Vulcan)", "G_Sport_Blackred", 100, "gogg"],
	["Sport Shades (Shadow)", "G_Sport_BlackWhite", 100, "gogg"],
	["Sport Shades (Poison)", "G_Sport_Blackyellow", 100, "gogg"],
	["Sport Shades (Style)", "G_Sport_Checkered", 100, "gogg"],
	["Sport Shades (Yetti)", "G_Sport_Greenblack", 100, "gogg"],
	["Sport Shades (Fire)", "G_Sport_Red", 100, "gogg"],
	["Square Spectacles", "G_Squares", 100, "gogg"],
	["Square Shades", "G_Squares_Tinted", 100, "gogg"],
	["Tactical Shades", "G_Tactical_Black", 100, "gogg"],
	["Tactical Glasses", "G_Tactical_Clear", 100, "gogg"],
	// Apex DLC
	["NV Goggles (Tropic)","NVGoggles_tna_F", 100, "nvg"],
	["Compact NVG (Green Hex)","O_NVGoggles_ghex_F", 100, "nvg"],
	["Compact NVG (Hex)","O_NVGoggles_hex_F", 100, "nvg"],
	["Compact NVG (Urban)","O_NVGoggles_urb_F", 100, "nvg"],
	["ENVG-II (Black)","NVGogglesB_blk_F", 5000, "nvg"],
	["ENVG-II (Green)","NVGogglesB_grn_F", 5000, "nvg"],
	["ENVG-II (Grey)","NVGogglesB_gry_F", 5000, "nvg"]
];

allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray);

genObjectsArray = compileFinal str
[
	["Camo Ammo Cache", "Box_FIA_Support_F", 250, "ammocrate"],
	["Base Re-Locker", "Land_Device_assembled_F", 25000, "object"],  //Cael817, SNAFU,Used for base operations <-- Destroyable
	["Safe (PIN IS EMPTY)", "Box_NATO_AmmoVeh_F", 50000, "ammocrate"],
	//["Metal Barrel", "Land_MetalBarrel_F", 25, "object"],
	//["Toilet Box", "Land_ToiletBox_F", 25, "object"],
	["Lamp Post (Harbour)", "Land_LampHarbour_F", 100, "object"],
	["Lamp Post (Shabby)", "Land_LampShabby_F", 100, "object"],
	["Lamp Post (Halogen)(macchky.net)", "Land_LampHalogen_F", 100, "object"],
	["Boom Gate", "Land_BarGate_F", 150, "object"],
	["City Wall Gate (macchky.net)", "Land_City_Gate_F", 150, "object"],
	["Net Fence Gate (macchky.net)", "Land_Net_Fence_Gate_F", 150, "object"],
	["Pipes", "Land_Pipes_Large_F", 200, "object"],
	["Highway Guardrail", "Land_Crash_barrier_F", 200, "object"],
	["Concrete Frame", "Land_CncShelter_F", 200, "object"],
	["Concrete Barrier", "Land_CncBarrier_F", 200, "object"],
	["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 350, "object"],
	["Concrete Barrier (Long)", "Land_CncBarrierMedium4_F", 500, "object"],
	["Concrete Wall", "Land_CncWall1_F", 400, "object"],
	["Concrete Wall (Long)", "Land_CncWall4_F", 600, "object"],
	["Concrete Military Wall", "Land_Mil_ConcreteWall_F", 400, "object"],
	["Concrete Ramp", "Land_RampConcrete_F", 350, "object"],
	["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 500, "object"],
	["HBarrier (1 block)", "Land_HBarrier_1_F", 150, "object"],
	["HBarrier (3 blocks)", "Land_HBarrier_3_F", 200, "object"],
	["HBarrier (5 blocks)", "Land_HBarrier_5_F", 250, "object"],
	["HBarrier Big", "Land_HBarrierBig_F", 500, "object"],
	["HBarrier Wall (4 blocks)", "Land_HBarrierWall4_F", 400, "object"],
	["HBarrier Wall (6 blocks)", "Land_HBarrierWall6_F", 500, "object"],
	["HBarrier Watchtower", "Land_HBarrierTower_F", 600, "object"],
	["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 600, "object"],
	//["Shoot House Wall", "Land_Shoot_House_Wall_F", 180, "object"],
	["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 400, "object"],
	["Canal Stairs", "Land_Canal_Wall_Stairs_F", 500, "object"],
	["Bag Fence (Corner)", "Land_BagFence_Corner_F", 150, "object"],
	["Bag Fence (End)", "Land_BagFence_End_F", 150, "object"],
	["Bag Fence (Long)", "Land_BagFence_Long_F", 200, "object"],
	["Bag Fence (Round)", "Land_BagFence_Round_F", 150, "object"],
	["Bag Fence (Short)", "Land_BagFence_Short_F", 150, "object"],
	["Bag Bunker (Small)", "Land_BagBunker_Small_F", 250, "object"],
	["Bag Bunker (Large)", "Land_BagBunker_Large_F", 500, "object"],
	["Bag Bunker Tower", "Land_BagBunker_Tower_F", 1000, "object"],
	["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 800, "object"],
	["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 10000, "object"],
	//["Scaffolding", "Land_Scaffolding_F", 250, "object"],
	["Concrete Block (macchky.net)", "BlockConcrete_F", 10000, "object"],
	["Land Pier (TOParma.com)", "Land_Pier_F", 150000, "object"],
	["Fuel Station (TOParma.com)", "Land_FuelStation_Feed_F", 10000, "object"],
	["Military Cargo House (macchky.net)", "Land_Cargo_House_V1_F", 1000, "object"],
	["Military Cargo HQ (macchky.net)", "Land_Cargo_HQ_V1_F", 5000, "object"],
	["Cargo Container (Long) (macchky.net)", "Land_Cargo40_military_green_F", 1000, "object"],
	["Pier Platform (macchky.net)", "Land_Pier_addon", 10000, "object"],
	["Food sacks", "Land_Sacks_goods_F", 5000, "object"], // Added on player request
	["Water Barrel", "Land_BarrelWater_F", 5000, "object"]
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
	// SKIPSAVE = will not be autosaved until first manual force save, good for cheap vehicles that usually get abandoned

	["Kart", "C_Kart_01_F", 500, "vehicle", "SKIPSAVE"],

	["Quadbike (Civilian)", "C_Quadbike_01_F", 600, "vehicle", "SKIPSAVE"],
	["Quadbike (NATO)", "B_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],
	["Quadbike (CSAT)", "O_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],
	["Quadbike (AAF)", "I_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],
	["Quadbike (FIA)", "B_G_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],

	["Hatchback", "C_Hatchback_01_F", 800, "vehicle", "SKIPSAVE"],
	["Hatchback Sport", "C_Hatchback_01_sport_F", 1000, "vehicle", "SKIPSAVE"],
	["SUV", "C_SUV_01_F", 1100, "vehicle", "SKIPSAVE"],
	["Offroad", "C_Offroad_01_F", 1100, "vehicle", "SKIPSAVE"],
	["Offroad Camo", "B_G_Offroad_01_F", 1250, "vehicle", "SKIPSAVE"],
	["Offroad Repair", "C_Offroad_01_repair_F", 1500, "vehicle", "SKIPSAVE"],
	["Offroad HMG", "B_G_Offroad_01_armed_F", 2500, "vehicle", "SKIPSAVE"],

	["Truck", "C_Van_01_transport_F", 700, "vehicle", "SKIPSAVE"],
	["Truck (Camo)", "B_G_Van_01_transport_F", 800, "vehicle", "SKIPSAVE"],
	["Truck Box", "C_Van_01_box_F", 900, "vehicle", "SKIPSAVE"],
	["Fuel Truck", "C_Van_01_fuel_F", 2000, "vehicle", "SKIPSAVE"],
	["Fuel Truck (Camo)", "B_G_Van_01_fuel_F", 2100, "vehicle", "SKIPSAVE"],

	["HEMTT Tractor", "B_Truck_01_mover_F", 4000, "vehicle"],
	["HEMTT Resupply", "B_Truck_01_ammo_F", 5000, "vehicle"],
	//["HEMTT Box", "B_Truck_01_box_F", 5000, "vehicle"],
	["HEMTT Transport", "B_Truck_01_transport_F", 6000, "vehicle"],
	["HEMTT Covered", "B_Truck_01_covered_F", 7500, "vehicle"],
	["HEMTT Fuel", "B_Truck_01_fuel_F", 9000, "vehicle"],
	["HEMTT Medical", "B_Truck_01_medical_F", 10000, "vehicle"],
	["HEMTT Repair", "B_Truck_01_Repair_F", 12500, "vehicle"],
	// ["HEMTT Ammo", "B_Truck_01_ammo_F", 27500, "vehicle"],

	// ["Tempest Device", "O_Truck_03_device_F", 4000, "vehicle"],
	["Tempest Transport", "O_Truck_03_transport_F", 6000, "vehicle"],
	["Tempest Covered", "O_Truck_03_covered_F", 7500, "vehicle"],
	["Tempest Fuel", "O_Truck_03_fuel_F", 9000, "vehicle"],
	["Tempest Medical", "O_Truck_03_medical_F", 10000, "vehicle"],
	["Tempest Repair", "O_Truck_03_repair_F", 12500, "vehicle"],
	// ["Tempest Ammo", "O_Truck_03_ammo_F", 27500, "vehicle"],

	["Zamak Resupply", "I_Truck_02_ammo_F", 4000, "vehicle"],
	["Zamak Transport", "I_Truck_02_transport_F", 4500, "vehicle"],
	["Zamak Covered", "I_Truck_02_covered_F", 5000, "vehicle"],
	["Zamak Fuel", "I_Truck_02_fuel_F", 7500, "vehicle"],
	["Zamak Medical", "I_Truck_02_medical_F", 9000, "vehicle"],
	["Zamak Repair", "I_Truck_02_box_F", 10000, "vehicle"],
	// ["Zamak Ammo", "I_Truck_02_ammo_F", 25000, "vehicle"],

	["UGV Stomper (NATO)", "B_UGV_01_F", 25000, "vehicle"],
	["UGV Stomper RCWS (NATO)", "B_UGV_01_rcws_F", 50000, "vehicle"],
	["UGV Stomper (AAF)", "I_UGV_01_F", 25000, "vehicle"],
	["UGV Stomper RCWS (AAF)", "I_UGV_01_rcws_F", 50000, "vehicle"],
	["UGV Saif (CSAT)", "O_UGV_01_F", 25000, "vehicle"],
	["UGV Saif RCWS (CSAT)", "O_UGV_01_rcws_F", 50000, "vehicle"],
	// Apex DLC
	["MB 4WD","C_Offroad_02_unarmed_F", 1100, "vehicle"]
];

armoredArray = compileFinal str
[
	["Hunter", "B_MRAP_01_F", 4000, "vehicle", "SKIPSAVE"],
	["Hunter HMG", "B_MRAP_01_hmg_F", 15000, "vehicle"],
	["Hunter GMG", "B_MRAP_01_gmg_F", 17500, "vehicle"],
	["Ifrit", "O_MRAP_02_F", 4000, "vehicle", "SKIPSAVE"],
	["Ifrit HMG", "O_MRAP_02_hmg_F", 15000, "vehicle"],
	["Ifrit GMG", "O_MRAP_02_gmg_F", 17500, "vehicle"],
	["Strider", "I_MRAP_03_F", 4000, "vehicle", "SKIPSAVE"],
	["Strider HMG", "I_MRAP_03_hmg_F", 15000, "vehicle"],
	["Strider GMG", "I_MRAP_03_gmg_F", 17500, "vehicle"],
	["MSE-3 Marid", "O_APC_Wheeled_02_rcws_F", 22500, "vehicle"],
	["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 27500, "vehicle"],
	["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F", 30000, "vehicle"]
];

tanksArray = compileFinal str
[
	["CRV-6e Bobcat (Resupply)", "B_APC_Tracked_01_CRV_F", 32500, "vehicle"],
	["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 35000, "vehicle"],
	["FV-720 Mora", "I_APC_tracked_03_cannon_F", 37500, "vehicle"],
	["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F", 40000, "vehicle"],
	["IFV-6a Cheetah AA", "B_APC_Tracked_01_AA_F", 40000, "vehicle"],
	["ZSU-39 Tigris AA", "O_APC_Tracked_02_AA_F", 40000, "vehicle"],
	["M2A1 Slammer", "B_MBT_01_cannon_F", 50000, "vehicle"],
	["M2A4 Slammer HMG", "B_MBT_01_TUSK_F", 50000, "vehicle"], // Commander gun variant
	["T-100 Varsuk", "O_MBT_02_cannon_F", 50000, "vehicle"],
	["MBT-52 Kuma", "I_MBT_03_cannon_F", 50000, "vehicle"]
];

helicoptersArray = compileFinal str
[
	["M-900 Civilian", "C_Heli_Light_01_civil_F", 4000, "vehicle"], // MH-6, no flares
	["MH-9 Hummingbird", "B_Heli_Light_01_F", 5000, "vehicle"], // MH-6
	["PO-30 Orca (Unarmed)", "O_Heli_Light_02_unarmed_F", 6000, "vehicle"], // Ka-60
	["WY-55 Hellcat (Unarmed)", "I_Heli_light_03_unarmed_F", 7000, "vehicle"], // AW159
	["CH-49 Mohawk", "I_Heli_Transport_02_F", 8000, "vehicle"], // AW101

	["Mi-290 Taru (Resupply)", "O_Heli_Transport_04_ammo_F", 7500, "vehicle"],
	["Mi-290 Taru (Crane)", "O_Heli_Transport_04_F", 7500, "vehicle"], // CH-54
	["Mi-290 Taru (Box)", "O_Heli_Transport_04_box_F", 8000, "vehicle"],
	["Mi-290 Taru (Fuel)", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
	["Mi-290 Taru (Bench)", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
	["Mi-290 Taru (Transport)", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
	["Mi-290 Taru (Medical)", "O_Heli_Transport_04_medevac_F", 12500, "vehicle"],
	["Mi-290 Taru (Repair)", "O_Heli_Transport_04_repair_F", 15000, "vehicle"],
	["Mi-290 Taru (Ammo)", "O_Heli_Transport_04_ammo_F", 25000, "vehicle"],

	["UH-80 Ghost Hawk (Black)", "B_Heli_Transport_01_F", 25000, "vehicle"], // UH-60 Stealth with 2 side miniguns

	["CH-67 Huron (Unarmed)", "B_Heli_Transport_03_unarmed_F", 10000, "vehicle"], // CH-47
	["CH-67 Huron (Armed)", "B_Heli_Transport_03_F", 20000, "vehicle"], // CH-47 with 2 side miniguns

	["UH-80 Ghost Hawk", "B_Heli_Transport_01_F", 25000, "vehicle"], // UH-60 Stealth with 2 side miniguns
	["AH-9 Pawnee", "B_Heli_Light_01_armed_F", 30000, "vehicle"], // Armed AH-6
	["PO-30 Orca (Armed, Black)", "O_Heli_Light_02_v2_F", 30000, "vehicle"], // Armed Ka-60 with orca paintjob	["PO-30 Orca (DAR)", "O_Heli_Light_02_dynamicLoadout_F", 30000, "vehicle", "variant_orcaDAR"], // Armed Ka-60
	["PO-30 Orca (Armed, Hex)", "O_Heli_Light_02_F", 35000, "vehicle"], // Armed Ka-60	["PO-30 Orca (DAGR)", "O_Heli_Light_02_dynamicLoadout_F", 40000, "vehicle", "variant_orcaDAGR"], // Armed Ka-60, add "HIDDEN" if you don't want it, but don't remove the line!
	["WY-55 Hellcat (Armed)", "I_Heli_light_03_F", 40000, "vehicle"], // Armed AW159
	["AH-99 Blackfoot", "B_Heli_Attack_01_F", 50000, "vehicle"], // RAH-66 with gunner
	["Mi-48 Kajman", "O_Heli_Attack_02_F", 60000, "vehicle"], // Mi-28 with gunner

	["MQ-12 Falcon UAV", "B_T_UAV_03_F", 50000, "vehicle"]
];

planesArray = compileFinal str
[
	["Caesar BTT", "C_Plane_Civil_01_F", 3000, "vehicle"],

	["A-143 Buzzard AA", "I_Plane_Fighter_03_AA_F", 40000, "vehicle"],
	["A-143 Buzzard CAS", "I_Plane_Fighter_03_CAS_F", 45000, "vehicle"],
	["A-164 Wipeout CAS", "B_Plane_CAS_01_F", 60000, "vehicle"],
	["To-199 Neophron CAS", "O_Plane_CAS_02_F", 60000, "vehicle"],

	["V-44 X Blackfish (Infantry)", "B_T_VTOL_01_infantry_F", 20000, "vehicle"],
	["V-44 X Blackfish (Gunship)", "B_T_VTOL_01_armed_F", 60000, "vehicle"],
	["Y-32 Xi'an", "O_T_VTOL_02_infantry_F", 60000, "vehicle"],

	["MQ4A Greyhawk Missile UAV", "B_UAV_02_F", 20000, "vehicle"],
	["MQ4A Greyhawk Bomber UAV", "B_UAV_02_CAS_F", 10000, "vehicle"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than Missile ones
	["K40 Ababil-3 Missile UAV", "O_UAV_02_F", 20000, "vehicle"],
	["K40 Ababil-3 Bomber UAV", "O_UAV_02_CAS_F", 10000, "vehicle"],
	["K40 Ababil-3 Missile UAV", "I_UAV_02_F", 20000, "vehicle"],
	["K40 Ababil-3 Bomber UAV", "I_UAV_02_CAS_F", 10000, "vehicle"],

	["KH-3A Fenghuang UAV", "O_T_UAV_04_CAS_F", 20000, "vehicle"]
];

boatsArray = compileFinal str
[
	["Rescue Boat", "C_Rubberboat", 500, "boat"],
	["Rescue Boat (NATO)", "B_Lifeboat", 500, "boat"],
	["Rescue Boat (CSAT)", "O_Lifeboat", 500, "boat"],
	["Assault Boat (NATO)", "B_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (FIA)", "B_G_Boat_Transport_01_F", 600, "boat"],
	["Motorboat", "C_Boat_Civil_01_F", 1000, "boat"],
	["Motorboat Rescue", "C_Boat_Civil_01_rescue_F", 900, "boat"],
	["Motorboat Police", "C_Boat_Civil_01_police_F", 1100, "boat"],
	["Speedboat HMG (CSAT)", "O_Boat_Armed_01_hmg_F", 4000, "boat"],
	["Speedboat Minigun (NATO)", "B_Boat_Armed_01_minigun_F", 4000, "boat"],
	["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 4000, "boat"],
	["SDV Submarine (NATO)", "B_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (CSAT)", "O_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (AAF)", "I_SDV_01_F", 1000, "submarine"],
	// Apex DLC
	["Water Scooter", "C_Scooter_Transport_01_F", 500, "boat"],
	["RHIB","C_Boat_Transport_02_F", 1250, "boat"]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray);

uavArray = compileFinal str
[
	"UAV_02_base_F",
	"UGV_01_base_F"
];

noColorVehicles = compileFinal str
[
	// Deprecated
];

rgbOnlyVehicles = compileFinal str
[
	// Deprecated
];

_color = "#(rgb,1,1,1)color";
_texDir = "client\images\vehicleTextures\";
_kartDir = "\A3\soft_f_kart\Kart_01\Data\";
_mh9Dir = "\A3\air_f\Heli_Light_01\Data\";
_mohawkDir = "\A3\air_f_beta\Heli_Transport_02\Data\";
_wreckDir = "\A3\structures_f\wrecks\data\";
_gorgonDir = "\A3\armor_f_gamma\APC_Wheeled_03\data\";

colorsArray = compileFinal str
[
	[ // Main colors
		"All",
		[
			["Black", _color + "(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
			["Gray", _color + "(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
			["White", _color + "(0.75,0.75,0.75,1)"], // #(argb,8,8,3)color(1,1,1,0.5)
			["Dark Blue", _color + "(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
			["Blue", _color + "(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
			["Teal", _color + "(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
			["Green", _color + "(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
			["Yellow", _color + "(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
			["Orange", _color + "(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
			["Red", _color + "(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
			["Pink", _color + "(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
			["Purple", _color + "(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
			["NATO Tan", _texDir + "nato.paa"], // #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
			["CSAT Brown", _texDir + "csat.paa"], // #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
			["AAF Green", _texDir + "aaf.paa"], // #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
			["Bloodshot", _texDir + "bloodshot.paa"],
			["Carbon", _texDir + "carbon.paa"],
			["Confederate", _texDir + "confederate.paa"],
			["Denim", _texDir + "denim.paa"],
			["Digital", _texDir + "digi.paa"],
			["Digital Black", _texDir + "digi_black.paa"],
			["Digital Desert", _texDir + "digi_desert.paa"],
			["Digital Woodland", _texDir + "digi_wood.paa"],
			["Doritos", _texDir + "doritos.paa"],
			["Drylands", _texDir + "drylands.paa"],
			["Hex", _texDir + "hex.paa"],
			["Hippie", _texDir + "hippie.paa"],
			["ISIS", _texDir + "isis.paa"],
			["Leopard", _texDir + "leopard.paa"],
			["Mountain Dew", _texDir + "mtndew.paa"],
			["'Murica", _texDir + "murica.paa"],
			["Nazi", _texDir + "nazi.paa"],
			["Orange Camo", _texDir + "camo_orange.paa"],
			["Pink Camo", _texDir + "camo_pink.paa"],
			["Pride", _texDir + "pride.paa"],
			["Psych", _texDir + "psych.paa"],
			["Red Camo", _texDir + "camo_red.paa"],
			["Rusty", _texDir + "rusty.paa"],
			["Sand", _texDir + "sand.paa"],
			["Snake", _texDir + "snake.paa"],
			["Stripes", _texDir + "stripes.paa"],
			["Stripes 2", _texDir + "stripes2.paa"],
			["Stripes 3", _texDir + "stripes3.paa"],
			["Swamp", _texDir + "swamp.paa"],
			["Tiger", _texDir + "tiger.paa"],
			["Union Jack", _texDir + "unionjack.paa"],
			["Urban", _texDir + "urban.paa"],
			["Weed", _texDir + "weed.paa"],
			["Woodland", _texDir + "woodland.paa"],
			["Woodland Dark", _texDir + "wooddark.paa"],
			["Woodland Tiger", _texDir + "woodtiger.paa"]
		]
	],
	[ // Kart colors
		"Kart_01_Base_F",
		[
			["Bluking (Kart)", ["Bluking"]],
			["Fuel (Kart)", ["Fuel"]],
			["Redstone (Kart)", ["Redstone"]],
			["Vrana (Kart)", ["Vrana"]],
			["Black (Kart)", ["Black"]], // ["Black (Kart)", [configName (configFile >> "CfgVehicles" >> "C_Kart_01_F" >> "TextureSources" >> "Black")]],
			["White (Kart)", ["White"]],
			["Blue (Kart)", ["Blue"]],
			["Green (Kart)", ["Green"]],
			["Yellow (Kart)", ["Yellow"]],
			["Orange (Kart)", ["Orange"]],
			["Red (Kart)", [[0, _kartDir + "kart_01_base_red_co.paa"]]] // no red TextureSource :(
		]
	],
	[ // MH-9 colors
		"Heli_Light_01_base_F",
		[
			["AAF Camo (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_indp_co.paa"]]],
			["Blue 'n White (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_blue_co.paa"]]],
			["Blueline (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_blueline_co.paa"]]],
			["Cream Gravy (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_co.paa"]]],
			["Digital (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_digital_co.paa"]]],
			["Elliptical (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["Furious (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_furious_co.paa"]]],
			["Graywatcher (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["ION (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_ion_co.paa"]]],
			["Jeans (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_jeans_co.paa"]]],
			["Light (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_light_co.paa"]]],
			["Shadow (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_shadow_co.paa"]]],
			["Sheriff (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["Speedy (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_speedy_co.paa"]]],
			["Sunset (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sunset_co.paa"]]],
			["Vrana (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_vrana_co.paa"]]],
			["Wasp (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wasp_co.paa"]]],
			["Wave (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wave_co.paa"]]]
		]
	],
	[ // Mohawk colors
		"Heli_Transport_02_base_F",
		[
			["Dahoman (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_dahoman_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_dahoman_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_dahoman_co.paa"]
			]],
			["ION (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_ion_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_ion_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_ion_co.paa"]
			]]
		]
	],
	[ // Armed Orca paintjob
		"Heli_Light_02_dynamicLoadout_base_F",
		[
			["Orca (Orca)", ["Blackcustom"]]
		]
	],
	[ // Orca paintjob
		"Heli_Light_02_base_F",
		[
			["Blue (Orca)", ["Blue"]]
		]
	],
	[ // Taru paintjob
		"Heli_Transport_04_base_F",
		[
			["Black (Taru)", ["Black"]]
		]
	],
	[ // Blackfoot paintjob
		"Heli_Attack_01_base_F",
		[
			["Rusty (Blackfoot)", [[0, _wreckDir + "wreck_heli_attack_01_co.paa"]]]
		]
	],
	[ // Kajman paintjobs
		"Heli_Attack_02_base_F",
		[
			["Black (Kajman)", ["Black"]],
			["Rusty (Kajman)", [
				[0, _wreckDir + "wreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "wreck_heli_attack_02_body2_co.paa"]
			]],
			["Mossy (Kajman)", [
				[0, _wreckDir + "uwreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "uwreck_heli_attack_02_body2_co.paa"]
			]]
		]
	],
	[ // Ghost Hawk camo
		"Heli_Transport_01_base_F",
		[
			["Green (Ghost Hawk)", ["Green"]]
		]
	],
	[ // Zamak paintjobs
		"Truck_02_base_F",
		[
			//["AAF (Zamak)", ["Indep"]], // default
			["Hex (Zamak)", ["Opfor"]],
			["Orange (Zamak)", ["Orange"]]
		]
	],
	[ // Strider NATO color
		"MRAP_03_base_F",
		[
			["NATO Tan (Strider)", ["Blufor"]]
		]
	],
	[ // Gorgon NATO color
		"APC_Wheeled_03_base_F",
		[
			["NATO Tan (Gorgon)", [
				[0, _gorgonDir + "apc_wheeled_03_ext_co.paa"],
				[1, _gorgonDir + "apc_wheeled_03_ext2_co.paa"],
				[2, _gorgonDir + "rcws30_co.paa"],
				[3, _gorgonDir + "apc_wheeled_03_ext_alpha_co.paa"]
			]]
		]
	],
	[ // Hatchback wreck paintjob
		"Hatchback_01_base_F",
		[
			["Rusty (Hatchback)", [[0, _wreckDir + "civilcar_extwreck_co.paa"]]]
		]
	],
	[ // GOD EMPEROR
		"B_MBT_01_cannon_F",
		[
			["Trump (Slammer)", [
				[0, _texDir + "slammer_trump_0.paa"],
				[1, _texDir + "slammer_trump_1.paa"]
			]]
		]
	],
	[
		"B_MBT_01_TUSK_F",
		[
			["Trump (Slammer)", [[2, _texDir + "slammer_trump_2.paa"]]]
		]
	],
	[ // Caesar BTT color
		"C_Plane_Civil_01_F",
		[
			["Red Line (Tan Interior)", ["RedLine_1"]],
			["Red Line", ["RedLine_2"]],
			["Blue Wave (Tan Interior)", ["Wave_1"]],
			["Blue Wave", ["Wave_2"]],
			["Tribal (Tan Interior)", ["Tribal_1"]],
			["Tribal", ["Tribal_2"]],
			["Racing (Tan Interior)", ["Racer_1"]],
			["Racing", ["Racer_2"]]
		]
	],
	[ // V-44 X Blackfish (Infantry Transport) color
		"B_T_VTOL_01_infantry_F",
		[
			["Olive (Blackfish)", ["Olive"]],
			["Blue (Blackfish)", ["Blue"]]
		]
	],
	[ // V-44 X Blackfish  (Vehicle Transport) color
		"B_T_VTOL_01_vehicle_F",
		[
			["Olive (Blackfish)", ["Olive"]],
			["Blue (Blackfish)", ["Blue"]]
		]
	],
	[ // V-44 X Blackfish (Armed) color
		"B_T_VTOL_01_armed_F",
		[
			["Olive (Blackfish)", ["Olive"]],
			["Blue (Blackfish)", ["Blue"]]
		]
	],
	[ // Y-32 Xi'an (Vehicle Transport) color
		"O_T_VTOL_02_vehicle_F",
		[
			["Green Hex (Xi'an)", ["GreenHex"]],
			["Grey (Xi'an)", ["Grey"]],
			["Hex (Xi'an)", ["Hex"]]
		]
	],
	[ // UGV paintjobs
		"UGV_01_base_F",
		[
			["Green Hex (Xi'an)", ["GreenHex"]],
			["Grey (Xi'an)", ["Grey"]],
			["Hex (Xi'an)", ["Hex"]]
		]
	],
		[ // RHIB color
		"C_Boat_Transport_02_F",
		[
			["Black (RHIB)", ["Black"]],
			["Civilian (RHIB)", ["Civilian"]]
		]
	],
	[ // MB 4WD color
		"C_Offroad_02_unarmed_F",
		[
			["Black (MB 4WD)", ["Black"]],
			["Blue (MB 4WD)", ["Blue"]],
			["Brown (MB 4WD)", ["Brown"]],
			["Green (MB 4WD)", ["Green"]],
			["Olive (MB 4WD)", ["Olive"]],
			["Orange (MB 4WD)", ["Orange"]],
			["Red (MB 4WD)", ["Red"]],
			["White (MB 4WD)", ["White"]]
		]
	]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200],  // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
	["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\waterbottle.paa", 30, 15],
	["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],

	["LSD", "lsd", localize "STR_WL_ShopDescriptions_LSD", "client\icons\lsd.paa", 12500, 6250],
	["Marijuana", "marijuana", localize "STR_WL_ShopDescriptions_Marijuana", "client\icons\marijuana.paa", 10000, 5000],
	["Cocaine", "cocaine", localize "STR_WL_ShopDescriptions_Cocaine", "client\icons\cocaine.paa", 14000, 7000],
	["Heroin", "heroin", localize "STR_WL_ShopDescriptions_Heroin", "client\icons\heroin.paa", 15000, 7500],

	["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 500, 250],
	["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\spawnbeacon.paa", 1500, 750],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 200, 100],
	["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\syphonhose.paa", 200, 100]
	//["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\energydrink.paa", 100, 50],
	//["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\warchest.paa", 1000, 500]
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";

	["TRG-21 EGLM Rifle", "arifle_TRG21_GL_F", 250],
// Markman Rifles
	//DLC Weapons
	["Navid 9.3 mm (Hex)[DLC]", "MMG_01_hex_F", 550],
	["Navid 9.3 mm (Tan)[DLC]", "MMG_01_tan_F", 550],
	["SPMG .338 (Black)[DLC]", "MMG_02_black_F", 500],
	["SPMG .338 (MTP)[DLC]", "MMG_02_camo_F", 500],
	["SPMG .338 (Sand)[DLC]", "MMG_02_sand_F", 500],
	// Apex DLC
	["Carrier GL Rig (Tropic)","V_PlateCarrierGL_tna_F", -1, "vest"],
	["Carrier Lite (Tropic)","V_PlateCarrier1_tna_F", -1, "vest"],
	["Carrier Rig (Tropic)","V_PlateCarrier2_tna_F", -1, "vest"],
	["Carrier Special Rig (Tropic)","V_PlateCarrierSpec_tna_F", -1, "vest"],
	["Gendarmerie Vest","V_TacVest_gen_F", -1, "vest"],
	["LBV Grenadier Harness (Green Hex)","V_HarnessOGL_ghex_F", -1, "vest"],
	["LBV Harness (Green Hex)","V_HarnessO_ghex_F", -1, "vest"],
	["Slash Bandolier (Green Hex)","V_BandollierB_ghex_F", -1, "vest"]
	["AH-9 Pawnee", "B_Heli_Light_01_armed_F", 30000, "vehicle"], // Armed AH-6
	["PO-30 Orca (Armed, Black)", "O_Heli_Light_02_v2_F", 30000, "vehicle"], // Armed Ka-60 with orca paintjob
	["PO-30 Orca (Armed, Hex)", "O_Heli_Light_02_F", 35000, "vehicle"], // Armed Ka-60
	["WY-55 Hellcat (Armed)", "I_Heli_light_03_F", 40000, "vehicle"], // Armed AW159
	["AH-99 Blackfoot", "B_Heli_Attack_01_F", 50000, "vehicle"], // RAH-66 with gunner
	["Mi-48 Kajman", "O_Heli_Attack_02_F", 60000, "vehicle"], // Mi-28 with gunner
	// Apex DLC
	["V-44 X Blackfish (Infantry Transport)","B_T_VTOL_01_infantry_F", 15000, "vehicle"],
	["V-44 X Blackfish (Vehicle Transport)","B_T_VTOL_01_vehicle_F", 10000, "vehicle"],
	["V-44 X Blackfish (Armed)","B_T_VTOL_01_armed_F", 60000, "vehicle"],

	["Y-32 Xi'an (Vehicle Transport)","O_T_VTOL_02_vehicle_F", 60000, "vehicle"],
	["Y-32 Xi'an (Infantry Transport)","O_T_VTOL_02_infantry_F", 65000, "vehicle"],
	["MQ-12 Falcon UAV", "B_T_UAV_03_F", 90000, "vehicle"]
	["A-143 Buzzard AA", "I_Plane_Fighter_03_AA_F", 160000, "vehicle"],
	["A-143 Buzzard CAS", "I_Plane_Fighter_03_CAS_F", 170000, "vehicle"],
	//["A-164 Wipeout CAS", "B_Plane_CAS_01_F", 200000, "vehicle"],
	["To-199 Neophron CAS", "O_Plane_CAS_02_F", 170000, "vehicle"],
	//["MQ4A Greyhawk Missile UAV", "B_UAV_02_F", 200000, "vehicle"],
	["MQ4A Greyhawk Bomber UAV", "B_UAV_02_CAS_F", 160000, "vehicle"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than Missile ones
	//["K40 Ababil-3 Missile UAV (CSAT)", "O_UAV_02_F", 200000, "vehicle"],
	["K40 Ababil-3 Bomber UAV (CSAT)", "O_UAV_02_CAS_F", 160000, "vehicle"],
	//["K40 Ababil-3 Missile UAV (AAF)", "I_UAV_02_F", 200000, "vehicle"],
	["K40 Ababil-3 Bomber UAV (AAF)", "I_UAV_02_CAS_F", 160000, "vehicle"],
	// Apex DLC
	["Caesar BTT","C_Plane_Civil_01_F", 3000, "vehicle"]
	[ // Y-32 Xi'an (Infantry Transport)x color
		"O_T_VTOL_02_infantry_F",
