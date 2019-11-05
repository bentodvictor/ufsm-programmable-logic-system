     INCLUDE 'derivative.inc'

interrupcoes EQU $FFC0

;Motor de passo com 100ms. Se btn1=1 vai gira pra um lado, se btn2=1 gira pro outro.
;Se ADC=0 o motor fica com 10Hz, se ADC=vcc o motor fica com 100Hz;
;--- Declaração de variaveis -----------
            ORG RAMStart
step        RMB 1
freq        RMB 2
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
           
           
           LDA #%01100000     ;clk do ADC = 1 do clock
		       ;     ||||||||
           ;     ||||||bus clock
           ;     ||||modo   (00=8bits, 01=12bits)
           ;     |||tamanho do sample (1=longo, 0=curto) 
           ;     |divi do clock
           ;     1=low power
           STA ADCCFG         ;ADC com 8 bits
           
           LDA #%01100010  ;AD2 (PTA(2))
           ;     ||||||||
           ;     |||porta de entrada 
           ;     ||converção contínua, ou só 1 converção  
           ;     |ativa a interrupção
           ;     COCO (ver se terminou ou não)
           STA ADCSC1
           ;com interrup./ inf conv/ conversor AD0
           
		       ;Valor gera 10Hz.
		       ;255/100 = 2.55
		       ;Pra dividir por 2.55
		       ;ADC*255/100 
		       lda #99
           sta RTCMOD   ;Qdo contador chegar em 1, gera interr
           
           lda #%10011000               ; Sem interr, clock de 1K, liga interr, 1ms.
           ;     ||||||||
           ;     ||||prescaler de clk de 1ms 
           ;     |||Liga interr  
           ;     |clk de 1khz
           ;     limpa flag de interr       
           sta RTCSC    ;salva a congi no RTC (rea-time-clk)
           
           ;zera o passo
           clra
           sta step
           sta freq
           sta freq+1
           
loop:      
          jmp   loop  
                     
INT_ACD:
          lda ADCSC1
          and #%01111111   ;limpa o COCO (logo quer dizer que não terminou)
          sta ADCSC1
          
          ;;Pega o valor que foi gerado pelo ADC
          LDA ADCRL    ;Accum <= ADC_valor(L)
          
          ;ADC*255/100 = valor da freqência.
          ldx 255
          MUL       ;X:A <= X*A
          
          ;Salva a parte alta no freq
          stx freq
          ldhx freq  ; H<= ficou com o que tinha no X
          
          ;X<= 100
          ldx 100
          
          div   ; A <= (H:A)/X
          
          ;Salva a frequencia certa no RTC
          sta RTCMOD   ;Qdo contador chegar em 1, gera interr
          
          rti ;volta da interr.     
                      
INT_RTC:  
          ;limpar a flag da interruptiuon 
          lda RTCSC
          and #%01111111   ;limpa bit 7 do RTCSC
          sta RTCSC
          
          BRSET 0, PTAD, nextStep   ;btn1=1? roda direita
          BRSET 1, PTAD, prevStep   ;btn2=1? roda esquerda

volta_int: 
          ;Coloca o novo valor na saída.
          lda step
          cbeqa #0, zer_std
          cbeqa #1, um_std
          cbeqa #2, dois_std
          cbeqa #3, tres_std
          cbeqa #4, quat_std
          cbeqa #5, quint_std
          cbeqa #6, sex_std
          
          ;Se não he nenhum desse é o 7
          lda #%00001001
          jmp fim_int

zer_std:
          lda #%00000001
          jmp fim_int 
um_std:
          lda #%00000011
          jmp fim_int 
dois_std: 
          lda #%00000010
          jmp fim_int
tres_std:
          lda #%00000110
          jmp fim_int
quat_std:
          lda #%00000100
          jmp fim_int
quint_std:
          lda #%00001100
          jmp fim_int
sex_std:
          lda #%00001000
fim_int:
          sta PTBD
          rti ;não faz nada retorna da iterruption
          
nextStep:
          lda step
          add #1
          
          ;se der 8, tem que zerar o cont.
          cbeqa #8, zera_cont
          sta step
          jmp volta_int
          
zera_cont:
          clra
          sta step
          
          jmp volta_int
                    
prevStep:        
          
          lda step
          
          sub #1
          
          cbeqa #-1, coloca_sete
          sta step
          jmp volta_int
          
coloca_sete:
          lda #7
          sta step
          
          jmp volta_int          
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
          DC.W INT_ACD  ;  FFD8 - ADC			18
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