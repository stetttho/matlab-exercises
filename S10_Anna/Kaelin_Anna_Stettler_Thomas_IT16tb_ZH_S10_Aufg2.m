
%implementierung der kubischen splinefunktion

% Beispiel:
% x = [0; 1; 2; 3]
% y = [2; 1; 2; 2]
% xx = [ 0.5; 0.8; 1.1; 2.2];

function yy = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S10_Aufg2(x, y, xx)
%% werte initialisieren
    n = size(x);
    c(1) = 0;
    c(n) = 0;
    A = zeros(n-2);
    z = 0;
    a = 0;
    d = 0;
    s = zeros(size(xx));
for i = 0 : (n -2)
    h(i+1) = x(i+2) - x(i+1);
    a(i+1) = y(i+1);
end
% c-werte berechnen
% 1. Matrix A bestimmen
for i = 1 : (n - 2)
    for j = 1 : (n-2)
        if i == j
        A(i,j) = 2*(h(i)+h(i+1));
        else
         A(i,j) = h(j);
        end
    end
end
 % 2. Vektor z bestimmen
 for i = 1 : (n-2)
   % z(i) = 3*(y(i+2) - y(i+1)) - 3*(y(i+1) - y(i));
   % wie komme ich auf diese gleichung???? 
     z(i) = 3*(y(i+2) - y(i+1)) / h(i+1)-3*(y(i+1)-y(i)) / h(i);
 end
   z = z.';
% 3. Vektor c bestimmen
  c_temp = A\z;
  for i = 2 : (n-1)
      c(i) = c_temp(i-1);
  end

 % b-werte und  d-werte berechnen
 for i = 0 : (n-2)
     b(i+1) = (y(i+2) - y(i+1))/h(i+1) - (h(i+1)/3)*(c(i+2) + 2*c(i+1));
     d(i+1) = (1/(3*h(i+1))*(c(i+2)-c(i+1)));
 end
  
 % polynom bestimmen 
 x = x.';
 xx= xx.';
 % in welchem interval liegt das xx(i) - entsprechend dem wert das s wählen
 for i = 0 : n-2      
        s =  @(xx) a(i+1) + b(i+1)*(xx-x(i+1)) + c(i+1)*(xx-x(i+1)).^2 + d(i+1)*(xx-x(i+1)).^3;
        % ist das gleiche wie:  s = @(xx) polyval([d(i+1), c(i+1),  b(i+1),  a(i+1)],  xx-x(i+1));
        r = find(x(i+1)<=xx & xx<=x(i+2));
        yy(r) = s(xx(r));
 end
 yy
  
 

% Plot
% interpolierte Werte
plot(xx, yy);
grid on;
hold on;
% gegebene Werte
plot(x, y);
% Plot settings
legend("interpolierte Werte", "gegebene Werte");
xlabel("x");
ylabel("y");


 
 
end


