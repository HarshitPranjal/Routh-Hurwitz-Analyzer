function [routhTable, stabilityStatement, signChanges] = routhAnalyzer(coeffs)

    % Get degree and setup dimensions
    n = length(coeffs) - 1;
    numRows = n + 1;
    numCols = ceil(length(coeffs) / 2);

    % Initialize Routh table
    routhTable = zeros(numRows, numCols);

    % Fill first two rows
    oddCoeffs = coeffs(1:2:end);
evenCoeffs = coeffs(2:2:end);

% Pad with zeros to match numCols
oddCoeffs(end+1:numCols) = 0;
evenCoeffs(end+1:numCols) = 0;

routhTable(1, :) = oddCoeffs;
routhTable(2, :) = evenCoeffs;

    % Fill remaining rows
    for i = 3:numRows

        % Handle zero row (Auxiliary polynomial)
        if all(routhTable(i-1, :) == 0)
            disp(['Zero row at row ', num2str(i-1), ' — Using auxiliary polynomial...']);
            degree = n - i + 2;
            rowAbove = routhTable(i-2, :);
            auxCoeffs = [];

            for k = 1:length(rowAbove)
                power = degree - 2*(k-1);
                if power >= 0
                    auxCoeffs = [auxCoeffs, rowAbove(k) * power];
                end
            end

            routhTable(i-1, 1:length(auxCoeffs)) = auxCoeffs;
        end

        for j = 1:(numCols - 1)
            A = routhTable(i-2, 1);
            C = routhTable(i-1, 1);

            if abs(C) < 1e-6
                C = 1e-6; % epsilon
            end

            if (j+1) > size(routhTable,2)
                B = 0;
                D = 0;
            else
                B = routhTable(i-2, j+1);
                D = routhTable(i-1, j+1);
            end

            routhTable(i,j) = (B*C - A*D) / C;
        end
    end

    % Replace zeros in first column
    firstColumn = routhTable(:, 1);
    eps_val = 1e-6;
    firstColumn(firstColumn == 0) = eps_val;

    % Count sign changes
    signChanges = 0;
    for i = 1:length(firstColumn)-1
        if sign(firstColumn(i)) ~= sign(firstColumn(i+1))
            signChanges = signChanges + 1;
        end
    end

    % Determine stability
    if signChanges == 0
        stabilityStatement = 'The system is stable.';
    else
        stabilityStatement = ['The system is unstable. Sign changes: ', num2str(signChanges)];
    end

    % Display outputs for debugging
    disp('--- Routh-Hurwitz Table ---');
    disp(routhTable);
    disp('--- First Column ---');
    disp(firstColumn);
    disp(['Sign changes: ', num2str(signChanges)]);
    disp(['Stability: ', stabilityStatement]);

end