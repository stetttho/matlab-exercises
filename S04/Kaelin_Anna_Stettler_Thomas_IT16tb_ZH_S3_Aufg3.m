function T = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg3(f, a, b, m)
% Beispielaufruf: Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S3_Aufg3(@(x) cos(x^2), 0, pi, 5)

% Summierte Trapezformel
imax = m;
kmax = m;
Tf = zeros(imax+1,kmax);
for i=0:imax
   h(i+1)=(b-a)/(2^i);
   for j=1:((b-a)/h(i+1)-1)
       Tf(i+1,1)= Tf(i+1,1)+f(j*h(i+1));
   end
   Tf(i+1,1) = Tf(i+1,1) + (f(a)+f(b))/2;
   Tf(i+1,1) = Tf(i+1,1)*h(i+1);
end

% Romberg Extrapolation
for k=1:kmax
    for i=0:kmax-k
        Tf(i+1,k+1)=((4^k)*Tf(i+2,k)-Tf(i+1,k))/((4^k)-1);
    end
end
T=Tf(1,m);
%T=Tf;