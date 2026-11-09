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
TryMove PROC USES ebx edx
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
    cmp al,'s'
    jne NotDown
    inc dh                      ; s moves down one row
NotDown:
    cmp al,'a'
    jne NotLeft
    dec dl                      ; a moves left one column
NotLeft:
    cmp al,'d'
    jne NotRight
    inc dl                      ; d moves right one column
NotRight:                       ; the outer wall keeps DH, DL inside the maze
    call GetCell                ; AL = what is in that cell
    mov bl,al                   ; BL keeps the cell for the checks below
    cmp bl,WallChar
    je StillRunning             ; walls block the move and cost nothing
    xchg dh,Player.Row          ; Player gets the new cell, DH, DL the old one
    xchg dl,Player.Col
    call DrawCell               ; redraw the cell the player left
    call DrawPlayer
StillRunning:
    mov al,GameRunning
    ret
TryMove ENDP

END
