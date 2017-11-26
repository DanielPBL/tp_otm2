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
