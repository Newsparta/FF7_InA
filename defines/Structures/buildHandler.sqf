/* ----------
Script:
	Build handler

Description:
	Define class names and costs for all buildings

Author:
	[FF7] Newsparta
---------- */

_id = _this select 0;

switch (_id) do
{
	
	case 0:
	{
		objCost = 1;
		objType = "Land_BagFence_01_long_green_F";

		xDefine = 0;
		yDefine = 2.5;
		zDefine = 0.4;
		rotDefine = 180;

		call buildObj;
	};
	
	case 1:
	{
		objCost = 1;
		objType = "Land_BagFence_01_round_green_F";

		xDefine = 0;
		yDefine = 2.5;
		zDefine = 0.4;
		rotDefine = 180;

		call buildObj;
	};
	
	case 2:
	{
		objCost = 0.25;
		objType = "Land_BagFence_01_end_green_F";

		xDefine = 0;
		yDefine = 2.5;
		zDefine = 0.4;
		rotDefine = 180;

		call buildObj;
	};
	
	case 3:
	{
		objCost = 1;
		objType = "Land_PortableLight_double_F";

		xDefine = 0;
		yDefine = 2;
		zDefine = 1;
		rotDefine = 180;

		call buildObj;
	};

	case 4:
	{
		objCost = 4;
		objType = "Land_HBarrier_01_line_5_green_F";

		xDefine = 0;
		yDefine = 3;
		zDefine = 0.5;
		rotDefine = 0;

		call buildObj;
	};

	case 5:
	{
		objCost = 20;
		objType = "Land_Cargo_Patrol_V4_F";

		xDefine = 0;
		yDefine = 5;
		zDefine = 4;
		rotDefine = 180;

		call buildObj;
	};

	case 6:
	{
		objCost = 1;
		objType = "Camonet_BLUFOR_open_F";

		xDefine = 0;
		yDefine = 4;
		zDefine = 1;
		rotDefine = 0;

		call buildObj;
	};
};