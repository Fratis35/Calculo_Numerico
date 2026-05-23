clear; 
clc; 
close;

function y = f(t)
    y = cos(%pi*t.*exp(-t.*t/4)+%pi/7);
endfunction

ini = -10;
fim = 10;

x = ini:0.1:fim
plot(x,f(x));
title('Raizes');
legend('cos(%pi*t.*exp(-t.*t/4)+%pi/7');
xgrid;
plot(x,0,'r');

for k = ini:0.1:fim
    a = k;
    b = k +  0.1;
    if f(a)*f(b)<0 then
        //c = (a + b)/2;
        c = (a*f(b) - b*f(a)) / ( f(b)-f(a) );
        while(abs(f(c))>0.001)
        
          //c = (a + b)/2;
          c = (a*f(b) - b*f(a)) / ( f(b)-f(a) );
          if f(a)*f(c)<0 then
            b = c;
          end
         
          if f(b)*f(c)<0 then
            a = c;
          end
        end
        mprintf('Raiz: %f\n',c);
        plot(c,f(c),'ro');
    end
end
