_id = _this select 0;

switch (_id) do
{
	
	case 0:
	{
		objCost = 1;
		objType = "Land_BagFence_long_F";

		xDefine = 0;
		yDefine = 2.5;
		zDefine = 0.4;
		rotDefine = 180;

		call buildObj;
	};
	
	case 1:
	{
		objCost = 1;
		objType = "Land_BagFence_round_F";

		xDefine = 0;
		yDefine = 2.5;
		zDefine = 0.4;
		rotDefine = 180;

		call buildObj;
	};
	
	case 2:
	{
		objCost = 0.25;
		objType = "Land_BagFence_end_F";

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
};