.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 10,13,"ENTER BINARY: $"  ; Message prompting the user to enter a binary number
    MSG2 DB 10,13,"DECIMAL: $"        ; Message to display the converted decimal result
    DIGIT DB ?                        ; Variable to store input digit

.CODE
MAIN PROC
    MOV AX, @DATA  ; Load data segment address
    MOV DS, AX     ; Initialize DS with data segment address
    
    ; Display input message
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    
    XOR BX, BX   ; Clear BX to store the binary number
    
INPUT:
    MOV AH, 1    ; Read a character from keyboard
    INT 21H
    CMP AL, 13   ; Check if Enter key is pressed
    JE OUTPUT
    SUB AL, '0'  ; Convert ASCII character to numeric value (0 or 1)
    SHL BX, 1    ; Shift BX left (multiply by 2)
    OR BL, AL    ; Add the new bit to BX
    JMP INPUT    ; Repeat for the next input character
    
OUTPUT:
    MOV AH, 9    ; Display output message
    LEA DX, MSG2
    INT 21H
    
    MOV AX, BX   ; Move the binary value to AX for conversion
    MOV CX, 10   ; Decimal divisor (base 10)
    XOR DX, DX   ; Clear DX for division
    
CONVERT:
    XOR DX, DX   ; Clear DX before division
    DIV CX       ; Divide AX by 10 (AX = AX / 10, DX = remainder)
    ADD DL, '0'  ; Convert remainder to ASCII
    PUSH DX      ; Push ASCII digit onto the stack
    TEST AX, AX  ; Check if quotient is zero
    JNZ CONVERT  ; If not zero, continue conversion
    
DISPLAY:
    POP DX       ; Retrieve digit from stack
    MOV AH, 2    ; Print character
    INT 21H
    CMP SP, 100H ; Check if the stack is empty
    JNE DISPLAY  ; If not empty, print next digit
    
    MOV AH, 4CH  ; Terminate the program
    INT 21H
MAIN ENDP
END MAIN
