function output_struct = receive_user_input(input_struct)

% d8params = Black Box (Basically get user inputs as str and convert to double)
user_input = d8params(fieldnames(input_struct), [input_struct.min_distance, input_struct.max_distance]);

% Extract the values from the user_input variable and save them in the output structure
output_struct.min_distance = user_input(1);
output_struct.max_distance = user_input(2);
