; Faça um programa para escrever os numeros de 0 a 9 no display de 7 segmentos que está na PTC. Faça isso repetidamente, dando um intervalo entre cada numero,
;chamando a rotina DEMORA.

INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0


;--- Declaraзгo de variaveis -----------
            ORG RAMStart
result        RMB 1
;---- Aqui comeзa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           ;MOV    #0,PTADD      		 PTA й entrada e bit 7 й saida
           ;MOV    #0, PTBDD   	         PTB entrada
		   MOV 	  #$FF, PTCDD			; PTC saída
           SEI                          ; desliga interr.
           
loop:      
		LDA #%1111011					;desenha o numero 9 no display
		STA PTCDD						;Coloca na saida C
		JMP demora
		
		LDA #%1111111 					;desenha o numero 8 no display
		STA PTCDD						;Coloca na saida C
		JMP demora

		LDA #%1110000					;desenha o numero 7 no display
		STA PTCDD						;Coloca na saida C
		JMP demora

		LDA #%1011111					;desenha o numero 6 no display
		STA PTCDD						;Coloca na saida C
		JMP loop
		
		LDA #%1011011					;desenha o numero 5 no display
		STA PTCDD						;Coloca na saida C
		JMP demora

		LDA #%0111011					;desenha o numero 4 no display
		STA PTCDD						;Coloca na saida C
		JMP demora

		LDA #%1111001					;desenha o numero 3 no display
		STA PTCDD						;Coloca na saida C
		JMP demora

		LDA #%1101101					;desenha o numero 2 no display
		STA PTCDD						;Coloca na saida C
		JMP demora

		LDA #%0110000					;desenha o numero 1 no display
		STA PTCDD						;Coloca na saida C
		JMP demora

		LDA #%1111110					;desenha o numero 0 no display
		STA PTCDD						;Coloca na saida C
		JMP demora
		JMP loop						; reinicia o loop
nada:     
          cli ; Limpa Interrupзгo
          rti ; Retorna da Interrupзгo


demora:
         lda      #255                  ; A <- 255
         ldx      #255                  ; X <- 255
         dbnzx    *                     ; X <- X-1. se nao chegou a zero, repete
         dbnza    *-2                   ; A <- A-1. se nгo chegou a zero, pula pra 2 linhas antes
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