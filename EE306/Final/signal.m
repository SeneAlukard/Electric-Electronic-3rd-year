fs = 50;
t = 0:1/fs:10;
x = cos(2*pi*15*t) + cos(2*pi*20*t);
subplot 211
plot(t,x)
n = size(t,2);
fz = (-n/2:n/2-1) * fs/n;
subplot 212
plot(fz,abs(fftshift(fft(x))));
