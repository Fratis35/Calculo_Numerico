clear;
clc;
x = -10:0.5:10;

subplot(2,2,1);
plot(x,cos(x),'r'); 
hold on;
plot(x,sin(x),'b');
title('Funções Trigonométricas');
legend('cosseno','seno');
grid on;
hold off;

subplot(2,2,2);
plot(x,5*x-3);
hold on;
plot(x,-2*x+1);
plot(x,3*x);
title('Funções Afim');
grid on;
hold off;

subplot(2,2,3);
plot(x,x.^2+3*x-10);
hold on;
plot(x,-2*(x.^2)+3*x);
plot(x,3*(x.^2)-10*x+7);
title('Funções Quadráticas');
grid on;
hold off;

subplot(2,2,4);
y = -10:0.5:10;
[X,Y] = meshgrid(x,y);
Z = X.^2 + Y.^2;
surf(X,Y,Z);
title('Superfície 3D');

