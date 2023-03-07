function [start_index_atoms, end_index_atoms] = start_end_atoms(protein_atoms)
%A) this function gets the protein atoms and return two numeric arrays
% of the first and last atoms of each amino acid in the chain 

%numeric array of resSeq values of all the protein atoms 
res_Seq = [protein_atoms.resSeq];

%get the end atoms of each amino acid by finding resSeq change points
indx = find(res_Seq(1:end-1)~=res_Seq(2:end));
%add the last atoms - which was not inserted
indx(end+1) = length(res_Seq);
end_index_atoms = indx;

%get the start atoms by adding +1 to the end atoms index.
temp = end_index_atoms + 1;
%add the first atom - reprsent the start of the first amino acid.
start_index_atoms = [1, temp(1:end-1)];

end