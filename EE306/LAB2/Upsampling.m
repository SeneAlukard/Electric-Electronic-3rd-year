clc
close all
N = 80;
n=0:N;
x = sin(2*pi*0.12*n);
k = 4;
y = zeros(1, k*length(x));
y(1:k:length(y)) = x;
subplot 211, stem(n,x);
title('input sequence')
subplot 212, stem(n,y(1:length(x)));
title('output sequence');

[xz v] = freqz(x, 1, 512, 'whole');
[yz w] = freqz(y, 1, 512, 'whole');
figure, subplot 211, plot(v/pi, abs(xz));
title('input spectrum')
subplot 212, plot(w/pi, abs(yz));
title('output spectrum');
xlabel('\omega/\pi'); ylabel('magnitude');

% we use freqz to compute and plot the spectra of two signal

% our data 
%
%

% Assuming 'x' is the original signal and 'k' is the upsampling factor
%linear interpolation
n = 0:length(x)-1; % Original sample indices
n_up = linspace(0, n(end), k*length(x)-(k-1)); % New sample indices for interpolation
y_linear = interp1(n, x, n_up, 'linear');
figure
stem(y_linear)
% Linear Interpolation
% Cubic Interpolation (Cubic Spline Interpolation)
% Lanczos Interpolation
% Polynomial Interpolation
% Nearest Neighbor Interpolation