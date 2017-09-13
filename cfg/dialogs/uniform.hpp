
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
