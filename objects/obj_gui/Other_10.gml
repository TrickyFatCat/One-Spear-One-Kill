/// @description Draw black screen
draw_set_color(c_black);
draw_rectangle(0, 0, percent * w, h_quarter, false);
draw_rectangle(w, h_quarter, w - (percent * w), h_half, false);
draw_rectangle(0, h_half, percent * w, h_third, false);
draw_rectangle(w, h_third, w - (percent * w), h, false);
draw_set_color(c_white);