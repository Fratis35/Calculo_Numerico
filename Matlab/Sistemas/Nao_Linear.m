clear;
clc;

disp('Sistema não linear:');
erro = 1;
x = 0;
y = 0;

while erro > 1e-5
    d = [x, y];
    disp(d)

    %y = (exp(x) - 11)^(2);
    %x = sqrt(8-y);
    
    x = log( 11-sqrt(y) ) / log(exp(1));
    y = 8 - x.^2;
     
    %teste:
    %y = ((9 - x^3)/2*x)^(1/2)
    %x = (8 - 3^y)^2
    
    d = d - [x, y];
    erro = max(abs(d));
end

%  FUNÇÕES 
function a = f1(x,y)
    %a = exp(x) + sqrt(y) - 11;
    a = x^3 +2*x*y*y -9;
end

function a = f2(x,y)
    %a = y + x.^2 - 8;
    a = x^(1/2) + 3^y -8;
end

function a = df1x(x,y,h)
    a = (f1(x+h,y) - f1(x-h,y)) / (2*h);
end
    
function a = df1y(x,y,h)
    a = (f1(x,y+h) - f1(x,y-h)) / (2*h);
end

function a = df2x(x,y,h)
    a = (f2(x+h,y) - f2(x-h,y)) / (2*h);
end
    
function a = df2y(x,y,h)
    a = (f2(x,y+h) - f2(x,y-h)) / (2*h);
end

% NEWTON 
disp('Método de Newton:');
%tem q ter um chute inicial bom

h = 1e-3;
x = 0.5;
y = 0.5;
xy = [x; y];

erros = 1;

while erros > 1e-4
    a11 = df1x(x,y,h);
    a12 = df1y(x,y,h);
    a21 = df2x(x,y,h);
    a22 = df2y(x,y,h);

    J = [a11 a12; a21 a22];

    F = [f1(x,y); f2(x,y)];

    erro = - J \ F;   % MELHOR que inv(J)*F

    xy = xy + erro;
    x = xy(1);
    y = xy(2);

    disp(xy);

    erros = max(abs(erro));
end

