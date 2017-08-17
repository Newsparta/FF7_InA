private ["_cars"];
// ---------- Civilian tolerance init ----------

civTol = 1;
responded = false;

// ---------- Control loop ----------

while {true} do {

	sleep 60;
	
	// basic increase
	civTol = civTol + (1/2880);
	
	if (civTol > 1) then {
		civTol = 1;
	};
	if (civTol < 0) then {
		civTol = 0;
	};

};