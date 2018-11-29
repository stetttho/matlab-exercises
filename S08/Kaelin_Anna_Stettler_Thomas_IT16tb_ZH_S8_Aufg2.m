%% Lösung mit Runge-Kutta
c = 0.16;
m = 1;
l = 1.2;
g = 9.81;
y0 = [pi/2;0];
a = 0;
b = 60;
h = 0.1;
n = (b-a)/h;

% Umformung in DGL 1. Ordnung:
% y'' = - c/m * y' - g/l * sin(y)
% z' = (z2; (-c/m * z2 - g/l * sin(z1) ) 

f = @(x,z) [z(2); (-(c/m) * z(2) - g/l * sin(z(1)))];

[x,y] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(f , 0, 60, n, y0);
plot(x,y(1,:));


%% klassisches runge-kutta verfahren angepasst für vektoren
% dy(x) = f(x,y(x)), 
% y(a) = y0 auf dem Intervall [a,b] mit n

% beispielaufruf:
% [x,y] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(@(x,y) x.^2 + 0.1.*y , -1.5, 1.5, 5, 0)

function [x,y] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(f , a, b, n, y0)
x = zeros(1,n+1);
y = zeros(2, n+1);
x(1) = a;
y(:,1) = y0;

h = (b-a)/n;

    for i = 1 : n
    k1 = f(x(i), y(:,i));
    k2 = f(x(i) + h/2, y(:,i) + (h/2)*k1);
    k3 = f(x(i) + h/2, y(:,i) + (h/2)*k2);
    k4 = f(x(i) + h, y(:,i) + h*k3);
    x(i+1) = x(i) + h;
    y(:,i+1) = y(:,i) + h * (1/6) * (k1+2*k2+2*k3+k4);
    end

end

