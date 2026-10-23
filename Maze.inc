; Shared definitions for the maze game            (Maze.inc)
; Every .asm file includes this file instead of Irvine32.inc.

INCLUDE Irvine32.inc

MazeRows  = 10                  ; number of rows in the maze
MazeCols  = 20                  ; characters in each row
MoveLimit = 60                  ; moves the player starts with

WallChar  = '#'
FloorChar = ' '
KeyChar   = 'K'
ExitChar  = 'E'
StartChar = '@'                 ; only marks where the player starts

GameRunning = 0                 ; values TryMove returns in AL
GameWon     = 1
GameLost    = 2

PlayerInfo STRUCT
    Row       BYTE ?            ; current row, goes in DH for Gotoxy
    Col       BYTE ?            ; current column, goes in DL for Gotoxy
    KeysHeld  DWORD 0           ; keys picked up so far
    MovesLeft DWORD 0           ; moves remaining
PlayerInfo ENDS
