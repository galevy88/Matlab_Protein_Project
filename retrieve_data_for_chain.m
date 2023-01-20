function output_structures = retrieve_data_for_chain(input_structures, chain_id)
    % Get all the chainIDs values for all the atoms in the protein
    chain_ids = [input_structures.chainID];
    
    % Getting logical array for all the indexes that the Atom's chainID i the same as the user chose
    chain_id = char(chain_id);
    is_matching_chain = chain_ids == chain_id;
    
    % Return only the Atoms with the same chainID (Cut the protein)
    output_structures = input_structures(is_matching_chain);
end
