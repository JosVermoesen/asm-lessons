PrintChar equ &BB5A                     ;reference to firmware print character function

    org &1200                           ;start of program    

    ld hl,Message                       ;load message into hl
    Call PrintString                    ;print message

    ret                                 ;return to firmware

PrintString:
    ld a,(hl)                           ;load one by one character from message
    cp 255                              ;check for end of message
    ret z                               ;return if end of message
    inc hl                              ;increment message pointer
    call PrintChar                      ;print each character
    jr PrintString                      ;repeat until end of message

Message: db 'Hello World 2022!',255     ;message to print

NewLine:
    ld a,13                             ;load newline
    call PrintChar                      ;print newline
    ld a,10                             ;load line feed
    jp PrintChar                        ;print line feed