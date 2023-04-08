var hh = string_height("M");
var half_width = floor(room_width * 0.5);
var padded_width = floor(room_width / 8);
var draw_y_position = 16;

draw_set_font(fnt_dtm_mono);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(half_width, draw_y_position, "--Instructions--");
draw_y_position += hh * 2;

draw_set_halign(fa_left);
draw_set_color(c_gray);
var _text = "Controls:\n";
_text += "[ENTER or SPACE] - Confirm\n";
_text += "[ARROW KEYS] - Move\n";
_text += "[BACKSPACE] - Remove Character\n";
_text += "[CTRL + R] - Restart\n";
_text += "[CRTL + W] - Exit";
draw_text(padded_width, draw_y_position, _text);

draw_y_position = room_height - floor(room_height / 5);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(half_width, draw_y_position, "[ENTER or SPACE] - Continue");

var draw_x_position = room_width - 5;
draw_y_position = room_height - 5 - hh;
draw_set_halign(fa_right);
draw_text(draw_x_position, draw_y_position, github_url_string);
