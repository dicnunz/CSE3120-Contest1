; Everything that draws on the screen             (Render.asm)

INCLUDE Maze.inc

PlayerChar = '@'                ; how the player looks on the screen

.code
DrawMaze PROC                   ; stub
    ret
DrawMaze ENDP

DrawCell PROC                   ; stub
    ret
DrawCell ENDP

;-----------------------------------------------------
DrawPlayer PROC USES eax edx
;
; Draws the player at its current position.
; Receives: nothing
; Returns: nothing
; Requires: Player.Row and Player.Col hold the position
;-----------------------------------------------------
    mov dh,Player.Row
    mov dl,Player.Col
    call Gotoxy
    mov al,PlayerChar
    call WriteChar
    ret
DrawPlayer ENDP

DrawHud PROC                    ; stub
    ret
DrawHud ENDP

ShowWin PROC                    ; stub
    ret
ShowWin ENDP

ShowLose PROC                   ; stub
    ret
ShowLose ENDP

END
