clear
clc

function fx=fnc(x, kf)
   switch kf
        case 1, fx = 2 - 4*x.*x.*x + exp(2*x);
        case 2, fx = 4*exp(-x).*sin(2*x);
        case 3, fx = (x).^(1/3) + exp(x/2);
        case 4, fx = 3 + sin(2*x) - x.*x;
    end
end

n=0:12; % 13 pontos
xh= n/8; % x varia de 0 a 1.5, h = 1/8

p1 = [1 2 2 2 2 2 2 2 2 2 2 2 1]; % regra dos trapézios
p2 = [1 4 2 4 2 4 2 4 2 4 2 4 1]; % 1o. regra de Simpson
p3 = [1 3 3 2 3 3 2 3 3 2 3 3 1]; % 2o. regra de Simpson
p4 = [7 32 12 32 14 32 12 32 14 32 12 32 7]; % Regra de Bode;
h = 1/8; % passo

for kf=1:4
    fh = fnc(xh,kf); % chamada da função
    switch kf
        case 1, It = 2*xh(13) - (xh(13)^4) + exp(2*xh(13))/2 - (2*xh(1) - (xh(1)^4) + exp(2*xh(1))/2);
        case 2, It = 4*exp(-xh(13))*(-2*cos(2*xh(13)) + sin(2*xh(13)))/5 + 8/5;
        case 3, It = (3/5)*(xh(13))^(5/3) + 2*exp(xh(13)/2) - 2;
        case 4, It = 3*xh(13) - cos(2*xh(13))/2 - xh(13)^3/3 + 1/2;
    end

ittrap = sum(p1.*fh.*h/2); %disp([ittrap, It]);
itsimp1 = sum(p2.*fh.*h/3);
itsimp2 = sum(p3.*fh.*h*3/8);
itbode = sum(p4.*fh.*h*2/45);

fprintf('%1.6f & %1.6f & %1.6f & %1.6f \n', ittrap, itsimp1, itsimp2, itbode);
fprintf('%1.6f & %1.6f & %1.6f & %1.6f \n', ittrap-It, itsimp1-It, itsimp2-It, itbode-It);
end


