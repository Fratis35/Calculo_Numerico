clear 
clc
close

function y  = fa(x)
    y = (x.^2).*exp(-x);
endfunction


function y  = fb(x)
    y = (x.^2 + 1).^-1;
endfunction

function y  = fc(x)
    y = sin(x)./(x);
endfunction


function y  = fd(x)
    y = log(x);
endfunction

itv = 10e-3

//a
ini = 0;
fim = 5;
k = ini:itv:fim
disp("A:")
disp(inttrap(k,fa(k)))
disp(intsplin(k,fa(k)))

disp(intg(ini,fim,fa))
disp(integrate('fa(k)','k',ini,fim))

//b
ini = 0;
fim = 10e4
k = ini:itv:fim

disp("B:")
disp(inttrap(k,fb(k)))
disp(intsplin(k,fb(k)))

disp(intg(ini,fim,fb))
disp(integrate('fb(k)','k',ini,fim))

//c
ini = 10e-4;
fim = %pi;
k = ini:itv:fim

disp("C:")
disp(inttrap(k,fc(k)))
disp(intsplin(k,fc(k)))

disp(intg(ini,fim,fc))
disp(integrate('fc(k)','k',ini,fim))

//d
ini = 1;
fim = 5;
k = ini:itv:fim

disp("D:")
disp(inttrap(k,fd(k)))
disp(intsplin(k,fd(k)))

disp(intg(ini,fim,fd))
disp(integrate('fd(k)','k',ini,fim))
