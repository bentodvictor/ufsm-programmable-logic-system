     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

 ;Uma camara fura possui 3 sensores de temperaturas ligados no ADC do uC. Os termometros dão valores de 0 até 100ºC
 ;Acione uma saída em nível alto, qdo a média dos 3 sensores ficar acima de 5°  (>= 5º). Faça as leitura/controle a cada 10s.
 ;Use adc c/8bits
;--- Declaração de variaveis -----------
            ORG RAMStart
soma        RMB 2
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H
           
           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #00,PTADD      	      ;  PTA é entrada
           MOV    #$FF, PTBDD           ; PTB é saida
           cli                          ; liga interr.
           
           LDA #%00000000     ;;clk do ADC = 1 do clock
           STA ADCCFG         ;ADC com 8 bits
           
           lda #9
           sta RTCMOD   ;Qdo contador chegar em 1, gera interr
           
           lda #%00011111               ; Sem interr, clock de 1K, liga interr, 1 seg.
           ;     ||||||||
           ;     ||||prescaler de clk de 1s 
           ;     |||Liga interr  
           ;     |clk de 1khz
           ;     limpa flag de interr       
           sta RTCSC    ;salva a congi no RTC (rea-time-clk)

loop:      
          ;alimenta o cao
         ; feed_watchdog
          jmp   loop             
                      
INT_RTC:  
          lda RTCSC
          and #%01111111   ;limpa bit 7 do RTCSC
          sta RTCSC
          
          clra    ; A= 0
          ;soma = 0
          sta soma   
          sta soma+1
          
          
          ;---------------Sensor1----------------------
           LDA #%00000000
          STA ADCSC1        ;sem interrup./ 1 conv/ conversor AD0
          ;;Começar a leitura de uma entrada (ADC0)
          BRCLR 7, ADCSC1, * ; espera o coco fica em 1 (pronto)
          ;Quado o coco=1 gera a interrup e entra nessa parte do codigo
          LDA ADCRL
          STA soma+1
          
          ;---------------Sensor2----------------------
          LDA #%00000001
          STA ADCSC1        ;sem interrup./ 1 conv/ conversor AD01
          ;;Começar a leitura de uma entrada (ADC1)
          BRCLR 7, ADCSC1, * ; espera o coco fica em 1 (pronto)
          ;Quado o coco=1 gera a interrup e entra nessa parte do codigo
          LDA ADCRL   ;Acum <= parte baixa do ADC
          
          add soma+1
          sta soma+1  ;soma com a parte baixa
         
          lda soma  
          adc #0  ;soma+ 0 + carry do resultado anterior
          sta soma
          
          ;---------------Sensor3----------------------
          LDA #%000000010
          STA ADCSC1        ;sem interrup./ 1 conv/ conversor AD02
          ;;Começar a leitura de uma entrada (ADC2)
          BRCLR 7, ADCSC1, * ; espera o coco fica em 1 (pronto)
          ;Quado o coco=1 gera a interrup e entra nessa parte do codigo
          LDA ADCRL   ;Acum <= parte baixa do ADC
          
          add soma+1
          sta soma+1  ;soma com a parte baixa
         
          lda soma  
          adc #0  ;soma+ 0 + carry do resultado anterior
          sta soma
          
          JSR media_print
          
          rti ; retorna da interru do RTC

media_print: ;fazer a média da soma, dividindo por 3.

          ;soma[H] e soma+1[L]
          ldhx soma
          txa       ;Accum  <= X
          ldx #3    ;X<=3
          
          div       ; divide
          
          ;ver se está acima de 5º
          sub #6    ;128=100, logo 6.4 = 5
          
          bge liga_ar ; liga o ar
          ;Desliga o ar
          
          clra
          sta PTBD    ;store 0 em PTB
          rts
          
          
liga_ar:     
          lda #$ff
          sta PTBD          
          
          rts       ;retorna da sub-rotina
     
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