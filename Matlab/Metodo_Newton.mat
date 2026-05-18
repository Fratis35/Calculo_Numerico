
clear; 
clc; 
%close;
clf();

function y = f(t)
    y = sin(t);
end

function y = df(t)
    h = 1e-3;
    y = (f(t+h)-f(t-h)) / (2*h);
end

%f = @(t) sin(t);
%df = @(t) (f(t+h)-f(t-h)) / (2*h);


x = -20:0.1:20
plot(x,f(x));
hold on;
grid on;
title('Raízes');
plot(x,0,'r');

erro = 1e-4
x0 = 0
x1 = 3

while abs(x0-x1) > erro
    x0 = x1;
    x1 = x0 - f(x0)/df(x0);
    fprintf('\nx0: %f\nvariação: %f\nf(x0): %f\n',x0,abs(x0-x1),f(x0))
    plot(x0,f(x0),'go');
end
plot(x1,f(x1),'ro');
fprintf('Raiz: %f\n',x1);

