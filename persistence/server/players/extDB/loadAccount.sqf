// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: loadAccount.sqf
//	@file Author: Torndeco, AgentRev

if (!isServer) exitWith {};

private ["_UID", "_bank", "_moneySaving", "_donator", "_donatorEnabled", "_teamkiller", "_tkCount", "_tkAutoKickEnabled", "_tkKickAmount", "_customUniformEnabled", "_uniformNumber", "_crossMap", "_environment", "_result", "_data", "_location", "_dataTemp", "_ghostingTimer", "_secs", "_columns", "_pvar", "_pvarG"];
_UID = _this;

_bank = 0;
_donator = 0;
_teamkiller = 0;
_tkCount = 0;
_tkKickAmount = 0;
_uniformNumber = 0;
_moneySaving = ["A3W_moneySaving"] call isConfigOn;
_donatorEnabled = ["A3W_donatorEnabled"] call isConfigOn;
_tkAutoKickEnabled = ["A3W_tkAutoKickEnabled"] call isConfigOn;
_tkKickAmount = ["A3W_tkKickAmount", 0] call getPublicVar;
_customUniformEnabled = ["A3W_customUniformEnabled"] call isConfigOn;


if (_donatorEnabled) then
{
	_result = ["getPlayerDonatorLevel:" + _UID, 2] call extDB_Database_async;

	if (count _result > 0) then
	{
		_donator = _result select 0;
	};
};

if (_customUniformEnabled) then
{
	_result = ["getPlayerCustomUniform:" + _UID, 2] call extDB_Database_async;

	if (count _result > 0) then
	{
		_uniformNumber = _result select 0;
	};
};
_crossMap = ["A3W_extDB_playerSaveCrossMap"] call isConfigOn;
_environment = ["A3W_extDB_Environment", "normal"] call getPublicVar;

if (_moneySaving) then
{
	_result = ["getPlayerBankMoney:" + _UID, 2] call extDB_Database_async;

	if (count _result > 0) then
	{
		_bank = _result select 0;
	};
};

if (_tkAutoKickEnabled) then
{
	_result = ["getPlayerTeamKiller:" + _UID, 2] call extDB_Database_async;

	if (count _result > 0) then
	{
		_teamkiller = _result select 0;
	}
	else
	{
		_result = ["getPlayerTKCount:" + _UID, 2] call extDB_Database_async;
		
		if (count _result > 0) then
		{
			_tkcount = _result select 0;
			
			if (_tkcount > _tkKickAmount) then
			{
				_teamkiller = 1;
			}
			else
			{
				_teamkiller = 0;
			};
		}
	};
};

_result = if (_crossMap) then
{
	([format ["checkPlayerSaveXMap:%1:%2", _UID, _environment], 2] call extDB_Database_async) select 0
}
else
{
	([format ["checkPlayerSave:%1:%2", _UID, call A3W_extDB_MapID], 2] call extDB_Database_async) select 0
};

if (!_result) then
{
	_data =
	[
		["PlayerSaveValid", false],
		["BankMoney", _bank],
		["DonatorLevel", _donator],
		["CustomUniform", _uniformNumber]
	];
}
else
{
	// The order of these values is EXTREMELY IMPORTANT!
	_data =
	[
		"Damage",
		"HitPoints",

		"LoadedMagazines",

		"PrimaryWeapon",
		"SecondaryWeapon",
		"HandgunWeapon",

		"PrimaryWeaponItems",
		"SecondaryWeaponItems",
		"HandgunItems",

		"AssignedItems",

		"CurrentWeapon",

		"Uniform",
		"Vest",
		"Backpack",
		"Goggles",
		"Headgear",

		"UniformWeapons",
		"UniformItems",
		"UniformMagazines",

		"VestWeapons",
		"VestItems",
		"VestMagazines",

		"BackpackWeapons",
		"BackpackItems",
		"BackpackMagazines",

		"WastelandItems",

		"Hunger",
		"Thirst"
	];

	_location = ["Stance", "Position", "Direction"];

	if (!_crossMap) then
	{
		_data append _location;
	};

	if (_moneySaving) then
	{
		_data pushBack "Money";
	};

	_result = if (_crossMap) then
	{
		[format ["getPlayerSaveXMap:%1:%2:%3", _UID, _environment, _data joinString ","], 2] call extDB_Database_async;
	}
	else
	{
		[format ["getPlayerSave:%1:%2:%3", _UID, call A3W_extDB_MapID, _data joinString ","], 2] call extDB_Database_async;
	};

	{
		_data set [_forEachIndex, [_data select _forEachIndex, _x]];
	} forEach _result;

	if (_crossMap) then
	{
		_result = [format ["getPlayerSave:%1:%2:%3", _UID, call A3W_extDB_MapID, _location joinString ","], 2] call extDB_Database_async;

		if (count _result == count _location) then
		{
			{
				_location set [_forEachIndex, [_location select _forEachIndex, _x]];
			} forEach _result;

			_data append _location;
		};
	};

	_dataTemp = _data;
	_data = [["PlayerSaveValid", true]];

	_ghostingTimer = ["A3W_extDB_GhostingTimer", 5*60] call getPublicVar;

	if (_ghostingTimer > 0) then
	{
		_result = if (_crossMap) then
		{
			[format ["getTimeSinceServerSwitchXMap:%1:%2:%3", _UID, _environment, call A3W_extDB_ServerID], 2] call extDB_Database_async
		}
		else
		{
			[format ["getTimeSinceServerSwitch:%1:%2:%3", _UID, call A3W_extDB_MapID, call A3W_extDB_ServerID], 2] call extDB_Database_async
		};

		if (count _result > 0) then
		{
			_secs = _result select 0; // [_result select 1] = LastServerID, if _crossMap then [_result select 2] = WorldName

			if (_secs < _ghostingTimer) then
			{
				_data pushBack ["GhostingTimer", _ghostingTimer - _secs];
			};
		};
	};

	_data append _dataTemp;
	_data pushBack ["BankMoney", _bank];
	_data pushBack ["DonatorLevel", _donator];
	_data pushBack ["CustomUniform", _uniformNumber];
};

// before returning player data, restore global player stats if applicable
if (["A3W_playerStatsGlobal"] call isConfigOn) then
{
	_columns = ["playerKills", "aiKills", "teamKills", "deathCount", "reviveCount", "captureCount"];
	_result = [format ["getPlayerStats:%1:%2", _UID, _columns joinString ","], 2] call extDB_Database_async;

	{
		_pvar = format ["A3W_playerScore_%1_%2", _columns select _forEachIndex, _UID];
		_pvarG = _pvar + "_global";
		missionNamespace setVariable [_pvarG, _x - (missionNamespace getVariable [_pvar, 0])];
		publicVariable _pvarG;
	} forEach _result;
};

_data
