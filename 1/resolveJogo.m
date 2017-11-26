% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353
          
%{ 
    Função recebe como parametro a tabela de premios de um jogo de dois
    jogadores e soma zero e, a partir da tabela, monta o modelo linear de
    estrategias mistas para o jogador A e para o jogador B. Ambos os modelos sao
    solucionados utilizando o comando glpk.
    
    @param P matriz - tabela de premios do jogo
    @return vetor - vetor com a probabilidade de escolha de cada estrategia
    do jogador A
    @return vetor - vetor com a probabilidade de escolha de cada estrategia
    do jogador B
    @return real - valor do jogo
%}

function [Xi, Yi, v] = resolveJogo (P)
  [lin, col] = size(P);
  
  c = [zeros(lin, 1); 1];
  A = [[P'; ones(1, lin)], [-ones(col, 1); 0]];
  b = [zeros(col,1); 1];
  
  lb = zeros(size(c));
  
  for i = 1:size(b, 1) - 1
    ctype(i) = "L";
  end
  ctype = [ctype "S"];
  
  lb(end) = -Inf;
  
  for i = 1:size(c, 1)
    vartype(i) = "C";
  end
  
  [Xi] = glpk(c, A, b, lb, [], ctype', vartype, -1);
  
  P = P';
  [lin, col] = size(P);
  
  c = [zeros(lin, 1); 1];
  A = [[P'; ones(1, lin)], [-ones(col, 1); 0]];
  b = [zeros(col,1); 1];
  
  lb = zeros(size(c));
  ctype = "";
  vartype = "";
  
  for i = 1:size(b, 1) - 1
    ctype(i) = "U";
  end
  ctype = [ctype "S"];
  
  lb(end) = -Inf;
  
  for i = 1:size(c, 1)
    vartype(i) = "C";
  end
  
  [Yi] = glpk(c, A, b, lb, [], ctype', vartype, 1);
  
  v  = Xi(end);
  Xi = Xi(1:end-1);
  Yi = Yi(1:end-1);
end