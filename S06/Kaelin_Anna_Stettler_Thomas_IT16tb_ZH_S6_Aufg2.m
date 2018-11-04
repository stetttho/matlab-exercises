%gegeben
R = 4;
r = 0.02;
g = 9.81;


%% aufgabe a)
% y0 = h0
y0 = 6.5;
b = 24000;
a = 0;
h = 4000;
n = (b-a)/h;
f = @(x,y) - (r^2 .* sqrt(2.*g.*y)) ./ (2.*y.*R - y.^2);

[x,y] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S6_Aufg1(f , a, b, n, y0);

%% aufgabe b)
[~,y_euler, y_mittelpunkt, y_modeuler ] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S5_Aufg3(f , a, b, n, y0);


%% aufgabe c)

hold on
plot(x,y_euler, 'r');
plot(x,y_mittelpunkt, 'g');
plot(x,y_modeuler, 'b');
plot(x,y, 'y');
legend('euler', 'modeuler','mittelpunkt', 'runge-kutta');
hold off



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
