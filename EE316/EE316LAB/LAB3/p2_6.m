load('signals.mat');


p1 = figure;
for i = 1:10
    varName = sprintf('s%d', i);
    currentValue = eval(varName);
    subplot (5, 2, i)
    plot(currentValue);
end

fs = 600;
p2 = figure;
for i = 1:8
    varName = sprintf('s%d', i);
    currentSignal = eval(varName);
    n = length(currentSignal);
    if(rem(n,2) == 0)
        fx = (-n/2 : n/2 - 1) * (fs/n);
    else
        fx = (-(n-1)/2 : (n-1)/2) * (fs/n);
    end
    subplot(4,2,i);
    plot(fx,abs(fftshift(fft(currentSignal))))
end

p3 = figure;
for i = 9:10
    varName = sprintf('s%d', i);
    currentSignal = eval(varName);
    fs = 44.1e3;
    n = length(currentSignal);
    if(rem(n,2) == 0)
        fx = (-n/2 : n/2 - 1) * (fs/n);
    else
        fx = (-(n-1)/2 : (n-1)/2) * (fs/n);
    end
    subplot(2,1,(i-8))
    plot(fx,abs(fftshift(fft(currentSignal))));
end