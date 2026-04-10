// 1. CAPTURAR AS TECLAS
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _jump = keyboard_check_pressed(vk_space);
var _jump_held = keyboard_check(vk_space);

// 2. MOVIMENTO HORIZONTAL
hsp = (_right - _left) * move_speed;

// 3. GRAVIDADE
vsp = vsp + grav;

// 4. LÓGICA DO PULO
// Primeiro: O impulso inicial quando aperta
if (place_meeting(x, y + 1, obj_ground) && _jump) {
    vsp = jump_force;
}

// Segundo: Diminuir o pulo se soltar o botão (Pulo Variável)
if (vsp < 0 && !_jump_held) {
    vsp = max(vsp, jump_force / 2);
}

// 5. COLISÃO HORIZONTAL (Paredes)
if (place_meeting(x + hsp, y, obj_ground)) {
    while (!place_meeting(x + sign(hsp), y, obj_ground)) {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

// 6. COLISÃO VERTICAL (Chão e Teto)
if (place_meeting(x, y + vsp, obj_ground)) {
    while (!place_meeting(x, y + sign(vsp), obj_ground)) {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

// 7. ANIMAÇÃO
if (!place_meeting(x, y + 1, obj_ground)) {
    // Se estiver no AR
    image_speed = 0;
    image_index = 1; // Deixe no frame de pulo
} else {
    // Se estiver no CHÃO
    if (hsp != 0) {
        image_speed = 1; // Rodar animação de andar
    } else {
        image_speed = 0; // Parar animação
        image_index = 0; // Frame parado
    }
}

// Inverter o lado do desenho (Esquerda/Direita)
if (hsp != 0) image_xscale = sign(hsp);