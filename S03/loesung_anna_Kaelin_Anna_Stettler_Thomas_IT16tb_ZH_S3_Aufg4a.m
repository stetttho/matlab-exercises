function [Tf_neq] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg4a(x,y)
%x = [0000 800000 1200000 1400000 2000000 3000000 3400000 3600000 4000000 5000000 5500000 6370000]
%y = [13000 12900 12700 12000 11650 10600 9900 5500 5300 4750 4500 3300]

n = max(size(x));
sum = 0;
f = @(x,y) y*4*pi*(x^2);

for i = 0:n-2
    sum = sum + (((f(x(i+2), y(i+2))+f(x(i+1),y(i+1)))/2)*(x(i+2)-x(i+1)));
end
    %absoluter und relativer fehler

    m_lit = 5.9722*10^24;

f_abs = abs(sum-m_lit)
f_rel = f_abs/m_lit

    
    Tf_neq = sum;
   
end
