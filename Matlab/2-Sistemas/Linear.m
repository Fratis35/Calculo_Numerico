clear
clc
 
 %Sistema:
 %3x + 2y +  z = 7
 %x + 4y -  z = 5
 %x +  y + 2z = 6
 %diagonal: 3 4 2 (domina)
 
 A = [3 2 1; 1 4 -1; 1 1 2]
 b = [7;5;6]
 r = inv(A)*b
 disp(r)
 
 er = 1e-5
 
 e1 = 1
 e2 = 1
 e3 = 1
  
 x0 = 0
 y0 = 0
 z0 = 0
 
 while max(e1+e2+e3) > er
     x = (7 - 2*y0 -z0)/3
     y = (5 - x0 + z0)/4
     z = (6 - x0 - y0)/2
     
     e1 = abs(x-x0)
     e2 = abs(y-y0)
     e3 = abs(z-z0)
     
     x0 = x
     y0 = y
     z0 = z
     
     %disp([x,y,z])
 end
 
 fprintf('\nRaizes:\n x = %f\n y = %f\n z = %f\n',x0,y0,z0);


