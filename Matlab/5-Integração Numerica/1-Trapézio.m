clear
clc

f = @(x) (cos(pi*x))./(x+1); 

ini = 0;
fim = 1;
itv = 0.001;
A = 0;
S = 0;

for i = ini:itv:(fim-itv)
    A = ((f(i)+f(i+itv))*itv )/2;
    S = S+A;
end
disp(S)

k = ini:itv:fim;
plot(k, f(k)) 

