%1.Generate a variable of zeros with length 101
x = zeros(1,101);
%2.Set the indices between 40 and 61 to 1, including 40 and 61
x(40:61) = 1;
figure
plot(x);
%3.Take the FFT of the signal. 
X = fft(x);
%4.Generate the zero-centered frequency domain for fs = 100 Hz.
fs = 1e2;
n = length(x);
fz = (-n/2:n/2 - 1) * (fs/n);
Xs = fftshift(X);
XX = abs(Xs);
%5.Plot the signal in the frequency domain.
figure
plot(fz,XX);
%6.Do the same for fs = 1 kHz, and plot it on the same figure
hold on;
fs = 2e2;
n = length(x);
fz = (-n/2:n/2-1) * (fs/n);
X = fft(x);
Xs = fftshift(X);
XX = abs(Xs);
plot(fz,XX);