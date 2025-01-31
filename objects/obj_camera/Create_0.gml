gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, vertex_format);

var x1 = 400;
var y1 = 400;
var x2 = 600;
var y2 = 600;

/*
vertex_position_3d(vbuffer, x1, y1, 100);
vertex_normal(vbuffer, 0, 0, 1);
vertex_texcoord(vbuffer, 0, 0);
vertex_color(vbuffer, c_white, 1);


vertex_add_point(vbuffer, x1, y1, 100,	0, 0, 1,	0, 0,	c_white, 1);
vertex_add_point(vbuffer, x2, y1, 100,	0, 0, 1,	0, 0,	c_white, 1);
vertex_add_point(vbuffer, x2, y2, 100,	0, 0, 1,	0, 0,	c_white, 1);

vertex_add_point(vbuffer, x2, y2, 100,	0, 0, 1,	0, 0,	c_purple, 1);
vertex_add_point(vbuffer, x1, y2, 100,	0, 0, 1,	0, 0,	c_yellow, 1);
vertex_add_point(vbuffer, x1, y1, 100,	0, 0, 1,	0, 0,	c_blue, 1);
*/


for(var i = -room_width * 1; i < room_width * 1; i += 32) {
	for(var j = -room_height * 200; j < room_height * 200; j += 32) {
		if((abs(i) % 64 == 0 && abs(j) % 64 == 0) || (abs(i) % 64 > 0 && abs(j) % 64 > 0))
			var color = c_purple;
		else	
			var color = c_black;
		
		
		vertex_add_point(vbuffer, i, j, 100,			0, 0, 1,	0, 0,	color, 1);
		vertex_add_point(vbuffer, i + 32, j, 100,		0, 0, 1,	0, 0,	color, 1);
		vertex_add_point(vbuffer, i + 32, j + 32, 100,	0, 0, 1,	0, 0,	color, 1);

		vertex_add_point(vbuffer, i + 32, j + 32, 100,	0, 0, 1,	0, 0,	color, 1);
		vertex_add_point(vbuffer, i, j + 32, 100,		0, 0, 1,	0, 0,	color, 1);
		vertex_add_point(vbuffer, i, j, 100,			0, 0, 1,	0, 0,	color, 1);
	}
}


vertex_end(vbuffer);

vb_sin = import_obj("bru.obj", vertex_format);



instance_create_depth(0, 0, 0, obj_player);

show_debug_overlay(false);
audio_play_sound(snd_theme, 0, true);