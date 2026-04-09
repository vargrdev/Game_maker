var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);

hsp = (_right - _left) * move_speed;
vsp = (_down - _up) * move_speed;

x += hsp;
y += vsp;

// controlar a animação

if ( hsp !=0 || vsp !=0) {

image_speed = 0.2; // ativa a movimentação

// inverter o lado da animação
 
if ( hsp !=0 ) image_xscale = sign(hsp);

}	else {
	image_speed = 0; // para a animação
	image_index =0; // Volta pra primeira animação
}