clear
clc 

function f = fx(x) //função
    f = x.^4-2*x.^2+3;
endfunction

function g = fxi(x) //integraldafunção
    g = x.^5/5-2*x.^3/3+ 3*x;
endfunction

MR=zeros(4,4); //MatrizdeRomberg(MR)
h=2; //passoinicial
for k=1:4
    x = 1:h:3;
    y = fx(x);
    MR(k,1) = inttrap(x,y); //Primeira coluna da MR
    h = h/2;
end;

for C = 2:4 // Algoritmo de Romberg sem critério de parada
    k4 = 4^(C-1);
    for L=1:(5-C)
        MR(L,C) = (k4*MR(L+1,C-1)- MR(L,C-1))/(k4-1);
    end
end

for L=1:4 // Mostrando os resultados
    mprintf("%1.6f & %1.6f & %1.6f & %1.6f \n",MR(L,1:4));
end

valor_teorico = fxi(3)- fxi(1); // valor teórico da integral
erro = MR(1,4)- valor_teorico; // erro
mprintf("Erro = %e, *** %1.6f",erro,valor_teorico);
