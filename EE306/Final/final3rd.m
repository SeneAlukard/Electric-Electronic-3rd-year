close all
clear all
%%Time specifications:
Fs = 10;                    % samples per second
dt = 1/Fs;                  % seconds per sample(Sample Period)
StopTime = 6;               % seconds
t = (0:dt:StopTime-dt)';    % seconds
%%Sine wave:
Fc = 1/3;                   % hertz
x = sin(2*pi*Fc*t);
noise = rand(size(x));
A_noise = 2 * x;
noisy_signal = x + A_noise.*noise;
% Plot the signal and noisy signal versus time:
figure;
subplot(3,2,[1 2]);
plot(t,x);
subtitle("Signal");
subplot(3,2,3);
plot(t,noisy_signal);
subtitle("Noisy Signal");
zoom xon;

% Cheybyshev filter
f_cutoff = 1/3;
cheby_filter_order = 6;
[b, a] = cheby1(cheby_filter_order, Fs, f_cutoff, "low");
cheby_filtered_signal = filter(b, a, noisy_signal);
subplot(3,2,4);
plot(t, cheby_filtered_signal);
subtitle("Chebyshev Filtered Signal");

% Butterworth filter
[b, a] = butter(6, 0.33, "low"); % b/a
butter_filtered_signal = filter(b, a, noisy_signal);
subplot(3,2,5);
plot(t, butter_filtered_signal);
subtitle("Butter Filtered Signal");

% FIR filter
fir_filter_order = 5;
f_cutoff = 0.33;
b = fir1(fir_filter_order, f_cutoff, "low");
fir_filtered_signal = filter(b, 1, noisy_signal);
subplot(3,2,6);
plot(t, fir_filtered_signal);
subtitle("FIR Filtered Signal");
