close all;

N = 100;
T = 1000;

cenarios = [0.3, 0.25, 1; 0.3, 0.25, 2; 0.3, 0.2, 3];
n_cen = size(cenarios, 1);
M = zeros(2 * n_cen, T);

for i = 1:n_cen
  L_soma = zeros(1, T);
  Lq_soma = zeros(1, T);
  
  for j = 1:N
    lambda = cenarios(i, 1);
    mi = cenarios(i, 2);
    s = cenarios(i, 3);
    [L, Lq] = simulaFila(lambda, mi, s, T);
    L_soma = L_soma + L;
    Lq_soma = Lq_soma + Lq;
  end
  
  L_soma = L_soma / N;
  Lq_soma = Lq_soma / N;
  M(2 * i - 1, :) = L_soma;
  M(2 * i, :) = Lq_soma;
  
  figure;
  hold on;
  plot(1:T, L_soma, "-b");
  plot(1:T, Lq_soma, "-r");
  legend("Nº de clientes no sistema", "Nº de clientes na fila");
end

