_diversity = random 1;
if (_diversity < 0.90) then {_men = civ_man_tanoan};
if (_diversity < 0.925 and _diversity >= 0.90) then {_men = civ_man_european};
if (_diversity < 0.975 and _diversity >= 0.925) then {_men = civ_man_asian};
if (_diversity < 1 and _diversity >= 0.975) then {_men = civ_man_african};
_men 