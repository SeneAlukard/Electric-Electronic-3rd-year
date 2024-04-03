fs = 1e3;
f = 1e2;
t = -4*pi:1/fs:(4*pi);
m = square(2*pi*t);
c = cos(2*pi*100*t);
s = m .* c;
n = length(s);

fz = (-n/2:n/2-1)*(fs/n);
S1 = fft(s);

plot(t, s);
title 'Signal in Time domain'
xlabel 'Time (s)'
ylabel 'Amplitude (V)'
grid on

figure
plot(fz, abs(fftshift(fft(s))));
title 'Signal in Frequency Domain'
xlabel 'Frequency (Hz)'
ylabel 'Amplitude (V)'

figure
subplot 211
plot(fz,abs(fft(s)))
title 'fft without shift'
subplot 212
plot(fz,abs(fftshift(fft(s))))
title 'fft with shift' 
