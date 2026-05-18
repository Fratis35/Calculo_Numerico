clf()

R = 7
i=0.1
x = -R:0.01:R

function y = f1(x)
    y =  sqrt(R.^2-x.^2);
endfunction

fun1 = sqrt(R.^2-x.^2)
fun2 = -sqrt(R.^2-x.^2)


plot(fun1,x,'b')
plot(fun2,x,'b')

xgrid;
for k = -R:i:R
    drawlater();
    plot(f1(k),k,'ro')
    drawnow();
    //sleep(1e-100)
    drawlater();
    clf()
        
    plot(fun1,x,'b')
    plot(fun2,x,'b')
    plot(0,0,'gx')
    xgrid;
    drawnow(); 
end
for k = R:-i:-R
    drawlater();
    plot(-f1(k),k,'ro')
    drawnow();
    //sleep(1e-100)
    drawlater();
    clf()
        
    plot(fun1,x,'b')
    plot(fun2,x,'b')
    plot(0,0,'gx')
    xgrid;
    drawnow(); 
end
