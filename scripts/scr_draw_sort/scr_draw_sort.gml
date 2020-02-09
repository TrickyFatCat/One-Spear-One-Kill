var list = argument0;
//<<<<<<< Updated upstream
//=======

//>>>>>>> Stashed changes

//drawer.alarm[10] = 3

var sorted = true;
var n = ds_list_size(list);
var len = ds_list_size(list);

var res = ds_list_create()
ds_list_copy(res, list)

var sz = 2
while sz < 2 * n {
	for (var i = 0; i < n; i += sz) {
		var l = i
		var r = min(i + sz, n)
		var m = l + sz / 2
		var pl = l
		var pr = m
		var c = l
		var left
		var right
		while (pl < m && pr < r) {
			left = ds_list_find_value(list, pl)
			right = ds_list_find_value(list, pr)
//<<<<<<< Updated upstream
			if //(left.y + left.sprite_yoffset + left.image_yscale * sprite_get_height(left.mask_index) <= 
		      //right.y + right.sprite_yoffset + right.image_yscale * sprite_get_height(right.mask_index)) 
			  (left.y <= right.y)
			{
//=======
//			if (left.y + left.sprite_yoffset + left.image_yscale * sprite_get_height(left.mask_index) <= 
//		      right.y + right.sprite_yoffset + right.image_yscale * sprite_get_height(right.mask_index)) {
//>>>>>>> Stashed changes
				ds_list_replace(res, c++, left)
				pl++
			}
			else {
				ds_list_replace(res, c++, right)
				pr++
			}
		}
		while (pl < m) {
			ds_list_replace(res, c++, ds_list_find_value(list, pl++))
		}
		while (pr < r) {
			ds_list_replace(res, c++, ds_list_find_value(list, pr++))
		}
		for (var j = l; j < r; j++) {
			ds_list_replace(list, j, ds_list_find_value(res, j))
		}
	}
	sz *= 2
}
ds_list_destroy(res)