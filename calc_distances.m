function distanceMatrix = calc_distances(userInfo)
%this function get the user info struct containg the ligand and protein
%atoms and return the atoms distance matrix using d10dist function - from class. 

%get coordinate of protein atoms
coordinates_protein = extract_coordinates(userInfo.protein_atoms);

%get coordinate of ligand atoms
coordinates_ligand = extract_coordinates(userInfo.foreign_atoms);

%calculte distances between the two atom sets
distanceMatrix = d10dist(coordinates_ligand, coordinates_protein);

end