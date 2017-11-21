function v = alteraVetor(v, dif)
  v = v(:);
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