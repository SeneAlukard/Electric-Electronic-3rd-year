% Define the range of angles (in radians) for which you want to plot sine
theta = linspace(0, 2*pi, 100); % for example, you can adjust the range and number of points as needed

% Initialize an array to store the sine values
sin_values = zeros(size(theta));

% Calculate sine using Euler's identity for each angle
for i = 1:length(theta)
    sin_values(i) = imag(exp(1i * theta(i)));
end

% Plot the sine function
plot(theta, sin_values, 'r', 'LineWidth', 2);
xlabel('Angle (radians)');
ylabel('Sine');
title('Plot of Sine Function using Euler''s Identity');
grid on;
