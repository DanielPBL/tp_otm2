% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353
          
%{ 
    Função recebe um vetor e a difereça maxima. O vetor recebido e alterado
    de forma que a norma da dirença entre o vetor calculado e o de parametro
    nao supere a diferença maxima e a norma do vetor calculado seja a mesma do
    vetor informado.
    
    @param v vetor - vetor que sera modificado
    @param dif real - norma maxima da diferenca
    @return vetor - vetor modificado de mesma norma que v
%} 

function v = alteraVetor(v, dif)
  v = v(:); %transforma em vetor coluna
  [l, c] = size(v);
  taxa =  dif / sqrt(l);
  
  for i = 1:l
    fator = rand() * taxa;
    v(i) = v(i) + fator;
    
    j = round((rand() * (l - 1)) + 1);
    while v(j) < fator
      j = round((rand() * (l - 1)) + 1);
    end
    
    v(j) = v(j) - fator;
  end
end