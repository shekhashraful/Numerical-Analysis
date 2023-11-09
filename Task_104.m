% Function to find the root of
f = @(x) x^2 - 4;

% Derivative of the function
df = @(x) 2*x;

% Newton-Raphson method
x0 = input('Enter the initial guess (x0): ');
tolerance = input('Enter the tolerance: ');

% Matrix to store roots and corresponding iterations
rootsMatrix = [];
tangentLines = [];

x = x0;

while abs(f(x)) > tolerance
    rootsMatrix = [rootsMatrix; x];
    tangentLines = [tangentLines; @(t) df(x)*(t - x) + f(x)];
    
    x = x - f(x) / df(x);
end

% Plotting the equation with roots and tangent lines
xValues = linspace(min(rootsMatrix), max(rootsMatrix), 1000);
yValues = f(xValues);

figure;
plot(xValues, yValues, 'LineWidth', 2);
hold on;
scatter(rootsMatrix, zeros(size(rootsMatrix)), 'ro', 'filled');

% Plotting tangent lines
for i = 1:length(rootsMatrix)
    tangentX = linspace(rootsMatrix(i)-1, rootsMatrix(i)+1, 100);
    tangentY = tangentLines(i)(tangentX);
    plot(tangentX, tangentY, '--', 'Color', [0.8 0.8 0.8]);
end

title('Newton-Raphson Method for Root Finding with Tangent Lines');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Roots', 'Tangent Lines');

hold off;
