% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353
          
%{ 
    Funçao recebe os parametros de um sistema de filas e simula o processo de 
    nascimento e morte dos clientes em um numero determinado de iteracoes. Para
    cada iteracao, um numero aleatorio e gerado e, se esse numero for menor que 
    a taxa de chegada de clientes, entao um cliente e inserido no sistema. O 
    mesmo processo e repetido com relacao a taxa de atendimento, resultando na 
    remocao do cliente no sistema. Quando um atendente fica livre, este so pode
    atender outro cliente na proxima iteracao. Ao final da execucao, os vetores
    de numero de clientes no sistema e na fila sao retornados.
    
    Obs.: Os vetores de simulacao possuem um estado a mais para armazenar o
    estado incial, onde o sistema se encontra vazio, antes do inicio do
    funcionamento do sistema.
    
    @param lambda real - taxa de chegada de clientes
    @param mi real - taxa de atendimento dos atendentes
    @param s inteiro - numero de atendentes
    @param T - numero de iteraçoes
    @return vetor - vetor com o numero de clientes no sistema em cada iteracao
    @return vetor - vetor com o numero de clientes na fila em cada iteracao
%}

function [L, Lq] = simulaFila (lambda, mi, s, T)
  Lq = zeros(T + 1, 1);
  L = zeros(T + 1, 1);
  
  for i = 2:(T + 1)
    L(i) = L(i - 1);
    Lq(i) = Lq(i - 1);
    em_atend = L(i) - Lq(i);
    
    if rand() < lambda
      Lq(i) = Lq(i) + 1;
      L(i) = L(i) + 1;
    end
    
    while (Lq(i) > 0) && (s > em_atend)
      Lq(i) = Lq(i) - 1;
      em_atend = em_atend + 1;
    end
    
    for j = 1:em_atend
      if rand() < mi
        L(i) = L(i) - 1;
      end
    end
  end
  
  L = L(2:(T + 1))';
  Lq = Lq(2:(T + 1))';
end