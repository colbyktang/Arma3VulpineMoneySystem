_money = player getVariable "temp_money";
profileNamespace setVariable ["char_money", _money];
saveProfileNamespace;

_money = profileNamespace getVariable "char_money";

_speaker = "Vulpine Accountant";

_lines = [
	format ["Greetings %1, your balance is <t color='#4fff3f'>$%2.00</t>. Have a nice day.", profileName, _money], 
	format ["Nice to see you again %1, you have <t color='#4fff3f'>$%2.00</t> in your account. Keep up the good work.", profileName, _money],
	format ["%1, <t color='#4fff3f'>$%2.00</t> is your balance. See ya.", profileName, _money], 
	format ["Mr. %1, you have accumulated <t color='#4fff3f'>$%2.00</t> in your bank account. Magnificiently well done sir, I sincerely hope you have a spectacular day.", profileName, _money]
	];

[_speaker, selectRandom _lines] spawn BIS_fnc_showSubtitle;