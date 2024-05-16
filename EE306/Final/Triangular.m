%Triangular using for loop

fs = 100;
f = 10;

t = -1:1/fs:1;

signal = zeros(size(t));

for i = 1:length(t)
    if(mod(i,f) <= (0.5*f - 1))
        signal(i) = 2*mod(i,f)/f;
    else
        signal(i) = 2*(1-mod(i,f)/f);
    end
end

plot(signal)
xlim([0 20])