% Extracting DICOM Info
% renaming numbered folders and adding folders with project name and
% patient age

% choose directory '.../SCANS'
selpath = uigetdir;
% main folder 
fold = dir(selpath); % adds "." and ".." non-directories to the beginning...

% loop through all folders and name them
for i = 3:length(fold) % starting at 3 due to "." and ".."
    name = fold(i).name; % current name of folder
    subpath = append(selpath, '/', name, '/DICOM'); % respective dicom path for this folder

    % function to get dicom information 
    dicom = checkDICOM(subpath);
    descript = dicom.SeriesDescription; % protocol description

    if strcmp(descript, 'localizer at center') % only description with spaces
       descript = 'localizer_at_center'; % remove spaces 
    end 

    appended = append(fold(i).name, '_', descript);
    cd(selpath) % need to change directory to rename folders
    movefile(fold(i).name, appended) % renaming

end 

% adding empty folder labeled with patient age
age_str = dicom.PatientAge;
age = str2num(age_str(2:3)); % assuming format '0XXY'
fold_name = append('Patient_Age_', num2str(age));
mkdir(fold_name)

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
mkdir(proj_fold_name)

% optional 
% create a folder in processing directory for this subject
cd('/home/LabAst/Documents/SpectraProcessing/AABCProcessing') % my personal processing directory
ID = dicom.PatientID;
mkdir(ID)
