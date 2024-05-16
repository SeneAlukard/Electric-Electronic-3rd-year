v = zeros(1,101);
v(40:61) = 1;
vfft = fft(v);
n = size(v, 2);
fs = 100;
fs = ( - n /2: n /2 -1) *( fs / n );

subplot 211
plot(fs, abs(fftshift(vfft)))
axis([fs(1) fs(101) -2 2])
%%
fs = 1e3;
fs = ( - n /2: n /2 -1) *( fs / n );
subplot 212
plot(fs, abs(fftshift(vfft)));
axis([fs(1) fs(101) -2 2])

%% Fs original = 100