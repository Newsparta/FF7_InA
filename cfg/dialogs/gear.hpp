
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
			onLBSelChanged = "[lbCurSel 1500] spawn g_dialog_handler_gear_item_select;";
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
			action = "[lbCurSel 1500] spawn g_dialog_handler_gear_item_purchase;";
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
			onSliderPosChanged = "[_this select 1] spawn g_dialog_handler_gear_slider_change";
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

class InA_Gear_Open_Dialog
{
	idd = 9300;
	movingenable = false;
	
	class controls
	{
		class InA_Gear_Open_Background: RscFrame
		{
			idc = 1800;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.378989 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.286026 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_Gear_Open_Header: RscFrame
		{
			idc = 1801;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.356987 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022002 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Gear_Open_Button_1: RscButton
		{
			idc = 1600;
			text = "Weapons";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.400991 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "['weapons', 'type', false] spawn InA_fnc_handleGearDialog; [] execVM 'defines\Gear\resourceUpdate.sqf';";
		};
		class InA_Gear_Open_Button_2: RscButton
		{
			idc = 1601;
			text = "Munitions";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.455996 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "['magazines', 'type', false] spawn InA_fnc_handleGearDialog; [] execVM 'defines\Gear\resourceUpdate.sqf';";
		};
		class InA_Gear_Open_Button_3: RscButton
		{
			idc = 1602;
			text = "Misc.";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.511001 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "['miscitems', 'type', false] spawn InA_fnc_handleGearDialog; [] execVM 'defines\Gear\resourceUpdate.sqf';";
		};
		class InA_Gear_Open_Button_4: RscButton
		{
			idc = 1603;
			text = "Close";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.599009 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044004 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_Gear_Open_HeaderText: RscText
		{
			idc = 1000;
			text = "Gear Menu";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.356987 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022002 * safezoneH;
		};
	};
};
