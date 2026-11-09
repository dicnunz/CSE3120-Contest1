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

TryMove PROC                    ; stub, the game keeps running
    mov al,GameRunning
    ret
TryMove ENDP

END
