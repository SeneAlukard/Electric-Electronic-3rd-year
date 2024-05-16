num = [1 1];%s+1
den1 = [1 2 2];%s^2+2s+2
den2 = [1 2 5];%s^2+2s+5

G1 = tf(num,den1);%divide eqn into two part(s+1)/s^2+2s+2
G2 = tf(1,den2);%divide eqn into two part 1 / s^2+2s+5

G = G1 * G2;

K = 0:0.01:50;%0.01 needed cause some parts small gain difference affects big in graph.
rlocus(G)
grid
title('Root-Locus Plot of G(s) = K(s+1)/[(s^2+2s+2)(s^2+2s+5)]')
xlabel('Real Axis')
ylabel('Imag Axis')