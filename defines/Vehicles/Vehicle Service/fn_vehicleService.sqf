/* ----------
Function: InA_fnc_vehicleService

Description:
    A function to service or store vehicles

Parameters:
    - Marker locations for service (Array of Positions)

Optional:


Example:
   
    [[getMarkerPos "marker_1", getMarkerPos "marker_2"]] spawn InA_fnc_vehicleService

Returns:
    Nil

Author:
    Newsparta
---------- */

// ---------- PARAMETERS ----------

params ["_array"];
	
// ---------- MAIN ----------

parkedVehicle = ObjNull;

waitUntil {sleep 1; initialized};

while {true} do {
	
	sleep (2 + (random 2));
	
	{
	
		_parked = count (_x nearEntities [["LandVehicle","Air"],6]);
		
		if (_parked > 0) then {
		
			_parkedVehicle = (_x nearEntities [["LandVehicle","Air"], 6]) select 0;
			
			[_parkedVehicle, [["FF9900", "Vehicle Menu"] call FF7_fnc_formatText, 
				{
						
					ID = clientOwner;
					publicVariableServer "ID";
					
					parkedVehicle = _this select 3 select 0;
					publicVariableServer "parkedVehicle";
					
					[parkedVehicle] remoteExec ["InA_fnc_serviceCost", 2];
					
					disableSerialization;
		
					createDialog "InA_vehicleService_Dialog";
					
					waitUntil {!isNull (findDisplay 6999);};
					
				}, [_parkedVehicle], 99, true, true, "", "", 5]] remoteExec ["addAction", 0, false];
				
			waitUntil {sleep 1;(_x distance _parkedVehicle > 6)};
			
			_parkedVehicle remoteExec ["removeAllActions", 0, false];
		};
	} forEach _array;
};