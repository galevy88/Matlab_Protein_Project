function output_atoms = retrieve_atoms(input_atoms, material_id)
    % Get the Ligand Shortcut
    resNames = {input_atoms.resName};
    
    % Deleting spaces
    resNames = strtrim(resNames);
    
    % Create logical Arr for specific ligand
    is_matching_material = strcmp(resNames, material_id);
    
    % Generating atoms only for the specific ligand
    output_atoms = input_atoms(is_matching_material);
end
