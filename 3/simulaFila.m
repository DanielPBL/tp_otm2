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