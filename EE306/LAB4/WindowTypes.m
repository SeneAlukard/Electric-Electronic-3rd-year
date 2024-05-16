M = 40; % Window length

% Create windows
hammingWindow = hamming(M);
rectWindow = rectwin(M);
blackmanWindow = blackman(M);

% Plot the windows
figure;
subplot(3,1,1);
stem(hammingWindow, 'filled');
title('Hamming Window');

subplot(3,1,2);
stem(rectWindow, 'filled');
title('Rectangular Window');

subplot(3,1,3);
stem(blackmanWindow, 'filled');
title('Blackman Window');
