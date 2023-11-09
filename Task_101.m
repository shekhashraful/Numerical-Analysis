% Define matrix A
A = input('Enter values for matrix A (e.g., [1 2; 3 4]): ');

% Define matrix B
B = input('Enter values for matrix B (e.g., [5 6; 7 8]): ');

% Print the maximum value from matrix A
maxA = max(A(:));
fprintf('The maximum value in matrix A is: %d\n', maxA);

% Multiply matrices A and B and handle the case where multiplication is not possible
if size(A, 2) == size(B, 1)
    % Multiplication is possible
    resultMatrix = A * B;
    disp('Matrix multiplication result:');
    disp(resultMatrix);
else
    % Multiplication is not possible
    disp('Matrix multiplication is not possible. Number of columns in A must be equal to the number of rows in B.');
end
