% Spreadsheet generator for historical data 
% run once for each cohort

% choose directory with LCModel outputs
selpath = uigetdir;
files = dir(selpath); % fist 'files' are again '.' and '..'

for i = 3:length(files)-1 % don't need to look over batch folder 
    file_name = files(i).name;
    [filepath, name, ext] = fileparts(file_name);
    name_split = strsplit(name, '_'); % obtain ID from file name

    if strcmp(ext, '.conc') % check file extension 
        prefix = char(name_split(5)); % to disguish between AD, elderly, and young
        ID = char(name_split(6)); % index for ID number
        Patient_ID = append(prefix, ID);

        cd(selpath)
        conc_file = append(name, '.conc');
        txt_file = append(name, '_conc.txt'); 
        copyfile(conc_file, txt_file) % convert to .txt file

        conc_table = readtable(txt_file); % read .txt file

        % to get all metabolites 
        for x = 1:30 % loop through all 30 (non-NaN) rows
            metab_tab = conc_table(x, 4); % metabolites are always in the 4th column 
            metab_cell = table2cell(metab_tab); % convert to cell format
            
            % /Cr+PCr concentration 
            conc = conc_table(x, 3);
            relat_conc = table2cell(conc);
            % %SD
            perc_SD = conc_table(x, 2);
            SD = table2cell(perc_SD);
            
            % cell comparisons to assign values 
            if strcmpi(metab_cell, {'MacY'})
                MacY = relat_conc;
                CRLB1 = SD;
           
            elseif strcmpi(metab_cell, {'MacE'})
                MacE = relat_conc;
                CRLB1 = SD;
        
            elseif strcmpi(metab_cell, {'Asc'})
                Asc = relat_conc;
                CRLB2 = SD;
        
            elseif strcmpi(metab_cell, {'Asp'})
                Asp = relat_conc;
                CRLB3 = SD;
        
            elseif strcmpi(metab_cell, {'PCho'})
                PCho = relat_conc;
                CRLB4 = SD;
        
            elseif strcmpi(metab_cell, {'GPC'})
                GPC = relat_conc;
                CRLB5 = SD;
        
            elseif strcmpi(metab_cell, {'Cr'})
                Cr = relat_conc;
                CRLB6 = SD;
        
            elseif strcmpi(metab_cell, {'PCr'})
                PCr = relat_conc;
                CRLB7 = SD;
        
            elseif strcmpi(metab_cell, {'GABA'})
                GABA = relat_conc;
                CRLB8 = SD;
        
            elseif strcmpi(metab_cell, {'Glc'})
                Glc = relat_conc;
                CRLB9 = SD;
        
            elseif strcmpi(metab_cell, {'Gln'})
                Gln = relat_conc;
                CRLB10 = SD;
        
            elseif strcmpi(metab_cell, {'Glu'})
                Glu = relat_conc;
                CRLB11 = SD;
        
            elseif strcmpi(metab_cell, {'GSH'})
                GSH = relat_conc;
                CRLB12 = SD;
        
            elseif strcmpi(metab_cell, {'Ins'})
                Ins = relat_conc;
                CRLB13 = SD;
        
            elseif strcmpi(metab_cell, {'Lac'})
                Lac = relat_conc;
                CRLB14 = SD;
        
            elseif strcmpi(metab_cell, {'NAA'})
                NAA = relat_conc;
                CRLB15 = SD;
        
            elseif strcmpi(metab_cell, {'NAAG'})
                NAAG = relat_conc;
                CRLB16 = SD;
        
            elseif strcmpi(metab_cell, {'PE'})
                PE = relat_conc;
                CRLB17 = SD;
        
            elseif strcmpi(metab_cell, {'sIns'})
                sIns = relat_conc;
                CRLB18 = SD;
        
            elseif strcmpi(metab_cell, {'Tau'})
                Tau = relat_conc;
                CRLB19 = SD;
        
            elseif strcmpi(metab_cell, {'Sup'})
                Sup = relat_conc;
                CRLB20 = SD;
        
            elseif strcmpi(metab_cell, {'NAA+NAAG'})
                NAA_plus_NAAG = relat_conc;
                CRLB21 = SD;
        
            elseif strcmpi(metab_cell, {'Glu+Gln'})
                Glu_plus_Gln = relat_conc;
                CRLB22 = SD;
        
            elseif strcmpi(metab_cell, {'GPC+PCho'})
                GPC_plus_PCho = relat_conc;
                CRLB23 = SD;
        
            elseif strcmpi(metab_cell, {'Cr+PCr'})
                Cr_plus_PCr = relat_conc;
                CRLB24 = SD;
        
            elseif strcmpi(metab_cell, {'Glc+Tau'})
                Glc_plus_Tau = relat_conc;
                CRLB25 = SD;
        
            elseif strcmpi(metab_cell, {'GPC+PCho+PE'})
                GPC_plus_PCho_plus_PE = relat_conc;
                CRLB26 = SD;
            end
        end 

        % other information from dicom header...
        split_path = strsplit(selpath, '/');
        cohort = char(split_path(7));
    
        % start with getting the right path
        if startsWith(cohort, 'AD') % aim 2
           if startsWith(Patient_ID, 'A') % AD participants
              newpath = '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/aim2AD/';
           else % controls
               newpath = '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/aim2control/';
           end
        elseif startsWith(cohort, 'Aging') % aim 1
            if startsWith(Patient_ID, 'E') % elderly
                newpath = '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/aim1elderly/';
            else % young
                newpath = '/home/LabAst/Desktop/Data_4Thesis/MN_Aging_AD/aim1young/';
            end 
        end 
    
        cd(newpath)
        % now that we are in the right place, match the patient ID with the
        % folder name to obtain the right .dcm files
        patient_folder = append(newpath, Patient_ID);
    
        subfolders = dir(patient_folder);
        if length(subfolders) > 3 % folders that contain original data (from scanner)
            first_subfolder = subfolders(3).name; % first real folder in directory (usually metab_RES)
            
            dicom_path = append(patient_folder, '/', first_subfolder);
            dicom = checkDICOM(dicom_path);
        
            % variables from dicom 
            age_str = dicom.PatientAge;
            age = str2num(age_str(2:3)); % assuming format '0XXY'
        
             % ages over 89 constitute as PHI
            if age > 89
                Age = {'90+'};
            else 
                Age = {age};
            end 
            
            % young vs elderly categories based on cut off of 60
            if age < 60 % range may change later...
               Category = {'Young'};
            else
               Category = {'Elderly'};
            end
            
            Gender = {dicom.PatientSex};
        
            project = append('MN_', cohort);
            Project_Name = {project}; 
        else % folders that are empty (cannot access .dcm files)
            Age = {'NaN'};
            Category = {'NaN'};
            Gender = {'NaN'};
            Project_Name = {'NaN'};
        end 

    % information from .COORD file - FWHM and SNR
    % first, convert to .txt
     cd(selpath)
     coord_file = append(name, '.COORD');
     coord_txt_file = append(name, '_COORD', '.txt');
     copyfile(coord_file, coord_txt_file)

     coord = fopen(coord_txt_file);
     linenum = 37; % line where FWHM and SNR are located **USUALLY
     line = textscan(coord, '%s', 1, 'delimiter', '\n', 'headerlines', linenum-1);
     fclose('all');

     % extract values 
     % making sure we have the correct line..there have been oddball cases 
     if startsWith(char(line{1,1}), 'FWHM')
         str_split = strsplit(char(line{1,1}), ' ');
         FWHM = str_split(3);
         SNR = str_split(7);
     elseif startsWith(char(line{1,1}), 'Data')
         coord = fopen(coord_txt_file);
         linenum = 36; % line where FWHM and SNR are located in this case
         line = textscan(coord, '%s', 1, 'delimiter', '\n', 'headerlines', linenum-1);
         fclose('all');
        
         str_split = strsplit(char(line{1,1}), ' ');
         FWHM = str_split(3);
         SNR = str_split(7);
     end  
  
    % convert str to cell for table function
    Patient_ID = {Patient_ID};
    % put variables into table (row)
    if exist('MacY', 'var') % young basis set used?
        t = table(Patient_ID, Age, Gender, Category, Project_Name, FWHM, SNR, MacY, CRLB1, Asc, ...
        CRLB2, Asp, CRLB3, PCho, CRLB4, GPC, CRLB5, Cr, CRLB6, ...
        PCr, CRLB7, GABA, CRLB8, Glc, CRLB9, Gln, CRLB10, Glu, ...
        CRLB11, GSH, CRLB12, Ins, CRLB13, Lac, CRLB14, NAA, ...
        CRLB15, NAAG, CRLB16, PE, CRLB17, sIns, CRLB18, Tau, CRLB10, ...
        Sup, CRLB20, NAA_plus_NAAG, CRLB21, Glu_plus_Gln, CRLB22, GPC_plus_PCho, ...
        CRLB23, Cr_plus_PCr, CRLB24, Glc_plus_Tau, CRLB25, GPC_plus_PCho_plus_PE, ...
        CRLB26);
    elseif exist('MacE', 'var') % elderly basis set used?
        t = table(Patient_ID, Age, Gender, Category, Project_Name, FWHM, SNR, MacE, CRLB1, Asc, ...
        CRLB2, Asp, CRLB3, PCho, CRLB4, GPC, CRLB5, Cr, CRLB6, ...
        PCr, CRLB7, GABA, CRLB8, Glc, CRLB9, Gln, CRLB10, Glu, ...
        CRLB11, GSH, CRLB12, Ins, CRLB13, Lac, CRLB14, NAA, ...
        CRLB15, NAAG, CRLB16, PE, CRLB17, sIns, CRLB18, Tau, CRLB10, ...
        Sup, CRLB20, NAA_plus_NAAG, CRLB21, Glu_plus_Gln, CRLB22, GPC_plus_PCho, ...
        CRLB23, Cr_plus_PCr, CRLB24, Glc_plus_Tau, CRLB25, GPC_plus_PCho_plus_PE, ...
        CRLB26);
    end 
 
    % convert table to .csv
    % directory to save spreadsheet
    if ~exist('prefix', 'var') % first variable created when .conc file exists
        % do nothing if the file did not go thru loop 
    else
        cd('/home/LabAst/Desktop/Data_4Thesis/')
        spreadsheet_name = append(cohort, '_spreadsheet.csv');
    
        if ~exist(spreadsheet_name, 'file')
            % initial file generation 
            writetable(t, spreadsheet_name, 'WriteRowNames', true)
        else 
            % to append file 
            writetable(t, spreadsheet_name,'WriteMode','Append',...
            'WriteVariableNames',false,'WriteRowNames',true)
        end 
    end 
    end 
 end 
