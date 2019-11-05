  INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

 ;Faça um sistema de monitoramento que ligue uma sirene, se apos 3 seg, o sinal de controle ficar em nivel 0. O controle deve ser monitorado a cada 1/2 seg
;--- Declara??o de variaveis -----------
            ORG RAMStart
cont        RMB 1
;---- Aqui come?a o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           
           MOV #$FF, PTADD           ; PTA ?saida
           MOV #0, PTBDD           ; PTB ? entrada
           CLI 
           LDA #49 ; 500 ms
           STA RTCMOD ;QUANDO O CONT CHEGA EM 1 GERA INTERRUPÇÃO                         ; liga interr.
           LDA    #%00011011
                  ; |||||||| 
                  ; |||| prescaler do clk de 1s
                  ; ||| liga interr
                  ; | clk de 1KHz
                  ; limpa flag de interr
           STA RTCSC
           
loop:     
            
          feed_watchdog
          jmp   loop  
          
liga_sirene:
           LDA #1
           STA PTAD  ; liga sirene
           LDA #6
           STA cont
           RTI 
           
desliga_sirene:
           LDA #0
           STA PTAD  ;desliga sirene
           RTI       ; cont = 0
          
INT_RTC: 
          LDA RTCSC      ; carrega a configuração original
          AND #%01111111 ; limpa bit 7 do RTCSC
          STA RTCSC      ; salva de novo 
          
          BRCLR 0, PTBD, inc_cont
          ; se PTBD[0] = 0 vai para inc_cont, senão retorna da int
          CLRA 
          STA cont ; cont = 0
          JSR  desliga_sirene 
inc_cont:
          LDA cont
          INCA
          STA cont
          
          ; se cont >= 6 deu 3seg ou mais,  dai liga sirene
          
          SUB #6
          BGE liga_sirene
          JMP desliga_sirene           
            
nada:     
          cli ; Limpa Interrup??o
          rti ; Retorna da Interrup??o


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