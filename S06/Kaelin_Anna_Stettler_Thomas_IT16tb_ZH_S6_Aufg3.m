%Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg3(f , a, b, n, y0)

y_exakt = @(x) sqrt((2.*x.^3)./3 +4);

%% aufgabe a)

f = @(x,y) (x.^2)./y;
a = 0;
b = 10;
h = 0.1;
n = (b-a)/h;
y0= 2;

% runga-kutta
[x,y_runga] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(f , a, b, n, y0);

% euler-, mittelpunkt- und modifiziertes euler-verfahren
[~,y_euler, y_mittelpunkt, y_modeuler ] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(f, a, b, n, y0);

figure(1);
title('Funktionen');
plot(x,y_runga, 'g');
hold on
plot(x, y_euler, 'b');
plot(x, y_mittelpunkt, 'r');
plot(x, y_modeuler, 'y');
plot(x, y_exakt(x), 'r');
legend('runge-kutta', 'euler', 'mittelpunkt', 'modifizierter euler', 'exakt');
hold off

%globaler fehler nach der i-ten Iteration mit log y-achse plotten
% 1. globaler fehler

fehler_kutta = abs(y_runga - y_exakt(x));
fehler_euler = abs(y_euler - y_exakt(x));
fehler_mittelpunkt = abs(y_mittelpunkt - y_exakt(x));
fehler_modeuler = abs(y_modeuler - y_exakt(x));

% 2. Plot
figure(2)
title('globale Fehler');
semilogy(x,fehler_kutta, 'g');
hold on
semilogy(x, fehler_euler, 'b');
semilogy(x, fehler_mittelpunkt, 'r');
semilogy(x, fehler_modeuler, 'y');
legend('runge-kutta', 'euler', 'mittelpunkt', 'modifizierter euler');



%% euler-, mittelpunkt- und modifiziertes euler-verfahren
function [x,ye, ym, yme ] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(f , a, b, n, y0)


%% eulerverfahren
h = (b-a)/n;
x(1) = a;
ye(1) = y0;
for i = 0 : n-1
    x(i+2) = x(i+1) + h;
    ye(i+2) = ye(i+1) + h*(f(x(i+1), ye(i+1)));
end
x = x(n+1)


%% mittelpunktverfahren
h = (b-a)/n;
x(1) = a;
ym(1) = y0;
for i = 0 : n-1
    xh2 = x(i+1) + h/2;
    yh2 = ym(i+1) + (h/2)*(f(x(i+1), ym(i+1)));
    x(i+2) = x(i+1) + h;
    ym(i+2) = ym(i+1) + h*(f(xh2, yh2));
end

%% mod eulerverfahren
h = (b-a)/n;
x(1) = a;
yme(1) = y0;
for i = 0 : n-1
    x(i+2) = x(i+1) + h;
    yeul(i+2) = yme(i+1) + h*(f(x(i+1), yme(i+1)));
    k1 = (f(x(i+1), yme(i+1)));
    k2 = (f(x(i+2), yeul(i+2)));
    yme(i+2) = yme(i+1) + h*((k1+k2)/2);
end

end
