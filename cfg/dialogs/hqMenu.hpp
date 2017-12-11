class InA_HQ_Dialog
{
	idd = 9100;
	movingenable = false;
	
	class controls
	{

		class InA_HQ_Background: RscFrame
		{
			idc = -1;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.356987 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.308028 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_HQ_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.400991 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.066006 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};
		class InA_HQ_Frame_2: RscFrame
		{
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.400991 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.121011 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};
		class InA_HQ_Frame_3: RscFrame
		{
			idc = -1;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.400991 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.066006 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_HQ_Frame_4: RscFrame
		{
			idc = -1;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.511001 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_HQ_Frame_5: RscFrame
		{
			idc = -1;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.511001 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.066006 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};
		class InA_HQ_Button_1: RscButton
		{
			idc = 1600;
			text = "Request";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.411992 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "if !(InA_sitrep) exitWith {['Headquarters', 'Situation report has already been given recently..'] call FF7_fnc_formatHint};[] remoteExec ['InA_fnc_sitrep', 2, false];openMap true;closeDialog 0;";
		};
		class InA_HQ_Button_2: RscButton
		{
			idc = 1601;
			text = "Close";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.599009 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_HQ_Button_3: RscButton
		{
			idc = 1602;
			text = "Save";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.411992 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] remoteExec ['InA_fnc_save', 2];";
		};
		class InA_HQ_Button_4: RscButton
		{
			idc = 1603;
			text = "Reset";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.466997 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] remoteExec ['InA_fnc_defaultDB', 2];";
		};
		class InA_HQ_Button_5: RscButton
		{
			idc = 1604;
			text = "Select";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.577007 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "InA_Warning_ID = lbCurSel 1500; createDialog 'InA_Warning_Dialog';";
		};
		class InA_HQ_Button_6: RscButton
		{
			idc = 1605;
			text = "Set";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.522002 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'functions\InA\Dialogs\timerDialog.sqf';";
		};
		class InA_HQ_Listbox_1: RscListbox
		{
			idc = 1500;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.400991 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.154014 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_HQ_InputText_1: RscText
		{
			idc = 1000;
			text = "0";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.400991 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_InputText_2: RscText
		{
			idc = 1001;
			text = "0";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.422993 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_InputText_3: RscText
		{
			idc = 1002;
			text = "0";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.444995 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_InputText_4: RscText
		{
			idc = 1003;
			text = "00:00";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.511001 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_1: RscText
		{
			idc = -1;
			text = "Logistics";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.400991 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_2: RscText
		{
			idc = -1;
			text = "Fuel";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.422993 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_3: RscText
		{
			idc = -1;
			text = "Supplies";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.444995 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Header: RscFrame
		{
			idc = -1;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.334985 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_2: RscFrame
		{
			idc = -1;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.488999 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_3: RscFrame
		{
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_4: RscFrame
		{
			idc = -1;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_5: RscFrame
		{
			idc = -1;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_6: RscFrame
		{
			idc = -1;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.488999 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_Text_4: RscText
		{
			idc = -1;
			text = "Headquarters";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.334985 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_5: RscText
		{
			idc = -1;
			text = "Situation Report";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_6: RscText
		{
			idc = -1;
			text = "Time of Day";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.488999 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_7: RscText
		{
			idc = -1;
			text = "Database";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_8: RscText
		{
			idc = -1;
			text = "Faction";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_9: RscText
		{
			idc = -1;
			text = "Inventory";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
		};
		class InA_HQ_Text_10: RscText
		{
			idc = -1;
			text = "Supply Drop";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.488999 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022002 * safezoneH;
		};
	};
};
