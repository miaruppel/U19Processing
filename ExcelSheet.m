% 1st draft - running spreadsheet script 
% to be run after LCModel / MRSpa

% converts numbers to character vectors
age_str = num2str(age);

% append commas (for comma seperated file)
ID_app = append(ID, ',');
age_app = append(age_str, ',');
proj_app = append(proj_name, ',');

% create array of all variables 
array = [ID_app, age_app, proj_app];

% initial file creation
%dlmwrite('spreadsheet.csv', array, '')

% assuming file already exists 
% 'dlmwrite' may not be recommended, but it is the only comparable
% function with an append option 
dlmwrite('spreadsheet.csv', array, 'delimiter', '', '-append')

% need MRSpa/LCModel output files to complete the spreadsheet 
% concentrations (.conc file)
% convert to text file first ???
fileID = fopen('test.txt');
concs = fscanf(fileID, '%c'); % one big character vector
sep = strsplit(concs, 'MM387');% separate concentrations from added info
concs_char = char(sep(1)); % cell array back to character 
concs_sep = strsplit(concs_char); % split vector by white spaces

% format goes as follows: 
% every 4 cells corresponds to one metabolite
% 1) conc 2) CRLB 3) /Cr+PCr 4) metabolite 
% last 3 cells correspond to MM387 (was previously used as delimiter)

fclose(fileID);

% misc. information 
fileID = fopen('test_tinfo.txt');
info = fscanf(fileID, '%c');

fclose(fileID);