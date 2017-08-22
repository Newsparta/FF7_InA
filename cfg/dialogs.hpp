// ---------- Timer ----------

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
			action = "[[lbCurSel 1500], 'functions\InA\Auxiliary\timer.sqf'] remoteExec ['execVM', 2]; closeDialog 0";
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

// ---------- HQ Menu ----------

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
			action = "if !(InA_sitrep) exitWith {['Headquarters', 'Situation report has already been given recently...'] call FF7_fnc_formatHint};['1'] remoteExec ['InA_fnc_sitrep', 2, false];openMap true;";
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
			action = "if !(InA_sitrep) exitWith {['Headquarters', 'Situation report has already been given recently...'] call FF7_fnc_formatHint};['2'] remoteExec ['InA_fnc_sitrep', 2, false];openMap true;";
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
			action = "if !(InA_sitrep) exitWith {['Headquarters', 'Situation report has already been given recently...'] call FF7_fnc_formatHint};['3'] remoteExec ['InA_fnc_sitrep', 2, false];openMap true;";
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

// ---------- HQ Warning ----------

class InA_Warning_Dialog
{
	idd = 9101;
	movingenable = false;
	
	class controls
	{

		class InA_HQ_Warning_Dialog_Background: RscFrame
		{
			idc = 1800;
			x = 0.407022 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.175629 * safezoneW;
			h = 0.175984 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_HQ_Warning_Dialog_Button_1: RscButton
		{
			idc = 1600;
			text = "No";
			x = 0.438013 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_HQ_Warning_Dialog_Button_2: RscButton
		{
			idc = 1601;
			text = "Yes";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[[InA_Warning_ID], 'defines\Themes\baseHandler.sqf'] remoteExec ['execVM', 2]; closeDialog 0;";
		};
		class InA_HQ_Warning_Dialog_Header: RscFrame
		{
			idc = 1801;
			x = 0.40702 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.175629 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_HQ_Warning_Dialog_Text_1: RscText
		{
			idc = 1000;
			text = "WARNING: This action resets all progress";
			x = 0.417351 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.154967 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_HQ_Warning_Dialog_Text_2: RscText
		{
			idc = 1001;
			text = "Are you sure?";
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};

// ---------- Uniform Menu ----------

class InA_Uniform_Dialog
{
	idd = 9201;
	movingenable = false;
	
	class controls
	{
		class InA_Uniform_Dialog_Background: RscFrame
		{
			idc = 1800;
			x = 0.365695 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.258278 * safezoneW;
			h = 0.087992 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_Uniform_Dialog_Button_1: RscButton
		{
			idc = 1600;
			text = "Close";
			x = 0.376026 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_Uniform_Dialog_Button_2: RscButton
		{
			idc = 1601;
			text = "Uniforms";
			x = 0.438013 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'defines\Gear\uniformDialog.sqf';";
		};
		class InA_Uniform_Dialog_Button_3: RscButton
		{
			idc = 1602;
			text = "Vests";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'defines\Gear\vestDialog.sqf';";
		};
		class InA_Uniform_Dialog_Button_4: RscButton
		{
			idc = 1603;
			text = "Helmets";
			x = 0.561987 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'defines\Gear\helmetDialog.sqf';";
		};
		class InA_Uniform_Dialog_Header: RscFrame
		{
			idc = 1801;
			x = 0.365695 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.258278 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Uniform_Dialog_Text_1: RscText
		{
			idc = 1000;
			text = "Uniform Menu";
			x = 0.365695 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};

// ---------- Uniform Equip Menu ----------

class InA_UniformEquip_Dialog
{
	idd = 9202;
	movingenable = false;
	
	class controls
	{
		class InA_UniformEquip_Background: RscFrame
		{
			idc = -1;
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.134305 * safezoneW;
			h = 0.307972 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_UniformEquip_Listbox: RscListbox
		{
			idc = 1500;
			x = 0.438013 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.197982 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_UniformEquip_Button_1: RscButton
		{
			idc = 1600;
			text = "Equip";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.576993 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[lbCurSel 1500] call equipUniform;closeDialog 0";
		};
		class InA_UniformEquip_Button_2: RscButton
		{
			idc = 1601;
			text = "Close";
			x = 0.438013 * safezoneW + safezoneX;
			y = 0.576993 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_UniformEquip_Header: RscFrame
		{
			idc = -1;
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.134305 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_UniformEquip_Text_1: RscText
		{
			idc = -1;
			text = "Uniform Equip Menu";
			x = 0.427682 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.0826491 * safezoneW;
			h = 0.021998 * safezoneH;
		};	
	};
};

// ---------- Gear Menu ----------

class InA_Gear_Dialog
{
	idd = 9200;
	movingenable = false;
	
	class controls
	{
		class InA_Gear_Background: RscFrame
		{
			idc = -1;
			x = 0.334702 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.330596 * safezoneW;
			h = 0.285974 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_Gear_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Gear_Frame_2: RscFrame
		{
			idc = -1;
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Gear_Frame_3: RscFrame
		{
			idc = -1;
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.510999 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Gear_Listbox: RscListbox
		{
			idc = 1500;
			x = 0.345033 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.197982 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			onLBSelChanged = "[lbCurSel 1500] spawn gearItemChange;[lbCurSel 1500] spawn lbSelCost;";
		};
		class InA_Gear_Button_1: RscButton
		{
			idc = 1600;
			text = "Requisition";
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[lbCurSel 1500] spawn gearRequisition;";
		};
		class InA_Gear_Button_2: RscButton
		{
			idc = 1601;
			text = "Close";
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_Gear_Slider: RscSlider
		{
			idc = 1900;
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			onSliderPosChanged = "[_this select 1] spawn gearSliderChange";
		};
		class InA_Gear_OutputText_1: RscText
		{
			idc = 1000;
			text = "1";
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_OutputText_2: RscText
		{
			idc = 1001;
			text = "0";
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_InputText_1: RscText
		{
			idc = 1002;
			text = "0";
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.510999 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_Header: RscFrame
		{
			idc = -1;
			x = 0.334702 * safezoneW + safezoneX;
			y = 0.291019 * safezoneH + safezoneY;
			w = 0.330596 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Gear_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.345033 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Gear_SubHeader_2: RscFrame
		{
			idc = -1;
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Gear_SubHeader_3: RscFrame
		{
			idc = -1;
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Gear_SubHeader_4: RscFrame
		{
			idc = -1;
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Gear_Text_1: RscText
		{
			idc = -1;
			text = "Amount";
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_Text_2: RscText
		{
			idc = -1;
			text = "Cost";
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_Text_3: RscText
		{
			idc = -1;
			text = "Supplies";
			x = 0.613642 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_Text_4: RscText
		{
			idc = -1;
			text = "Stockpile";
			x = 0.59298 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_Text_5: RscText
		{
			idc = -1;
			text = "Supplies";
			x = 0.613642 * safezoneW + safezoneX;
			y = 0.510999 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_Text_6: RscText
		{
			idc = -1;
			text = "Items";
			x = 0.345033 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Gear_Text_7: RscText
		{
			idc = -1;
			text = "Gear Menu";
			x = 0.334702 * safezoneW + safezoneX;
			y = 0.291019 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};

// ---------- Gear Open Menu ----------

class InA_Gear_Open_Dialog
{
	idd = 9300;
	movingenable = false;
	
	class controls
	{
		class InA_Gear_Open_Background: RscFrame
		{
			idc = -1;
			x = 0.324371 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.340928 * safezoneW;
			h = 0.10999 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};/*
		class InA_Gear_Open_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.334702 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.043996 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};*/
		class InA_Gear_Open_Button_1: RscButton
		{
			idc = 1600;
			text = "Weapons";
			x = 0.417351 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'defines\Gear\weaponDialog.sqf';[]execVM 'functions\InA\Gear\resourceUpdate.sqf';";
		};
		class InA_Gear_Open_Button_2: RscButton
		{
			idc = 1601;
			text = "Munitions";
			x = 0.479338 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'defines\Gear\ammoDialog.sqf';[]execVM 'functions\InA\Gear\resourceUpdate.sqf';";
		};
		class InA_Gear_Open_Button_3: RscButton
		{
			idc = 1602;
			text = "Misc.";
			x = 0.541324 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[]execVM 'defines\Gear\miscDialog.sqf';[]execVM 'functions\InA\Gear\resourceUpdate.sqf';";
		};/*
		class InA_Gear_Open_Button_4: RscButton
		{
			idc = 1603;
			text = "Yes";
			x = 0.334702 * safezoneW + safezoneX;
			y = 0.478002 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "gearRestricted = true;publicVariableServer 'gearRestricted';['Headquarters', 'Gear access is now restricted.'] call FF7_fnc_formatHint;";
		};
		class InA_Gear_Open_Button_5: RscButton
		{
			idc = 1604;
			text = "No";
			x = 0.376026 * safezoneW + safezoneX;
			y = 0.478002 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "gearRestricted = false;publicVariableServer 'gearRestricted';['Headquarters', 'Gear access is now unrestricted.'] call FF7_fnc_formatHint;";
		};*/
		class InA_Gear_Open_Button_6: RscButton
		{
			idc = 1605;
			text = "Close";
			x = 0.603311 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_Gear_Open_Header: RscFrame
		{
			idc = -1;
			x = 0.324371 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.340928 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};/*
		class InA_Gear_Open_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.334702 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};*/
		class InA_Gear_Open_Text_1: RscText
		{
			idc = -1;
			text = "Gear Menu";
			x = 0.324371 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
		};/*
		class InA_Gear_Open_Text_2: RscText
		{
			idc = -1;
			text = "Restrict Access?";
			x = 0.334702 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.072318 * safezoneW;
			h = 0.021998 * safezoneH;
		};*/
	};
};

// ---------- Civilian Interaction ----------

class InA_Civ_Dialog
{
	idd = 8101;
	movingenable = true;
	
	class controls
	{
		
		class InA_Civ_Background: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.10999 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_Civ_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Civ_Button_1: RscButton
		{
			idc = 1600;
			text = "Disengage";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_Civ_Button_2: RscButton
		{
			idc = 1601;
			text = "Converse";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[interimCiv] spawn InA_fnc_civConverse;closeDialog 0";
		};
		class InA_Civ_InputText_1: RscText
		{
			idc = 1000;
			text = "none";
			//x = 0.489687 * safezoneW + safezoneX;
			x = 0.495 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Civ_Text_1: RscText
		{
			idc = -1;
			text = "Disposition:";
			//x = 0.438125 * safezoneW + safezoneX;
			x = 0.445 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Civ_Header: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Civ_Text_2: RscText
		{
			idc = -1;
			text = "Civilian Interaction";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};

// ---------- Civilian Interaction Conversation ----------

class InA_CivConverse_Dialog
{
	idd = 8102;
	movingenable = true;
	
	class controls
	{
		class InA_CivConverse_Background: RscFrame
		{
			idc = -1;
			x = 0.417499 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.417962 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_CivConverse_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.576993 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.153986 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.1};
		};
		class InA_CivConverse_Frame_2: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.153986 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_CivConverse_Button_1: RscButton
		{
			idc = 1600;
			text = "Sympathize";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.598991 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "responded = true;response = 'Sympathize'";
		};
		class InA_CivConverse_Button_2: RscButton
		{
			idc = 1601;
			text = "Persuade";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.598991 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "responded = true;response = 'Persuade'";
		};
		class InA_CivConverse_Button_3: RscButton
		{
			idc = 1602;
			text = "Intimidate";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.664985 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "responded = true;response = 'Intimidate'";
		};
		class InA_CivConverse_Button_4: RscButton
		{
			idc = 1603;
			text = "Question";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.664985 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "responded = true;response = 'Question'";
		};
		class InA_CivConverse_InputText_1: RscStructuredText
		{
			idc = 1100;
			text = "none";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.153986 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_CivConverse_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_CivConverse_SubHeader_2: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.554995 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_CivConverse_Header: RscFrame
		{
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_CivConverse_Text_1: RscText
		{
			idc = -1;
			text = "Conversation";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_CivConverse_Text_2: RscText
		{
			idc = -1;
			text = "Civilian:";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_CivConverse_Text_3: RscText
		{
			idc = -1;
			text = "Responses";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.554995 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.021998 * safezoneH;
		};		
	};
};

// ---------- Intel ----------

class InA_Intel_Dialog
{
	idd = 8200;
	movingenable = true;
	
	class controls
	{
		class InA_Intel_Background: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.32997 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_Intel_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Intel_Frame_2: RscFrame
		{
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.197982 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Intel_InputText_1: RscText
		{
			idc = 1000;
			text = "none";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Intel_InputText_2: RscStructuredText
		{
			idc = 1100;
			text = "-";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.065994 * safezoneH;
		};
		class InA_Intel_InputText_3: RscStructuredText
		{
			idc = 1101;
			text = "-";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.065994 * safezoneH;
		};
		class InA_Intel_InputText_4: RscStructuredText
		{
			idc = 1102;
			text = "-";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.554995 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.065994 * safezoneH;
		};
		class InA_Intel_Header: RscFrame
		{
			idc = -1;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.291019 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Intel_SubHeader_1: RscFrame
		{
			idc = -1;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Intel_SubHeader_2: RscFrame
		{
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Intel_Text_1: RscText
		{
			idc = -1;
			text = "Intel";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.291019 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Intel_Text_2: RscText
		{
			idc = -1;
			text = "Enemy Activity";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Intel_Text_3: RscText
		{
			idc = -1;
			text = "Notes";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};