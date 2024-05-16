fs = 1e3;
t = -25:1/fs:25;
f = 100;
w = 2 * pi * f;
y1 = sin(w*t);
y2 = sinc((w/2)*t);
z = y1.*y2;
n = length(y1);
fx = (-n/2 : n/2-1) * (fs/n);
p1 = figure
subplot 311
plot(fx, abs(fftshift(fft(y1))));
subplot 312
plot(fx, abs(fftshift(fft(y2))))
subplot 313
plot(fx, abs(fftshift(fft(z))))
Y1 = fft(y1);
Y2 = fft(y2);
Q = conv(Y1(1:round(length(Y1)/4)), Y2(1:round(length(Y2)/4)))
q = ifft([Q(1), Q(2:end)/2, fliplr(conj(Q(2:end)))/2]);

p2 = figure
subplot 211
plot(t(1:length(q)),abs(q));
subplot 212
plot(t,abs(z))
p3 = figure
f = 2e3
w = 2 * pi * f;
y1 = sin(w*t);
plot(fx,abs(fftshift(fft(y1))))