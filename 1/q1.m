% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353
          
%{ 
    Script para resoluçao do problema 1
    a) vide resolveJogo.m
    b) a tabela de premios do jogo de par ou impar foi encontrada:
    P = [ 1 -1
         -1  1]
    e o premio acumulado em 100 rodadas foi calculado (vide simulaJogo.m)
    c) um vetor pouco distinto da solucao otima foi gerado (vide alteraVetor.m)
    e, em posse desse novo vetor, o premio acumulado em 100 rodadas foi
    calculado.
%} 

P = [1 -1; -1 1];
[A, B, ~] = resolveJogo(P);
premio = simulaJogo(A, B, P, 100);

printf("Questao b\n")
printf("Premio do jogador A: %d\n", premio(1));
printf("Premio do jogador B: %d\n", premio(2));

P = [3, -1, -3; -2, 4, -1; -5, -6 -2];
[A, B, ~] = resolveJogo(P);
premio = simulaJogo(A, B, P, 100);

printf("\nQuestao c (ii)\n");
printf("Premio do jogador A: %d\n", premio(1));
printf("Premio do jogador B: %d\n", premio(2));

Ad = alteraVetor(A, 0.01);
Bd = alteraVetor(B, 0.01);
premiod = simulaJogo(Ad, Bd, P, 100);
 
printf("\nQuestao c (iii)\n");
printf("Diferença da sol. otima p/ A: %d\n", norm(A - Ad));
printf("Diferença da sol. otima p/ B: %d\n", norm(B - Bd));
printf("Premio do jogador A: %d\n", premiod(1));
printf("Premio do jogador B: %d\n", premiod(2));

printf("\nQuestao c (iv)\n");
printf("Jogador A: %d - %d = %d\n", premio(1), premiod(1), premio(1) - premiod(1));
printf("Jogador B: %d - %d = %d\n", premio(2), premiod(2), premio(2) - premiod(2));