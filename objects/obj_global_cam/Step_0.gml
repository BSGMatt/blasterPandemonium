/// @description Set view to match user screen
//This code is not mine, it is from a Reddit comment made by u/bishoujoedward.

var s_width, s_height, g_width, g_height, aspect, c_scale, offSET;

g_width = view_xport[0];
g_height = view_hport[0];
aspect = (g_width/g_height);
s_height = display_get_height();
s_width = s_height * aspect;
c_scale = s_height/ g_height;
offSET = 256;

if(!window_get_fullscreen()){
	window_set_size((s_width - offSET),(s_height - offSET));	
}

display_set_gui_size(s_width,s_height);
