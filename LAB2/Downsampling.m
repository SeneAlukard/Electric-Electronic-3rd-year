clc
close all
N = 30;
n= 0:N;
x1 = sinc(n/6);
subplot(221), stem(n,x1); grid;
title('original signal')
m = 2; %%%%% DOWNSAMPLING FACTOR ==> 2 || 30 sample -> 15 sample
x2 = x1(1:m:length(x1));
m = 0:m:N;
subplot(222), stem(m,x2); grid;
title('decimated signal')
X1 = abs(fftshift(fft(x1)));
subplot(223), plot(n,X1), title('input spectrum')
X2 = abs(fft(x2));
subplot(224), stem(m,X2), title('output spectrum')

% Fourier of Sinc -> Rect
% its similar to 2 or 3 taken FT of sinusoidal signal
% it can be caused by FFT formula or limitations of sampling amount


%Q3

f = 100;
t = -2:1/f:2;
t1 = -2:1/(f/3):2;
m = 3;
x = sin(2*pi*t);
y = x(1:m:length(x));

subplot 211, plot(t,x);
title('x')
subplot 212, plot(t1,y);
title('y')