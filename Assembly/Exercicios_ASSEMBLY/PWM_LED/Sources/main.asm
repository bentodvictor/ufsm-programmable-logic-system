     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

;;LED que diminui a intensidade a cada 1s usando o PWM.

; f=1MHz -> clk do Barramento = 4MHz => 0.25 us
; PWM: T= 4 ms -> 1Hz
;      D= variado
;      Dmax = 250

;Para isso funcionar o TIME Cont (período total) = 4000
;          enquanto o  CANAL  (período em 1 [duty]) = 2000

;--- Declaração de variaveis -----------
            ORG RAMStart
D        RMB 1
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #0,PTADD      	    ; PTA é entrada e bit 7 é saida
           MOV    #$FF, PTBDD           ; PTB é saida
          ; SEI                          ; liga interrup
          
          
           lda   #$00
           sta   TPM1MODH
           lda   #250
           sta   TPM1MODL
           
      
           lda   #$00
           sta   TPM1C1VH
           lda   #250
           sta   TPM1C1VL
           
           
           ;Configuração do timer.
           lda   #%01001110
                ;  ||||||||               16000 é o clk pra dar 4ms, 16000/250 = 64
                ;  |||||Prescaler = 64
                ;  |||Clock interno
                ;  ||PWM na borda
                ;  |Com interrupcao
                ;  Flag que ocorreu interr
           sta TPM1SC
           
           ;Configuração do canal.
           lda   #%00101000
                ;  ||||||||
                ;  ||||||Não usado
                ;  ||Tabela = PWM borda pulso +
                ;  ||PWM na borda
                ;  |Com interrupcao
                ;  Flag que ocorreu interr
           sta TPM1C1SC 
           
           CLI    ; liga interr.
           
loop:           

          jmp   loop             

DEU_PERIODO:
          lda TPM1SC
          and #%01111111
          sta TPM1SC    ;limpa a flag
          lda TPM1C1VL
          deca
          BEQ maximo
          STA TPM1C1VL
          rti             ;retorna da interr


maximo:
          lda #250
          sta TPM1C1VL
          
          rti ; retorna da interr
                      
DEU_D:    
          lda TPM1C1SC
          and #%01111111
          sta TPM1C1SC    ;liga o flag
          
          rti ;retorna da interr      
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
          DC.W DEU_D  ;  FFF4 - TMP1 CH1			5
          DC.W nada  ;  FFE6 - TMP1 CH0			4
          DC.W nada  ;  FFF8 - Low voltage		3
          DC.W nada  ;  FFFA - /IRQ1 Vector            	2
          DC.W nada  ;  FFFC - Int. por software	1
          DC.W main  ;  FFFE - Vetor de Reset		0