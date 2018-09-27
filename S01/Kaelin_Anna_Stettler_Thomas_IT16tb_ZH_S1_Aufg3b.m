n=1000;
t=zeros(1,n);
x=zeros(1,n);

for i=1:n
    t(i)=0.1*i;
    x(i)=10*exp(-0.05*t(i))*cos(0.2*pi*t(i));
end

v = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t, x);
a = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t, v);


plot(t,x,'r');
hold on
plot(t,v,'g');
plot(t,a,'b');