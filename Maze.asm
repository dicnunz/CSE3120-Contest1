; Maze data and the procedures that read and change it    (Maze.asm)

INCLUDE Maze.inc

.data
; Fixed maze rows contain 20 characters each, without terminators.
MazeData BYTE "####################"
         BYTE "#@    #       K    #"
         BYTE "# ### # ####### ## #"
         BYTE "# K #   #       #  #"
         BYTE "### ##### ##### # ##"
         BYTE "#   #     #   # #  #"
         BYTE "# ### ##### # # ## #"
         BYTE "#     K     #    E #"
         BYTE "# ################ #"
         BYTE "####################"

Player    PlayerInfo <>         ; the player's position, keys and moves
KeysTotal DWORD 0               ; number of keys in the maze

.code
;-----------------------------------------------------
; Reads one character from the row-major maze.
; Receives: DH = row, DL = column
; Returns: AL = character (EAX changed)
; Requires: row < MazeRows, column < MazeCols
;-----------------------------------------------------
GetCell PROC USES ebx esi
    mov al,dh
    mov bl,MazeCols
    mul bl                     ; AX = row * MazeCols; DX unchanged
    movzx esi,ax
    movzx ebx,dl
    add esi,ebx
    mov al,MazeData[esi]
    ret
GetCell ENDP

SetCell PROC                    ; stub
    ret
SetCell ENDP

FindPlayer PROC                 ; stub
    ret
FindPlayer ENDP

CountKeys PROC                  ; stub
    ret
CountKeys ENDP

END
