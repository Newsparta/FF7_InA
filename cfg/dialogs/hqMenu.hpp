class InA_HQ_Dialog
{
	idd = 9100;
	movingenable = false;
	
	class controls
	{
		class InA_HQ_Background: RscFrame
		{
			idc = -1;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.351968 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_HQ_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.21998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};
		class InA_HQ_Frame_2: RscFrame
		{
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.087992 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};
		class InA_HQ_Frame_3: RscFrame
		{
			idc = -1;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.065994 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_HQ_Frame_4: RscFrame
		{
			idc = -1;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_HQ_Button_1: RscButton
		{
			idc = 1600;
			text = "Mainland";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "if !(InA_sitrep) exitWith {['Headquarters', 'Situation report has already been given recently..'] call FF7_fnc_formatHint};['1'] remoteExec ['InA_fnc_sitrep', 2, false];openMap true;";
		};/*
		class InA_HQ_Button_2: RscButton
		{
			idc = 1601;
			text = "Southern";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "if !(InA_sitrep) exitWith {['Headquarters', 'Situation report has already been given recently..'] call FF7_fnc_formatHint};['2'] remoteExec ['InA_fnc_sitrep', 2, false];openMap true;";
		};
		class InA_HQ_Button_3: RscButton
		{
			idc = 1602;
			text = "Western";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "if !(InA_sitrep) exitWith {['Headquarters', 'Situation report has already been given recently..'] call FF7_fnc_formatHint};['3'] remoteExec ['InA_fnc_sitrep', 2, false];openMap true;";
		};*/
		class InA_HQ_Button_4: RscButton
		{
			idc = 1603;
			text = "Submit";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] remoteExec ['InA_fnc_afterAction', 2];";
		};
		class InA_HQ_Button_5: RscButton
		{
			idc = 1604;
			text = "Select";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.598991 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "InA_Warning_ID = lbCurSel 1500; createDialog 'InA_Warning_Dialog';";
		};
		class InA_HQ_Button_6: RscButton
		{
			idc = 1605;
			text = "Time";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'functions\InA\Auxiliary\timerDialog.sqf';";
		};
		class InA_HQ_Button_7: RscButton
		{
			idc = 1606;
			text = "Close";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.620989 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_HQ_Button_8: RscButton
		{
			idc = 1607;
			text = "Save";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] remoteExec ['InA_fnc_save', 2];";
		};
		class InA_HQ_Button_9: RscButton
		{
			idc = 1604;
			text = "Reset DB";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.598991 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] remoteExec ['InA_fnc_defaultDB', 2];";
		};
		class InA_HQ_Listbox_1: RscListbox
		{
			idc = 1500;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.197982 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_HQ_InputText_1: RscText
		{
			idc = 1000;
			text = "0";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_InputText_2: RscText
		{
			idc = 1001;
			text = "0";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_InputText_3: RscText
		{
			idc = 1002;
			text = "0";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_InputText_4: RscText
		{
			idc = 1003;
			text = "00:00";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_1: RscText
		{
			idc = -1;
			text = "Logistics";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_2: RscText
		{
			idc = -1;
			text = "Fuel";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_3: RscText
		{
			idc = -1;
			text = "Supplies";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Header: RscFrame
		{
			idc = -1;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_2: RscFrame
		{
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_3: RscFrame
		{
			idc = -1;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_4: RscFrame
		{
			idc = -1;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_SubHeader_5: RscFrame
		{
			idc = -1;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_Text_4: RscText
		{
			idc = -1;
			text = "Headquarters";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_5: RscText
		{
			idc = -1;
			text = "Situation Report";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_6: RscText
		{
			idc = -1;
			text = "AAR";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_7: RscText
		{
			idc = -1;
			text = "Base";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_8: RscText
		{
			idc = -1;
			text = "Inventory";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Text_9: RscText
		{
			idc = -1;
			text = "Supply Drop";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.021998 * safezoneH;
		};	
	};
};
