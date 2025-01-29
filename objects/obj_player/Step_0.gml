look_dir -= (window_mouse_get_x() - window_get_width() / 2) / 10;
look_pitch -= (window_mouse_get_y() - window_get_height() / 2) / 10;
look_pitch = clamp(look_pitch, -80, 80);

window_mouse_set(window_get_width() / 2, window_get_height() / 2);

if(keyboard_check_direct(vk_escape))
	game_end();
	
if(keyboard_check(vk_shift))
	var sprint = sprint_spd;
else
	var sprint = 0;

if(keyboard_check(ord("W"))) {
	x += dcos(look_dir) * (spd + sprint);
	y -= dsin(look_dir) * (spd + sprint);
}

if(keyboard_check(ord("A"))) {
	x -= dsin(look_dir) * (spd + sprint);
	y -= dcos(look_dir) * (spd + sprint);
}

if(keyboard_check(ord("S"))) {
	x -= dcos(look_dir) * (spd + sprint);
	y += dsin(look_dir) * (spd + sprint);
}

if(keyboard_check(ord("D"))) {
	x += dsin(look_dir) * (spd + sprint);
	y += dcos(look_dir) * (spd + sprint);
}

var jump = keyboard_check_pressed(vk_space) && z == -64;

z_vel += grav - jump * jump_force;

z += z_vel;
z = min(-64, z);
if(z == -64)
	z_vel = 0;