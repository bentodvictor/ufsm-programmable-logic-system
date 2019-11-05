     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

; Exemplo de PMW utilizando as seguintes configurações:
; f = 1MHz -> clk bar = 4MHz = 0.25us
; PWM: T = 1 ms -> 1KHz
;D = 50%

;;   Time Cont = 4000
;;   Canal = 2000

;--- Declaração de variaveis -----------
            ORG RAMStart
lido        RMB 1
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #0,PTADD      	; PTA é entrada e bit 7 é saida
           MOV    #$FF, PTBDD           ; PTB é saida
           
           ; Configuração do Timer, até aonde ele vai contar
           ; 4000 = 0FA0
           LDA    #$0F
           STA    TPM1MODH
           LDA    #$A0
           STA    TPM1MODL
            
           ; Configuração do Canal           
           ; 2000 = 07D0
           LDA    #$07
           STA    TPM1C1VH
           LDA    #$D0
           STA    TPM1C1VL
           
           LDA    #%01001000
           ;        ||||||||
           ;        |||||Prescaler = 0
           ;        |||clock interno
           ;        ||PWM na borda
           ;        |Com interrupção
           ;        Flag que ocorreu interr
           STA    TPM1SC
           
           LDA    #%01101000
           ;        ||||||||
           ;        ||||||Não usamos
           ;        ||Tabela = PWM borda pulso + 
           ;        |Com interrupção
           ;        Flag que ocorreu interr
           STA    TPM1C1SC
           
           CLI    ; Liga interrupções 
           
           
           
           
loop:      

          jmp   loop             
            
            
DEU_PERIODO:
          LDA   TPM1SC
          AND   #%01111111
          STA   TPM1SC              ; Limpa FLAG das interrupções 
          
          RTI
          
Deu_D:
          LDA   TPM1C1SC
          AND   #%01111111
          STA   TPM1C1SC            ; Limpa FLAG das interrupções
          
          RTI
          
            
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
          DC.W DEU_PERIODO  ;  FFF0 - TMP1 overflow		7
          DC.W nada  ;  FFF2 - TMP1 CH2			6
          DC.W Deu_D  ;  FFF4 - TMP1 CH1			5
          DC.W nada  ;  FFE6 - TMP1 CH0			4
          DC.W nada  ;  FFF8 - Low voltage		3
          DC.W nada  ;  FFFA - /IRQ1 Vector            	2
          DC.W nada  ;  FFFC - Int. por software	1
          DC.W main  ;  FFFE - Vetor de Reset		0