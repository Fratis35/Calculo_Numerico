clear
clc

%equação x³-2x-1

x = 2 
x0 = 1

while abs(x-x0) > 0.01
   x0 = x
   x = (2*x0+1)^(1/3)
   
   disp(x0)
end
fprintf('Raiz: %f\n',x);

