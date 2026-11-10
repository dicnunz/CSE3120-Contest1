; Maze data and the procedures that use it        (Maze.asm)

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
GetCell PROC USES ebx esi
;
; Reads one character from the row-major maze.
; Receives: DH = row, DL = column
; Returns: AL = character (EAX changed)
; Requires: row < MazeRows, column < MazeCols
;-----------------------------------------------------
    mov al,dh
    mov bl,MazeCols
    mul bl                     ; AX = row * MazeCols; DX unchanged
    movzx esi,ax
    movzx ebx,dl
    add esi,ebx
    mov al,MazeData[esi]
    ret
GetCell ENDP

;-----------------------------------------------------
SetCell PROC USES eax ebx ecx esi
;
; Writes one character into the row-major maze.
; Receives: DH = row, DL = column, AL = character
; Returns: nothing; preserves all registers
; Requires: row < MazeRows, column < MazeCols
;-----------------------------------------------------
    mov cl,al                  ; save the character before MUL
    mov al,dh
    mov bl,MazeCols
    mul bl
    movzx esi,ax
    movzx ebx,dl
    add esi,ebx
    mov MazeData[esi],cl
    ret
SetCell ENDP

;-----------------------------------------------------
FindPlayer PROC USES eax ebx ecx edi
;
; Finds the start position and replaces its marker with floor.
; Receives: nothing
; Returns: nothing; preserves all registers
; Requires: at most one StartChar in MazeData
;-----------------------------------------------------
    mov edi,OFFSET MazeData
    mov ecx,MazeRows * MazeCols
    mov al,StartChar
    cld
    repne scasb
    jne PlayerNotFound
    mov BYTE PTR [edi - 1],FloorChar
    sub edi,OFFSET MazeData + 1 ; convert past-marker pointer to index
    mov eax,edi
    mov bl,MazeCols
    div bl                     ; AL = row, AH = column
    mov Player.Row,al
    mov Player.Col,ah
PlayerNotFound:
    ret
FindPlayer ENDP

;-----------------------------------------------------
CountKeys PROC USES ecx esi
;
; Counts key characters in the maze and stores the total.
; Receives: nothing
; Returns: nothing; preserves all registers
; Requires: MazeData contains MazeRows * MazeCols bytes
;-----------------------------------------------------
    mov KeysTotal,0
    mov esi,OFFSET MazeData
    mov ecx,MazeRows * MazeCols
CountKeyLoop:
    cmp BYTE PTR [esi],KeyChar
    jne NextKeyCell
    inc KeysTotal
NextKeyCell:
    inc esi
    loop CountKeyLoop
    ret
CountKeys ENDP

END
