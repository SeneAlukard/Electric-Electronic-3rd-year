fs = 3e2;
t = -1 : 1/fs : 1;
w = 2 * pi * 5;
a = sin(w * t) + 0.3;
n = length(a);
fx = (-n/2 : n/2-1) * (fs/n);
p1 = figure
subplot 211
plot(t,a);
subplot 212
plot(fx,abs(fftshift(fft(a))));

B = fft(a);
B(f<3) = 0;
b = abs(ifft(a));
p2 = figure
%subplot 211
plot(t,a);
hold on;
%subplot 212
plot(fx,b);