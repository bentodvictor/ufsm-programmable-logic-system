     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

;4

;--- Declaração de variaveis -----------
            ORG RAMStart
valor        RMB 2
aux          rmb 1
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H
           
           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #$ff,PTADD      	    ; PTA é saída
           MOV    #$f0, PTBDD           ; PTB(7:4) é saida, PTB(3:0) é entrada 
           MOV    #$00, PTCDD
 
           ;Valor gera 100Hz (10ms)
		       lda #9       ;Espera 9ms antes de mudar o valor.
           sta RTCMOD   ;Qdo contador chegar em 1, gera interr
           
           lda #%00011000               ; Sem interr, clock de 1K, liga interr, 1ms.
           ;     ||||||||
           ;     ||||prescaler de clk de 1ms 
           ;     |||Liga interr  
           ;     |clk de 1khz
           ;     limpa flag de interr       
           sta RTCSC    ;salva a config no RTC (rea-time-clk)
           
           ;Zera o valor
           clra
           sta valor
           sta valor+1
           
           ;Liga o primeiro display
           lda #$10
           sta PTBD
           
           CLI    ; liga interr.
           
loop:           
          jmp   loop  
                     
INT_RTC:  
          ;limpar a flag da interruptiuon 
          lda RTCSC
          and #%01111111   ;limpa bit 7 do RTCSC
          sta RTCSC
          
          ;Se tiver que somar, soma
          brset 0, PTCD, SUM
          jmp CONTROL_AJT
          
SUM:
          lda valor+1  ;Pega a parte baixa
          add #1      
          daa          ;Ajusta pra BCD
          sta valor+1  ;salva de volta
          
          ;Se der overflow a carry fica com 1, senão fica com 0.
          lda valor
          adc #0      ;valor <= valor + 0 + carry
          daa         ; ajusta o BCD
          sta valor        

CONTROL_AJT:
          ;Pega o controle
          lda PTBD
          and #$F0     ; Apaga a parte baixa pra não entrar no shift
          ;Shifita pra esquerda
          lsla
          ;Salva o controle
          
          ;Se o carry é 1 deve voltar pro primeiro display
          bcs ROTATION
          jmp salva_control

ROTATION: 
          lda #$10
          
salva_control:
          
          sta PTBD
          
          ;Muda o valor
          jsr MOSTRA_VALOR
          
          rti
    
MOSTRA_VALOR:
disp0:
          brclr 7, PTBD, disp1
          ;Se for o disp0
          lda valor+1
          jmp FIM
disp1:    
          brclr 6, PTBD, disp2   
          ;Se for o disp1
          lda valor+1
          nsa           ;Acum <= (Acum[3:0] : Acum[7:4])
          jmp FIM
disp2:                 
          brclr 5, PTBD, disp3
          ;Se for o disp2
          lda valor
          jmp FIM

disp3:          
          ;Se for o disp3
          lda valor
          nsa           ;Acum <= (Acum[3:0] : Acum[7:4])
          
FIM:      
          ;Remove parte que não importa
          and #$0F
          sta aux
          jsr VALOR_AJUST
      
          ;Valor convertido está no aux
          lda aux
          
          ;Salva o valor;
          sta PTAD

          ;Retorna da subsrotina
          rts


VALOR_AJUST:
          lda aux ;carrega o valor que vai ser ajustado
          
          cbeqa #9, coloca_9
          cbeqa #8, coloca_8
          cbeqa #7, coloca_7
          cbeqa #6, coloca_6
          cbeqa #5, coloca_5
          cbeqa #4, coloca_4
          cbeqa #3, coloca_3
          cbeqa #2, coloca_2
          cbeqa #1, coloca_1
          jmp coloca_0
          
          ;pabcdefg
coloca_9:
          lda #$7B
          jmp fim_ajust
coloca_8:
          lda #$7F
          jmp fim_ajust
coloca_7:  
          lda #$70
          jmp fim_ajust
coloca_6:  
          lda #$5F
          jmp fim_ajust
coloca_5: 
          lda #$5B
          jmp fim_ajust
coloca_4: 
          lda #$33
          jmp fim_ajust
coloca_3:  
          lda #$79
          jmp fim_ajust
coloca_2: 
          lda #$6D
          jmp fim_ajust
coloca_1: 
          lda #$30
          jmp fim_ajust
coloca_0: 
          lda #$7E
         
fim_ajust:
          sta aux
          rts
                                               
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
          DC.W nada ;  FFF4 - TMP1 CH1			5
          DC.W nada  ;  FFE6 - TMP1 CH0			4
          DC.W nada  ;  FFF8 - Low voltage		3
          DC.W nada  ;  FFFA - /IRQ1 Vector            	2
          DC.W nada  ;  FFFC - Int. por software	1
          DC.W main  ;  FFFE - Vetor de Reset		0