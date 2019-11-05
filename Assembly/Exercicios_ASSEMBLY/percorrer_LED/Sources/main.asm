  INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

;--- Declaração de variaveis -----------
            ORG RAMStart
soma        RMB 2                       ;soma de 2 bytes 
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           
           MOV #$FF, PTADD           ; PTA é saida
           lda #1                    ; primeiro led começa ligada
           sta PTAD                  ; PTA <= 1
           CLI                       ; liga interr.
           
           LDA #124     ;pra fechar 1s
           STA RTCMOD   ;QUANDO O CONT CHEGA EM 1 GERA INTERRUPÇÃO                 
           LDA    #%00011000    
                  ; |||||||| 
                  ; |||||prescaler do clk de 1ms
                  ; ||||liga interr
                  ; | clk de 1KHz
                  ; limpa flag de interr
           STA RTCSC
           
loop:      
          feed_watchdog          ; alimenta cão de guarda 
          jmp   loop
          
INT_RTC:         
         
         brset 0, PTAD, seta1       ;PTA[0] = 1? Se sim salta
         brset 1, PTAD, seta2       ;PTA[1] = 1? Se sim salta
         brset 2, PTAD, seta3       ;PTA[2] = 1? Se sim salta
         brset 3, PTAD, seta4       ;PTA[3] = 1? Se sim salta
         brset 4, PTAD, seta5       ;PTA[4] = 1? Se sim salta
         brset 5, PTAD, seta6       ;PTA[5] = 1? Se sim salta
         brset 6, PTAD, seta7       ;PTA[6] = 1? Se sim salta
         brset 7, PTAD, seta0       ;PTA[7] = 1? Se sim salta
         
         
seta1:
         bclr 0, PTAD            ;limpar PTA[0]
         bset 1, PTAD            ;acende PTA[1]
         rti                     ;volta para interrupções (CLI)
         
seta2:
         bclr 1, PTAD             
         bset 2, PTAD            
         rti                     
seta3:
         bclr 2, PTAD
         bset 3, PTAD
         rti
seta4:
         bclr 3, PTAD
         bset 4, PTAD
         rti
seta5:
         bclr 4, PTAD
         bset 5, PTAD
         rti
seta6:
         bclr 5, PTAD
         bset 6, PTAD
         rti 
seta7:
         bclr 6, PTAD
         bset 7, PTAD
         rti
seta8:
         bclr 7, PTAD
         bset 0, PTAD
         rti

nada:     
          cli ; Limpa Interrupção
          rti ; Retorna da Interrupção


demora:
         lda      #255                  ; A <- 255
         ldx      #255                  ; X <- 255
         dbnzx    *                     ; X <- X-1. se nao chegou a zero, repete
         dbnza    *-2                   ; A <- A-1. se n?o chegou a zero, pula pra 2 linhas antes
         RTS
         
;alimenta_cao: MACRO
 ;             STA SRS
  ;            ENDM 
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