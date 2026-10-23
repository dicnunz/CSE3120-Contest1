; Maze Game                                        (Main.asm)

; Program Description: Main module of a text maze game. The player
;   collects every key and reaches the exit before running out of moves.
; Author: Nicholas Welsh
; Creation Date: 10/23/2026
; Revisions:
; Date:                  Modified by:

INCLUDE Maze.inc

.code
main PROC
    call FindPlayer             ; find the @ and save the start position
    call CountKeys              ; count the K's in the maze
    mov Player.MovesLeft,MoveLimit
    call DrawMaze
    call DrawPlayer
    call DrawHud
    exit
main ENDP
END main
