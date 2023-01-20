function output_structure = select_and_read_pdb()
    % Select a file
    [fileName, folderName] = uigetfile('*.ent');
    fullFileName = fullfile(folderName, fileName);
    
    % Read the file
    output_structure = pdbread(fullFileName);
end
