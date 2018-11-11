% Vergleich Fehler und Laufzeit von Adams-Bashforth und Runge-Kutta
f = @(x,y) y;
y0 = 1;
a = 0;
b = 1;
nmax = 6;
n = zeros(1,nmax);
y_exakt = @(x) exp(x);
fehler_bashforth = zeros(1,nmax);
fehler_runge = zeros(1,nmax);
t_bashforth = zeros(1,nmax);
t_runge = zeros(1,nmax);

% Berechnung für verschiedene n
for i=1:nmax
    n(i) = 10^i;
    tic;
    [x, y_bashforth] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S7_Aufg2(f, a, b, n(i), y0);
    t_bashforth(i) = toc;
    fehler_bashforth(i) = abs(y_exakt(x(length(x))) - y_bashforth(length(y_bashforth)));
    tic;
    [~, y_runge] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(f , a, b, n(i), y0);
    t_runge(i) = toc;
    fehler_runge(i) = abs(y_exakt(x(length(x))) - y_runge(length(y_runge)));
    
end

% Plotten des Fehlers und der Laufzeit
subplot(1,2,1);
loglog(n, fehler_bashforth, n, fehler_runge);
title('Absoluter Fehler');
legend('Bashforth', 'Runge-Kutta');

subplot(1,2,2);
semilogx(n, t_bashforth, n, t_runge);
title('Zeitmessung');
legend('Bashforth', 'Runge-Kutta');

% Runge-Kutta liefert bis n = 10^3 die genaueren Resultate. Danach sind die
% Resultate aufgrund der Rundungsfehler bei beiden Verfahren praktisch
% identisch. 
% Die Laufzeit ist bei Runge-Kutta höher, was sich ab n=10^6 stark
% auszuwirken beginnt.


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

