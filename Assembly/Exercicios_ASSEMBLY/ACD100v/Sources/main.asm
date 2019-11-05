;Programa padr�o

     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0


;--- Declara??o de variaveis -----------
            ORG RAMStart
lido        RMB 2
outra       RMB 2
;---- Aqui come?a o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H
           
           
           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #00,PTADD      	      ;  PTA � entrada
           MOV    #$FF, PTBDD           ; PTB � saida
           SEI                          ; desliga interr.
           
           LDA #%00000100     ;;clk do ADC = 1 do clock
           STA ADCCFG         ;ADC com 12 bits 



loop:    
          ; 1 conv por vez;
          LDA #%00000000
          STA ADCSC1        ;sem interrup./ 1 conv/ conversor AD0


          ;;Come�ar a leitura de uma entrada (ADC0)
          BRCLR 7, ADCSC1, * ; espera o coco fica em 1 (pronto)
          
          ;SEI  ;N�o me incomode = interr off
          
          ;Quado o coco=1 gera a interrup e entra nessa parte do codigo
          LDA ADCRH
          STA lido
          
          lda ADCRL
          sta lido+1
          
         ;temos os 12 bits do ADC em lido.
          ;para ter um n�mero entre 0 e 100V temos que dividir 4095 pra que fique sendo 100.
           ;4095/41 =~ 100
           
           ldhx lido  ; h<=lido[h] e x<=lido[l]
           txa        ; a<=x , logo lido[l]
           
           ldx #41    ;constante da div
           
           DIV
           
           ;A tem a resposta entre 0 e 100, por�m s� vai 49 ou 99.
           add #1  ;s� pra deixar bem certinho
           sta PTBD    ;0->100 est� em PTB
      
       
         jmp loop       
            
            
nada:     
          cli ; Limpa Interrup??o
          rti ; Retorna da Interrup??o


demora:
         lda      #255                  ; A <- 255
         ldx      #255                  ; X <- 255
         dbnzx    *                     ; X <- X-1. se nao chegou a zero, repete
         dbnza    *-2                   ; A <- A-1. se n?o chegou a zero, pula pra 2 linhas antes
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

