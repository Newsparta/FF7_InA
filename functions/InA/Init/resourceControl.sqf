/* ----------
Script:
	Resource control

Description:
	Maintain resource values below a max value

Author:
	[FF7] Newsparta
---------- */

while {true;} do {

	sleep (2 + (random 2));

	if (LogF > 1000) then {
		LogF = 1000;
	};
	if (LogM > 600) then {
		LogM = 600;
	};
	if (LogV > 10) then {
		LogV = 10;
	};
};