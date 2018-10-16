function [dx] = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(x, y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
amount = length(x);

dx = zeros(1,amount);
i = 1;
while(i<=amount) 
    if(i==1) 
        h=x(i+1)-x(i);
        dx(i)=(y(i+i)-y(i))/h;
    elseif(i==amount)
        h=x(i) - x(i-1);
        dx(i)=(y(i)-y(i-1))/h;
    else
        h=x(i+1) - x(i-1);
        dx(i)=(y(i+1)-y(i-1))/h;
    end
    
    i=i+1;
end

end