; Maze data and the procedures that read and change it    (Maze.asm)

INCLUDE Maze.inc

.data
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
