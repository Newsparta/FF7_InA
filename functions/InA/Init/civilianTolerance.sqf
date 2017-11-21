private ["_cars"];

// ---------- Control loop ----------

while {true} do {

	sleep 60;
	
	// basic increase
	civTol = civTol + (1/10080);
	
	if (civTol > 1) then {
		civTol = 1;
	};
	if (civTol < 0) then {
		civTol = 0;
	};

};