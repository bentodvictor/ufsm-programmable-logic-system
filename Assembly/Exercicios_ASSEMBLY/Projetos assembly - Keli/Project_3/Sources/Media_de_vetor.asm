  INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0
 ;LEIA 100 VALORES DA PTA E SALVE-AS EM UM VETOR. APÓS, CALCULE A MEDIA DO VETOR E APRESENTE-AS NA PTB.

;--- Declara??o de variaveis -----------
            ORG RAMStart
lido        RMB 100
soma        RMB 2
media       RMB 1
;---- Aqui come?a o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #0,PTADD      	; PTA ? entrada e bit 7 ? saida
           MOV    #$FF, PTBDD           ; PTB ? saida
           SEI                          ; desliga interr.
           
loop:      
          
          LDX #99                        ;POSIÇÃO DO VETOR  X RECEBE 99
          
 inicio:  LDA PTAD  
          STA lido, X                    ;salva o numero na variavel lido + 9     LIDO[X] RECEBE NUMERO
          DBNZX inicio                   ; X--, SE X!= 0 PULA PARA INICIO
          LDA PTAD  
          
          
          STA lido, X                    ; LIDO [0] RECEBE AC  
          
          CLRA
          STA soma                       ; soma[h] =0
          STA soma + 1                   ; soma[l] = 0
          
          LDX #99 ; índice
loop2:    
          LDA soma+1                     ; AC recebe soma[l]
          ADD  lido, X                   ;AC recebe soma[l] + lido[x] 
          STA soma + 1                   ; soma[l] receb AC
          
          LDA soma
          ADC #0                         ; AC recebe soma[h] + 0 + carry
          STA soma                       ; soma[h] recebe AC
          DBNZX loop2                    ; X--, SE X!= 0 PULA PARA LOOP2
           
           ; Para o zero
           
          LDA soma+1                     ; AC recebe soma[l]
          ADD  lido, X                   ;AC recebe soma[l] + lido[x] 
          STA soma + 1                   ; soma[l] receb AC
          LDA soma
          ADC #0                         ; AC recebe soma[h] + 0 + carry
          STA soma                       ; soma[h] recebe AC
          
          ; divisão
          LDHX soma                      ; H:X recebe soma : soma+1
          LDA soma+1                     ; carrega no A a parte baixa    AC receb soma + 1
          LDX #100                       ; dividendo        x recebe 100
          
          DIV                            ; a recebe (H:A)/X
          STA PTBD                          
          JMP loop
                       
            
            
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