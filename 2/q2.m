% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353

%{
    A solucao implementada consiste em 2 loops aninhados que realizam as
    iteracoes e para cada uma delas executa um dado numero de transicoes
    as transicoes sao feitas sorteando um numero e entao atualizando o estado
    o contador de estados deve ser entao atualizado.

    No final as probabilidades sao obtidas atraves da divisao do vetor de
    contador pelo numero de iteracoes.

    @param P matriz -
    @param init inteiro - estado inicial
    @param iterations - numero de iteraçoes
    @param transitions - numero de transicoes por iteracao
    @return vetor - vetor com a probabilidade de se parar em cada estado
%} 

P = [1 0 0 0 0; 2/3 0 1/3 0 0; 0 2/3 0 1/3 0; 0 0 2/3 0 1/3; 0 0 0 0 1];
x = markova(P, 1, 1000, 100);
printf("P(0) = %.3f \nP(4) = %.3f\n", x(1), x(5));
