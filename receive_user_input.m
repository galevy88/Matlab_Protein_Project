function output_struct = receive_user_input(input_struct)
% Init params for
param_names = {'Minimum distance', 'Maximum distance'};

% Set the default params
default_params = [input_struct(1), input_struct(2)];

% d8params = Black Box (Basically get user inputs as str and convert to double)
user_input = d8params(param_names, default_params);

% Extract the values from the user_input variable and save them in the output structure
output_struct.min_distance = user_input(1);
output_struct.max_distance = user_input(2);
