%1. Convolve the signal you generated in Procedure 1 by itself, and assign it to a new variable.
%Hint: Use conv(..., ...) function
x = zeros(1,101);
x(40:61) = 1;
%2. Normalize the signal by signal = signal/max(signal);
y = conv(x,x);
y = y/max(y);
%3.Plot the signal and interpret how the shape was generated.
figure
plot(y);
%4. Plot the FFT of the signal.
figure
plot(abs(fftshift(fft(y))));