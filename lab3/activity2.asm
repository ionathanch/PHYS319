mov.w   #0xF0F0, R7     ; R7 = 1111000011110000b = 0xF0F0, Z = 0, N = 0, C = 0
add.w   #0xF000, R7     ; R7 = 1110000011110000b = 0xE0E0, Z = 0, N = 1, C = 1
sub.w   #0xE0F0, R7     ; R7 = 0,                          Z = 1, N = 0, C = 0