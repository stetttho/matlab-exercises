% D1f mit 8 Nachkommastellen 
% D2f mit 12 Nachkommastellen
% f�r f(x) = ln(x^2) und x0 = 2, h = 10^?1, 10^?2, ..., 10^?16, 10^?17


f = @(x) log(x.^2);
df = @(x) 2/x;

x0 = 2;
x = x0;

fprintf('h \t D1f  \t\t\t Disk.-fehler D1f \t D2f \t\t\t Disk.-fehler D2f\n');

for i = -1 : -1 : -17
   h = 10.^i; 
   D1f = (f(x0 + h) - f(x0))/h;
   D2f = (f(x0 + h) - f(x0 - h)) / (2*h);
   
   %Diskretisierungsfehler
    D1fFehler = abs(D1f - df(x0));
    D2fFehler = abs(D2f - df(x0));
    
   fprintf('%.0e \t %-14.8f \t %-18.12f \t %-14.8d \t %-18.12d\n', h, D1f, D1fFehler, D2f, D2fFehler);

end

% minimaler Diskretisierungsfehler f�r D1f ist bei h = 10^-8 und f�r D2f
% bei h = 10^-4


ddf = @(x) -2/(x^2);
dddf = @(x) 4/(x^3);

h1opt = (4 * 2^(-52) * (abs(f(x0))/abs(ddf(x0))))^(1/2)
h2opt = (6 * 2^(-52) * (abs(f(x0))/abs(dddf(x0))))^(1/3)
D1fhopt = (f(x0 + h1opt) - f(x0))/h1opt
D2fhopt = (f(x0 + h2opt) - f(x0 - h2opt)) / (2*h2opt) % irgend etwas stimmt mit diesem resultat ev noch nicht
D1fhoptFehler = abs(D1fhopt - df(x0))
D2fhoptFehler = abs(D2fhopt - df(x0))

