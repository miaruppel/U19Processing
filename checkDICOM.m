function dicom = checkDICOM(subpath)
subdir = dir(subpath); % DICOM directory
filename = subdir(3).name; % 1st .dcm file
filepath = append(subpath, '/', filename); % entire file path
dicom = dicominfo(filepath); % obtaining DICOM info
end