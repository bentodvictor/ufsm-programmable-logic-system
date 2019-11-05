;*******************************************************************
;*  Leia 100 valores da PTA e salve-as em um vetor. Após, calcule  *
;*  a média do vetor e apresente-a na PTB.                         *
;*******************************************************************
           
            INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0


;--- Declaração de variaveis -----------
            ORG RAMStart
lido        RMB 100           ; lido tem 100 BYTES
soma        RMB 2             ; Tamanho  de 2 BYTES
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H

           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #0,PTADD             	; PTA é entrada e bit 7 é saida
           MOV    #$FF, PTBDD           ; PTB é saida
           SEI                          ; desliga interr.
           
loop:
          ldx #99         ; posição do vetor x recebe 99
;======================= Faz a leitura dos 100 valores ========================
inicio:
          lda PTAD
          sta lido, x     ; lido[x] <= PTAD
          dbnzx inicio    ; x--, se x !=0 vai ara inicio
          lda PTAD
          sta lido, x     ; lido[0] <= ac(PTAD)
          
          clra
          sta soma        ;soma[h] = 0
          sta soma + 1    ;soma[l] = 0
          
;======================= Faz a soma dos 100 valores ========================          
          ldx #99
loop2:
          lda soma + 1    ; ac <= soma[l]
          add lido, x     ; ac <= soma[l] + lido[x]          
          sta soma + 1    ; soma[l] <= ac
          
          lda soma 
          adc #0          ; ac <= soma[h] + 0 + carry
          sta soma        ; soma[h] <= ac
          dbnzx loop2     ; x--, se x != 0, pula para o loop2

;===================== PARA O LIDO[0] =====================
          lda soma + 1    ; ac <= soma[l]
          add lido, x     ; ac <= soma[l] + lido[0]          
          sta soma + 1    ; soma[l] <= ac
          
          lda soma 
          adc #0          ; ac <= soma[h] + 0 + carry       caso ocorra um carry na soma da parte baixa
          sta soma        ; soma[h] <= ac
;===========================================================

;======================= Faz a divisão dos valores somados ========================          
          ldhx soma       ; H:X <= soma:soma + 1     Carrega o h com soma e o x com soma + 1
          lda soma + 1    ; ac <= soma + 1
          ldx #100        ; x <= 100
          
          div             ; ac <= (H:A)/X
          
          sta PTBD
          
          jmp loop
                   
          
            
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
          DC.W nada  ;  FFF0 - TMP1 overflow		7
          DC.W nada  ;  FFF2 - TMP1 CH2			6
          DC.W nada  ;  FFF4 - TMP1 CH1			5
          DC.W nada  ;  FFE6 - TMP1 CH0			4
          DC.W nada  ;  FFF8 - Low voltage		3
          DC.W nada  ;  FFFA - /IRQ1 Vector            	2
          DC.W nada  ;  FFFC - Int. por software	1
          DC.W main  ;  FFFE - Vetor de Reset		0