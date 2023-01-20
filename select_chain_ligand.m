function [chainID, ligandID] = select_chain_ligand(pdbStruct)
    % Getting all ligands (Fullnames)
    chemNames = {pdbStruct.HeterogenName.ChemName};
    % Deleting spaces
    chemNames = strtrim(chemNames);
    % If there is only one Ligand = choose him
    if length(chemNames) == 1
        selectedChemName = 1;
    else
        % Allow user to select Ligand from list (~ is index that not use)
        [selectedChemName,~] = listdlg('ListString',chemNames,'PromptString','Select a ligand:');
    end
    % Getting hetID (shortcut) for the chosen Ligand
    ligandID = pdbStruct.HeterogenName(selectedChemName).hetID;
    % Deleting spaces
    ligandID = strtrim(ligandID);
    % Getting Ligand's Atoms
    ligandAtoms = retrieve_atoms(pdbStruct.Model.HeterogenAtom, ligandID);
    % Get chainIDs of which chain this atom is related to
    chainIDs = {ligandAtoms.chainID};
    % DISTINCT
    chainIDs = unique(chainIDs);
    % If only one chainID, select it (if only A/B)
    if length(chainIDs) == 1
        chainID = chainIDs{1};
    else
        % Allow user to select chainID from list
        [selectedChain,~] = listdlg('ListString',chainIDs,'PromptString','Select a chain:');
        chainID = chainIDs{selectedChain};
    end
end
