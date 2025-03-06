DATA SEGMENT  
    bin_msg DB 'Enter 8-bit binary: $'  ; Prompt message for binary input
    hex_msg DB 10,13,'Hex: $'           ; Prompt message for hexadecimal output
DATA ENDS 

CODE SEGMENT  
START:
    MOV AX, @DATA   ; Load data segment
    MOV DS, AX  
    
BIN_TO_HEX:
    CALL DISPLAY_MSG    ; Show input prompt
    CALL INPUT_BIN      ; Get binary input
    CALL DISPLAY_HEX_MSG ; Show hex output prompt
    CALL BINARY_TO_HEX  ; Convert and display hex
    JMP BIN_TO_HEX      ; Repeat process
    
EXIT:
    MOV AH, 4Ch   ; Exit program
    INT 21h         

; Procedure to display binary input message
DISPLAY_MSG PROC 
    LEA DX, bin_msg  
    MOV AH, 09h   ; Print string function
    INT 21h
    RET 
DISPLAY_MSG ENDP

; Procedure to read an 8-bit binary input from the user
INPUT_BIN PROC
    XOR BX, BX   ; Clear BX to store binary number
    MOV CX, 8    ; Expecting 8-bit input
INPUT_LOOP:
    MOV AH, 08h  ; Read character without echo
    INT 21h
    MOV DL, AL   ; Store input in DL
    MOV AH, 02h  ; Print character to echo input
    INT 21h
    
    CMP AL, 13   ; Check if Enter key is pressed
    JE RETURN_BIN
    SUB AL, '0'  ; Convert ASCII to binary (0 or 1)
    SHL BX, 1    ; Shift left to make room for new bit
    OR BL, AL    ; Add new bit to BX
    LOOP INPUT_LOOP  ; Repeat for 8 bits
RETURN_BIN:
    RET  
INPUT_BIN ENDP

; Procedure to display hexadecimal output message
DISPLAY_HEX_MSG PROC
    MOV AH, 09h  ; Print string function
    LEA DX, hex_msg
    INT 21h
    RET
DISPLAY_HEX_MSG ENDP

; Procedure to convert binary (BX) to hexadecimal and display it
BINARY_TO_HEX PROC 
    MOV CX, 2    ; Two hexadecimal digits (8-bit binary = 2 hex digits)
HEX_LOOP:
    MOV DL, BL   ; Get lower 4 bits
    SHR DL, 4    ; Extract highest 4 bits first
    CMP DL, 0Ah  ; Check if it's 0-9
    JL HEX_DIGIT
    ADD DL, 37h  ; Convert to ASCII letter (A-F)
    JMP PRINT_HEX
HEX_DIGIT:
    ADD DL, 30h  ; Convert to ASCII number (0-9)
PRINT_HEX:
    MOV AH, 02h  ; Print character
    INT 21h
    ROL BX, 4    ; Rotate left to process next 4 bits
    LOOP HEX_LOOP
    RET
BINARY_TO_HEX ENDP   

CODE ENDS   
END START
