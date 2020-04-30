var half_width, draw_x_position, draw_y_position, hh, padded_width;

hh = string_height(string_hash_to_newline("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
half_width = floor(room_width / 2);
padded_width = floor(room_width / 8);
draw_y_position = 16;

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

draw_x_position = room_width - 5 - sprite_get_width(spr_twitter);
draw_y_position = room_height - 5 - sprite_get_height(spr_twitter);
draw_sprite(spr_twitter, 0, draw_x_position, draw_y_position);

draw_x_position = room_width - 5 - sprite_get_width(spr_twitter) - 3;
draw_y_position = room_height - 5 - hh;
draw_set_halign(fa_right);
draw_text(draw_x_position, draw_y_position, string_hash_to_newline("@frymangames"));

