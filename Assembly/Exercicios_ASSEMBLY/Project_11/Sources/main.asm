     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

;###### Fa�a um LED diminuir de intensidade a cada 1s usando PWM #######
; TPWM = 4ms
; Fclock = 1MHz -> Fbar = 4MHz
; Dmax = 250         para n�o fazer a subtra��o com 16 bits
; 1/250 = 4ms     para chegar nisso perecisamos de 16000 clocks pois 4MHz = 0.25 us


;--- Declara��o de variaveis -----------
            ORG RAMStart
D           RMB 1
;---- Aqui come�a o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #0,PTADD      	; PTA � entrada e bit 7 � saida
           MOV    #$FF, PTBDD           ; PTB � saida
           
           ; Configura��o do Timer, at� aonde ele vai contar
           ; 0250
           LDA    #0
           STA    TPM1MODH
           LDA    #250
           STA    D
           STA    TPM1MODL
            
           ; Configura��o do Canal           
           ; 0250
           LDA    #0
           STA    TPM1C1VH
           LDA    #250
           STA    TPM1C1VL
           
           LDA    #%01001110
           ;        ||||||||
           ;        |||||Prescaler = 64
           ;        |||clock interno
           ;        ||PWM na borda
           ;        |Com interrup��o
           ;        Flag que ocorreu interr
           STA    TPM1SC
           
           LDA    #%00101000
           ;        ||||||||
           ;        ||||||N�o usamos
           ;        ||Tabela = PWM borda pulso + 
           ;        |Sem interrup��o
           ;        Flag que ocorreu interr
           STA    TPM1C1SC
           
           CLI    ; Liga interrup��es 
           
           
           
           
loop:      

          jmp   loop             
            
            
DEU_PERIODO:
          LDA   TPM1SC
          AND   #%01111111
          STA   TPM1SC              ; Limpa FLAG das interrup��es 
          
          LDA   D                   ; Carrega 250
          ;   Poderia ser carregado direto o TPM1C1VL
          DECA                      ; Decrementa 
          BEQ   maximo
          STA   D                   ; Salva valor decrementado em D
          STA   TPM1C1VL            ; Salva na raz�o ciclica 
          
          RTI


maximo:
          LDA   #250
          STA   D
          STA   TPM1C1VL
          
          RTI
nada:     
          cli ; Limpa Interrup��o
          rti ; Retorna da Interrup��o


demora:
         lda      #255                  ; A <- 255
         ldx      #255                  ; X <- 255
         dbnzx    *                     ; X <- X-1. se nao chegou a zero, repete
         dbnza    *-2                   ; A <- A-1. se n�o chegou a zero, pula pra 2 linhas antes
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
          DC.W nada  ;  FFF4 - TMP1 CH1			5
          DC.W nada  ;  FFE6 - TMP1 CH0			4
          DC.W nada  ;  FFF8 - Low voltage		3
          DC.W nada  ;  FFFA - /IRQ1 Vector            	2
          DC.W nada  ;  FFFC - Int. por software	1
          DC.W main  ;  FFFE - Vetor de Reset		0