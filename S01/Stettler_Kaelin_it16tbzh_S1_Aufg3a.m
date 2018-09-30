function dx = Stettler_Kaelin_it16tbzh_S1_Aufg3a(x,y)


size = length(x);
dx = zeros(1,size);

for i = 1 : size-1
    if(i==1)
        dx(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
    elseif(i==size-1)
        dx(i) = (y(i) - y(i-1)) / (x(i) - x(i-1));
    else
       dx(i) = (y(i+1) - y(i-1)) / (x(i+1) - x(i-1));
    end
end



end