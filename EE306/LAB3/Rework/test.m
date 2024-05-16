fs = 3e2; % Sampling frequency
t = -1 : 1/fs : 1; % Time vector
a = sin(2 * pi * 5 * t) + 0.3; % Original signal

% Original signal plot
figure;
plot(t, a);
title('Original Signal a');

% FFT and frequency domain plot
n = length(a);
fz = (-n/2 : n/2-1) * (fs/n); % Frequency vector
A = fftshift(fft(a)); % Shifted FFT for visualization

% Frequency domain plot of the shifted FFT
figure;
plot(fz, abs(A));
title('Frequency Domain of a');

% Apply high-pass filter
B = fft(a); % FFT of the original signal
fz_nonshifted = (0 : n-1) * (fs/n) - fs/2; % Non-shifted frequency vector for filtering
B(abs(fz_nonshifted) < 3) = 0; % Zeroing components with absolute frequency less than 3 Hz
b = ifft(B); % Inverse FFT of the filtered signal

% Comparing original and filtered signals
figure;
subplot(121);
plot(t, a);
title('Original Signal a');
subplot(122);
plot(t, real(b)); % Plot real part of the filtered signal
title('Filtered Signal b');
