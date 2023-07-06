function copyFiles(selpath, subpath, name, copy_path)
% function to copy over spa and COORD files to their own isolated directories (to make further analysis easier) 
cd(subpath)

if endsWith(copy_path, 'S3_isolated_spa_files') % the name of MY local spa file directory 
    file = append(name, '.spa');
elseif endsWith(copy_path, 'S3_isolated_COORD_files') % the name of MY local COORD file directory 
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
     % data was processed with different control files and basis sets (hence multiple experiments)
     % the following code can easily be altered to fit user's needs and directory structure/naming 
     
     if endsWith(selpath, 'S3_EMM_AABC1') % experiment with elder MM and control file #1
         copy_path = append(copy_path, '/', 'S3_EMM_AABC1');
         % ensure the file has not already been copied first 
         check_file_path = append(copy_path, '/', file);
         if ~exist(check_file_path, 'file')
            copyfile(file, copy_path)
         end 
     elseif endsWith(selpath, 'S3_YMM_AABC2') % experiment with young MM and control file #2 
         copy_path = append(copy_path, '/', 'S3_YMM_AABC2');
         % ensure the file has not already been copied first 
         check_file_path = append(copy_path, '/', file);
         if ~exist(check_file_path, 'file')
            copyfile(file, copy_path)
         end 
     end
end