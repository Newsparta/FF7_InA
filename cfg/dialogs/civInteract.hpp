
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