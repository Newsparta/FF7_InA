_id = _this select 0;

switch (_id) do
{
	case 0:
	{
		themeFlag = "flag_USA";
		themeType = "Army";
		themeSupplier = "OPF";

		call themeSelect;
	};
	
	case 1:
	{
		themeFlag = "flag_USA";
		themeType = "Marines";
		themeSupplier = "OPF";

		call themeSelect;
	};
	
	case 2:
	{
		themeFlag = "flag_NATO";
		themeType = "Nato";
		themeSupplier = "OPF";

		call themeSelect;
	};
	
	case 3:
	{
		themeFlag = "flag_AAF";
		themeType = "AAF";
		themeSupplier = "OPF";

		call themeSelect;
	};
	
	case 4:
	{
		themeFlag = "rhs_flag_russia";
		themeType = "Russia";
		themeSupplier = "BLU";

		call themeSelect;
	};
};