%1. Generate a sinusoidal with a frequency of 100 Hz from 0 to 2 s, using fs = 1 kHz
f = 1e2;
fs = 1e3;
t = 0:1/fs:2;
w = 2 * pi * f;
m = cos(w*t);
n = length(m);
fz = (-n/2:n/2-1) * (fs/n);
%2. Plot the FFT of the signal
figure
M = abs(fftshift(fft(m)));
plot(fz, abs(fftshift(fft(m))));
%3. Set the indices between 500 and 1000 of the signal to 1, and regenerate the FFT of the signal.
m(500:1000) = 1;
figure
plot(fz, abs(fftshift(fft(m))));
%5 Take the square of the generated signal, and regenerate the FFT.
m = m .^2;
figure
plot(fz, abs(fftshift(fft(m))));