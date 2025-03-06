DATA SEGMENT  
    bin_msg DB 'Enter 8-bit binary: $'  ; Prompt for binary input
    hex_msg DB 10,13,'Hex: $'           ; Prompt for hexadecimal output
DATA ENDS 

CODE SEGMENT  
START:
    MOV AX, @DATA
    MOV DS, AX  
    
BIN_TO_HEX:
    CALL DISPLAY_MSG       ; Display "Enter 8-bit binary" message
    CALL INPUT_BIN         ; Get binary input
    CALL DISPLAY_HEX_MSG   ; Display "Hex: " message
    CALL BINARY_TO_HEX     ; Convert and print hexadecimal value
    JMP BIN_TO_HEX         ; Repeat process
    
EXIT:
    MOV AH, 4Ch   ; Exit program
    INT 21h         

; Procedure to display binary input prompt
DISPLAY_MSG PROC 
    LEA DX, bin_msg  
    MOV AH, 09h   ; Print string
    INT 21h
    RET 
DISPLAY_MSG ENDP

; Procedure to read an 8-bit binary input from the user
INPUT_BIN PROC
    XOR BX, BX   ; Clear BX to store binary value
    MOV CX, 8    ; Expecting 8-bit input

INPUT_LOOP:
    MOV AH, 08h  ; Read character (without echo)
    INT 21h
    MOV DL, AL   ; Store character in DL
    MOV AH, 02h  ; Echo character
    INT 21h
    
    CMP AL, 13   ; Check if Enter key is pressed
    JE RETURN_BIN
    SUB AL, '0'  ; Convert ASCII to binary (0 or 1)
    SHL BX, 1    ; Shift left (multiply by 2)
    OR BL, AL    ; Store bit in BX
    LOOP INPUT_LOOP  ; Repeat for 8 bits

RETURN_BIN:
    RET  
INPUT_BIN ENDP

; Procedure to display hexadecimal output prompt
DISPLAY_HEX_MSG PROC
    MOV AH, 09h  ; Print string
    LEA DX, hex_msg
    INT 21h
    RET
DISPLAY_HEX_MSG ENDP

; Procedure to convert 8-bit binary (BX) to hexadecimal and print it
BINARY_TO_HEX PROC 
    MOV CX, 2    ; 8-bit binary = 2 hex digits

HEX_LOOP:
    ROL BX, 4    ; Rotate BX left by 4 bits (MSN first)
    MOV DL, BL   ; Extract lower 4 bits
    AND DL, 0Fh  ; Mask out unwanted bits

    CMP DL, 0Ah  ; Check if value is 10 or higher (A-F)
    JL HEX_DIGIT
    ADD DL, 37h  ; Convert to ASCII letter (A-F)
    JMP PRINT_HEX

HEX_DIGIT:
    ADD DL, 30h  ; Convert to ASCII number (0-9)

PRINT_HEX:
    MOV AH, 02h  ; Print character
    INT 21h
    LOOP HEX_LOOP  ; Process both nibbles (MSN, LSN)
    
    RET
BINARY_TO_HEX ENDP   

CODE ENDS   
END START
