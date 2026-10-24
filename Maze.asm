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
GetCell PROC                    ; stub
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
