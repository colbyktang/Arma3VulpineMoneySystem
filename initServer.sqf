
if (isServer) then {

	MoneyTable = {

	_man = 15;    
	_car = 25;
	_tank = 50;
	_aircraft = 150;
	_teamkill = -50;
	_civilian = -100;
	[_man,_car,_tank,_aircraft, _teamkill, _civilian]

	};


	addMissionEventHandler ["EntityKilled", 
	{
		params ["_killed", "_killer"];
		private ["_source", "_value"];
		
		if (isClass(configFile >> "CfgPatches" >> "ace_main")) then { 
			_source  = _killed getVariable ["ace_medical_lastDamageSource", objNull];
		}
		else {
			_source  = _killer;
		};
		
		
		if (isPlayer _source) then {
			_getMoneyValue = [] call MoneyTable;
			_getMoneyValue params ["_man","_car","_tank","_aircraft", "_teamkill", "_civilian"];
			_value = 0;
			
			if (side group _killed == east || side group _killed == independent || side group _killed == civilian) then {
				if (!isNull _source) then {
					if (typeof _killed isKindOf "CAManBase") then {_value = _man};
					if (typeof _killed isKindOf "Car") then {_value = _car};
					if (typeof _killed isKindOf "Tank") then {_value = _tank};
					if (typeof _killed isKindOf "Air") then {_value = _aircraft};
				
					[[_value], "money.sqf"] remoteExec ["execVM", (owner _source)]; 
				}
			};

			if (side group _killed == side group _source) then {
				
				if (!isNull _source) then {
					_source sideChat format ["BLUE ON BLUE -$1.00", _teamkill];
					[[_teamkill], "money.sqf"] remoteExec ["execVM", (owner _source)]; 
				}
			};
			
			if (side group _killed == civilian) then {
				
				if (!isNull _source) then {
					_source sideChat format ["CIVILIAN CASUALITY -$%1.00", _civilian];
					[[_civilian], "money.sqf"] remoteExec ["execVM", (owner _source)]; 
				}
			};
		}
	}];
	
	addMissionEventHandler ["PlayerDisconnected",
	{
		params ["_id", "_uid", "_name", "_jip", "_owner"];
		[[], "addSaveAction.sqf"] remoteExec ["execVM", _owner]; 
		saveProfileNamespace;
	}];
	
	addMissionEventHandler ["Ended",
	{
		saveProfileNamespace;
	}];
	
};