/// player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);

///calculated movments
var _move = key_right - key_left;


if (wallhug = 1) {
vsp = 2
}
else {
vsp = vsp + grv;
}

if (place_meeting(x,y+1,obj_invisibleWall)) && (key_jump)
{
	vsp = -jumpsp
}

if (place_meeting((x + sign(hsp)*3),y,obj_invisibleWall))
{
wallhug = 1;
walljumped = 0;
if (key_jump = 1) {
vsp = -6;
wallhug = 0;
hsp = -(_move) * 3
walljumped = 1
}
}
if (!place_meeting((x + sign(hsp)*3),y,obj_invisibleWall))
{
	wallhug = 0
}
if (place_meeting(x, y + 1, obj_invisibleWall)) {
walljumped = 0;
}

if (walljumped = 1) {
hsp =  min(hsp + (_move * 0.3), 5)
}
else {
hsp = _move * walksp
}


/// horizontal collision
if (place_meeting(x+hsp,y,obj_invisibleWall))
{
	while (!place_meeting(x+sign(hsp),y,obj_invisibleWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

/// vertical collision
if (place_meeting(x,y+vsp,obj_invisibleWall))
{
	while (!place_meeting(x,y+sign(vsp),obj_invisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

/// animation
if (!place_meeting(x,y+1,obj_invisibleWall))
{
	
	if (wallhug = 0) 
	{
		if (vsp > 0) sprite_index = spr_falling; else sprite_index = spr_jumping;
	}
	
}
else
{
	if (hsp == 0)
	{
		sprite_index = spr_idle;
	}
	else
	{	
		sprite_index = spr_walk;
	}
}

if (_move != 0) 
{
	image_xscale = (_move * 3);
}

///respawn
if (y > 900) {
obj_EggMan.x = 160;
obj_EggMan.y = 384;
}