num = [1 1];
den = [1 0 0];
G = tf(num,den);
H = 1;
T = feedback(G,H);
K = 0:0.01:50;
figure;
rlocus(G,K);
grid 

figure;
rlocus(T,K);
grid

