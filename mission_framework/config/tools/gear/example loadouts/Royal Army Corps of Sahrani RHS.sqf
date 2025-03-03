

// RACS 80s

case "LDR_1" : {

    _randomUniform = selectRandom ["LOP_U_RACS_Fatigue_01", "LOP_U_RACS_Fatigue_01_slv"];
    _randomVest = selectRandom ["LOP_V_CarrierRig_WDL", "LOP_V_CarrierRig_OLV", "LOP_V_CarrierRig_TAN","LOP_V_CarrierLite_TRI", "LOP_V_CarrierLite_WDL", "LOP_V_CarrierLite_OLV","LOP_V_CarrierLite_TAN"];
	
    _gear = [
		// Primary Weapon
		["rhs_weap_m16a2_m203","ACE_muzzle_mzls_L","rhs_acc_m16_handguard_m203_norail","",["hlc_30rnd_556x45_SPR",30],["rhs_mag_M441_HE",1],""],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		[_randomUniform,[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15]]],
		// Vest
		[_randomVest ,[["hlc_30rnd_556x45_SPR",10,30]]],
		// Backpack
		["TFAR_anprc155_coyote",[["ACE_EntrenchingTool",1],["rhs_mag_M441_HE",15,1],["rhs_mag_m713_Red",2,1],["rhs_mag_m714_White",1,1],["rhs_mag_m715_Green",1,1],["SmokeShellBlue",5,1],["HandGrenade",2,1]]],
		// Helmet
		"rhsgref_un_beret",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "LDR_2" : {
	_gear = [
		// Primary Weapon
		["HLC_Rifle_g3ka4_GL","ACE_muzzle_mzls_B","","",["hlc_20rnd_762x51_T_G3",20],[],""],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["hlc_20rnd_762x51_T_G3",8,20]]],
		// Backpack
		["TFAR_anprc155_coyote",[["ACE_EntrenchingTool",1],["SmokeShellBlue",2,1],["HandGrenade",2,1],["hlc_20rnd_762x51_T_G3",5,20],["1Rnd_HE_Grenade_shell",10,1],["SmokeShell",2,1]]],
		// Helmet
		"rhsgref_un_beret",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ItemWatch",""]
	];
};


case "RM_1" : {

    _randomUniform = selectRandom ["LOP_U_RACS_Fatigue_01", "LOP_U_RACS_Fatigue_01_slv"];
    _randomVest = selectRandom ["LOP_V_CarrierRig_WDL", "LOP_V_CarrierRig_OLV", "LOP_V_CarrierRig_TAN","LOP_V_CarrierLite_TRI", "LOP_V_CarrierLite_WDL", "LOP_V_CarrierLite_OLV","LOP_V_CarrierLite_TAN"];
    _randomHelmet = selectRandom ["LOP_H_6B27M_ess_RACS", "LOP_H_6B27M_RACS"];

	_gear = [
		// Primary Weapon
		["rhs_weap_m16a2","ACE_muzzle_mzls_L","rhs_acc_m16_handguard","",["hlc_30rnd_556x45_SPR",30],[],"rhs_acc_m16_norail"],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		[_randomUniform,[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		[_randomVest,[["hlc_30rnd_556x45_SPR",10,30],["SmokeShell",2,1]]],
		// Backpack
		["milgp_b_patrol_01_rgr",[["ACE_EntrenchingTool",1],["HandGrenade",2,1],["rhs_fgm148_magazine_AT",1,1],["rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red",4,30]]],
		// Helmet
		_randomHelmet,
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};


case "RM_2" : {
	_gear = [
		// Primary Weapon
		["hlc_rifle_g3a3","","","",["hlc_20rnd_762x51_T_G3",20],[],""],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["SmokeShell",2,1],["hlc_20rnd_762x51_T_G3",7,20]]],
		// Backpack
		["milgp_b_patrol_01_rgr",[["ACE_EntrenchingTool",1],["HandGrenade",2,1],["rhs_fgm148_magazine_AT",1,1],["hlc_20rnd_762x51_T_G3",2,20]]],
		// Helmet
		"LOP_H_6B27M_ess_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "AR_1" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_fnmag","ACE_muzzle_mzls_B","","",["hlc_200Rnd_762x51_T_M60E4",200],[],""],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["SmokeShell",2,1]]],
		// Backpack
		["milgp_b_patrol_01_rgr",[["ACE_EntrenchingTool",1],["HandGrenade",2,1],["hlc_200Rnd_762x51_T_M60E4",2,200],["hlc_100Rnd_762x51_T_M60E4",1,100]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "AR_2" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_m249_pip_S_para","rhsusf_acc_SFMB556","","",["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch",200],[],"rhsusf_acc_grip4_bipod"],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["SmokeShell",2,1]]],
		// Backpack
		["milgp_b_patrol_01_rgr",[["ACE_EntrenchingTool",1],["HandGrenade",2,1],["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch",7,200]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};


case "AAR_1" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_m16a2","ACE_muzzle_mzls_L","rhs_acc_m16_handguard","",["hlc_30rnd_556x45_SPR",30],[],"rhs_acc_m16_norail"],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["hlc_30rnd_556x45_SPR",10,30],["SmokeShell",2,1]]],
		// Backpack
		["rhsgref_wdl_alicepack",[["ACE_EntrenchingTool",1],["HandGrenade",2,1],["rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red",20,30]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "AAR_2" : {
	_gear = [
		// Primary Weapon
		["hlc_rifle_g3a3","","","",["hlc_20rnd_762x51_b_G3",20],[],""],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["SmokeShell",2,1],["hlc_20rnd_762x51_T_G3",7,20]]],
		// Backpack
		["rhsgref_wdl_alicepack",[["ACE_EntrenchingTool",1],["HandGrenade",2,1],["hlc_20rnd_762x51_T_G3",19,20]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};



case "MED_1" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_m16a2","ACE_muzzle_mzls_L","rhs_acc_m16_handguard","",["hlc_30rnd_556x45_SPR",30],[],"rhs_acc_m16_norail"],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_6B23_Medic_TAN",[["hlc_30rnd_556x45_SPR",10,30],["SmokeShell",2,1]]],
		// Backpack
		["TFL_M9Backpack_AOR1",[["ACE_EntrenchingTool",1],["ACE_elasticBandage",90],["ACE_packingBandage",30],["ACE_bloodIV",15],["ACE_bloodIV_500",10],["ACE_surgicalKit",1],["ACE_splint",15],["ACE_tourniquet",8],["ACE_morphine",3],["ACE_epinephrine",3],["ACE_adenosine",2],["ACE_personalAidKit",1],["HandGrenade",2,1],["SmokeShellGreen",2,1],["SmokeShellBlue",2,1],["SmokeShell",2,1],["rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red",5,30]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "MED_2" : {
	_gear = [
		// Primary Weapon
		["hlc_rifle_g3a3","","","",["hlc_20rnd_762x51_b_G3",20],[],""],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_6B23_Medic_TAN",[["SmokeShell",2,1],["hlc_20rnd_762x51_T_G3",8,20]]],
		// Backpack
		["TFL_M9Backpack_AOR1",[["ACE_EntrenchingTool",1],["ACE_elasticBandage",90],["ACE_packingBandage",30],["ACE_bloodIV",15],["ACE_bloodIV_500",10],["ACE_surgicalKit",1],["ACE_splint",15],["ACE_tourniquet",8],["ACE_morphine",3],["ACE_epinephrine",3],["ACE_adenosine",2],["ACE_personalAidKit",1],["HandGrenade",2,1],["SmokeShellGreen",2,1],["SmokeShellBlue",2,1],["SmokeShell",2,1],["hlc_20rnd_762x51_T_G3",5,20]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};


case "HAT_1" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_m16a2","ACE_muzzle_mzls_L","rhs_acc_m16_handguard","",["hlc_30rnd_556x45_SPR",30],[],"rhs_acc_m16_norail"],
		// Launcher
		["rhs_weap_fgm148","","","",["rhs_fgm148_magazine_AT",1],[],""],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["hlc_30rnd_556x45_SPR",10,30],["SmokeShell",2,1]]],
		// Backpack
		["SAS_BattleBelt_Cpt_v1_1",[["rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red",7,30]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "HAT_2" : {
	_gear = [
		// Primary Weapon
		["hlc_rifle_g3a3","ACE_muzzle_mzls_B","","",["hlc_20rnd_762x51_T_G3",20],[],""],
		// Launcher
		["rhs_weap_fgm148","","","",["rhs_fgm148_magazine_AT",1],[],""],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["SmokeShell",2,1],["hlc_20rnd_762x51_T_G3",7,20]]],
		// Backpack
		["SAS_BattleBelt_Cpt_v1_1",[["hlc_20rnd_762x51_T_G3",7,20],["HandGrenade",2,1]]],
		// Helmet
		"LOP_H_6B27M_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};


case "MM_1" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_m24sws","rhsusf_acc_m24_muzzlehider_black","","rhsusf_acc_M8541_mrds",["rhsusf_5Rnd_762x51_m62_Mag",5],[],"rhsusf_acc_harris_swivel"],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["SmokeShell",2,1],["rhsusf_5Rnd_762x51_m993_Mag",20,5],["rhsusf_5Rnd_762x51_m62_Mag",10,5],["RH_7Rnd_45cal_m1911",4,7]]],
		// Backpack
		["rhsusf_falconii",[]],
		// Helmet
		"LOP_H_Booniehat_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "MM_2" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_sr25_ec","ACE_muzzle_mzls_B","","rhsusf_acc_M8541_mrds",["rhsusf_20Rnd_762x51_SR25_m62_Mag",20],[],"RH_HBLM_tg"],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_CarrierRig_WDL",[["SmokeShell",2,1],["RH_7Rnd_45cal_m1911",4,7],["rhsusf_20Rnd_762x51_SR25_m993_Mag",4,20]]],
		// Backpack
		["rhsusf_falconii",[["rhsusf_20Rnd_762x51_SR25_m993_Mag",9,20]]],
		// Helmet
		"LOP_H_Booniehat_RACS",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};


case "CRW_1" : {
	_gear = [
		// Primary Weapon
		["rhs_weap_m4_car","ACE_muzzle_mzls_L","","",["hlc_30rnd_556x45_SPR",30],[],"rhs_acc_m4_carBipod"],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_6B23_CrewOfficer_TAN",[["hlc_30rnd_556x45_SPR",5,30]]],
		// Backpack
		["TFAR_anprc155_coyote",[["ACE_EntrenchingTool",1],["ToolKit",1],["rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red",7,30]]],
		// Helmet
		"H_HelmetCrew_I",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};

case "CRW_2" : {
	_gear = [
		// Primary Weapon
		["hlc_rifle_g3a3","","","",["hlc_20rnd_762x51_T_G3",20],[],""],
		// Launcher
		[],
		// Secondary Weapon
		["RH_m1911","","","",["RH_7Rnd_45cal_m1911",7],[],""],
		// Uniform
		["LOP_U_RACS_Fatigue_01",[["TFIcTab_android",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_plasmaIV_500",3],["ACE_packingBandage",15],["ACE_Clacker",1]]],
		// Vest
		["LOP_V_6B23_CrewOfficer_TAN",[["hlc_20rnd_762x51_T_G3",4,20]]],
		// Backpack
		["TFAR_anprc155_coyote",[["ACE_EntrenchingTool",1],["ToolKit",1],["hlc_20rnd_762x51_T_G3",4,20]]],
		// Helmet
		"H_HelmetCrew_I",
		// Facewear
		"rhsusf_oakley_goggles_clr",
		// Binos
		["Rangefinder","","","",[],[],""],
		// Linked Items
		["ItemMap","ItemGPS","TFAR_anprc148jem","ItemCompass","ACE_Altimeter",""]
	];
};
