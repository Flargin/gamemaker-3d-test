draw_clear(c_black);

var camera = camera_get_active();

var x_from = obj_player.x;
var y_from = obj_player.y;
var z_from = obj_player.z;
var x_to = x_from + dcos(obj_player.look_dir);
var y_to = y_from - dsin(obj_player.look_dir);
var z_to = z_from - dsin(obj_player.look_pitch);

camera_set_view_mat(camera, matrix_build_lookat(x_from, y_from, z_from, x_to, y_to, z_to, 0, 0, 1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 32000));
camera_apply(camera);

vertex_submit(vbuffer, pr_trianglelist, -1);

matrix_set(matrix_world, matrix_build(0, -640, 0, 90, 0, 0, 100, 100, 100))
vertex_submit(vb_sin, pr_trianglelist, 1);
matrix_set(matrix_world, matrix_build_identity());