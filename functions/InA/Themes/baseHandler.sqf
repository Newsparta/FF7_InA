_id = _this select 0;

switch (_id) do
{
	case 0:
	{
		[]execVM "functions\InA\Themes\baseTransportArmy.sqf";
	};
	
	case 1:
	{
		[]execVM "functions\InA\Themes\baseTransportMarines.sqf";
	};
	
	case 2:
	{
		[]execVM "functions\InA\Themes\baseTransportNato.sqf";
	};
	
	case 3:
	{
		[]execVM "functions\InA\Themes\baseTransportAAF.sqf";
	};
	
	case 4:
	{
		[]execVM "functions\InA\Themes\baseTransportRussia.sqf";
	};
};