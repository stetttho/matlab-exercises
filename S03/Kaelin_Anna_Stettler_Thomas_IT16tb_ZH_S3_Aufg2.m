% Summierte Trapezformel
f = @(x) cos(x^2);
a = 0;
b = pi;
imax = 4;
kmax = imax;
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
        Tf(i+1,k+1)=((4^k)*Tf(i+2,k)-Tf(i+1,k))/((4^k)+1);
    end
end