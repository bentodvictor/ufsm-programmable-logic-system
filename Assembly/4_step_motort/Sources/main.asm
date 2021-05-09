     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0
;  Um motor de passo é acionado com pulso, conforme mostrado na tabela abaixo. Controle um motor de passo, com uma frequência de passo de 100ms.
; Use um botão na entrada para controlar o sentido do giro do motor.


;--- Declaração de variaveis -----------
            ORG RAMStart
cont        RMB 1

;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           
           ;LDA #$01000010
           ;STA  SOPT1    ;Desliga cao de guarda       ; 
           
           
                                   ; liga interr.
           LDA #9 ; 10 vezes
           STA RTCMOD ;QUANDO O CONT CHEGA EM 1 GERA INTERRUPÇÃO                 
           LDA    #%00011011
                  ; |||||||| 
                  ; |||| prescaler do clk de 10ms
                  ; ||| liga interr
                  ; | clk de 1KHz
                  ; limpa flag de interr
           STA RTCSC
           
           MOV #0 , PTADD 
           MOV #$FF , PTBDD
           
           LDA #0
           STA cont
           CLI
           
loop:
          JMP loop
           
                  
INT_RTC: 
          BRSET 0, PTAD,estado1   ; quer ver se o botao está em 1 no bit 0
          BRSET 1, PTAD,estado2   ; quer ver se o botao está em 1 no bit 0
          RTI
          
estado1:

          LDA cont
          ADD #1
          STA cont
   
          CBEQA #8 , zerar
motor:    
          CBEQA #0, saida0
          CBEQA #1, saida1
          CBEQA #2, saida2
          CBEQA #3, saida3
          CBEQA #4, saida4
          CBEQA #5, saida5
          CBEQA #6, saida6
          CBEQA #7, saida7
              
zerar:
          CLRA 
          STA cont
          JMP motor
          
estado2:

          LDA cont
          SUB #1
          STA cont
   
          CBEQA #255 , seven
          JMP motor
seven: 
          LDA #7
          STA cont
          JMP motor       
saida0:
          LDA #%0001
          STA PTBD
          RTI
             
saida1:
          LDA #%0011
          STA PTBD
          RTI
             
saida2:
          LDA #%0010
          STA PTBD
          RTI
             
saida3:
          LDA #%0110
          STA PTBD
          RTI
             
saida4:
          LDA #%0100
          STA PTBD
          RTI
             
saida5:
          LDA #%1100
          STA PTBD
          RTI
             
saida6:
          LDA #%1000
          STA PTBD
          RTI
             
saida7:
          LDA #%1001
          STA PTBD
          RTI
                 

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