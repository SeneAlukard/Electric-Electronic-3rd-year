clear, clc

%% Signal Generation
fm = 10;                    % Message frequency
fc = 1e2;                   % Carrier frequency
fs = 3e3;                   % Sampling frequency
t  = 0:(1/fs):(1-1/fs);     % Time domain
m  = 2*cos(2*pi*fm*t);      % Message signal
c  = 1*cos(2*pi*fc*t);      % Carrier signal
mc = m.*c;                  % Modulated signal

%% FFT
n = length(m);              % Message length
f = (0:n-1)*(fs/n);         % Frequency domain
fz = (-n/2:n/2-1)*(fs/n);   % Zero-centered freq. domain
XC  = fft(c);               % FFT of carrier
YC  = fftshift(XC);         % Zero-centering XC
XM  = fft(m);               % FFT of message
YM  = fftshift(XM);         % Zero-centering XM
XMC = fft(mc);              % FFT of modulated signal
YMC = fftshift(XMC);        % Zero-centering XMC

%% Plotting Signals
figure('units','normalized','outerposition',[0 0 1 1])
subplot 311, plot(t, m), xlim([0 .5])
grid on, xlabel 'Time (s)', ylabel 'm(t)'
title 'Message Signal'
subplot 312, plot(t, c), xlim([0 .5])
grid on, xlabel 'Time (s)', ylabel 'c(t)'
title 'Carrier Signal'
subplot 313, plot(t, mc), xlim([0, .5])
grid on, xlabel 'Time (s)', ylabel 'm(t)c(t)'
title 'Modulated Signal'

%% Plotting FFT
h = figure; movegui(h, 'northeast'), hold on
plot(fz, abs(YM))           % Plotting YM
plot(fz, abs(YC))           % Plotting YC
plot(fz, abs(YMC))          % Plotting YMC
xlim([-150 150])
xlabel 'Frequency (Hz)', ylabel 'Amplitude (V)'
title 'FFT of All Signals', grid on
legend('Message Signal',...
       'Carrier Signal',...
       'Modulated Signal')