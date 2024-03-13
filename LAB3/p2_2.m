v = zeros(1,101);
v(40:61) = 1;
convv = conv(v,v);
v = convv/max(convv);
n = length(v);
fs = 100;
fs = ( - n /2: n /2 -1) *( fs / n );
subplot 211
plot(v)
vfft = fft(v);
subplot 212
plot(fs,abs(fftshift(vfft)));
