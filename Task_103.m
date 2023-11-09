% Function to find the root of
f = @(x) x^2 - 4;

% False-Position method
a = input('Enter the lower bound (a): ');
b = input('Enter the upper bound (b): ');
tolerance = input('Enter the tolerance: ');

% Matrix to store roots and corresponding iterations
rootsMatrix = [];

while abs(b - a) > tolerance
    c = (a*f(b) - b*f(a)) / (f(b) - f(a));
    rootsMatrix = [rootsMatrix; c];
    
    if f(c) == 0
        break; % Root found
    elseif f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
end

% Plotting the equation with roots
x = linspace(min(a, b), max(a, b), 1000);
y = f(x);

figure;
plot(x, y, 'LineWidth', 2);
hold on;
scatter(rootsMatrix, zeros(size(rootsMatrix)), 'ro', 'filled');
title('False-Position Method for Root Finding');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Roots');

hold off;
