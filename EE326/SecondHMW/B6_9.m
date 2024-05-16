num = [0 9];
den = [1 4 11 0];
G = tf(num, den);

% Generate root locus data
[k, poles] = rlocus(G);

% k is an array of gain values
% poles is an array of corresponding pole locations for each gain value


% Initialize array to store damping ratios
zetas = zeros(size(poles));

% Calculate damping ratio for each pole at each gain
for i = 1:size(poles, 2) % iterate over different gains
    for j = 1:size(poles, 1) % iterate over different poles
        sigma = real(poles(j, i));
        omega = imag(poles(j, i));
        zetas(j, i) = -sigma / sqrt(sigma^2 + omega^2);
    end
end

% Find the gain where damping ratio is approximately 0.5
target_zeta = 0.5;
[~, idx] = min(abs(zetas - target_zeta), [], 'all', 'linear');
[pi, ki] = ind2sub(size(zetas), idx);
optimal_gain = k(ki);
optimal_pole = poles(pi, ki);

fprintf('Optimal Gain (K) for damping ratio 0.5 is approximately: %.3f\n', optimal_gain);
fprintf('Corresponding Pole: %.3f + %.3fi\n', real(optimal_pole), imag(optimal_pole));
