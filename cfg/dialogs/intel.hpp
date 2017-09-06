
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