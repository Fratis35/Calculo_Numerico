clear
clc
clf()
//mode(0)

//close
y=-10:0.01:10;
x=-10:0.01:10;
f2 = x.^3 - 2*x.^2 +35;
f1 = x.^2 - 2*x +35;

subplot(2,2,1);
plot(x,f1,'--r');
title("fun1");
legend('f verm');
xlabel("Eixo X")
ylabel("Eixo Y")
xgrid;

subplot(2,2,2);
plot(x,-2*f2,'ko');
title("fun2");
xgrid;

subplot(2,1,2)
plot(x,sin(x),'b');
plot(x,cos(x),'r');
title('seno e cos');


/*
[x,y]=meshgrid(-2:.1:2,-2:.1:2);
z= x.^2 + y.^2 ;
//title('Grafico');
//xgrid;
mesh(x,y,z);
*/

//histplot(30,rand(1,100));
