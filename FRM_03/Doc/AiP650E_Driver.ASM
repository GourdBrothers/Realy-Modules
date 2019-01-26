;===================================================
;==== AiP650E_Driver.ASM
;===================================================

AiP650E_Port        EQU   PT2
 B_AiP650E_CLK_PIN  EQU   7
 B_AiP650E_DAT_PIN  EQU   6
 B_AiP650E_PWR      EQU   3

AiP650E_Wr:
    DW      0FFFFH
	NOP
AiP650E_Wr_START:
    DW      0FFFFH
	NOP
	BSF     AiP650E_Port,B_AiP650E_DAT_PIN
    BSF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 0
	NOP
	NOP
	BCF     AiP650E_Port,B_AiP650E_DAT_PIN
AiP650E_WrH:
    MOVLW   8
	MOVWF   AipCnt
AiP650E_WrH_Loop:
    DW      0FFFFH
	NOP
	CLRWDT
    BCF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 0
	BSF     AiP650E_Port,B_AiP650E_DAT_PIN
	BCF     STATUS,C
    RLF     AipCmdH,F
	BTFSS   STATUS,C
	BCF     AiP650E_Port,B_AiP650E_DAT_PIN
	NOP
	NOP
    BSF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 1
    DECFSZ  AipCnt,F
	GOTO    AiP650E_WrH_Loop
	NOP
	NOP
	BCF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 0
	NOP
	NOP
	BSF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 1
AiP650E_WrL:
    MOVLW   8
	MOVWF   AipCnt
AiP650E_WrL_LOOP:
    DW      0FFFFH
	NOP
	CLRWDT
    BCF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 0
	BSF     AiP650E_Port,B_AiP650E_DAT_PIN
	BCF     STATUS,C
    RLF     AipCmdL,F
	BTFSS   STATUS,C
	BCF     AiP650E_Port,B_AiP650E_DAT_PIN
	NOP
	NOP
    BSF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 1
    DECFSZ  AipCnt,F
	GOTO    AiP650E_WrL_LOOP
    NOP
	NOP
	BCF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 0
	NOP
	NOP
	BSF     AiP650E_Port,B_AiP650E_CLK_PIN  ; CLK 1
AiP650E_Wr_STOP:
    DW      0FFFFH
	NOP
	BCF     AiP650E_Port,B_AiP650E_DAT_PIN
	NOP
	NOP
	BSF     AiP650E_Port,B_AiP650E_DAT_PIN
	NOP
RETURN







