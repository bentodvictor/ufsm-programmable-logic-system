     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0


;--- Declaração de variaveis -----------
            ORG RAMStart
lido        RMB 1
result      RMB 1
;---- Aqui começa o programa -----------         
            ORG ROMStart
main     
           clra                         ; Limpa o Acumulador
           clrx                         ; Limpa o X
           clrh                         ; Limpa o H
           sta  lido    ;lido = 0;

           LDA    #%01000010
           STA    SOPT1                 ; desliga COP

           MOV    #$FF,PTADD           	; PTA é entrada e bit 7 é saida
           MOV    #$0F, PTBDD           ; PTB é saida. HH=input,LH=output
           lda    #$FF
           sta    PTBPE                 ;Liga pull-up na borta b
           SEI                          ; desliga interr.
           
loop:      
;ler 3 números e converter. Tipo a peasoa aoerta 2->1->1, logo deve ter 211 no result
        lda #30
        ldx #30
        sta lido
        jrs teclado
        
        lda lido
        sub #30
        beq loop
        
        lda lido
        sta result
        
        lda #30
        sta
        
        
        
        lda #30
        
        
        sta PTADD
        
        jmp loop

teclado:
linha1:   
          
          lda #%11111110
          sta PTBD                      ;Somente PTB[0]=0, demais em 1.
          
          lda   #1
          BRCLR 4, PTBD, salvac1           ;SE PTB[4]=0, vai pra num1
          lda   #2
          BRCLR 5, PTBD, salvac2           ;SE PTB[4]=0, vai pra num1
          lda   #3
          BRCLR 6, PTBD, salvac3           ;SE PTB[4]=0, vai pra num1
          
linha2:
          lda #%11111101
          sta PTBD                      ;Somente PTB[0]=0, demais em 1.
          
          lda   #4
          BRCLR 4, PTBD, salvac1           ;SE PTB[4]=0, vai pra num1
          lda   #5
          BRCLR 5, PTBD, salvac2           ;SE PTB[4]=0, vai pra num1
          lda   #6
          BRCLR 6, PTBD, salvac3           ;SE PTB[4]=0, vai pra num1

linha3:
          lda #%11111101
          sta PTBD                      ;Somente PTB[0]=0, demais em 1.
          
          lda   #7
          BRCLR 4, PTBD, salvac1           ;SE PTB[4]=0, vai pra num1
          lda   #8
          BRCLR 5, PTBD, salvac2           ;SE PTB[4]=0, vai pra num1
          lda   #9
          BRCLR 6, PTBD, salvac3           ;SE PTB[4]=0, vai pra num1

linha4:
          lda #%11111101
          sta PTBD                      ;Somente PTB[0]=0, demais em 1.
          
          lda   #10
          BRCLR 4, PTBD, salvac1           ;SE PTB[4]=0, vai pra num1
          lda   #0
          BRCLR 5, PTBD, salvac2           ;SE PTB[4]=0, vai pra num1
          lda   #11
          BRCLR 6, PTBD, salvac3           ;SE PTB[4]=0, vai pra num1 

          RTS

salvac1:
          sta   lido        ;lido = acc    
          sta   PTAD
          JSR   demora      ;gasta tempo para debounce
          brclr 4, PTBD, *  ;espera soltar o botão
          jrs   demora      ;faz debouce
          jmp teclado
          
salvac2:
          sta   lido        ;lido = acc    
          sta   PTAD
          JSR   demora      ;gasta tempo para debounce
          brclr 5, PTBD, *  ;espera soltar o botão
          jrs   demora      ;faz debouce
          jmp teclado

salvac3:
          sta   lido        ;lido = acc    
          sta   PTAD
          JSR   demora      ;gasta tempo para debounce
          brclr 6, PTBD, *  ;espera soltar o botão
          jrs   demora      ;faz debouce
          jmp teclado          
          
            
            
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