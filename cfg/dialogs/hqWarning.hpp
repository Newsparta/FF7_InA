
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
			action = "[[InA_Warning_ID], 'defines\baseHandler.sqf'] remoteExec ['execVM', 2]; closeDialog 0;";
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
