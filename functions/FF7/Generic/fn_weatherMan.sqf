params ["_period", "_fogLimit"];

// fog control loop
while {true} do	{
	private ["_fog", "_decay", "_base"];
	sleep (_period);
	if (fog > _fogLimit) then {
		_fog	= ((random _fogLimit)/4);
		_base	= (4 + (random 46));
		_decay	= (_fog / (_base / 6));
		(_period / 4) setFog [_fog, _decay, _base];
	};
};