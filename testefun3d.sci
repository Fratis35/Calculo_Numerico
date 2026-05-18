clear
clc
//close

clf()

// /*
y =-10:.4:10;
x = -10:0.4:10;
[x,y]=meshgrid(x,y);
z = abs(y)*(x.^2);
subplot(2,2,1);
surf(x,y,z);
//desenha superficie
title('surf')

subplot(2,2,2);
mesh(x,y,z);
title('mesh');

subplot(2,2,3);
plot3d(x,y,z);
title('plot3d');

subplot(2,2,4);
param3d(x,y,z);
title('param3d');
//*/

/*
t=0:0.1:10;
param3d(sin(t),cos(t),0*t);
//obs:circulo trigonometrico
//desenha curva
*/
