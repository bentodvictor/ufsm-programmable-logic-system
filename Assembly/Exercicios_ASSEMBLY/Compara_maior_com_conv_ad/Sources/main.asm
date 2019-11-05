  INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0


;--- Declara??o de variaveis -----------
            ORG RAMStart
lido        RMB 2                 ; lido com 2 bytes
outro       RMB 2                 ; outro com 2 bytes para usar segundo conversor
;---- Aqui come?a o programa -----------         
            ORG ROMStart
main     
            clra
            MOV #$00,  PTADD     ; PTA � entrada
            MOV #$00 , PTBDD     ; PTB � entrada
            MOV #$FF , PTCDD     ; PTC � saida
            MOV #$FF , PTDDD     ; PTD � saida
            SEI                  ; desliga interr.
                                   
           
loop:     
            LDA #%00000100
            STA ADCCFG       ; adc com 12 bits
            LDA #%00000000
            STA ADCSC1       ; sem interrup��o/conv continua/ conversor AD0
          
         	  BRCLR ADCSC1_COCO, ADCSC1, *
         	  LDA ADCRH       ; le parte alta
         	  STA lido        
         	  LDA ADCRL       ; le parte baixa
         	  STA lido+1
         	  
         	  LDA #%00000001
            STA ADCSC1       ; sem interrup��o/conv continua/ conversor AD1
            
         	  BRCLR ADCSC1_COCO, ADCSC1, *
         	  LDA ADCRH        ; le parte alta
         	  STA outro
         	  LDA ADCRL        ; le parte baixa
         	  STA outro+1
         	  
         	  LDA lido
         	  SUB outro       ; lido - outro
         	  
         	  BEQ iguais          ; se forem iguais (=0)
         	  BGT lido_maior      ; lico > outro
         	  
outro_maior: 
         	 LDA lido
           STA PTCD
           LDA lido+1
           STA PTDD
           JMP loop  
           ;PTCD <= lido
           ;PTDD <= lido+1
         	  
         	  
; se forem iguais mexe com a parte baixa	          
iguais:
            LDA lido + 1            
            SUB outro + 1
            BGT lido_maior
            BRA outro_maior

lido_maior:
           LDA outro
           STA PTCD
           LDA outro+1
           STA PTDD
           JMP loop  
           
     
maior_lido2:
           LDA  lido
           STA  PTCD
           JMP  loop   	         

            
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
          DC.W main  ;  FFFE - Vetor de Reset	0