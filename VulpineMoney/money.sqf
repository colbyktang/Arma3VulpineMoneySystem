params ["_value"];

_player = player;

_money = _player getVariable "temp_money";
_money = _money + _value;

_player setVariable ["temp_money", _money];
