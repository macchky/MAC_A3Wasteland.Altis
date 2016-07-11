// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerIcon.sqf
//	@file Author: macchky
//	@file Created: 28/9/2015 19:35
//	@file Args:

_uid = getPlayerUID player;
if (_uid call isAdmin) then
{
	if (isNil "adminPlayerIcons") then { adminPlayerIcons = false };
	disableSerialization;
	if (!adminPlayerIcons) then
	{
		adminPlayerIcons = true;
		hint "Player Icons ON";
	}
	else
	{
		adminPlayerIcons = false;
		hint "Player Icons OFF";
	};
	_mainMap = uiNamespace getVariable 'A3MAPICONS_mainMap';
	if((isNil 'CIVILIAN_COLOR')||(isNil '_mainMap'))then
	{
		CIVILIAN_COLOR = [0.67,0.97,0.97,1];
		uiNamespace setVariable['A3MAPICONS_mainMap', nil];
		uiNamespace setVariable['A3MAPICONS_mainMap', findDisplay 12 displayCtrl 51];
	};
	draw_MapIcons = {
		if(visibleMap)then
		{
			private['_ctrl'];
			_ctrl =  _this select 0;
			_fnc_get_color = {
				if(_this == civilian)exitWith{CIVILIAN_COLOR};
				if(_this == west)exitWith{[0.047,0.502,1,1]};
				if(_this == resistance)exitWith{[0,0.65,0,1]};
				if(_this == east)exitWith{[1,0.17,0.17,1]};
				[1,1,1,1]
			};
			_iscale = ((1 - ctrlMapScale _ctrl) max .2) * 28;
			_icon = '';
			_shown = [];
			{
				if(!isNull _x)then
				{
					_veh = vehicle _x;
					if(_veh in _shown)exitWith{};
					_shown pushBack _veh;
					_PUIDX = getPlayerUID _x;
					if(_PUIDX != '')then
					{
						_name = _x getVariable['realname',name _x];
						_type = typeOf _veh;
						_dist = round(_veh distance player);
						_txt = format['%1 (%2m) (DEAD, but still watching)',_name,_dist];
						if(alive _x)then
						{
							if(_x == _veh)then
							{
								_txt = format['%1 (%2m)',_name,_dist];
							}
							else
							{
								_names = '';
								{
									if(_forEachIndex == 0)then
									{
										_names = _names + format['%1',_x getVariable['realname',name _x]];
									}
									else
									{
										_names = _names + format[', %1',_x getVariable['realname',name _x]];
									};
								} forEach (crew _veh);
								_typename = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
								_txt = format['%1 - %2 (%3m)',_names,_typename,_dist];
							};
						};
						
						_clr = (side _x) call _fnc_get_color;
						
						_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
						
						_grpx = group _x;
						if(!isNull _grpx)then
						{
							_alive = {alive _x} count units _grpx;
							if(_alive > 1)then
							{
								_id=allGroups find _grpx;
								_txt = _txt + format[' GRP:%1 PLR:%2',_id,_alive];
							};
						};
						
						_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
					};
				};
			} forEach allPlayers;
		};
	};

	while {adminPlayerIcons} do
	{
		if(visibleMap)then
		{
			if(isNil'EventHandlerDrawAdded')then
			{
				EventHandlerDrawAdded = (uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['Draw','_this call draw_MapIcons'];
			};
		}
		else
		{
			if(!isNil'EventHandlerDrawAdded')then
			{
				(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;
			};
		};
		uiSleep 0.3;
		if (!adminPlayerIcons) exitWith {
			if(!isNil'EventHandlerDrawAdded')then
			{
				(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;
			};
		};
	};
};
