function [Tf_neq] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg4a(x,y)
% Funktion zur Berechnung des Integrals mittels summierter Trapezregel
% Beispielaufruf: Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg4a(x,y)

n = length(x);
Tf_neq = 0;
for i=1:n-1
    Tf_neq = Tf_neq + ((y(i)+y(i+1))/2)*(x(i+1)-x(i));  
end

end
