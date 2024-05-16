%1.Generate a noisy sinusoidal as follows.
fs = 3e2;
t = -1: 1/fs : 1;
a = sin(2 * pi * 5 * t) + 0.3;
%2. Plot t versus a(t).
figure
plot(t,a);
%3. Plot the FFT of a with a precisely generated zero-centered frequency domain.
n = length(a);
fz = (-n/2:n/2-1) * (fs/n);
figure
plot(fz, abs(fftshift(fft(a))));

%4. Generate the discentered frequency domain, i.e., without fftshift and generate the corresponding FFT
figure
zfz = (0:n-1) * (fs/n);
plot(zfz, abs(fft(a)));

%5. Do the following operation.
B = fft(a);
B(abs(fz)< 3) = 0;
b = ifft(B);

%6. Check if the signal b(t) makes sense by plotting b(t) and a(t) on the same figure.
figure
subplot 121
plot(t,a);
title 'a'
subplot 122
plot(t,real(b));
title 'b'