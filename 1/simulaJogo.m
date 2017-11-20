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