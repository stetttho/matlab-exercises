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

% Plotten in Richtungsfeld
Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg1(f, a, b, min(y_euler)-1, max(y_euler)+1, 0.1, 0.1);
hold on
plot(x,y_euler, 'g');
plot(x,y_mittelpunkt, 'y');
plot(x,y_modeuler, 'r');
legend('Richtungsfeld', 'euler', 'euler mittelpunkt', 'euler modifiziert');

end

