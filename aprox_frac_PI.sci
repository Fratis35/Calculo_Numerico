clear
clc

val = %pi 
f1 = 335/113;
er = abs(val-f1);

for k = 1000:30000
    d=k
    n = round(d*val)
    n1 = n-1;
    n2 = n+1;

    fa = n/d; ea = abs(val-fa);
    fb = n1/d; eb = abs(val-fb);
    fc = n2/d; ec = abs(val-fc);
    
    if ea<er then disp([n,d,n/d,ea]); er=ea; end;
    if eb<er then disp([n,d,n/d,eb]); er=eb; end;   
    if ec<er then disp([n,d,n/d ,ec]); er=ec; end;
end
