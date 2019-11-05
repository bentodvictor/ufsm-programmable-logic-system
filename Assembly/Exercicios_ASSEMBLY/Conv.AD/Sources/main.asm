     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0


;--- Declaração de variaveis -----------
            ORG RAMStart
lido        RMB 2                         ; Variavel lido de 2 bytes

;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           
           CLRA 
           MOV    #$FF, PTADD       ; Porta A é saída
           MOV    #$FF, PTBDD       ; Porta B é saída
           SEI
           
loop:      
         	 LDA	#%00000100
         	 STA  ADCCFG        ; ADC COM 12 BITS
         	 
         	 LDA  #%00000000
         	 STA  ADCSC1        ; Registradora para conversão AD
		 	
 	         BRCLR	7, ADCSC1, *  	;espera enquanto ADCSC1[7] = 0
 	                                ;espera conversão terminar, quando terminar ADCSC1[7] = 1
				   
	         LDA	ADCRH		          ;acum  <= parte alta da conversão
	         STA  lido              ;lido <= acum
	         STA  PTAD              ;Porta A <= lido
	         LDA  ADCRL             ;AC <= parte baixa da conversão
	         STA  lido+1            ;salva no segundo byte de lido lido+1<=AC  
	         STA  PTBD              ;Porta B <= lido+1
	         JMP  loop
	          
nada:     
          cli ; Limpa Interrupção
          rti ; Retorna da Interrupção


demora:
         lda      #255                  ; A <- 255
         ldx      #255                  ; X <- 255
         dbnzx    *                     ; X <- X-1. se nao chegou a zero, repete
         dbnza    *-2                   ; A <- A-1. se não chegou a zero, pula pra 2 linhas antes
         RTS
           
          ORG interrupcoes
            
          DC.W nada  ;  FFC0 - Timer3 Overflow  	31
          DC.W nada  ;  FFC2 - TPM3 CH5         	30
          DC.W nada  ;  FFC4 - TPM3 CH4         	29
          DC.W nada  ;  FFC6 - TPM3 CH3         	28
          DC.W nada  ;  FFC8 - TPM3 CH2         	26
          DC.W nada  ;  FFCA - TPM3 CH1         	25
          DC.W nada  ;  FFCC - TPM3 CH0         	24
          DC.W nada  ;  FFCE - Real-Time interrupt     	23
          DC.W nada  ;  FFD0 - SCI2 - transmit		22
          DC.W nada  ;  FFD2 - SCI2 - receive		21
          DC.W nada  ;  FFD4 - SCI2 - error		20
          DC.W nada  ;  FFD6 - Analog comparator x	19
          DC.W nada  ;  FFD8 - ADC			18
          DC.W nada  ;  FFDA - Teclado                 	17       
          DC.W nada  ;  FFDC - IIC Co0ntrl		16
          DC.W nada  ;  FFDE - SCI1 transmit		15
          DC.W nada  ;  FFE0 - SCI1 receive		14
          DC.W nada  ;  FFE2 - SCI1 error		13
          DC.W nada  ;  FFE4 - SPI1			12
          DC.W nada  ;  FFE6 - SPI2			11
          DC.W nada  ;  FFE8 - TMP2 overflow		10
          DC.W nada  ;  FFEA - TMP2 CH2			9
          DC.W nada  ;  FFEC - TMP2 CH1			8
          DC.W nada  ;  FFED - TMP2 CH0			8
          DC.W nada  ;  FFF0 - TMP1 overflow		7
          DC.W nada  ;  FFF2 - TMP1 CH2			6
          DC.W nada  ;  FFF4 - TMP1 CH1			5
          DC.W nada  ;  FFE6 - TMP1 CH0			4
          DC.W nada  ;  FFF8 - Low voltage		3
          DC.W nada  ;  FFFA - /IRQ1 Vector            	2
          DC.W nada  ;  FFFC - Int. por software	1
          DC.W main  ;  FFFE - Vetor de Reset		0