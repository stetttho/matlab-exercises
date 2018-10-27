function [] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg1(f , xmin, xmax, ymin, ymax, hx, hy)
% Funktion die das Richtungsfeld einer Funktion auf einem gegebenen Intervall plottet.
% Bsp Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg1(@(x,y)x.^2.*y.^2, 0, 5, 0, 3, 0.1, 0.1)

[X, Y] = meshgrid(xmin:hx:xmax,ymin:hy:ymax);
Ydiff = f(X,Y);
Xdiff = ones(size(X));
r = sqrt(Ydiff.*Ydiff+Xdiff.*Xdiff);
quiver(X,Y, Xdiff./r, Ydiff./r);

end