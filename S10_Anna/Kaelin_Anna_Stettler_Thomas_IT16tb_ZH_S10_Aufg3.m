
% gegebene Werte
pt = [ 75.995; 91.972; 105.711; 123.203; 131.669; 150.697; 179.323; 203.212; 226.505; 249.633; 281.422];
t = 1900:10:2000;
t = t.';

t_i = 1900:0.5:2000;
t_i = t_i.';

% Vergleich der Funktionen
% 
Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S10_Aufg2(t, pt, t_i)
% Spline
yy_spline = spline(t, pt, t_i);
% Polyfit
t_ = t - 1900;
p = polyfit(t_, pt, 10);
t_i_ = t_i - 1900;
yy_poly = polyval(p, t_i_);

% Plot
plot(t_i, yy_spline);
hold on;
plot(t_i, yy_poly);
legend("interpolierte Werte", "gegebene Werte", "splin MATLAB", "polyfit MATLAB");


