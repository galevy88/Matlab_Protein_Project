% Select and read pdb file
pdb_data = select_and_read_pdb();
%##################### ONE TIME CHECK ##########################
% Getting Heterogens names (Ligands names)
heterogen_names = pdb_data.HeterogenName;

% Iterate over ligands and get the hetID (Ligands shortcut)
for i = 1:length(heterogen_names)
    disp(heterogen_names(i).hetID);
end

% Extract the first member from the heterogen_names array
first_heterogen_name = heterogen_names(1);

% Get hetID of the Ligand
material_id = strtrim(first_heterogen_name.hetID);

% Get Atoms of Ligands
heterogen_atoms = pdb_data.Model.HeterogenAtom;

% Getting Atoms of the specific LIgand (first_heterogen_name.hetID)
output_atoms = retrieve_atoms(heterogen_atoms, material_id);
%##################### ONE TIME CHECK ##########################


% Test function from section D
[chain_id, ligand_id] = select_chain_ligand(pdb_data);
disp(ligand_id);
disp(chain_id);

% Get only the protein's Atoms the are as the same of the chain_id
protein_atoms = retrieve_data_for_chain(pdb_data.Model.Atom, chain_id);

% Get only the Ligand's Atoms the are as the same of the chain_id (or all ligands)
foreign_atoms = retrieve_data_for_chain(pdb_data.Model.HeterogenAtom, chain_id);

% Creating Struct with 2 fields for min, max
empty_structure = struct('min_distance', [], 'max_distance', []);

% Initialize the 'min_distance' field to 5
empty_structure.min_distance = 5;

% Initialize the 'max_distance' field to 30
empty_structure.max_distance = 30;

% Recieve user input for numerical params
% default_params = [empty_structure.min_distance, empty_structure.max_distance];
output_structure = receive_user_input(empty_structure);

% Get the relevant atoms for the chosen chain
relevant_atoms = retrieve_data_for_chain(heterogen_atoms, chain_id);

% Relevant atoms = Protein's atoms was chosen (
coordinates = extract_coordinates(relevant_atoms);
disp(coordinates);

% Use the coordinates variable to plot a 3D scatter graph
scatter3(coordinates(:,1), coordinates(:,2), coordinates(:,3));
xlabel('X Coordinate');
ylabel('Y Coordinate');
zlabel('Z Coordinate');
title('3D Scatter Plot of Atoms');
