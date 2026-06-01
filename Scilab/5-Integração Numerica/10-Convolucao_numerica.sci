clear
clc
clf()

dt=0.01;
t=0:dt:10;

tm = max(size(t))
h=exp(-t);
x=h;

y = dt*convol(x,h);
yt = t.*exp(-t);
y=y(1:tm);
plot(t,y,t,yt)
 
