private ["_player"];

_player = _this select 0;
waitUntil {!isNull _player}; 

[player, "Vulpine"] call BIS_fnc_setUnitInsignia;

if (isClass(configFile >> "CfgPatches" >> "ace_main")) then { 
	_action = ["check_money", "Check Balance", "", {_player sideChat format [_player sideChat format ["Money: $%1.00", _player getVariable "temp_money"]]}, {true}] call ace_interact_menu_fnc_createAction;
	[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
}; 

_player setVariable ["temp_money", 0];

if (isNil {profileNamespace getVariable "char_money"}) then { // if profilenamespace doesn't find your variable it creates as 0
	profileNamespace setVariable ["char_money", 0];
}

else {
	_player setVariable ["temp_money", profileNamespace getVariable "char_money"];
};

if (isNil {profileNamespace getVariable "char_kills"}) then { // if profilenamespace doesn't find your variable it creates as 0
	profileNamespace setVariable ["char_kills", 0];
};