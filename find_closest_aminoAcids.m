function index_AA = find_closest_aminoAcids(user_info, dist_matrix, min_dist)
%I) this function gets the user info strut, distances matrix of the protein
%atoms and ligand atom, and a constat distance and return all the amino
%acid identifiers that are in the ligand binding site.

% Find in which columns there are 2 amino acids that have a shorter
% distance than min_dist.
out = any(dist_matrix < min_dist,1);

%retrieve all the protein atoms that are close enough to at least one ligand atom
relevant_protein_atoms = user_info.protein_atoms(out);

%closest amino acid identifiers
resSeq_relevent = [relevant_protein_atoms.resSeq]; 

%retrieve all atoms that are AA start atoms
first_atoms = user_info.protein_atoms(user_info.start_index_atoms);

%general amino acid identifiers
resSeq_aminoAcid = [first_atoms.resSeq];

%check which amino acid are in the binding site 
logic = ismember(resSeq_aminoAcid, resSeq_relevent);

%retrieve their indexes
index_AA = find(logic);

end
