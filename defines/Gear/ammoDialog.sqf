private ["_value","_itemType","_item","_id","_ctrl","_slider"];
// ---------- Requisition and display updates ----------

gearSliderChange =
{
	disableSerialization;

	_value = _this select 0;
	
	Amount = round (_value);
	ctrlSetText [1000,(format ["%1",Amount])];
	
	Cost = (Amount * Multiplier);
	ctrlSetText [1001,(format ["%1",Cost])];
};
lbSelCost =
{
	disableSerialization;
	
	Cost = (Amount * Multiplier);
	ctrlSetText [1001,(format ["%1",Cost])];
};
magazineCostCheck = 
{
	[clientOwner, "LogM"] remoteExec ["publicVariableClient", 2, false];
	
	sleep 0.2;
	
	if (LogM >= Cost) then {
	
		switch (_itemType) do
		{
			case "magazine":
			{
				[ammoCrate_1, [_item, Amount]] remoteExec ["addMagazineCargoGlobal", 2];
			};
			case "launcher":
			{
				[launcherCrate_1, [_item, Amount]] remoteExec ["addMagazineCargoGlobal", 2];
			};

			case "grenade":
			{
				[grenadeCrate_1, [_item, Amount]] remoteExec ["addItemCargoGlobal", 2];
			};
			case "explosive":
			{
				[explosiveCrate_1, [_item, Amount]] remoteExec ["addMagazineCargoGlobal", 2];
			};
		};
		
		LogM = (LogM - Cost);
		
		publicVariableServer "LogM";
		
		ctrlSetText [1002, (format ["%1",LogM])];	

		["Headquarters", "item(s) Requisitioned."] call FF7_fnc_formatHint;
	} else {
		["Headquarters", "Not enough Supplies."] call FF7_fnc_formatHint;
	};
};

// ---------- _item information ----------

gearItemChange = 
{
	_id = _this select 0;

	switch (baseType) do {
		case "Army":
		{
			switch (_id) do {
			
				case 0:
				{
					// 9mm Magazine
					Multiplier = 0;
				};

				case 1:
				{
					// 5.56mm 30Rnd Magazine
					Multiplier = 0;
				};
				
				case 2:
				{
					// 5.56mm 30Rnd Tracer
					Multiplier = 0;
				};

				case 3:
				{
					// 6.8mm 30Rnd Magazine
					Multiplier = 1.5;
				};
				
				case 4:
				{
					// 6.8mm 30Rnd Tracer
					Multiplier = 1.5;
				};
				
				case 5:
				{
					// 5.56mm 200Rnd Belt
					Multiplier = 5;
				};
				
				case 6:
				{
					// 5.56mm 100Rnd Belt
					Multiplier = 2.5;
				};
				
				case 7:
				{
					// 7.62mm 100Rnd Belt
					Multiplier = 5;
				};
				
				case 8:
				{
					// 7.62mm 50Rnd Belt
					Multiplier = 2.5;
				};
				
				case 9:
				{
					// 7.62mm 20Rnd Magazine
					Multiplier = 1;
				};
				
				case 10:
				{
					// .300 5Rnd Magazine
					Multiplier = 0.25;
				};

				case 11:
				{
					// .50 10Rnd Magazine
					Multiplier = 5;
				};
				
				case 12:
				{
					// M3 Heat
					Multiplier = 10;
				};
				
				case 13:
				{
					// M3 HEDP
					Multiplier = 10;
				};
				
				case 14:
				{
					// M3 HE
					Multiplier = 10;
				};
				
				case 15:
				{
					// M3 SMOKE
					Multiplier = 8;
				};
				
				case 16:
				{
					// Javelin
					Multiplier = 20;
				};
				
				case 17:
				{
					// Stinger
					Multiplier = 20;
				};
				
				case 18:
				{
					// 40mm HE
					Multiplier = 2;
				};
				
				case 19:
				{
					// 40mm 3Rnd HE
					Multiplier = 2;
				};
				
				case 20:
				{
					// 40mm Smoke
					Multiplier = 1;
				};
				
				case 21:
				{
					// 40mm Flare
					Multiplier = 1;
				};
				
				case 22:
				{
					// 40mm HuntIR
					Multiplier = 5;
				};
				
				case 23:
				{
					// M67
					Multiplier = 2;
				};
				
				case 24:
				{
					// RGN
					Multiplier = 1;
				};
				
				case 25:
				{
					// Smoke White
					Multiplier = 1;
				};
				
				case 26:
				{
					// Smoke Blue
					Multiplier = 1;
				};
				
				case 27:
				{
					// Smoke Green
					Multiplier = 1;
				};
				
				case 28:
				{
					// M14 Incendiary
					Multiplier = 2;
				};
				
				case 29:
				{
					// VS-50 AP Mine
					Multiplier = 5;
				};
				
				case 30:
				{
					// M4A1 Slam Mine
					Multiplier = 5;
				};
				
				case 31:
				{
					// M18A1 Claymore Mine
					Multiplier = 5;
				};
				
				case 32:
				{
					// M15 AT Mine
					Multiplier = 10;
				};
				
				case 33:
				{
					// M112 Demolition Block
					Multiplier = 1;
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					// 9mm Magazine
					Multiplier = 0;
				};
				case 1:
				{
					// 5.56mm 30Rnd Magazine
					Multiplier = 0;
				};
				
				case 2:
				{
					// 5.56mm 30Rnd Tracer
					Multiplier = 0;
				};
				
				case 3:
				{
					// 5.56mm 200Rnd Belt
					Multiplier = 5;
				};
				
				case 4:
				{
					// 5.56mm 100Rnd Belt
					Multiplier = 2.5;
				};
				
				case 5:
				{
					// 7.62mm 100Rnd Belt
					Multiplier = 5;
				};
				
				case 6:
				{
					// 7.62mm 50Rnd Belt
					Multiplier = 2.5;
				};
				
				case 7:
				{
					// 7.62mm 20Rnd Magazine
					Multiplier = 1;
				};
				
				case 8:
				{
					// 7.62mm 5Rnd Magazine
					Multiplier = 0.25;
				};

				case 9:
				{
					// .50 10Rnd Magazine
					Multiplier = 5;
				};
				
				case 10:
				{
					// M3 Heat
					Multiplier = 10;
				};
				
				case 11:
				{
					// M3 HEDP
					Multiplier = 10;
				};
				
				case 12:
				{
					// M3 HE
					Multiplier = 10;
				};
				
				case 13:
				{
					// M3 SMOKE
					Multiplier = 8;
				};
				
				case 14:
				{
					// Javelin
					Multiplier = 20;
				};
				
				case 15:
				{
					// Stinger
					Multiplier = 20;
				};
				
				case 16:
				{
					// 40mm HE
					Multiplier = 2;
				};
				
				case 17:
				{
					// 40mm 3Rnd HE
					Multiplier = 2;
				};
				
				case 18:
				{
					// 40mm Smoke
					Multiplier = 1;
				};

				case 19:
				{
					// 40mm Flare
					Multiplier = 1;
				};
				
				case 20:
				{
					// 40mm HuntIR
					Multiplier = 5;
				};
				
				case 21:
				{
					// M67
					Multiplier = 2;
				};
				
				case 22:
				{
					// RGN
					Multiplier = 1;
				};
				
				case 23:
				{
					// Smoke White
					Multiplier = 1;
				};
				
				case 24:
				{
					// Smoke Blue
					Multiplier = 1;
				};
				
				case 25:
				{
					// Smoke Green
					Multiplier = 1;
				};
				
				case 26:
				{
					// M14 Incendiary
					Multiplier = 2;
				};
				
				case 27:
				{
					// VS-50 AP Mine
					Multiplier = 5;
				};
				
				case 28:
				{
					// M4A1 Slam Mine
					Multiplier = 5;
				};
				
				case 29:
				{
					// M18A1 Claymore Mine
					Multiplier = 5;
				};
				
				case 30:
				{
					// M15 AT Mine
					Multiplier = 10;
				};
				
				case 31:
				{
					// M112 Demolition Block
					Multiplier = 1;
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {
			
				case 0:
				{
					// 9mm
					Multiplier = 0;
				};
				
				case 1:
				{
					// 5.56mm 30Rnd
					Multiplier = 0;
				};
				
				case 2:
				{
					// 5.56mm 30Rnd tracer
					Multiplier = 0;
				};

				case 3:
				{
					// 5.56mm  200Rnd Belt
					Multiplier = 6;
				};
				
				case 4:
				{
					// 5.56mm 100Rnd Belt
					Multiplier = 6;
				};
				
				case 5:
				{
					// .338 Belt
					Multiplier = 6.5;
				};
				
				case 6:
				{
					// 7.62mm 20Rnd
					Multiplier = 1;
				};

				case 7:
				{
					// 7.62mm 10Rnd
					Multiplier = 0.5;
				};

				case 8:
				{
					// .50 10Rnd
					Multiplier = 5;
				};

				case 9:
				{
					// M3 Heat
					Multiplier = 10;
				};
				
				case 10:
				{
					// M3 HEDP
					Multiplier = 10;
				};
				
				case 11:
				{
					// M3 HE
					Multiplier = 10;
				};
				
				case 12:
				{
					// M3 SMOKE
					Multiplier = 8;
				};
				
				case 13:
				{
					// Titan AT
					Multiplier = 20;
				};
				
				case 14:
				{
					// Titan AP
					Multiplier = 20;
				};
				
				case 15:
				{
					// Titan AA
					Multiplier = 20;
				};
				
				case 16:
				{
					// 40mm HE
					Multiplier = 2;
				};
				
				case 17:
				{
					// 40mm 3Rnd HE
					Multiplier = 2;
				};
				
				case 18:
				{
					// 40mm Smoke
					Multiplier = 1;
				};
				
				case 19:
				{
					// 40mm Flare
					Multiplier = 1;
				};
				
				case 20:
				{
					// 40mm HuntIR
					Multiplier = 5;
				};
				
				case 21:
				{
					// M67
					Multiplier = 2;
				};
				
				case 22:
				{
					// RGN
					Multiplier = 1;
				};
				
				case 23:
				{
					// Smoke White
					Multiplier = 1;
				};
				
				case 24:
				{
					// Smoke Blue
					Multiplier = 1;
				};
				
				case 25:
				{
					// Smoke Green
					Multiplier = 1;
				};
				
				case 26:
				{
					// M14 Incendiary
					Multiplier = 2;
				};
				
				case 27:
				{
					// VS-50 AP Mine
					Multiplier = 5;
				};
				
				case 28:
				{
					// M4A1 Slam Mine
					Multiplier = 5;
				};
				
				case 29:
				{
					// M18A1 Claymore Mine
					Multiplier = 5;
				};
				
				case 30:
				{
					// M15 AT Mine
					Multiplier = 10;
				};
				
				case 31:
				{
					// M112 Demolition Block
					Multiplier = 1;
				};
			};
		};
		
		case "AAF":
		{
			switch (_id) do {
			
				case 0:
				{
					// 9mm
					Multiplier = 0;
				};
				
				case 1:
				{
					// 5.56mm 30Rnd
					Multiplier = 0;
				};
				
				case 2:
				{
					//5.56mm 30Rnd tracer
					Multiplier = 0;
				};
				
				case 3:
				{
					// 6.5mm Belt
					Multiplier = 6;
				};
				
				case 4:
				{
					// 6.5mm Belt
					Multiplier = 6;
				};
				
				case 5:
				{
					// 9.3mm Belt
					Multiplier = 12;
				};
				
				case 6:
				{
					// 7.62mm 20Rnd
					Multiplier = 1;
				};
				
				case 7:
				{
					// .50 10Rnd Magazine
					Multiplier = 5;
				};
				
				case 8:
				{
					// Titan AT
					Multiplier = 20;
				};
				
				case 9:
				{
					// Titan AP
					Multiplier = 20;
				};
				
				case 10:
				{
					// Titan AA
					Multiplier = 20;
				};
				
				case 11:
				{
					// 40mm HE
					Multiplier = 2;
				};
				
				case 12:
				{
					// 40mm 3Rnd HE
					Multiplier = 2;
				};
				
				case 13:
				{
					// 40mm Smoke
					Multiplier = 1;
				};
				
				case 14:
				{
					// 40mm Flare
					Multiplier = 1;
				};
				
				case 15:
				{
					// 40mm HuntIR
					Multiplier = 5;
				};
				
				case 16:
				{
					// M67
					Multiplier = 2;
				};
				
				case 17:
				{
					// RGN
					Multiplier = 1;
				};
				
				case 18:
				{
					// Smoke White
					Multiplier = 1;
				};
				
				case 19:
				{
					// Smoke Blue
					Multiplier = 1;
				};
				
				case 20:
				{
					// Smoke Green
					Multiplier = 1;
				};
				
				case 21:
				{
					// M14 Incendiary
					Multiplier = 2;
				};
				
				case 22:
				{
					// VS-50 AP Mine
					Multiplier = 5;
				};
				
				case 23:
				{
					// M4A1 Slam Mine
					Multiplier = 5;
				};
				
				case 24:
				{
					// M18A1 Claymore Mine
					Multiplier = 5;
				};
				
				case 25:
				{
					// M15 AT Mine
					Multiplier = 10;
				};
				
				case 26:
				{
					// M112 Demolition Block
					Multiplier = 1;
				};
			};
		};
		
		case "Russia":
		{
			switch (_id) do {
			
				case 0:
				{
					//9mm
					Multiplier = 0;
				};
				
				case 1:
				{
					//5.45mm 30Rnd Tracer
					Multiplier = 0;
				};
				
				case 2:
				{
					//5.45mm 30Rnd Mag
					Multiplier = 0;
				};
				
				case 3:
				{
					//7.62mm 100Rnd Belt
					Multiplier = 5;
				};
				
				case 4:
				{
					//7.62mm 100Rnd Tracer
					Multiplier = 5;
				};
				
				case 5:
				{
					//7.62mm 10Rnd
					Multiplier = 0.5;
				};
				
				case 6:
				{
					//338 Lapua
					Multiplier = 0.5;
				};
				
				case 7:
				{
					//PG 7VL
					Multiplier = 6;
				};
				
				case 8:
				{
					//OG 7V
					Multiplier = 6;
				};
				
				case 9:
				{
					//TBG 7V
					Multiplier = 10;
				};
				
				case 10:
				{
					//PG 7VR
					Multiplier = 10;
				};
				
				case 11:
				{
					//9k38 Igla
					Multiplier = 20;
				};
				
				case 12:
				{
					//40mm HE
					Multiplier = 2;
				};
				
				case 13:
				{
					//40mm Thermobaric
					Multiplier = 4;
				};
				
				case 14:
				{
					//40mm Smoke
					Multiplier = 1;
				};
				
				case 15:
				{
					//40mm Flare
					Multiplier = 1;
				};
				
				case 16:
				{
					//RGO Grenade
					Multiplier = 1;
				};
				
				case 17:
				{
					//RGN Grenade
					Multiplier = 1;
				};
				
				case 18:
				{
					//Smoke White
					Multiplier = 1;
				};
				
				case 19:
				{
					// Smoke Black
					Multiplier = 1;
				};
				
				case 20:
				{
					// VS-50 AP Mine
					Multiplier = 5;
				};
				
				case 21:
				{
					// M4A1 Slam Mine
					Multiplier = 5;
				};
				
				case 22:
				{
					// M18A1 Claymore Mine
					Multiplier = 5;
				};
				
				case 23:
				{
					// M15 AT Mine
					Multiplier = 10;
				};
				
				case 24:
				{
					// M112 Demolition Block
					Multiplier = 1;
				};
			};
		};
	};
};
gearRequisition = 
{
	_id = _this select 0;

	switch (baseType) do {
		case "Army":
		{
			switch (_id) do {
			
				case 0:
				{
					_item = "rhsusf_mag_15Rnd_9x19_JHP";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 1:
				{
					_item = "30Rnd_556x45_Stanag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 2:
				{
					_item = "30Rnd_556x45_Stanag_Tracer_Red";
					_itemType = "magazine";
					call magazineCostCheck;
				};

				case 3:
				{
					_item = "hlc_30rnd_68x43_FMJ";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 4:
				{
					_item = "hlc_30rnd_68x43_Tracer";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 5:
				{
					_item = "rhs_200rnd_556x45_M_SAW";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 6:
				{
					_item = "rhsusf_100Rnd_556x45_soft_pouch";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 7:
				{
					_item = "rhsusf_100Rnd_762x51_m80a1epr";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 8:
				{
					_item = "rhsusf_50Rnd_762x51_m80a1epr";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 9:
				{
					_item = "rhsusf_20Rnd_762x51_m118_special_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 10:
				{
					_item = "rhsusf_5Rnd_300winmag_xm2010";
					_itemType = "magazine";
					call magazineCostCheck;
				};

				case 11:
				{
					_item = "rhsusf_mag_10Rnd_STD_50BMG_M33";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 12:
				{
					_item = "tf47_m3maaws_HEAT";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 13:
				{
					_item = "tf47_m3maaws_HEDP";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 14:
				{
					_item = "tf47_m3maaws_HE";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 15:
				{
					_item = "tf47_m3maaws_SMOKE";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 16:
				{
					_item = "rhs_fgm148_magazine_AT";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 17:
				{
					_item = "rhs_fim92_mag";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 18:
				{
					_item = "1Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 19:
				{
					_item = "3Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 20:
				{
					_item = "1Rnd_Smoke_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 21:
				{
					_item = "UGL_FlareWhite_F";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 22:
				{
					_item = "ACE_HuntIR_M203";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 23:
				{
					_item = "HandGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 24:
				{
					_item = "MiniGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 25:
				{
					_item = "SmokeShell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 26:
				{
					_item = "SmokeShellBlue";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 27:
				{
					_item = "SmokeShellGreen";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 28:
				{
					_item = "ACE_M14";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 29:
				{
					_item = "APERSMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 30:
				{
					_item = "SLAMDirectionalMine_Wire_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 31:
				{
					_item = "ClaymoreDirectionalMine_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 32:
				{
					_item = "ATMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 33:
				{
					_item = "DemoCharge_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
			};
		};
		
		case "Marines":
		{
			switch (_id) do {
			
				case 0:
				{
					_item = "rhsusf_mag_15Rnd_9x19_JHP";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 1:
				{
					_item = "30Rnd_556x45_Stanag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 2:
				{
					_item = "30Rnd_556x45_Stanag_Tracer_Red";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 3:
				{
					_item = "rhs_200rnd_556x45_M_SAW";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 4:
				{
					_item = "rhsusf_100Rnd_556x45_soft_pouch";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 5:
				{
					_item = "rhsusf_100Rnd_762x51_m80a1epr";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 6:
				{
					_item = "rhsusf_50Rnd_762x51_m80a1epr";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 7:
				{
					_item = "rhsusf_20Rnd_762x51_m118_special_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 8:
				{
					_item = "rhsusf_5Rnd_762x51_m118_special_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};

				case 9:
				{
					_item = "rhsusf_mag_10Rnd_STD_50BMG_M33";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 10:
				{
					_item = "tf47_m3maaws_HEAT";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 11:
				{
					_item = "tf47_m3maaws_HEDP";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 12:
				{
					_item = "tf47_m3maaws_HE";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 13:
				{
					_item = "tf47_m3maaws_SMOKE";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 14:
				{
					_item = "rhs_fgm148_magazine_AT";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 15:
				{
					_item = "rhs_fim92_mag";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 16:
				{
					_item = "1Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 17:
				{
					_item = "3Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 18:
				{
					_item = "1Rnd_Smoke_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 19:
				{
					_item = "UGL_FlareWhite_F";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 20:
				{
					_item = "ACE_HuntIR_M203";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 21:
				{
					_item = "HandGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 22:
				{
					_item = "MiniGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 23:
				{
					_item = "SmokeShell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 24:
				{
					_item = "SmokeShellBlue";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 25:
				{
					_item = "SmokeShellGreen";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 26:
				{
					_item = "ACE_M14";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 27:
				{
					_item = "APERSMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 28:
				{
					_item = "SLAMDirectionalMine_Wire_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 29:
				{
					_item = "ClaymoreDirectionalMine_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 30:
				{
					_item = "ATMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 31:
				{
					_item = "DemoCharge_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
			};
		};
		
		case "Nato":
		{
			switch (_id) do {
			
				case 0:
				{
					_item = "16Rnd_9x21_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 1:
				{
					_item = "30Rnd_556x45_Stanag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 2:
				{
					_item = "30Rnd_556x45_Stanag_Tracer_Red";
					_itemType = "magazine";
					call magazineCostCheck;
				};

				case 3:
				{
					_item = "rhs_200rnd_556x45_M_SAW";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 4:
				{
					_item = "rhsusf_100Rnd_556x45_soft_pouch";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 5:
				{
					_item = "130Rnd_338_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 6:
				{
					_item = "20Rnd_762x51_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};

				case 7:
				{
					_item = "rhsusf_10Rnd_762x51_m118_special_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};

				case 8:
				{
					_item = "rhsusf_mag_10Rnd_STD_50BMG_M33";
					_itemType = "magazine";
					call magazineCostCheck;
				};

				case 9:
				{
					_item = "tf47_m3maaws_HEAT";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 10:
				{
					_item = "tf47_m3maaws_HEDP";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 11:
				{
					_item = "tf47_m3maaws_HE";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 12:
				{
					_item = "tf47_m3maaws_SMOKE";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 13:
				{
					_item = "Titan_AT";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 14:
				{
					_item = "Titan_AP";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 15:
				{
					_item = "Titan_AA";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 16:
				{
					_item = "1Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 17:
				{
					_item = "3Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 18:
				{
					_item = "1Rnd_Smoke_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 19:
				{
					_item = "UGL_FlareWhite_F";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 20:
				{
					_item = "ACE_HuntIR_M203";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 21:
				{
					_item = "HandGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 22:
				{
					_item = "MiniGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 23:
				{
					_item = "SmokeShell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 24:
				{
					_item = "SmokeShellBlue";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 25:
				{
					_item = "SmokeShellGreen";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 26:
				{
					_item = "ACE_M14";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 27:
				{
					_item = "APERSMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 28:
				{
					_item = "SLAMDirectionalMine_Wire_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 29:
				{
					_item = "ClaymoreDirectionalMine_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 30:
				{
					_item = "ATMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 31:
				{
					_item = "DemoCharge_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
			};
		};
		
		case "AAF":
		{
			switch (_id) do {
			
				case 0:
				{
					_item = "16Rnd_9x21_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 1:
				{
					_item = "30Rnd_556x45_Stanag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 2:
				{
					_item = "30Rnd_556x45_Stanag_Tracer_Yellow";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 3:
				{
					_item = "200Rnd_65x39_cased_Box";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 4:
				{
					_item = "200Rnd_65x39_cased_Box_Tracer";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 5:
				{
					_item = "150Rnd_93x64_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 6:
				{
					_item = "20Rnd_762x51_Mag";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 7:
				{
					_item = "rhsusf_mag_10Rnd_STD_50BMG_M33";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 8:
				{
					_item = "Titan_AT";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 9:
				{
					_item = "Titan_AP";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 10:
				{
					_item = "Titan_AA";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 11:
				{
					_item = "1Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 12:
				{
					_item = "3Rnd_HE_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 13:
				{
					_item = "1Rnd_Smoke_Grenade_shell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 14:
				{
					_item = "UGL_FlareWhite_F";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 15:
				{
					_item = "ACE_HuntIR_M203";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 16:
				{
					_item = "HandGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 17:
				{
					_item = "MiniGrenade";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 18:
				{
					_item = "SmokeShell";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 19:
				{
					_item = "SmokeShellBlue";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 20:
				{
					_item = "SmokeShellGreen";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 21:
				{
					_item = "ACE_M14";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 22:
				{
					_item = "APERSMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 23:
				{
					_item = "SLAMDirectionalMine_Wire_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 24:
				{
					_item = "ClaymoreDirectionalMine_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 25:
				{
					_item = "ATMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 26:
				{
					_item = "DemoCharge_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
			};
		};
		
		case "Russia":
		{
			switch (_id) do {
			
				case 0:
				{
					_item = "rhs_mag_9x18_8_57N181S";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 1:
				{
					_item = "rhs_30Rnd_545x39_7N10_AK";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 2:
				{
					_item = "rhs_30Rnd_545x39_AK_green";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 3:
				{
					_item = "rhs_100Rnd_762x54mmR";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 4:
				{
					_item = "rhs_100Rnd_762x54mmR_green";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 5:
				{
					_item = "rhs_10Rnd_762x54mmR_7N1";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 6:
				{
					_item = "rhs_5Rnd_338lapua_t5000";
					_itemType = "magazine";
					call magazineCostCheck;
				};
				
				case 7:
				{
					_item = "rhs_rpg7_PG7V_mag";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 8:
				{
					_item = "rhs_rpg7_OG7V_mag";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 9:
				{
					_item = "rhs_rpg7_TBG7V_mag";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 10:
				{
					_item = "rhs_rpg7_PG7VR_mag";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 11:
				{
					_item = "rhs_mag_9k38_rocket";
					_itemType = "launcher";
					call magazineCostCheck;
				};
				
				case 12:
				{
					_item = "rhs_VOG25";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 13:
				{
					_item = "rhs_VG40TB";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 14:
				{
					_item = "rhs_VG40MD_White";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 15:
				{
					_item = "rhs_VG40OP_white";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 16:
				{
					_item = "rhs_mag_rgo";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 17:
				{
					_item = "rhs_mag_rgn";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 18:
				{
					_item = "rhs_mag_rdg2_white";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 19:
				{
					_item = "rhs_mag_rdg2_black";
					_itemType = "grenade";
					call magazineCostCheck;
				};
				
				case 20:
				{
					_item = "APERSMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 21:
				{
					_item = "SLAMDirectionalMine_Wire_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 22:
				{
					_item = "ClaymoreDirectionalMine_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 23:
				{
					_item = "ATMine_Range_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
				
				case 24:
				{
					_item = "DemoCharge_Remote_Mag";
					_itemType = "explosive";
					call magazineCostCheck;
				};
			};
		};
	};
};

_items = [];

switch (baseType) do {
	case "Army":
	{
		_items =	[
			"9mm 15Rnd Magazine",
			"5.56mm 30Rnd Magazine",
			"5.56mm 30Rnd Tracer",
			"6.8mm 30Rnd Magazine",
			"6.8mm 30Rnd Tracer",
			"5.56mm 200Rnd Belt",
			"5.56mm 100Rnd Belt",
			"7.62mm 100Rnd Belt",
			"7.62mm 50Rnd Belt",
			"7.62mm 20Rnd Magazine",
			".300 5Rnd Magazine",
			".50BMG 10Rnd Magazine",
			"FFV751 HEAT",
			"FFV502 HEDP",
			"FFV441 HE",
			"FFV469 SMOKE",
			"Javelin AT",
			"Stinger AA",
			"40mm HE",
			"40mm 3Rnd HE",
			"40mm Smoke",
			"40mm Flare",
			"40mm HuntIR",
			"M67 Frag Grenade",
			"RGN Grenade",
			"Smoke Grenade (White)",
			"Smoke Grenade (Blue)",
			"Smoke Grenade (Green)",
			"M14 Incendiary Grenade",
			"VS-50 AP Mine",
			"M4A1 Slam Mine",
			"M18A1 Claymore Mine",
			"M15 AT Mine",
			"M112 Demolition Block"
		];
	};
	
	case "Marines":
	{
		_items =	[
			"9mm 15Rnd Magazine",
			"5.56mm 30Rnd Magazine",
			"5.56mm 30Rnd Tracer",
			"5.56mm 200Rnd Belt",
			"5.56mm 100Rnd Belt",
			"7.62mm 100Rnd Belt",
			"7.62mm 50Rnd Belt",
			"7.62mm 20Rnd Magazine",
			"7.62mm 5Rnd Magazine",
			".50BMG 10Rnd Magazine",
			"FFV751 HEAT",
			"FFV502 HEDP",
			"FFV441 HE",
			"FFV469 SMOKE",
			"Javelin AT",
			"Stinger AA",
			"40mm HE",
			"40mm 3Rnd HE",
			"40mm Smoke",
			"40mm Flare",
			"40mm HuntIR",
			"M67 Frag Grenade",
			"RGN Grenade",
			"Smoke Grenade (White)",
			"Smoke Grenade (Blue)",
			"Smoke Grenade (Green)",
			"M14 Incendiary Grenade",
			"VS-50 AP Mine",
			"M4A1 Slam Mine",
			"M18A1 Claymore Mine",
			"M15 AT Mine",
			"M112 Demolition Block"
		];	
	};
	
	case "Nato":
	{
		_items =	[
			"9mm 16Rnd Magazine",
			"5.56mm 30Rnd Magazine",
			"5.56mm 30Rnd Tracer",
			"5.56mm 200Rnd Belt",
			"5.56mm 100Rnd Belt",
			".338 130Rnd Belt",
			"7.62mm 20Rnd Magazine",
			"7.62mm 10Rnd Magazine",
			".50BMG 10Rnd Magazine",
			"FFV751 HEAT",
			"FFV502 HEDP",
			"FFV441 HE",
			"FFV469 SMOKE",
			"Titan AT",
			"Titan AP",
			"Titan AA",
			"40mm HE",
			"40mm 3Rnd HE",
			"40mm Smoke",
			"40mm Flare",
			"40mm HuntIR",
			"M67 Frag Grenade",
			"RGN Grenade",
			"Smoke Grenade (White)",
			"Smoke Grenade (Blue)",
			"Smoke Grenade (Green)",
			"M14 Incendiary Grenade",
			"VS-50 AP Mine",
			"M4A1 Slam Mine",
			"M18A1 Claymore Mine",
			"M15 AT Mine",
			"M112 Demolition Block"
		];	
	};
	
	case "AAF":
	{
		_items =	[
			"9mm 16Rnd Magazine",
			"5.56mm 30Rnd Magazine",
			"5.56mm 30Rnd Tracer",
			"6.5mm 200Rnd Belt",
			"6.5mm 200Rnd Tracer",
			"9.3mm 150Rnd Belt",
			"7.62mm 20Rnd Magazine",
			".50BMG 10Rnd Magazine",
			"Titan AT",
			"Titan AP",
			"Titan AA",
			"40mm HE",
			"40mm 3Rnd HE",
			"40mm Smoke",
			"40mm Flare",
			"40mm HuntIR",
			"M67 Frag Grenade",
			"RGN Grenade",
			"Smoke Grenade (White)",
			"Smoke Grenade (Blue)",
			"Smoke Grenade (Green)",
			"M14 Incendiary Grenade",
			"VS-50 AP Mine",
			"M4A1 Slam Mine",
			"M18A1 Claymore Mine",
			"M15 AT Mine",
			"M112 Demolition Block"
		];	
	};
	
	case "Russia":
	{
		_items =	[
			"9mm 8Rnd Magazine",
			"5.45mm 30Rnd Magazine",
			"5.45mm 30Rnd Tracer",
			"7.62mm 100Rnd Belt",
			"7.62mm 100Rnd Tracer",
			"7.62mm 10Rnd Magazine",
			".338 5Rnd Magazine",
			"PG-7VL Rocket",
			"OG-7V Rocket",
			"TBG-7V Rocket",
			"PG-7VR Rocket",
			"9k38 Igla",
			"40mm VOG-25 HE",
			"40mm VG-40 TB",
			"40mm VG-40 MD Smoke",
			"40mm VG-40 OP Flare",
			"RGO Grenade",
			"RGN Grenade",
			"Smoke Grenade (White)",
			"Smoke Grenade (Black)",
			"VS-50 AP Mine",
			"M4A1 Slam Mine",
			"M18A1 Claymore Mine",
			"M15 AT Mine",
			"M112 Demolition Block"
		];	
	};
};

// ---------- Create dialog ----------

disableSerialization;

createDialog "InA_Gear_Dialog";

waitUntil {!isNull (findDisplay 9200);};

_ctrl = (findDisplay 9200) displayCtrl 1500;

{
	_ctrl lbAdd _x;
} forEach _items;

_slider = (findDisplay 9200) displayCtrl 1900;
_slider sliderSetRange [1, 50];
_slider slidersetSpeed [1, 1];
Amount = 1;
_ctrl lbSetCurSel 0;