clear
clc
N=20; %raiz q eu quero
x=4; %aproximacao 
erro = 1; 

while abs(erro)>0.001
    erro = (x*x-N)/(2*x); 
    
    x=x-erro; 
    disp(x)
    
end
