// ---------- Build Menu ----------

class InA_Build_Dialog
{
	idd = 9500;
	movingenable = false;
	
	class controls
	{
		class InA_Build_Background: RscFrame
		{
			idc = -1;
			x = 0.396689 * safezoneW + safezoneX;
			y = 0.335015 * safezoneH + safezoneY;
			w = 0.206623 * safezoneW;
			h = 0.32997 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_Build_Frame_1: RscFrame
		{
			idc = -1;
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.8};
		};
		class InA_Build_Frame_2: RscFrame
		{
			idc = -1;
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.8};
		};
		class InA_Build_Listbox: RscListbox
		{
			idc = 1500;
			x = 0.40702 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.197982 * safezoneH;
			onLBSelChanged = "[lbCurSel 1500] execVM 'defines\Structures\resourceUpdate.sqf';[lbCurSel 1500] execVM 'defines\Structures\resourceCosts.sqf';";
			colorBackground[] = {0,0,0,0.8};
		};
		class InA_Build_Button_1: RscButton
		{
			idc = 1600;
			text = "Select";
			x = 0.469007 * safezoneW + safezoneX;
			y = 0.598991 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[lbCurSel 1500] execVM 'defines\Structures\buildHandler.sqf'; closeDialog 0;";
		};
		class InA_Build_Button_2: RscButton
		{
			idc = 1601;
			text = "Close";
			x = 0.40702 * safezoneW + safezoneX;
			y = 0.598991 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.043996 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_Build_InputText_1: RscText
		{
			idc = 1000;
			text = "0"; 
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Build_InputText_2: RscText
		{
			idc = 1001;
			text = "0";
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Build_Header: RscFrame
		{
			idc = -1;
			x = 0.396689 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.206623 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Build_SubHeader: RscFrame
		{
			idc = -1;
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Build_SubHeader_2: RscFrame
		{
			idc = -1;
			x = 0.40702 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.113643 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Build_SubHeader_3: RscFrame
		{
			idc = -1;
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_Build_Text_1: RscText
		{
			idc = -1;
			text = "Items";
			x = 0.551656 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Build_Text_2: RscText
		{
			idc = -1;
			text = "Cost";
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0206623 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Build_Text_3: RscText
		{
			idc = -1;
			text = "Fortifications";
			x = 0.40702 * safezoneW + safezoneX;
			y = 0.357013 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Build_Text_4: RscText
		{
			idc = -1;
			text = "Build Menu";
			x = 0.396689 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Build_Text_5: RscText
		{
			idc = -1;
			text = "Inventory";
			x = 0.530993 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_Build_Text_6: RscText
		{
			idc = -1;
			text = "Items";
			x = 0.551656 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.0413246 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};

// ---------- Build Action Menu ----------

class InA_Build_Action_Dialog
{
	idd = 9400;
	movingenable = true;
	enableSimulation = true;
	
	class controls
	{
		class InA_BuildActions_Background: RscFrame
		{
			idc = 1800;
			x = 0.365696 * safezoneW + safezoneX;
			y = 0.401009 * safezoneH + safezoneY;
			w = 0.299603 * safezoneW;
			h = 0.197982 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0.25,0.25,0.25,0.6};
		};
		class InA_BuildAction_Button_1: RscButton
		{
			idc = 1600;
			text = "Show"; //--- ToDo: Localize;
			x = 0.613642 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "obj attachTo [player, [xPos,yPos,zPos]]; obj setVectorDirAndUp [[ sin aPos * cos bPos,cos aPos * cos bPos,sin bPos],[ [ sin cPos,-sin bPos,cos cPos * cos bPos],-aPos] call BIS_fnc_rotateVector2D];";
		};
		class InA_BuildActions_Button_2: RscButton
		{
			idc = 1601;
			text = "Hide"; //--- ToDo: Localize;
			x = 0.613642 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "detach obj; obj setPosASL [0,0,0];";
		};
		class InA_BuildActions_Button_3: RscButton
		{
			idc = 1602;
			text = "Place"; //--- ToDo: Localize;
			x = 0.613642 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] spawn InA_fnc_placeObj;";
		};
		class InA_BuildActions_Button_4: RscButton
		{
			idc = 1603;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.613642 * safezoneW + safezoneX;
			y = 0.510999 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "deleteVehicle obj;removeAllActions player;['BUILDING CANCELED', ''] call FF7_fnc_formatHint; closeDialog 0";
		};
		class InA_BuildActions_Button_5: RscButton
		{
			idc = 1604;
			text = "Close"; //--- ToDo: Localize;
			x = 0.613642 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class InA_BuildActions_Button_6: RscButton
		{
			idc = 1605;
			text = "Forward"; //--- ToDo: Localize;
			x = 0.510331 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call plusY;";
		};
		class InA_BuildActions_Button_7: RscButton
		{
			idc = 1606;
			text = "Backward"; //--- ToDo: Localize;
			x = 0.510331 * safezoneW + safezoneX;
			y = 0.510999 * safezoneH + safezoneY;
			w = 0.0619868 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call minusY;";
		};
		class InA_BuildActions_Button_8: RscButton
		{
			idc = 1607;
			text = "Left"; //--- ToDo: Localize;
			x = 0.510331 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call minusX;";
		};
		class InA_BuildActions_Button_9: RscButton
		{
			idc = 1608;
			text = "Right"; //--- ToDo: Localize;
			x = 0.541324 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call plusX;";
		};
		class InA_BuildActions_Button_10: RscButton
		{
			idc = 1609;
			text = "Up"; //--- ToDo: Localize;
			x = 0.572318 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.032997 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call plusZ;";
		};
		class InA_BuildActions_Button_11: RscButton
		{
			idc = 1610;
			text = "Down"; //--- ToDo: Localize;
			x = 0.572318 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.032997 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call minusZ;";
		};
		class InA_BuildActions_Button_12: RscButton
		{
			idc = 1611;
			text = "Rotate CW"; //--- ToDo: Localize;
			x = 0.448344 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "transA = transA + 15; obj setVectorDirAndUp [[ sin (aPos + transA) * cos bPos,cos (aPos + transA) * cos bPos,sin bPos],[ [ sin (cPos + transC),-sin bPos,cos (cPos + transC) * cos bPos],-(aPos + transA)] call BIS_fnc_rotateVector2D];";
		};
		class InA_BuildActions_Button_13: RscButton
		{
			idc = 1612;
			text = "Rotate CCW"; //--- ToDo: Localize;
			x = 0.448344 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "transA = transA - 15; obj setVectorDirAndUp [[ sin (aPos + transA) * cos bPos,cos (aPos + transA) * cos bPos,sin bPos],[ [ sin (cPos + transC),-sin bPos,cos (cPos + transC) * cos bPos],-(aPos + transA)] call BIS_fnc_rotateVector2D];";
		};
		class InA_BuildActions_Button_14: RscButton
		{
			idc = 1613;
			text = "Rotate CW"; //--- ToDo: Localize;
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.467003 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "transC = transC - 1; obj setVectorDirAndUp [[ sin (aPos + transA) * cos bPos,cos (aPos + transA) * cos bPos,sin bPos],[ [ sin (cPos + transC),-sin bPos,cos (cPos + transC) * cos bPos],-(aPos + transA)] call BIS_fnc_rotateVector2D];";
		};
		class InA_BuildActions_Button_15: RscButton
		{
			idc = 1614;
			text = "Rotate CCW"; //--- ToDo: Localize;
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "transC = transC + 1; obj setVectorDirAndUp [[ sin (aPos + transA) * cos bPos,cos (aPos + transA) * cos bPos,sin bPos],[ [ sin (cPos + transC),-sin bPos,cos (cPos + transC) * cos bPos],-(aPos + transA)] call BIS_fnc_rotateVector2D];";
		};
		class InA_BuildActions_Header: RscFrame
		{
			idc = 1801;
			moving = 1;
			x = 0.365695 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.299603 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_BuildActions_Text_1: RscText
		{
			idc = 1000;
			text = "Action Menu"; //--- ToDo: Localize;
			x = 0.365695 * safezoneW + safezoneX;
			y = 0.379011 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_BuildActions_SubHeader_1: RscFrame
		{
			idc = 1802;
			x = 0.510331 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0929802 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_BuildActions_SubHeader_2: RscFrame
		{
			idc = 1803;
			x = 0.448344 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_BuildActions_SubHeader_3: RscFrame
		{
			idc = 1804;
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
			type = CT_STATIC;
			style = ST_CENTER;
			colorBackground[] = {0,0.5,1,0.8};
		};
		class InA_BuildActions_Text_2: RscText
		{
			idc = 1001;
			text = "Translation"; //--- ToDo: Localize;
			x = 0.510331 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0516557 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_BuildActions_Text_3: RscText
		{
			idc = 1002;
			text = "Z-Axis"; //--- ToDo: Localize;
			x = 0.448344 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
		};
		class InA_BuildActions_Text_4: RscText
		{
			idc = 1003;
			text = "X-Axis"; //--- ToDo: Localize;
			x = 0.386357 * safezoneW + safezoneX;
			y = 0.445005 * safezoneH + safezoneY;
			w = 0.0309934 * safezoneW;
			h = 0.021998 * safezoneH;
		};
	};
};