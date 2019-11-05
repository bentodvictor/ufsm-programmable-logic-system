     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

;Ligar o 8 leds em sequencia: ........ conforme o adc 8 bits
; Lê valores de 0 até 255. 256/8 = 32, logo se fizer 256/32 = 8, 0->7. Assim liga todos os leds.
;--- Declaração de variaveis -----------
            ORG RAMStart
lido        RMB 1
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H
           
           ;LDA    #%01000010
          ; STA    SOPT1                 ; liga COP

           MOV    #00,PTADD      	      ;  PTA é entrada
           MOV    #$FF, PTBDD           ; PTB é saida
           cli                          ; liga interr.
           
           LDA #%00000000     ;clk do ADC = 1 do clock
		       ;     ||||||||
           ;     ||||prescaler de clk = clk do processador.
           ;     |||desliga interr  
           ;     |interrup do ACD
           ;     limpa flag de interr 
		   
           STA ADCCFG         ;ADC com 8 bits
           
loop:      
          ;alimenta o cao
         ; feed_watchdog        
                                
          sta PTBD  ;salva ressultado em PTBD
          
          ;---------------Sensor----------------------
          LDA #%00000000
          STA ADCSC1        ;sem interrup./ 1 conv/ conversor AD0
          ;;Começar a leitura de uma entrada (ADC0)
          BRCLR ADCSC1_COCO, ADCSC1, * ; espera o coco fica em 1 (pronto)
          ;Quado o coco=1 gera a interrup e entra nessa parte do codigo
          LDA ADCRL    ;Accum <= ADC_valor(L)
          
          
          ldhx #32   ; H:X <= 0:32
          
          div     ;Accum <= 256/32
          
          cbeqa #0, saida0   ;if(Accum = #0){vai pra saida}
          cbeqa #1, saida1   ;if(Accum = #1){vai pra saida}
          cbeqa #2, saida2   ;if(Accum = #0){vai pra saida}
          cbeqa #3, saida3   ;if(Accum = #0){vai pra saida}
          cbeqa #4, saida4   ;if(Accum = #0){vai pra saida}
          cbeqa #5, saida5   ;if(Accum = #0){vai pra saida}
          cbeqa #6, saida6   ;if(Accum = #0){vai pra saida}
          
          ;igual a 7
          lda #$ff
          jmp loop
              
saida0:
        lda #%00000001
        jmp loop
saida1:
        lda #%00000011
        jmp loop
saida2:
        lda #%00000111
        jmp loop
saida3:
        lda #%00001111
        jmp loop
saida4:
        lda #%00011111
        jmp loop
saida5:
        lda #%00111111
        jmp loop
saida6:
        lda #%01111111
        jmp loop
     
nada:     
          cli ; Limpa Interrupção
          rti ; Retorna da Interrupção


demora:
         lda      #255                  ; A <- 255
         ldx      #255                  ; X <- 255
         dbnzx    *                     ; X <- X-1. se nao chegou a zero, repete
         dbnza    *-2                   ; A <- A-1. se não chegou a zero, pula pra 2 linhas antes
         RTS                            ;retorna da subrotina
         
alimenta_cao: MACRO     ;alimentar o cao de guarda para n resetar o codigo
               sta SRS
               ENDM            
           
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