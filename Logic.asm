; Keyboard input and player movement              (Logic.asm)

INCLUDE Maze.inc

.code
ReadMove PROC                   ; stub, always says quit for now
    mov al,'q'
    ret
ReadMove ENDP

TryMove PROC                    ; stub, the game keeps running
    mov al,GameRunning
    ret
TryMove ENDP

END
