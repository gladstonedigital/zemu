#target rom

#code _MAIN,0,0x4000

main:
    ld      a, 51
    ld      (original_number), a
    ld      (test_factor),  a
loop1:
    ld      a, (test_factor)
    dec     a
    jr      z, end
    ld      (test_factor), a
    ld      b, a
    ld      a, (original_number)
loop2:
    sub     b
    jr      z, end
    jr      nc, loop2
    jr      loop1
end:
    ld      a, b
    jp      0xff

original_number .byte 00h
test_factor     .byte 00h

#end

