function backbone_coordinates = retrieve_backbone_coordinates(userInfo)
%F)- function for extract the coordinates of the bckbones atoms

%get all indexes of the start atoms of the chain
start_index_atoms = userInfo.start_index_atoms;

%matrix of the backbones atoms - first 3 atoms of each amino acid
backBone_idx = zeros(3, length(start_index_atoms));
backBone_idx(1,:) = start_index_atoms;
backBone_idx(2,:) = start_index_atoms + 1;
backBone_idx(3,:) = start_index_atoms + 2;

%reshape the matrix to column array
backBone_idx = backBone_idx(:);

%extract the backbone atoms by their indexes
backbones_atoms = userInfo.protein_atoms(backBone_idx);

%find the coordinates x,y,z of all backbone atoms.
backbone_coordinates = extract_coordinates(backbones_atoms);








