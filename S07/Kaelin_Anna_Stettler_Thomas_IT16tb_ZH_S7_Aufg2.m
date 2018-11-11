function [x, yab4] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S7_Aufg2(f, a, b, n, y0)
% Adams-Bashforth Methode 4. Ordnung zur Berechnung eines
% Anfangwertproblems.
% Beispielaufruf: [x, yab4] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S7_Aufg2(@(x, yx) yx, 0, 1, 6, 1)

yab4 = zeros(1,n+1);
h = (b-a)/n;
x = a:h:b;

% Berechnug Startwerte mit Runge-Kutta
[~,yab4(1:4)] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(f , a, a+3*h, 3, y0);
f_val = zeros(1,n+1);
f_val(1:4) = f(x(1:4), yab4(1:4));

for i=4:n
    yab4(i+1) = yab4(i) + h/24 * (55 *f_val(i) - 59 * f_val(i-1) + 37 * f_val(i-2) - 9 * f_val(i-3));
    f_val(i+1) = f(x(i+1), yab4(i+1));
end

end


%% klassisches runge-kutta verfahren
% dy(x) = f(x,y(x)), 
% y(a) = y0 auf dem Intervall [a,b] mit n

% beispielaufruf:
% [x,y] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(@(x,y) x.^2 + 0.1.*y , -1.5, 1.5, 5, 0)

function [x,y] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(f , a, b, n, y0)
x = zeros(1,n+1);
y = zeros(1, n+1);
x(1) = a;
y(1) = y0;
h = (b-a)/n;

for i = 1 : n
k1 = f(x(i), y(i));
k2 = f(x(i) + h/2, y(i) + (h/2)*k1);
k3 = f(x(i) + h/2, y(i) + (h/2)*k2);
k4 = f(x(i) + h, y(i) + h*k3);
x(i+1) = x(i) + h;
y(i+1) = y(i) + h * (1/6) * (k1+2*k2+2*k3+k4);
end

end

