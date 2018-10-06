% Gegebene Bedingungen
R = @(v) -v.*sqrt(v);
v0 = 20;
m = 10;
v = 5;
t = @(v) m./R(v); % entspricht -m*v^-1.5

%Integral von -m*v^-1.5 ist 2*m*v^-0.5. Berechnung Integral zwischen
% v0 und v, um danach den absoluten Fehler angeben zu können
F = (2*m*v^-0.5)-(2*m*v0^-0.5);

% Aufteilung in n Teilbereiche ergibt Schrittweite h
n = 5;
h = (v-v0)/n;

% Aufgabe a) Berechnung mit summierter Rechtecksregel
Rf = 0;
for i=0:n-1
   Rf = Rf + t((v0+i*h)+h/2); 
end
Rf = Rf*h;
fprintf('Rf: %.4fs \n', Rf);

% Aufgabe b) Berechnung mit summierter Trapezregel
Tf = 0;
for i=1:n-1
   Tf = Tf + t(v0+i*h);
end
Tf = Tf + (t(v0)+t(v))/2;
Tf = Tf*h;
fprintf('Tf: %.4fs \n', Tf);

% Absolute Fehler der beiden Näherungen
RFehler = abs(F-Rf);
TFehler = abs(F-Tf);
