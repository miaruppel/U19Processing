% Extracting DICOM Info
% renaming numbered folders and adding folders with project name (which site) and patient age

% choose directory '.../SCANS'
selpath = uigetdir;
% main folder 
fold = dir(selpath); % adds "." and ".." non-directories to the beginning...

% loop through all folders and name them
for i = 3:length(fold) % starting at 3 due to "." and ".."
    name = fold(i).name; % current name of folder
    subpath = append(selpath, '/', name, '/DICOM'); % respective dicom path for this folder
    if ~exist(subpath, 'dir')
        subpath = append(selpath, '/', name, '/secondary'); % for the odd case of "secondary" folder instead of DICOM
    end 

    % if subpath does not exist...
    if ~exist(subpath, 'dir')
        break % exits the main for loop 
    end 
    % above lines could cause issues IF the standard naming in IntraDB changes 
    % no longer just "DICOM" or "secondary"
    % if the optional code below for renaming these folder with the
    % participant ID is used, this will also casue the for loop to break

    % function to get dicom information 
    dicom = checkDICOM(subpath);
    descript = dicom.SeriesDescription; % protocol description
    if strcmp(descript, 'localizer at center') % the only description with spaces
       descript = 'localizer_at_center'; % remove spaces 
    end 
    % participant ID
    ID = dicom.PatientID;

    % OPTIONAL - uncomment if wanted 
    % renaming secondary/DICOM folders to ID names 
    % eliminates the need to type IDs out when saving spa files later on 
%     rename_path = append(selpath, '/', name);
%     cd(rename_path)
%     if endsWith(subpath, 'DICOM')
%         movefile('DICOM', num2str(ID))
%     elseif endsWith(subpath, 'secondary')
%         movefile('secondary', num2str(ID))
%     end 
    
    if length(fold(i).name) <= 2 % scan folder are usually labeled 1 to 20 or 30 (2 character length)
        appended = append(fold(i).name, '_', descript);
        cd(selpath) % change directory to rename folders
        movefile(fold(i).name, appended) % renaming
    else 
        % do nothing, do not want to rename again if script was already run once 
    end 
end % end of main for loop 

% adding empty folder labeled with patient age
age_str = dicom.PatientAge;
age = str2num(age_str(2:3)); % assuming format '0XXY'
fold_name = append('Patient_Age_', num2str(age));
if ~exist(fold_name, 'dir')
    mkdir(fold_name)
else 
    % do nothing, folder already exists 
end 

% print age info in command window 
if age > 60 % range may change later...
   disp(['Elderly: Age ', num2str(age)])
else 
   disp(['Young: Age ', num2str(age)])
end

% add an empty folder on top with project name 
proj = dicom.PatientComments;
proj_name = proj(9:20);
proj_fold_name = append('0_Project_', proj_name);
if ~exist(proj_fold_name, 'dir')
    mkdir(proj_fold_name)
else 
    % do nothing, folder already exists 
end 

% optional 
% create a folder in processing directories for this subject
S3_EMM_AABC1_path = '/home/labast/Documents/AABCProcessing/S3_EMM_AABC1/'; % EMM, control file #1
cd(S3_EMM_AABC1_path)
dir_name = append(S3_EMM_AABC1_path, '/', num2str(ID));
if ~exist(dir_name, 'dir')
    mkdir(ID)
end 

% creating folders in young and elderly sub directories
S3_EMM_AABC1_young_path = '/home/labast/Documents/AABCProcessing/S3_EMM_AABC1/Young';
cd(S3_EMM_AABC1_young_path)
dir_name = append(S3_EMM_AABC1_young_path, '/', num2str(ID));
if ~exist(dir_name, 'dir')
    mkdir(ID)
end
S3_EMM_AABC1_eld_path = '/home/labast/Documents/AABCProcessing/S3_EMM_AABC1/Elderly';
cd(S3_EMM_AABC1_eld_path)
dir_name = append(S3_EMM_AABC1_eld_path, '/', num2str(ID));
if ~exist(dir_name, 'dir')
    mkdir(ID)
end

S3_YMM_AABC2_path = '/home/labast/Documents/AABCProcessing/S3_YMM_AABC2/'; % YMM, control file #2
cd(S3_YMM_AABC2_path) 
dir_name = append(S3_YMM_AABC2_path, '/', num2str(ID));
if ~exist(dir_name, 'dir')
    mkdir(ID)
end 

% creating folders in young and elderly sub directories
S3_YMM_AABC2_young_path = '/home/labast/Documents/AABCProcessing/S3_YMM_AABC2/Young';
cd(S3_YMM_AABC2_young_path)
dir_name = append(S3_YMM_AABC2_young_path, '/', num2str(ID));
if ~exist(dir_name, 'dir')
    mkdir(ID)
end
S3_YMM_AABC2_eld_path = '/home/labast/Documents/AABCProcessing/S3_YMM_AABC2/Elderly';
cd(S3_YMM_AABC2_eld_path)
dir_name = append(S3_YMM_AABC2_eld_path, '/', num2str(ID));
if ~exist(dir_name, 'dir')
    mkdir(ID)
end

% extra directory used for lipid contamination and outlier testing 
S3_EMM_AABC2_path = '/home/labast/Documents/AABCProcessing/S3_EMM_AABC2/'; % EMM, control file #2
cd(S3_EMM_AABC2_path) 
dir_name = append(S3_EMM_AABC2_path, '/', num2str(ID));
if ~exist(dir_name, 'dir')
    mkdir(ID)
end 

% back to main scan folders directory 
cd(selpath)

