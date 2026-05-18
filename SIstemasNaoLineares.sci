clear
clc

//Sistema:
 //f1 : x^3 + xy = 76
 //f2 : sqrt(x) + y^2 = 11
 
h=1e-3
 
function a = f1(x,y)
    a = x^3 + x*y - 76
    
endfunction

function a = df1x(x,y)
    a = (f1(x+h,y) - f1(x-h,y)) / (2*h)
endfunction

function a = df1y(x,y)
    a = (f1(x,y+h) - f1(x,y-h)) / (2*h)
endfunction


function a = f2(x,y)
    a =sqrt(x) + y^2 - 11
    
endfunction

function a = df2x(x,y)
    a = (f2(x+h,y) - f2(x-h,y)) / (2*h)
endfunction

function a = df2y(x,y)
    a = (f2(x,y+h) - f2(x,y-h)) / (2*h)
endfunction

x = 1
y = 1
r = [x;y]

erro=1

while erro > 1e-5
       
    a11 = df1x(x,y)
    a12 = df1y(x,y) 
    a21 = df2x(x,y)
    a22 = df2y(x,y)
    J = [a11,a12;a21,a22]
    F = [f1(x,y);f2(x,y)]
    er = -inv(J)*F
    
    r = r + er
    
    x = r(1)  
    y = r(2)
    
    erro = max(abs(er))
   
    disp([x,y])
end
 
mprintf('\nRaizes:\n x = %f\n y = %f\n',x,y);




