% reorganzing data after running MRspa/LCModel

% making copies of all spa and COORD files 
selpath = uigetdir;
fold = dir(selpath); 

% loop through all folders 
for i = 3:length(fold) % starting at 3 due to "." and ".."
    name = fold(i).name; % current name of folder
    if strcmpi(name, 'Elderly') || strcmpi(name, 'Young')
        % do nothing 
    else 
        subpath = append(selpath, '/', name); % path to copy from
        copy_spa_path = '/home/labast/Documents/AABCProcessing/S3_isolated_spa_files'; % path to copy to for spa files
        copy_coord_path = '/home/labast/Documents/AABCProcessing/S3_isolated_COORD_files'; % path to copy to for coord files
        % custom copying function
        copyFiles(selpath, subpath, name, copy_spa_path)
        copyFiles(selpath, subpath, name, copy_coord_path)
        
    end 
end 
