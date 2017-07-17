_id = _this select 0;

switch (_id) do
{
	
	case 0:
	{
		[]execVM "functions\InA\Structures\Build\sandbagLong.sqf";
	};
	
	case 1:
	{
		[]execVM "functions\InA\Structures\Build\sandbagRound.sqf";
	};
	
	case 2:
	{
		[]execVM "functions\InA\Structures\Build\sandbagEnd.sqf";
	};
	
	case 3:
	{
		[]execVM "functions\InA\Structures\Build\lamp.sqf";
	};
};