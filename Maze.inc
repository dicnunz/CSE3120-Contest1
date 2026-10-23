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
