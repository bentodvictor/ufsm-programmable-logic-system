
main:
		CLRA; zera acumudador e manda o zero para as portas, definindo elas como entradas
		STA PTADD; inputs
		STA PTBDD; inputs
		STA PTCDD; inputs
		STA PTDDD; inputs
		
		LDA #255
		
		STA PTEDD; outputs
		STA PTFDD; outputs
		
loop:

		LDA	PTBD;	AC <- Al parte baixa1
		ADD	PTDD;	AC <- AC + Bl parte baixa2
		STA PTFD;	PTF <- Cl pino de saida recebe valor da soma das partes baixas
		
		LDA	PTAD;	AC <- Ah parte alta1
		ADD	PTCD;	AC <- AC + Bh parte alta2
		STA PTED;	PTE <- Ch pino de saida recebe valor da soma das partes altas
		
		JMP loop;