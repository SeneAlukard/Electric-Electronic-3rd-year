% Specifications
order = 6;
ripple = 3; % 3 dB passband ripple
Wp = 0.4; % Normalized cutoff frequency (half the sampling rate)

% Generate the Chebyshev Type-1 filter
[b_cheby1, a_cheby1] = cheby1(order, ripple, Wp);

% Frequency response
[H_cheby1, w_cheby1] = freqz(b_cheby1, a_cheby1, 1024, 'half');

% Plot magnitude spectrum
figure;
plot(w_cheby1/pi, 20*log10(abs(H_cheby1)));
title('Magnitude Spectrum of Chebyshev Type-1 Filter');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');

% Generate the Butterworth filter
[b_butter, a_butter] = butter(order, Wp);

% Frequency response
[H_butter, w_butter] = freqz(b_butter, a_butter, 1024, 'half');

% Plot magnitude spectrum
figure;
plot(w_butter/pi, 20*log10(abs(H_butter)));
title('Magnitude Spectrum of Butterworth Filter');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');

% Filter specifications
hp_order = 20; % Highpass filter order
hp_cutoff = 0.2; % Highpass filter cutoff frequency (normalized)

% Generate FIR highpass filter
b_fir_hp = fir1(hp_order, hp_cutoff, 'high');

% Frequency response of the FIR filter
[H_fir_hp, w_fir_hp] = freqz(b_fir_hp, 1, 1024, 'half');

% Plot magnitude spectrum of FIR filter
figure;
plot(w_fir_hp/pi, 20*log10(abs(H_fir_hp)));
title('Magnitude Spectrum of FIR Highpass Filter');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');

% Generate square wave
Fs = 1000; % Sampling frequency
t = 0:1/Fs:1-1/Fs; % Time vector
f_square = 100; % Frequency of square wave
x_square = square(2*pi*f_square*t);

% Filter the square wave
y_square_filtered = filter(b_fir_hp, 1, x_square);

% Plot original and filtered square wave
figure;
subplot(2,1,1);
plot(t, x_square);
title('Original Square Wave');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, y_square_filtered);
title('Filtered Square Wave (Highpass)');
xlabel('Time (s)');
ylabel('Amplitude');

%% THEY ARE IIF INDEFINITE IMPULSE RESPONSE :  because they can respond indefinitely to a finite input, a characteristic due to their recursive nature.



