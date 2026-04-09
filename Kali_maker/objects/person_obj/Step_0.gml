var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);

x += _hsp;
y += _vsp;

// controlar a animação

if (_hsp !=0 || _vsp !=0) {

imagem_speed = 1; // ativa a movimentação

// inverter o lado da animação

if (_hsp !=0 ) image_xscale = sign(_hsp);

}	else {
	imagem_speed = 0; // para a animação
	image_index =0; // Volta pra primeira animação
}