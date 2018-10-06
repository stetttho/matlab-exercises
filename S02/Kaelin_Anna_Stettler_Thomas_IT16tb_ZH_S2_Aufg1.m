format long;
f = @(x) log(x^2);
fp = @(x) 2/x;
D1 = @(f,x0,h) (f(x0+h)-f(x0))./h;
D2 = @(f,x0,h) (f(x0+h)-f(x0-h))./(2.*h);

n = 3;
Dik = zeros(n+1,n+1);
Eik = zeros(n+1,n+1);
h0 = 0.1;
x0 = 2;
fpNum = fp(x0);

h = h0;
for i=0:n
   Dik(i+1,1) = D1(f,x0,h);
   Eik(i+1,1) = abs(Dik(i+1,1)-fpNum);
   h=h/2;
end

for k=1:n
    for i=0:n-k
        Dik(i+1,k+1)=(2^k*Dik(i+2,k)-Dik(i+1,k))/(2^k-1);
        Eik(i+1,k+1)=abs(Dik(i+1,k+1)-fpNum);
    end
end

fprintf('Dik\n');
for i=1:4
    for j=1:4
        fprintf('%.8f \t %.8f \t %.8f \t %.8f\n', Dik(i,j));
    end
    fprintf('\n');
end

fprintf('\n');

fprintf('Eik\n');
for i=1:4
    for j=1:4
        fprintf('%.8f \t %.8f \t %.8f \t %.8f\n', Eik(i,j));
    end
    fprintf('\n');
end

