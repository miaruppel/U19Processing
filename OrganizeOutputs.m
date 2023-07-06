% Reorganzing data after running MRspa/LCModel
% Makes down the road analysis easier 

% making copies of all spa and COORD files 
selpath = uigetdir; % select main directory housing all outputs for each participant 
fold = dir(selpath); 

% loop through all folders 
for i = 3:length(fold) % starting at 3 due to "." and ".."
    name = fold(i).name; % current name of folder
    if strcmpi(name, 'Elderly') || strcmpi(name, 'Young') % directory stucture used here had a seperate folder for each particpant and also folders seperating young and elderly 
        % do nothing, the young and elderly folders simply contain copies
    else 
        subpath = append(selpath, '/', name); % path to copy from
        copy_spa_path = '/home/labast/Documents/AABCProcessing/S3_isolated_spa_files'; % MY local directory to save all isolated spa files (or RAW files if desired)
        copy_coord_path = '/home/labast/Documents/AABCProcessing/S3_isolated_COORD_files'; % MY local directory to save all isolated COORD files 
        % custom copying function
        copyFiles(selpath, subpath, name, copy_spa_path)
        copyFiles(selpath, subpath, name, copy_coord_path)
        
    end 
end 
