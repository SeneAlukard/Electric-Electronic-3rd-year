% Define the transfer functions
num = [1 9];
den1 = [1 0];
den2 = [1 4 11];

G1 = tf(num, den1);  % Transfer function G1 = (s + 9)/s
G2 = tf(1, den2);    % Transfer function G2 = 1/(s^2 + 4s + 11)

G = G1 * G2;         % Overall open-loop transfer function
H = 1;
sys = feedback(G,H);
% Plot the OPEN LOOP root locus
%figure;
%rlocus(G);
%title 'Open Loop Root Locus'

 figure;
 rlocus(sys);
 title 'Closed Loop Root Locus'

% Calculate the closed-loop poles with a damping ratio of 0.5
zeta = 0.5;
sgrid(zeta, 0);

% Determine the corresponding gain K at the desired poles
K = rlocfind(G);  % K is the gain corresponding to the desired poles

disp(['The corresponding value of gain K is: ', num2str(K)]);
