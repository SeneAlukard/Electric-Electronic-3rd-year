% Parameters
M = 256;
n = linspace(0, 255, M);
noise = 0.5 * randn(1, M); % Gaussian noise

% Generate the noisy signal
x = 2 * cos(2*pi*n*0.240) .* cos(2*pi*n*0.006) + noise;

% Define windows
hamming_window = hamming(M)';
blackman_window = blackman(M)';
rectangular_window = rectwin(M)';

% Apply windows to the noisy signal
x_hamming = x .* hamming_window;
x_blackman = x .* blackman_window;
x_rectangular = x .* rectangular_window;

% Design a filter (e.g., moving average)
filter_order = 5;
b = ones(1, filter_order) / filter_order;

% Apply the filter to each windowed signal
filtered_hamming = filter(b, 1, x_hamming);
filtered_blackman = filter(b, 1, x_blackman);
filtered_rectangular = filter(b, 1, x_rectangular);

% Plot the results
subplot(3, 1, 1);
plot(n, x, 'b', n, filtered_hamming, 'r');
title('Hamming Window');
legend('Noisy Signal', 'Filtered Signal');
xlabel('n');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(n, x, 'b', n, filtered_blackman, 'r');
title('Blackman Window');
legend('Noisy Signal', 'Filtered Signal');
xlabel('n');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(n, x, 'b', n, filtered_rectangular, 'r');
title('Rectangular Window');
legend('Noisy Signal', 'Filtered Signal');
xlabel('n');
ylabel('Amplitude');
