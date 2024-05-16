f = 100;
w = 2 * pi * f;
fs = 1e3;
t = 0:1/fs:2;
x = sin(w*t);
xfft = fft(x);
n = length(x);
fx = (-n/2 : n/2 - 1) * (fs/n);
subplot 221
plot(fx, abs(fftshift(xfft)))
x(500:1000) = 1;
xfft = fft(x);
subplot 222
plot(fx, abs(fftshift(xfft)));

x = x.^2;
xfft = fft(x);
subplot 223
plot(fx, abs(fftshift(xfft)));
