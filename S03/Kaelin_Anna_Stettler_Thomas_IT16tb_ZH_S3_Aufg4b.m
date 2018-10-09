% Gegebene Werte für r (Radius) und p (Dichte)
r = [0, 800, 1200, 1400, 2000, 3000, 3400, 3600, 4000, 5000, 5500, 6370];
p = [13000, 12900, 12700, 12000, 11650, 10600, 9900, 5500, 5300, 4750, 4500, 3300];

% Berechnung der y-Werte
y = zeros(1, length(r));
for i=1:length(r)
   r(i)=r(i)*10^3;  
   y(i)=p(i)*4*pi*r(i)^2;
end

% Berechnung des Integrals
m = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg4a(r,y);
m_lit = 5.9722*10^24;

f_abs = abs(m-m_lit);
f_rel = f_abs/m_lit;