; Keyboard input and player movement              (Logic.asm)

INCLUDE Maze.inc

.code
;-----------------------------------------------------
ReadMove PROC
;
; Waits until the player presses w, a, s, d or q.
; Receives: nothing
; Returns: AL = the key in lowercase (EAX changed)
;-----------------------------------------------------
GetKey:
    call ReadChar               ; AL = ASCII code of the key
    or al,00100000b             ; lowercase, so W and w are the same
    cmp al,'w'
    je GotKey
    cmp al,'a'
    je GotKey
    cmp al,'s'
    je GotKey
    cmp al,'d'
    je GotKey
    cmp al,'q'
    jne GetKey                  ; any other key is ignored
GotKey:
    ret
ReadMove ENDP

;-----------------------------------------------------
TryMove PROC USES edx
;
; Moves the player one cell in the direction of the key.
; Receives: AL = w, a, s or d
; Returns: AL = GameRunning, GameWon or GameLost
;-----------------------------------------------------
    mov dh,Player.Row           ; DH, DL become the cell to move into
    mov dl,Player.Col
    cmp al,'w'
    jne NotUp
    dec dh                      ; w moves up one row
NotUp:
    xchg dh,Player.Row          ; Player gets the new cell, DH, DL the old one
    xchg dl,Player.Col
    call DrawCell               ; redraw the cell the player left
    call DrawPlayer
    mov al,GameRunning
    ret
TryMove ENDP

END
