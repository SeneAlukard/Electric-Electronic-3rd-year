%Rectangular using for loop

fs = 1000;
f = 100;

t = -1:1/fs:1;

signal = zeros(size(t));

for i = 1:length(t)
    if(mod(i,f) <= (0.5*f - 1))
        signal(i) = 1;
    else
        signal(i) = 0;
    end
end

plot(t,signal)