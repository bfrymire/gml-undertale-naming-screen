hh = string_height(string_hash_to_newline("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
var half_width = floor(room_width / 2);
var padded_width = floor(room_width / 8);
var draw_y_position = 16;

draw_set_font(fnt_dtm_mono);
draw_set_color(c_white);
draw_set_halign(fa_middle);
draw_text(half_width, draw_y_position, string_hash_to_newline("--Instructions--"));
draw_y_position += hh * 2;

draw_set_halign(fa_left);
draw_set_color(c_gray);
draw_text(padded_width, draw_y_position, string_hash_to_newline("Controls:#[ENTER] - Confirm#[ARROW KEYS] - Move#[BACKSPACE] - Remove Character#[CTRL + R] - Restart#[CRTL + W] - Exit"));

draw_y_position = room_height - floor(room_height / 5);
draw_set_halign(fa_middle);
draw_set_color(c_white);
draw_text(half_width, draw_y_position, string_hash_to_newline("[ENTER or SPACE] - Continue"))

var draw_x_position = room_width - 5;
var draw_y_position = room_height - 5 - hh;
draw_set_halign(fa_right);
draw_text(draw_x_position, draw_y_position, string_hash_to_newline(github_url_string));

