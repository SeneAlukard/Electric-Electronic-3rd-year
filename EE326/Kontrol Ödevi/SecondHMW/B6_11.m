GNUM = [1 1];
GDEN = [1 2 6 0];
HNUM = 1;
HDEN = [1 1];

G = tf(GNUM, GDEN);
H = tf(HNUM, HDEN);


figure;
rlocus(feedback(K*G,H));
%plot(r);
hold on;

K = 2;
T = feedback(K*G, H);

poles = pole(T);

% Plot the closed-loop poles on the root locus graph
scatter(real(poles), imag(poles), 'red','pentagram');
legend('Root locus', 'Closed-loop poles');

disp('Closed-loop poles for K = 2:');
disp(poles);
