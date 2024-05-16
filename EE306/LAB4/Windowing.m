M = 80; % Window length

% Create windows
hammingWindow = hamming(M);
rectWindow = rectwin(M);
blackmanWindow = blackman(M);


%n = 0:255;
n = linspace(0,255,M);
x = 2 * cos(2*pi*n*0.240) .* cos(2 * pi * n * 0.006);

fs = 100;

n = length(x);
fz = (-n/2:n/2 -1) * fs/n;

X = abs(fft(fftshift(x)));

subplot 211
plot(x)
subplot 212
plot(fz,X)

M = length(x);

x_hamming = x' .* hammingWindow;
x_rect = x' .* rectWindow;
x_blackman = x' .*blackmanWindow;

X_hamming = abs(fft(x_hamming, 256));
X_rect = abs(fft(x_rect, 256));
X_blackman = abs(fft(x_blackman, 256));

figure;
subplot 311
plot(X_hamming);
title('Magnitude Spectrum with Hammin Window');

subplot(3,1,2);
plot(X_rect);
title('Magnitude Spectrum with Rectangular Window');

subplot(3,1,3);
plot(X_blackman);
title('Magnitude Spectrum with Blackman Window');