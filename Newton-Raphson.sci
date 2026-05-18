clear; 
clc; 
//close;
clf();

function y = f(t)
    y = sin(t);
endfunction


function y = df(t)
    y = cos(t);
endfunction

//Derivada Numérica:
function y=df(t)
    y = (f(t+h)-f(t-h)) / (2*h);
endfunction


x = -20:0.1:20
plot(x,f(x));
title('Raizes');
legend('seno');
xgrid;
plot(x,0,'r');


erro = 1e-4
x0 = 0
x1 = 3

while abs(x0-x1) > erro
    x0 = x1;
    x1 = x0 - f(x0)/df(x0);
    mprintf('\nx0: %f\nvariação: %f\nf(x0): %f\n',x0,abs(x0-x1),f(x0))
    plot(x0,f(x0),'go');
end
plot(x1,f(x1),'ro');
mprintf('Raiz: %f\n',x1);
