% Alunos: Daniel de Paula Braga Lopes     201412040361
%         Gabriel Alves de Campos Mattar  201412040175
%         Guilherme Fernandes Marchezini  201412040353
          
%{ 
    A solucao implementada consiste nos algoritmos apresentador na disciplina 
    teorica de otimizacao 2. A solucao possui 1 loop que varia o tamanho de 
    atendentes do sistema, para cada uma das 4 variantes foi entao calculado o 
    valor de ρ, que foi necessario para o calculo de outras grandezas, em 
    seguida foram utilizadas as formulas necessarias para o calculo de P0, P1,
    P2, P5, P10, e as das demais grandezas.
    
    @param lambida real - taxa de chegada
    @param u real - taxa de atendimento
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
      if(n == 1 || n == 2 || n == 5 || n == 10)
        printf("P%d = %d\n", n, P(n));
      end
      
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
      if(t-1 == 0 || t-1 == 1 || t-1 == 2 || t-1 == 5)
        printf("PW(%d) = %d\n", t-1, PW(t)); 
      end
    end
    
    
  end
  
end