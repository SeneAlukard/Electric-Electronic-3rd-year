% Coefficients
a = [1 -1.3315 0.49];
b = [1 -0.4944 0.64];

% Roots
m = roots(a); % Poles
p = roots(b); % Zeros

% Mesh grid for complex plane
[re, im] = meshgrid(linspace(-2, 2, 100), linspace(-2, 2, 100));
z = re + 1i*im;

% Evaluate H(z) over the grid
H = polyval(b, z) ./ polyval(a, z);
H_mag = abs(H);

% 3D Plot
figure;
surf(re, im, H_mag, 'EdgeColor', 'none');
colorbar;
hold on;

% Plot zeros (as 'o') and poles (as 'x') on the same plot
plot3(real(p), imag(p), zeros(length(p), 1), 'bo', 'MarkerSize', 10, 'LineWidth', 2);
plot3(real(m), imag(m), zeros(length(m), 1), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('Real Part');
ylabel('Imaginary Part');
zlabel('|H(z)|');
title('3D Plot of |H(z)| with Zeros (o) and Poles (x)');
view(-30, 30); % Adjust the viewing angle for better visibility
