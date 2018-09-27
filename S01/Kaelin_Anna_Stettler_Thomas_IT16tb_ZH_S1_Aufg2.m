x0 = 2;
hwerte = zeros(1,17);
format long;

for n = 1:17
    hwerte(n)= 10^(-n);
end

f = @(x) log(x.^2);
fabl = @(x) 2./x;

D1f = (f(x0+hwerte)-f(x0))./hwerte;
Diskf1 = abs(D1f-fabl(x0));

D2f = (f(x0+hwerte)-f(x0-hwerte))./(2*hwerte);
Diskf2 = abs(D2f-fabl(x0));

% fprintf('%2.8f\t',D1f);
% fprintf('\n');
% fprintf('%2.8f\t',D2f)



fprintf('%6s %18s %18s %18s %18s \n', 'hwert', 'D1f', 'Diskf1', 'D2f', 'Diskf2');
fprintf('%5.1d %.8f \t %.8f \t %.8f \t %.8f\n', hwerte, D1f, Diskf1, D2f, Diskf2);

hoptD1f = sqrt(4*eps*(log(x0.^2))/(1));
hoptD2f = nthroot(6*eps*abs((log(x0.^2)))/(1), 3);