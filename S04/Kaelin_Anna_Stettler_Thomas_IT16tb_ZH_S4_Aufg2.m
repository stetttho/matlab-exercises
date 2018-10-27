% Gegebene Funktionen
R = 50;
V = @(t) 3500 .* sin(140.*pi.*t).*exp(-63.*pi.*t);
f = @(t) (V(t).^2)./R;

% 2a
% Schrittweite n=3 ist zu klein und führt zu einer fehlerhaften
% Romberg-Extrapolation. Deshalb wird n=7 gewählt, womit sich E beim Wert
% 250 stabilisiert.

n = 7;
E = zeros(1,R);

for t = 1:R
E(t) = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg3(f,0,t/1000,n);

end

plot(E);

% 2b
h0 = 0.01;
m = 7;
x0 = 0.01;
E_calc = @(i) Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg3(f,0,i,m);
g = (@(t) E_calc(t)-250);
limit = 10^-5;

while(g(x0-limit) * g(x0+limit)) >= 0

x0 = x0 - (g(x0)/Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S2_Aufg2(g, x0, h0, m));
end
% Ergebnis: 0.0075


