function copyFiles(selpath, subpath, name, copy_path)
% function to copy over spa and COORD files to their own directories 
cd(subpath)

if endsWith(copy_path, 'S3_isolated_spa_files')
    file = append(name, '.spa');
elseif endsWith(copy_path, 'S3_isolated_COORD_files') 
    file = append(name, '.COORD');
end 

 % spa files are the resulting spectrum after basic processing 
 % coord files are a result of the fitting parameters (control file
 % parameters) & the basis set chosen (i.e., will vary between experiments that
 % examine fitting) 
 if endsWith(file, '.spa')
     % ensure the file has not already been copied first 
     check_file_path = append(copy_path, '/', file);
     if ~exist(check_file_path, 'file')
         copyfile(file, copy_path)
     end 

 elseif endsWith(file, '.COORD') % more complicated, separated by experiment
     if endsWith(selpath, 'S3_EMM_AABC1')
         copy_path = append(copy_path, '/', 'S3_EMM_AABC1');
         % ensure the file has not already been copied first 
         check_file_path = append(copy_path, '/', file);
         if ~exist(check_file_path, 'file')
            copyfile(file, copy_path)
         end 
     elseif endsWith(selpath, 'S3_YMM_AABC2')
         copy_path = append(copy_path, '/', 'S3_YMM_AABC2');
         % ensure the file has not already been copied first 
         check_file_path = append(copy_path, '/', file);
         if ~exist(check_file_path, 'file')
            copyfile(file, copy_path)
         end 
     end
end