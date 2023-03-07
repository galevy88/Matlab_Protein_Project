%main script for managing the program running.

%c
clear;
close all;

%load pdb file
pdb_data = select_and_read_pdb();

%validate heterogen atom names is a row array, instead of 2D matrix.
pdb_data.HeterogenName = arrayfun(@toRow, pdb_data.HeterogenName);

%D - main program loop - user can keep choosing ligand and chain as pleased.
while true

%get from user the desired chain and ligand
[chain_id, ligand_id] = select_chain_ligand(pdb_data);

%get the protein id code
idcode = pdb_data.Header.idCode;

%graph title
text = ['file ' idcode ' chain ' chain_id ' hetero ' ligand_id];

%create struct of user choices.
user_info = struct('idcode', [], 'ligand_id', [], 'chain_id', [], 'foreign_atoms', [], ...
    'protein_atoms', [], 'start_index_atoms', [], 'end_index_atoms', [],'resNames', []);

%E) update the user info struct
user_info.ligand_id = ligand_id;
user_info.chain_id = chain_id;
user_info.idcode = idcode;

% Get only the Ligand's Atoms the are as the same of the chain_id (or all ligands)
foreign_atoms = retrieve_data_for_chain(pdb_data.Model.HeterogenAtom, chain_id);

% Getting Atoms of the specific LIgand (first_heterogen_name.hetID)
user_info.foreign_atoms = retrieve_atoms(foreign_atoms, ligand_id);

% Get only the protein's Atoms the are as the same of the chain_id
user_info.protein_atoms = retrieve_data_for_chain(pdb_data.Model.Atom, chain_id);

%Get the start and end atoms of each amino acid + update in user info struct
[start_index_atoms, end_index_atoms] = start_end_atoms(user_info.protein_atoms);
user_info.start_index_atoms = start_index_atoms;
user_info.end_index_atoms = end_index_atoms;

%Get the start atoms on the chosen chain
binary = zeros(1, length([user_info.protein_atoms.AtomSerNo]));
i = 1;
for x = [user_info.protein_atoms.AtomSerNo]
    a = x == [user_info.start_index_atoms];
    if any(a)
        binary(i) = 1;
    end
    i = i + 1;
end
protein_atoms_subset = user_info.protein_atoms(logical(binary));

%save the names of all amino acid chosen
user_info.resNames = strtrim({protein_atoms_subset.resName});

%get backbone atoms coordinates
backbone_coordinates = retrieve_backbone_coordinates(user_info);

% Use the coordinates variable to plot a 3D scatter graph
scatter3(backbone_coordinates(:,1), backbone_coordinates(:,2), backbone_coordinates(:,3));
xlabel('X Coordinate');
ylabel('Y Coordinate');
zlabel('Z Coordinate');
title('3D Scatter Plot of Atoms');

% Set the axes to be 1:1:1 proportion
axis equal

% Add a title to the graph
title(text);


%ask the user for exiting or repeating the loop
answer = questdlg("would you like to choose another chain and ligand from this file?");
switch answer
    case 'Yes'
        close all;
    case 'No'
        break;
    case 'Cancle'
        break;
    case ' '
        break;
end

end %of main script