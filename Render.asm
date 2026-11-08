; Everything that draws on the screen             (Render.asm)

INCLUDE Maze.inc

PlayerChar = '@'                ; how the player looks on the screen

.data
KeysLabel  BYTE "Keys: ",0
MovesLabel BYTE "   Moves left: ",0

.code
;-----------------------------------------------------
DrawMaze PROC USES edx
;
; Clears the screen and draws every cell of the maze.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
    call Clrscr
    mov dh,0                    ; start at the top row
RowLoop:
    mov dl,0                    ; start each row at column 0
ColLoop:
    call DrawCell
    inc dl
    cmp dl,MazeCols
    jb ColLoop
    inc dh
    cmp dh,MazeRows
    jb RowLoop
    ret
DrawMaze ENDP

;-----------------------------------------------------
DrawCell PROC USES eax
;
; Redraws one cell of the maze from MazeData.
; Receives: DH = row, DL = col
; Returns: nothing
;-----------------------------------------------------
    call Gotoxy                 ; screen row and col match the maze
    call GetCell                ; AL = character in that cell
    call WriteChar
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

;-----------------------------------------------------
DrawHud PROC USES eax edx
;
; Shows the keys and moves left on the line under the maze.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
    mov dh,MazeRows + 1         ; the line under the maze
    mov dl,0
    call Gotoxy
    mov edx,OFFSET KeysLabel
    call WriteString
    mov eax,Player.KeysHeld
    call WriteDec
    mov al,'/'
    call WriteChar
    mov eax,KeysTotal
    call WriteDec
    mov edx,OFFSET MovesLabel
    call WriteString
    mov eax,Player.MovesLeft
    call WriteDec
    mov al,' '                  ; erases the old digit when 10 drops to 9
    call WriteChar
    ret
DrawHud ENDP

ShowWin PROC                    ; stub
    ret
ShowWin ENDP

ShowLose PROC                   ; stub
    ret
ShowLose ENDP

END
