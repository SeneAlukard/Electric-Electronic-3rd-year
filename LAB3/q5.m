% Generate a Gaussian distributed random signal x[n]
x = randn(1, 32);

% Coefficients for the difference equation (example values)
a = [1, -0.5]; % Example denominator coefficients
b = [0.5, 0.5]; % Example numerator coefficients

% Apply the difference equation
y = diff_eqn(b, a, x);

% Plot x[n] and y[n]
figure;
subplot(2,1,1);
stem(x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');

subplot(2,1,2);
stem(y, 'filled');
title('Output Signal y[n]');
xlabel('n');
ylabel('Amplitude');

Fs = 100; % Sampling frequency in Hz
t = 0:1/Fs:1-(1/Fs); % Time vector for 1 second
f = 10; % 10 Hz frequency
cosSignal = cos(2*pi*f*t); % Cosine signal

noise = randn(size(t)); % Generate noise
noisyCosSignal = cosSignal + noise; % Add noise to the cosine signal


% Apply the difference equation (filter) to the noisy cosine signal
filteredSignal = diff_eqn(b, a, noisyCosSignal);

% Plot the noisy and filtered signals
figure;
subplot(2,1,1);
plot(t, noisyCosSignal);
title('Noisy Cosine Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, filteredSignal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');



function y = diff_eqn(b, a, x)
    y = filter(b, a, x);
end
