% Anfangswertproblem Lösung mit adaptiver Schrittweitensteuerung
y_exakt = @(t) 3.*(1- exp(-10.*t)).*exp(-2.*t);
f = @(t,y) -12.*y + 30 .* exp(-2.*t);
y0 = 0;

% Aufgabe a)
a = 0;
b = 10;
h = 0.1;
n = (b-a)/h;
[x,y_euler,y_mittelpunkt, ~] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(f , a, b, n, y0);

subplot(2,1,1);
hold off
plot(x, y_exakt(x));
hold on
plot(x, y_euler);
plot(x, y_mittelpunkt);

% Aufgabe b)
tol = 10^-4;
hk(1) = h;
xk(1) = a;
k = 1;
y_euler_adaptiv(1) = y0;
y_mittelpunkt_adaptiv(1) = y0;

while xk(k) < b
    xk(k+1) = xk(k) + hk(k); 

    [~,y_eul,~,~] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(f , xk(k), xk(k)+hk(k), 1, y_euler_adaptiv(k));   
    [~,~,y_mitp,~] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(f , xk(k), xk(k)+hk(k), 1, y_mittelpunkt_adaptiv(k));
    y_euler_adaptiv(k+1) = y_eul(2);
    y_mittelpunkt_adaptiv(k+1) = y_mitp(2);
    
    if abs(y_euler_adaptiv(k+1)-y_mittelpunkt_adaptiv(k+1)) < tol/20
        hk(k+1) = hk(k)*2;
        k = k + 1;
    elseif abs(y_euler_adaptiv(k+1)-y_mittelpunkt_adaptiv(k+1)) >= tol
        hk(k) = hk(k)/2; 
    else
        hk(k+1) = hk(k);
        k = k + 1;
    end     
end

% Aufgabe c)

plot(xk, y_mittelpunkt_adaptiv);
title("Vergleich exakte und geschätzte Lösungen");
legend('Exakt', 'Euler-Fix', 'Mittelpunkt-Fix', 'Mittelpunkt variables h');
hold off

subplot(2,1,2);
plot(xk, hk);
title("Schrittweite in Abhängigkeit der Zeit t");



%% Aufgabe d)
% tol: kleinere Toleranz führt zu kleinerer minimaler Schrittweite 
% bei grosser steigung. Kleine Werte von tol lassen h spät steigen.
% Je kleiner tol, desto länger dauert die Berechnung der Resultate
% massiv.
% h : Bei abflachender Funktionskurve wird h grösser ansonsten kleiner



%% Hilfsfunktion Euler und Mittelpunktverfahren
function [x,y_euler, y_mittelpunkt, y_modeuler ] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(f , a, b, n, y0)
%Beispielaufruf:
% [x,y_euler, y_mittelpunkt, y_modeuler ] =Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(@(x,y) x.^2./y , 0, 2.1, 3, 2)

% eulerverfahren
h = (b-a)/n;
x = zeros(1, n+1);
y_euler = zeros(1, n+1);
x(1) = a;
y_euler(1) = y0;
for i = 0 : n-1
    x(i+2) = x(i+1) + h;
    y_euler(i+2) = y_euler(i+1) + h*(f(x(i+1), y_euler(i+1)));
end

% mittelpunktverfahren
y_mittelpunkt = zeros(1,n+1);
y_mittelpunkt(1) = y0;
for i = 0 : n-1
    xh2 = x(i+1) + h/2;
    yh2 = y_mittelpunkt(i+1) + (h/2)*(f(x(i+1), y_mittelpunkt(i+1)));
    y_mittelpunkt(i+2) = y_mittelpunkt(i+1) + h*(f(xh2, yh2));
end

% mod eulerverfahren
h = (b-a)/n;
y_modeuler = zeros(1,n+1);
y_modeuler(1) = y0;
for i = 0 : n-1
    y_modeuler(i+2) = y_modeuler(i+1) + h*(f(x(i+1), y_modeuler(i+1)));
    k1 = (f(x(i+1), y_modeuler(i+1)));
    k2 = (f(x(i+2), y_modeuler(i+2)));
    y_modeuler(i+2) = y_modeuler(i+1) + h*((k1+k2)/2);
end

end