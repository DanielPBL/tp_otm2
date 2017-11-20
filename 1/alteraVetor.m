function v = alteraVetor(v, dif)
  v = v(:);
  [l, c] = size(v);
  taxa =  dif / sqrt(l);
  
  for i = 1:l
    if rand() > 0.5
      v(i) = v(i) + rand() * taxa;
    else
      v(i) = v(i) - rand() * taxa;
    end
  end
end