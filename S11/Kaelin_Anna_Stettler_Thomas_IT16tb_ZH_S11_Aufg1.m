% gegebene Messwerte
Ti = 0:10:100;
dichte = [999.9; 999.7; 998.2; 995.7; 992.2; 988.1; 983.2; 977.8; 971.8; 965.3; 958.4];
n = 11;

% Form der Ausgleichsfunktion
f1 = @(T) T.^2;
f2 = @(T) T;
f3 = @(T) 1;

% Lösen der Normalgleichung
A = zeros(n,3);
    for i=1:n
        A(i, 1) = f1(Ti(i)); 
        A(i, 2) = f2(Ti(i)); 
        A(i, 3) = f3(Ti(i)); 
    end
AT = A';
ATA = AT * A;
ATy = AT * dichte;
koeffizienten = linsolve(ATA, ATy);

% Plotten der gegebenen Werte und der erhaltenen Ausgleichsfunktion
p = @(T) koeffizienten(1).*T.^2 + koeffizienten(2).*T + koeffizienten(3);
plot(Ti, p(Ti), Ti, dichte, 'o');

konditionszahl = cond(ATA);
% Die Konditionszahl ist sehr hoch > kleine Fehler wirken sich stark auf
% die Resultate aus
koeff_poly = polyfit(Ti, dichte', 2);
% Die Matlab-Funktion polyfit ergibt die gleichen Werte für die
% Koeffizienten
