function dx = Stettler_Kaelin_it16tbzh_S1_Aufg3b
n = 1000;
t = zeros(1,n);
x = zeros(1,n);

for i=1:n
t(i) = 0+i*0.1;
x(i) = (10 * exp(1)^(-0.05*t(i))) * cos(0.2*pi*t(i));
end

dx = Stettler_Kaelin_it16tbzh_S1_Aufg3a(t,x);
ddx = Stettler_Kaelin_it16tbzh_S1_Aufg3a(t,dx);



%plot(t, x, 'r', t, ddx, 'g',t, dx, 'b');
plot(t,x,'r');
hold on
plot(t,dx,'g');
plot(t,ddx,'b');
xlabel('time');
legend('deflection', 'speed','acceleration');
%findpeaks(dx)
%findpeaks(ddx)

% Wo hat die Geschwindigkeit die Nulldurchgänge? 
% Die Geschwindigkeit ist Null bei den relativen Extremas 
% der Auslenkung und Beschleunigung.

%Wo liegen die relativen Extrema der Beschleunigung? 
% genau dort wo di relativen Extremas der Auslekung liegen, einfach 
% gerade umgekehrt: dort wo das relative Maximum der Beschleunigung 
% liegt, liegt das relative miminum der Auslenkung und umgekehrt. 

% Was bedeutet das in Bezug auf die Bewegung des Pendels? 
% 

end
