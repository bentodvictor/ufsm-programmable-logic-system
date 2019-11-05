; Uma camara fria possui 3 sensores de temperatura ligados no adc do uC.
; Os termometros dao valor maximo de 100ºC
; acione uma saída em nivel alto, qado a media dos 3 sensores for >= 5ºC
; Faça a leitura/controle a cada 10s
; use ADC c/ 8 bits

     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0


;--- Declaração de variaveis -----------
            ORG RAMStart
soma          RMB 2
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H
           
           

           MOV    #$FF,PTBDD      	; PTB é saida
           CLI                      ; Liga interrupção
         
           LDA #9        ; 10 s
           STA RTCMOD     ; Qdo contador chegar em 1
                          ; gera interr       
                                          
           LDA    #%00011111
           ;        ||||||||
           ;        ||||preescaler do clk de 0.01s
           ;        |||Liga interr
           ;        ||clk de 1Khz
           ;        |limpa flag de interr
           STA RTCSC
          

loop:
          feed_watchdog
          jmp   loop             

INT_RTC:
          LDA RTCSC
          AND #%01111111      ; limpa bit 7 do RTCSC, pino fica em 1 quando a interrupção ocorre
          STA RTCSC
          
          clra
          sta soma
          sta soma + 1
          
          MOV #%00000000, ADCCFG    ; 8 bits
          MOV #%00000000, ADCSC1    ; configura e começa a contar
          
          BRCLR 7,ADCSC1, *   ; enquanto ADCSC1[7] = 0
          LDA ADCRL
          STA soma + 1

          MOV #%00000001, ADCSC1    ; configura e começa a contar
          
          BRCLR 7,ADCSC1, *   ; enquanto ADCSC1[7] = 0
          LDA ADCRL
          add soma + 1
          STA soma + 1
          
          lda soma
          adc #0
          sta soma


          MOV #%00000010, ADCSC1    ; configura e começa a contar
          
          BRCLR 7,ADCSC1, *   ; enquanto ADCSC1[7] = 0
          LDA ADCRL
          add soma + 1
          STA soma + 1
          
          lda soma
          adc #0
          sta soma
          
       ;;;;; DIVISÃO    
      lda soma
      ldx #3
      div
      sub #5
      BGT liga_led
      RTI
          
          

liga_led:
         lda #255
         sta PTBD
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
          DC.W INT_RTC  ;  FFCE - Real-Time interrupt     	23
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