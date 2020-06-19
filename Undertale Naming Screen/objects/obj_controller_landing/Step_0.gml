// testing controls
if keyboard_check(vk_control) {
    if keyboard_check_pressed(ord("R")) {
        game_restart();
    }
    if keyboard_check_pressed(ord("W")) {
        game_end();
    }
}

// go to naming screen
if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) {
    window_set_cursor(cr_default);
    room_goto_next();
    exit;
}

// init variables
var box_x = room_width - 5 - string_width(github_url_string) - 5;
var box_y = room_height - 5 - string_height(github_url_string) - 5;
// cooldown for clicking link
if github_cooldown > 0 {
    github_cooldown -= 1;
}
// open link to github repo
if mouse_x >= box_x && mouse_y >= box_y {
    window_set_cursor(cr_handpoint);
    if mouse_check_button(mb_any) {
        if github_cooldown == 0 {
            github_cooldown = github_cooldown_max;
            url_open_ext(github_url, "_blank");
        }
    }
} else {
    window_set_cursor(cr_default);
}
