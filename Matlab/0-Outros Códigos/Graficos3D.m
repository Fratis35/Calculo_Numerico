
[X,Y] = meshgrid(-5:0.2:5);
Z = sin(sqrt(X.^2 + Y.^2));

figure
tiledlayout(2,3)

nexttile
surf(X,Y,Z); title('surf')

nexttile
mesh(X,Y,Z); title('mesh')

nexttile
surfc(X,Y,Z); title('surfc')

nexttile
plot3(X,Y,Z); title('plot3')

nexttile
contour3(X,Y,Z); title('contour3')

nexttile
surf(X,Y,Z); shading interp
title('surf + shading interp')
