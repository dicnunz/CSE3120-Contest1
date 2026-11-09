; Keyboard input and player movement              (Logic.asm)

INCLUDE Maze.inc

.code
;-----------------------------------------------------
ReadMove PROC
;
; Waits for the player to press a key.
; Receives: nothing
; Returns: AL = the key in lowercase (EAX changed)
;-----------------------------------------------------
    call ReadChar               ; AL = ASCII code of the key
    or al,00100000b             ; lowercase, so W and w are the same
    ret
ReadMove ENDP

TryMove PROC                    ; stub, the game keeps running
    mov al,GameRunning
    ret
TryMove ENDP

END
