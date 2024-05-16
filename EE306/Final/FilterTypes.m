f = 10; % signal Frequency
fs = 1e3; % sampling CT -> DT 
cutoff = 30;

t = -2:1/fs:2;

signal = sin(2*pi*f*t);
subplot 511

noise = rand(size(signal));
noisysig = signal + 0.5*noise;
plot(t,signal);
subplot 512
plot(t,noisysig);


[b, a] = cheby1(6, 1, 2*cutoff/fs, 'low');
filteredsignal = filter(b,a,noisysig);
subplot 513
plot(t,filteredsignal);
title 'Cheby'

[b, a] = butter(6,2*cutoff/fs,'low');
filteredsignal = filter(b,a,noisysig);
subplot 514
plot(t,filteredsignal);
title 'Butter'

[b, a] = fir1(5,2*cutoff/fs,'low');
filteredsignal = filter(b,a,noisysig);
subplot 515
plot(t,filteredsignal);
title 'FIR'
