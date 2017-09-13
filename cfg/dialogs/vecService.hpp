class InA_vehicleService_Dialog
{
	idd = 6999;
	movingenable = false;
	
	class controls
	{
		
		class InA_VehicleService_Background: RscFrame
		{
			idc = -1;
			x = 0.376027 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.165298 * safezoneW;
			h = 0.285974 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_VehicleService_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.087992 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};
		class InA_VehicleService_Frame_2: RscFrame
		{
			idc = -1;
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.087992 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_VehicleService_Button_1: RscButton
		{
			idc = 1600;
			text = "Scrap";
			x = 0.396689 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[parkedVehicle] remoteExec ['InA_fnc_vehicleDecommission', 2]; closeDialog 0";
		};
		class InA_VehicleService_Button_2: RscButton
		{
			idc = 1601;
			text = "All";
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[parkedVehicle,true] remoteExec ['InA_fnc_vehicleRepair', 2]; closeDialog 0";
		};
		class InA_VehicleService_Button_3: RscButton
		{
			idc = 1602;
			text = "Repair";
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[parkedVehicle] remoteExec ['InA_fnc_vehicleRepair', 2]; closeDialog 0";
		};
		class InA_VehicleService_Button_4: RscButton
		{
			idc = 1603;
			text = "Refuel";
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[parkedVehicle] remoteExec ['InA_fnc_vehicleRefuel', 2]; closeDialog 0";
		};
		class InA_VehicleService_Button_5: RscButton
		{
			idc = 1604;
			text = "Rearm";
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.456004 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[parkedVehicle] remoteExec ['InA_fnc_vehicleRearm', 2]; closeDialog 0";
		};
		class InA_VehicleService_Button_6: RscButton
		{
			idc = 1605;
			text = "Close";
			x = 0.396689 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_VehicleService_InputText_1: RscText
		{
			idc = 1000;
			text = "0";
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_InputText_2: RscText
		{
			idc = 1001;
			text = "0";
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.456004 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_InputText_3: RscText
		{
			idc = 1002;
			text = "0";
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_Text_1: RscText
		{
			idc = -1;
			text = "Supplies";
			x = 0.489669 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_Text_2: RscText
		{
			idc = -1;
			text = "Fuel";
			x = 0.489669 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_Text_3: RscText
		{
			idc = -1;
			text = "Supplies";
			x = 0.489669 * safezoneW + safezoneX;
			y = 0.456004 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_Header: RscFrame
		{
			idc = -1;
			x = 0.376026 * safezoneW + safezoneX;
			y = 0.291019 * safezoneH + safezoneY;
			w = 0.165298 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_VehicleService_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_VehicleService_SubHeader_2: RscFrame
		{
			idc = -1;
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_VehicleService_Text_4: RscText
		{
			idc = -1;
			text = "Vehicle Service Menu";
			x = 0.376026 * safezoneW + safezoneX;
			y = 0.291019 * safezoneH + safezoneY;
			w = 0.0826491 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_Text_5: RscText
		{
			idc = -1;
			text = "Service Options";
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_VehicleService_Text_6: RscText
		{
			idc = -1;
			text = "Cost";
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};