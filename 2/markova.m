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
 
function [probabilities] = markova (P, init, iterations, transitions)
  tam = size(P,1);
  count = zeros(tam, 1);
  
  for i = 1:iterations
    state = init+1;
    for j = 1:transitions
      randVal = rand(1);
      val = 0;
      accum = 0;
      for s = 1:tam
        accum = accum + P(state, s);
        if accum >= randVal
          state = s;
          break;
        end
      end
    end
    count(state) = count(state) + 1;
  end
  
  probabilities = count/iterations;
  
end