% 1a

% Gegebene Messwerte
t = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120];
h = [2, 286, 1268, 3009, 5375, 8220, 11505, 15407, 20127, 25593, 31672, 38257, 44931];
m = [2051113, 1935155, 1799290, 1681120, 1567611, 1475282, 1376301, 1277921, 1177704, 1075683, 991872, 913254, 880377];

% Berechnung Geschwindigkeit, Beschleunigung, Änderung der Masse
v = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t,h);
a = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t,v);
dmdt = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t,m);
dmdh = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(h,m);

% Plotten der verschiedenen berechneten Grössen
subplot(3,3,1);
plot(t,h);
title('h');

subplot(3,3,2);
plot(t,v);
title('v');

subplot(3,3,3);
plot(t,a);
title('a');

subplot(3,3,4);
plot(t,m);
title('m');

subplot(3,3,5);
plot(t,dmdt);
title('dmdt');

subplot(3,3,6);
plot(h, dmdh);
title('dmdh');

% dmdt ist gleich dmdh*v > nur 1 Linie im Plot
subplot(3,3,7);
plot(t,dmdt, t, dmdh.*v);
title('dmdt und dmdh*v');

% 1b

% Gegebene Konstanten
G = 6.673*10^-11;
M = 5.976*10^24;
R0 = 6378137;

% Berechnung R0h (Höhe h plus Erdradius R0)
R0h = zeros(size(h));
for i=1:length(h)
R0h(i)=R0+h(i);
end

% Initialisierung Epot, Ekin, Etot
Epot = zeros(size(h));
Ekin = zeros(size(h));
Etot = zeros(size(h));

% Berechnung von Epot, Ekin und Etot gemäss gegebener Formeln
for i=1:length(t)
Epot(i) = G * M * Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg4a(R0h(1:i),m(1:i)./R0h(1:i).^2);
Ekin(i) = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg4a(R0h(1:i),dmdt(1:i).* v(1:i)) + Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg4a(R0h(1:i), m(1:i).*a(1:i));
Etot(i) = Epot(i) + Ekin(i);
end

% Plotten von Epot, Ekin und Etot
subplot(3,3,8);
plot(t,Epot,t,Ekin,t,Etot);
legend('Epot','Ekin','Etot');
title('E');

% 1c

% Rund 63 Haushalte könnten mit der nach t=120s verbrauchten Energie für 1 Jahr versorgt werden.
haushalt = 10^10;
anzahl = Etot(13)/haushalt;


