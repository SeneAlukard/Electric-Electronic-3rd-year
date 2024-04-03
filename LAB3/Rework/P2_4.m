%1. Generate the time domain from −25 s to 25 s with fs = 1 kHz.
fs= 1e3;
t = -25:1/fs:25;
f = 1e2;
w = 2 * pi * f;
%2. Generate y1 = sin(2π100t) and y2 = sinc(2π50t).
y1 = sin(2*pi*100*t);
y2 = sinc(2*pi*50*t);
%3. Multiply the signals to find z = y1 · y2.
z = y1 .* y2;
%4. Plot the FFT of z, y1 and y2 on the same figure as subplots.
n = length(z);
fz = (-n/2:n/2-1)*(fs/n);
figure
subplot 311
plot(fz, abs(fftshift(fft(y1))));
title 'y1 frequency domain'
subplot 312
plot(fz, abs(fftshift(fft(y2))));
title 'y2 frequency domain'
subplot 313
plot(fz, abs(fftshift(fft(z))));
title 'z frequency domain';
%6. Convolve the frequency domain representations as
%Q = conv(Y1(1:round(length(Y1)/4)), Y2(1:round(length(Y2)/4))).
%Note: Y1=fft(y1) and Y2=fft(y2).

Y1 = fft(y1);
Y2 = fft(y2);
Q = conv(Y1(1:round(length(Y1)/4)), Y2(1:round(length(Y2)/4)));
%7. Take the IFFT as q = ifft([Q(1), Q(2:end)/2, fliplr(conj(Q(2:end)))/2]).
q = ifft([Q(1), Q(2:end)/2, fliplr(conj(Q(2:end)))/2]);
%8. Compare the signals q and z
figure
subplot 121
plot(q);
title 'q'
subplot 122
plot(z);
title 'z'

%9. Regenerate y1 with a frequency of 2 kHz, and regenerate FFT%s of z and y1.
y1 = sin(2*pi*2e3*t);
y2 = sinc(2*pi*50*t);
z = y1 .* y2;
n = length(z);
fz = (-n/2:n/2-1)*(fs/n);
figure
subplot 311
plot(fz, abs(fftshift(fft(y1))));
title 'y1 frequency domain'
subplot 312
plot(fz, abs(fftshift(fft(y2))));
title 'y2 frequency domain'
subplot 313
plot(fz, abs(fftshift(fft(z))));
title 'z frequency domain';




