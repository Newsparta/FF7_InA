
class InA_Timer_Dialog
{
	idd = 7999;
	movingenable = false;
	
	class controls
	{
		class InA_Timer_Background: RscFrame
		{
			idc = -1;
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.285974 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_Timer_Listbox: RscListbox
		{
			idc = 1500;
			x = 0.448344 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.10999 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Timer_Button_1: RscButton
		{
			idc = 1600;
			text = "Change"; //--- ToDo: Localize;
			x = 0.489669 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[[lbCurSel 1500], 'functions\InA\Dialogs\timer.sqf'] remoteExec ['execVM', 2]; closeDialog 0";
		};
		class InA_Timer_Button_2: RscButton
		{
			idc = 1601;
			text = "Close"; //--- ToDo: Localize;
			x = 0.448344 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_Timer_Header: RscFrame
		{
			idc = -1;
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Timer_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.448344 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Timer_Text_1: RscText
		{
			idc = -1;
			text = "Change Time"; //--- ToDo: Localize;
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};
