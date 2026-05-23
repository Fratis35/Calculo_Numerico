clear
clc
R = 40;
L = 1e-3;
C = 1e-6;
Z = 25;

function y = f(x)
    %y = x.^3 - 9*x + 4;
    y = ((1./(40*40))+(x*1e-6 - 1./(x*1e-3)).^2 ).^1/2 - 1/25;
  
end  
erro = 1e-6;

x = 0.1:0.01:10;
plot(x,f(x));
hold on;

for k = -10:0.1:10
      a = k;
      b = k+0.1;
      c=(a+b)/2;
     
  if f(a)*f(b) < 0
      
     while abs(f(c)) > erro  
        %c = (a+b) / 2;
        c = (a*f(b)-b*f(a))/(f(b)-f(a));
        if f(a)*f(c) <  0
            b = c;
        end
        
        if f(b)*f(c) < 0
            a = c;
        end
        %disp(c,f(c));
        fprintf("\n c = %f, f(c) = %f",c,f(c)); 
     end
     fprintf("\nValor final: %f\n",c);
     plot(c,f(c),'ro');
  end
  
end
grid on;
hold of;
