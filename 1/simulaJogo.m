% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353
          
%{ 
    Função que simula n_sim rodadas de um jogo de dois jogadores de soma zero.
    Para cada rodada e sorteado um valor aleatorio no intervalo [0, 1] para cada
    um dos jogadores. A estrategia utilizada um cada rodada e determinada com
    o metodo da roleta, isto e, a estrategia eleita e aquela a partir da qual o
    somatorio de todas a probabilidade das estrategias anteriores e superior ao
    numero aleatorio sorteado. Para cada rodada o premio e acumulado, somando a
    posicao das estrategias escolhidas na matriz de premios para o jogador A e 
    subtraindo para o jogador B.
    
    @param A vetor - vetor de probabilidades para o jogador A
    @param B vetor - vetor de probabilidades para o jogador B
    @param P matriz - tabela de premios
    @param n_sim - numero de rodadas
    @return vetor - vetor coluna com o premio acumulado do jogador A e jogado B,
    respectivamente
%}

function premios = simulaJogo (A, B, P, n_sim)
  premios = zeros(2, 1);
  
  for i = 1:n_sim
    randA = rand();
    acc = 0;
    n = size(A, 1);
    for jA = 1:n
      acc = acc + A(jA);
      if acc >= randA
        break;
      end
    end
    
    randB = rand();
    acc = 0;
    n = size(B, 1);
    for jB = 1:n
      acc = acc + B(jB);
      if acc >= randB
        break;
      end
    end
    
    premios(1) = premios(1) + P(jA, jB);
    premios(2) = premios(2) - P(jA, jB);
  end
end