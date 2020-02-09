/// draw_sprite_sliced_along_line
/// @param sprite_index
/// @param image_index
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param xscale
/// @param yscale
/// @param color
/// @param alpha
var _i = 0
var _sprite_index = argument[_i++]
var _image_index = argument[_i++]
var _x1 = argument[_i++]
var _y1 = argument[_i++]
var _x2 = argument[_i++]
var _y2 = argument[_i++]
var _xscale = argument[_i++]
var _yscale = argument[_i++]
var _color = argument[_i++]
var _alpha = argument[_i++]


var _part_w = sprite_get_width(_sprite_index) / 3
var _part_h = sprite_get_height(_sprite_index)

var _xoffset = sprite_get_xoffset(_sprite_index) * _xscale
var _yoffset = sprite_get_yoffset(_sprite_index) * _yscale

var _angle = point_direction(_x1, _y1, _x2, _y2)

var _dist = point_distance(_x1, _y1, _x2, _y2)

var _offset_angle = point_direction(_xoffset, _yoffset, 0, 0) + _angle
var _offset_distance = point_distance(_xoffset, _yoffset, 0, 0)


var _size_x_offset = 0

if (_dist>_part_w*2*_xscale)
{
	var _middle_part_scale = ((_dist - _part_w * 2 * _xscale) / _part_w)

	// middle part
	draw_sprite_general(_sprite_index, _image_index, _part_w, 0, _part_w, _part_h, 
		_x1 + lengthdir_x(_offset_distance, _offset_angle) + lengthdir_x(_part_w*_xscale, _angle), 
			_y1 + lengthdir_y(_offset_distance, _offset_angle) + lengthdir_y(_part_w*_xscale, _angle), _middle_part_scale, _yscale, _angle, 
				_color, _color, _color, _color, _alpha)
}
else
{
	_size_x_offset = (_dist - _part_w*2*_xscale)*0.5
}
			
// start part
draw_sprite_general(_sprite_index, _image_index, 0, 0, _part_w, _part_h, 
	_x1 + lengthdir_x(_offset_distance, _offset_angle) + lengthdir_x(_size_x_offset, _angle), 
		_y1 + lengthdir_y(_offset_distance, _offset_angle) + lengthdir_y(_size_x_offset, _angle), _xscale, _yscale, _angle, 
			_color, _color, _color, _color, _alpha)	

// end part
draw_sprite_general(_sprite_index, _image_index, _part_w*2, 0, _part_w, _part_h, 
	_x2 + lengthdir_x(_offset_distance, _offset_angle) - lengthdir_x(_part_w*_xscale, _angle) - lengthdir_x(_size_x_offset, _angle), 
		_y2 + lengthdir_y(_offset_distance, _offset_angle) - lengthdir_y(_part_w*_xscale, _angle) - lengthdir_y(_size_x_offset, _angle), 
			_xscale, _yscale, _angle, _color, _color, _color, _color, _alpha)
