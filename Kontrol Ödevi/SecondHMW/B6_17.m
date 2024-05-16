% Original system
num = 5;
den = [0.5 1 0];
G = tf(num, den);
H = 1;
orig_sys = feedback(G, H);

% Modified system
Gc = tf([1 2], [1 4]);
a = -2 + 2*sqrt(3)*1j;
K = abs(a * (a + 4) / 10);
Gc = K * Gc;

G = G * Gc;
new_sys = feedback(G, H);

% Plot Bode plot
figure;
bode(new_sys, 'r');
title('Bode Plot Comparison');

% Plot step response
figure;
step(new_sys, 'r');
title('Step Response Comparison');