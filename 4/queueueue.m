% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353
          
%{ 
    A solucao implementada consiste em 2 loops aninhados que realizam as
    iteracoes e para cada uma delas executa um dado numero de transicoes
    as transicoes sao feitas sorteando um numero e entao atualizando o estado
    o contador de estados deve ser entao atualizado.
    
    No final as probabilidades sao obtidas atraves da divisao do vetor de contador
    pelo numero de iteracoes.
%} 
 
function queueueue (lambida, u)
  
  P = zeros(10);
  PW = zeros(5);
  
  for s = 1:4
    un = s * u;
    p = lambida/un;
    parc = 0;
    printf("\ns = %d\n", s);
    printf("p = %d\n", p);
    
    for n = 0:s-1
      parc = parc + ((lambida/u)^n)/factorial(n);
    end
    
    P0 = 1/(parc + ((lambida/u)^s)/factorial(s) * 1/(1-lambida/(s*u)));
   
    printf("P0 = %d\n", P0);
   
    
    for n = 1:10
      if  n <= s
        P(n) = ((lambida/u)^n)/factorial(n) * P0;
      else
        P(n) = ((lambida/u)^n)/(factorial(s)*s^(n-s)) * P0;
      end      
        
      printf("P%d = %d\n", n, P(n));
      
    end
    
    lq = (P0*((lambida/u)^s)*p)/(factorial(s)*(1-p)^2);
    
    l = lq + lambida/u;
    
    wq = lq/lambida;
    w = wq + 1/u;
   
    printf("L = %d\n", l);
    printf("Lq = %d\n", lq);
    printf("W = %d\n", w);
    printf("Wq = %d\n", wq);
    
    PW0 = P0;
    
    for n = 1:s-1
      PW0 = PW0 + P(n);
    end
    
    for t = 1:6
      PW(t) = (1-PW0)*exp(-s*u*(1-p)*(t-1));
      printf("PW(%d) = %d\n", t-1, PW(t)); 
    end
    
    
  end
  
end