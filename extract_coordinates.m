function coordinates = extract_coordinates(atoms_structures)
    x = [atoms_structures.X];
    y = [atoms_structures.Y];
    z = [atoms_structures.Z];
    coordinates = [x', y', z'];
end
