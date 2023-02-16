% quick script to move raw data 
selpath = '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/MN_AD_RAW';
files = dir(selpath); % fist 'files' are again '.' and '..'

for i = 3:length(files)-2 % don't need to look over 2 batch files
    file_name = files(i).name;
    [filepath, name, ext] = fileparts(file_name);
    name_split = strsplit(name, '_'); % obtain ID from file name

    if strcmp(char(name_split(5)), 'C')
       if strcmp(char(name_split(7)), 'PCC')
           movefile(file_name, '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/AD_C_PCC/')
       elseif strcmp(char(name_split(7)), 'OCC')
           movefile(file_name, '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/AD_C_OCC/')
       end
    elseif strcmp(char(name_split(5)), 'A')
        if strcmp(char(name_split(7)), 'PCC')
            movefile(file_name, '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/AD_A_PCC/')
        elseif strcmp(char(name_split(7)), 'OCC')
            movefile(file_name, '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/AD_A_OCC/')
        end
    end 

end 

% lazy way - additional piece for the two oddly named files (ran seperately
% in terminal)
%for i = 3:length(files)-2 % don't need to look over 2 batch files
%    file_name = files(i).name;
%    [filepath, name, ext] = fileparts(file_name);
%    name_split = strsplit(name, '_'); % obtain ID from file name

 %   if strcmp(char(name_split(5)), 'C')
 %      if strcmp(char(name_split(8)), 'PCC')
  %         movefile(file_name, '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/AD_C_PCC/')
 %      elseif strcmp(char(name_split(8)), 'OCC')
  %         movefile(file_name, '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/AD_C_OCC/')
 %      end
%end 
%end
