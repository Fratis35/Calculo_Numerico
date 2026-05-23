clear; 
clc; 
%close;
clf();

function y=f(t)
    y = sin(t);
end

x = -20:0.1:20
plot(x,f(x));
hold on;
grid on;
title('Raízes');
plot(x,0,'r');

erro = 1e-4
x0 = 0
x1 = 2
x2 = 3

while abs(x2-x1) > erro
    x0 = x1;
    x1 = x2
    x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
    fprintf('\nx1: %f\nvariação: %f\nf(x1): %f\n',x1,abs(x2-x1),f(x1))
    plot(x1,f(x1),'go');
end
plot(x1,f(x1),'ro');
fprintf('Raiz: %f\n',x2);

