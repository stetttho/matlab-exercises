function [D] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S2_Aufg2(f, x0, h0, n)
% h^2 Algorithmus implementiert.
% Beispieleingabe: Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S2_Aufg2(@(x) (log(x^2)), 2, 0.1, 4)
% Vergleich zu h Algorithmus aus Aufgabe 1: Die Werte konvergieren
% schneller in Richtung korrektes Resultat

D1 = @(f,x0,h) (f(x0+h)-f(x0))./h;

Dik = zeros(n+1,n+1);
h = h0;
for i=0:n
   Dik(i+1,1) = D1(f,x0,h);

   h=h/2;
end

for k=1:n
    for i=0:n-k
        Dik(i+1,k+1)=(4^k*Dik(i+2,k)-Dik(i+1,k))/(4^k-1);
    end
end

D = Dik(1,n+1);

end

