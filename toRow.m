function newS = toRow(s)
%B) get pdbread struct and validate heterogen atom names are a row array,
% instead of 2D matrix.

% Extract the 2D text array from the ChemName field
name = s.ChemName;

% Transpose the array so that rows become columns
text = name';

% Convert the column vector into a row vector
text = text(:)';

% Remove leading and trailing whitespace from the row vector
text = strtrim(text);

% Create a copy of the input struct with the ChemName field replaced by the row vector
newS = s;
newS.ChemName = text;

end