syms z n 
a = [1 -1.3315 0.49];
b = [1 -0.4944 0.64];
H1 = b(1)+b(2)*(z^-1)+b(3)*(z^-2);
H2 = a(1)+a(2)*(z^-1)+a(3)*(z^-2);
H = H1/H2;
m = roots(a);
p = roots(b);
figure
subplot 211
fplot(H)
hold on;
grid on;
subplot 212
zplane(m,p);
%
figure
[l, freq] = freqz(b, a, 'half', 1024);
subplot 211
plot(freq/pi, abs(l));
title('H(z)')
subplot 212
phase = unwrap(angle(l));
plot(freq/pi, phase);
title('Phase diff')
%
figure
Hn = iztrans(H, z, n)
Hn_func = matlabFunction(Hn, 'Vars', n);
n_vals = -200:1:200;
Hn_vals = double(Hn_func(n_vals));
stem(n_vals,Hn_vals);
title("Hn");

