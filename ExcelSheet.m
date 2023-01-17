% 1st draft - running  spreadsheet script 
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
