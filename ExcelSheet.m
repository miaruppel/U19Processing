% Final draft - running spreadsheet script 
% to be run after LCModel / MRSpa
% need MRSpa/LCModel output files to complete the spreadsheet 

% choose LCModel ouput directory 
selpath = uipickfiles;

for i = (selpath) % loop through all folders (if multiple are chosen)
    path = char(i);

    % need 'dicom' variable for gender, age, project, etc
    split_path = split(path, '/');
    ID = split_path(end); % extract ID from path 
    
    dicom_path = append('/home/labast/Documents/AABCProcessing/S3_scanner_files/', char(ID), '/SCANS/1_localizer/DICOM');
    if ~exist(dicom_path, 'dir')
        dicom_path = append('/home/labast/Documents/AABCProcessing/S3_scanner_files/', char(ID), '/SCANS/1_localizer/secondary');
    end 
    if ~exist(dicom_path, 'dir')
        dicom_path = append('/home/labast/Documents/AABCProcessing/S3_scanner_files/', char(ID), '/SCANS/1_localizer/', char(ID));
    end
    dicom = checkDICOM(dicom_path);
    
    % concentrations (.conc file)
    % convert to text file first
    cd(path)
    conc_file = append(char(ID), '.conc');
    txt_file = append(char(ID), '_conc.txt');
    copyfile(conc_file, txt_file)
    
    conc_table = readtable(txt_file); % last few rows are NaN values 
    
    % to get all metabolites 
    for i = 1:31 % loop through all 30 (non-NaN) rows
        metab_tab = conc_table(i, 4); % metabolites are always in the 4th column 
        metab_cell = table2cell(metab_tab); % convert to cell format
        
        % /Cr+PCr concentration 
        conc = conc_table(i, 3);
        relat_conc = table2cell(conc);
        % %SD
        perc_SD = conc_table(i, 2);
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

        elseif strcmpi(metab_cell, {'Lip13a'})
            Lip13a = relat_conc;
            CRLB27 = SD;

        elseif strcmpi(metab_cell, {'Lip13b'})
            Lip13b = relat_conc;
            CRLB28 = SD;

        elseif strcmpi(metab_cell, {'Lip09'})
            Lip09 = relat_conc;
            CRLB29 = SD;

        elseif strcmpi(metab_cell, {'Lip14'})
            Lip14 = relat_conc;
            CRLB30 = SD;

        elseif strcmpi(metab_cell, {'Lip12n'})
            Lip12n = relat_conc;
            CRLB31 = SD;

        end
    end 
    
    % all other variables to include 
    % information from dicom header
    cohort = char(split_path(6)); % useful for naming

    age_str = dicom.PatientAge;
    age = str2num(age_str(2:3)); % assuming format '0XXY'
    
    proj = dicom.PatientComments;
    project = proj(14:16); % UMN or MGH
    project_name = append(cohort, '_', project); 
    Project_Name = {project_name};

    Gender = {dicom.PatientSex};

    Patient_ID = ID;

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
    
    % information from .COORD file - FWHM and SNR
    % first, convert to .txt
    coord_file = append(char(ID), '.COORD');
    coord_txt_file = append(char(ID), '_COORD', '.txt');
    copyfile(coord_file, coord_txt_file)
    
    coord = fopen(coord_txt_file);
     linenum = 3; % line where FWHM and SNR are located **USUALLY
     % so this actually depends on the control file used...
     line = textscan(coord, '%s', 1, 'delimiter', '\n', 'headerlines', linenum-1);
     fclose('all');

     % extract values 
     % making sure we have the correct line..there have been oddball cases 
     if startsWith(char(line{1,1}), '32')
         coord = fopen(coord_txt_file);
         new_linenum = 37;
         new_line = textscan(coord, '%s', 1, 'delimiter', '\n', 'headerlines', new_linenum-1);
         fclose('all');

         str_split = strsplit(char(new_line{1,1}), ' ');
         FWHM = str_split(3);
         SNR = str_split(7);
     elseif startsWith(char(line{1,1}), '31')
         coord = fopen(coord_txt_file);
         new_linenum = 36; % line where FWHM and SNR are located in this case
         new_line = textscan(coord, '%s', 1, 'delimiter', '\n', 'headerlines', new_linenum-1);
         fclose('all');
        
         str_split = strsplit(char(new_line{1,1}), ' ');
         FWHM = str_split(3);
         SNR = str_split(7);
     elseif startsWith(char(line{1,1}), '26')
         coord = fopen(coord_txt_file);
         new_linenum = 31; % line where FWHM and SNR are located in this case
         new_line = textscan(coord, '%s', 1, 'delimiter', '\n', 'headerlines', new_linenum-1);
         fclose('all');
        
         str_split = strsplit(char(new_line{1,1}), ' ');
         FWHM = str_split(3);
         SNR = str_split(7);
     end 
    
    % put variables into table (row)
    if exist('MacY', 'var') && exist('Lip12n', 'var') % young basis set & control file 1 (AABC1)
        t = table(Patient_ID, Age, Gender, Category, Project_Name, FWHM, SNR, MacY, CRLB1, Asc, ...
        CRLB2, Asp, CRLB3, PCho, CRLB4, GPC, CRLB5, Cr, CRLB6, ...
        PCr, CRLB7, GABA, CRLB8, Glc, CRLB9, Gln, CRLB10, Glu, ...
        CRLB11, GSH, CRLB12, Ins, CRLB13, Lac, CRLB14, NAA, ...
        CRLB15, NAAG, CRLB16, PE, CRLB17, sIns, CRLB18, Tau, CRLB19, ...
        Sup, CRLB20, NAA_plus_NAAG, CRLB21, Glu_plus_Gln, CRLB22, GPC_plus_PCho, ...
        CRLB23, Cr_plus_PCr, CRLB24, Glc_plus_Tau, CRLB25, GPC_plus_PCho_plus_PE, ...
        CRLB26, Lip13a, CRLB27, Lip13b, CRLB28, Lip09, CRLB29, Lip14, CRLB30, Lip12n, CRLB31);
    elseif exist('MacE', 'var') && exist('Lip12n', 'var') % elderly basis set & control file 1 (AABC1)
        t = table(Patient_ID, Age, Gender, Category, Project_Name, FWHM, SNR, MacE, CRLB1, Asc, ...
        CRLB2, Asp, CRLB3, PCho, CRLB4, GPC, CRLB5, Cr, CRLB6, ...
        PCr, CRLB7, GABA, CRLB8, Glc, CRLB9, Gln, CRLB10, Glu, ...
        CRLB11, GSH, CRLB12, Ins, CRLB13, Lac, CRLB14, NAA, ...
        CRLB15, NAAG, CRLB16, PE, CRLB17, sIns, CRLB18, Tau, CRLB19, ...
        Sup, CRLB20, NAA_plus_NAAG, CRLB21, Glu_plus_Gln, CRLB22, GPC_plus_PCho, ...
        CRLB23, Cr_plus_PCr, CRLB24, Glc_plus_Tau, CRLB25, GPC_plus_PCho_plus_PE, ...
        CRLB26, Lip13a, CRLB27, Lip13b, CRLB28, Lip09, CRLB29, Lip14, CRLB30, Lip12n, CRLB31);
    elseif exist('MacY', 'var') % young basis set & control file 2 (AABC2)
        t = table(Patient_ID, Age, Gender, Category, Project_Name, FWHM, SNR, MacY, CRLB1, Asc, ...
        CRLB2, Asp, CRLB3, PCho, CRLB4, GPC, CRLB5, Cr, CRLB6, ...
        PCr, CRLB7, GABA, CRLB8, Glc, CRLB9, Gln, CRLB10, Glu, ...
        CRLB11, GSH, CRLB12, Ins, CRLB13, Lac, CRLB14, NAA, ...
        CRLB15, NAAG, CRLB16, PE, CRLB17, sIns, CRLB18, Tau, CRLB19, ...
        NAA_plus_NAAG, CRLB21, Glu_plus_Gln, CRLB22, GPC_plus_PCho, ...
        CRLB23, Cr_plus_PCr, CRLB24, Glc_plus_Tau, CRLB25, GPC_plus_PCho_plus_PE, ...
        CRLB26);
    elseif exist('MacE', 'var') % elderly basis set & control file 2 (AABC2)
        t = table(Patient_ID, Age, Gender, Category, Project_Name, FWHM, SNR, MacE, CRLB1, Asc, ...
        CRLB2, Asp, CRLB3, PCho, CRLB4, GPC, CRLB5, Cr, CRLB6, ...
        PCr, CRLB7, GABA, CRLB8, Glc, CRLB9, Gln, CRLB10, Glu, ...
        CRLB11, GSH, CRLB12, Ins, CRLB13, Lac, CRLB14, NAA, ...
        CRLB15, NAAG, CRLB16, PE, CRLB17, sIns, CRLB18, Tau, CRLB19, ...
        NAA_plus_NAAG, CRLB21, Glu_plus_Gln, CRLB22, GPC_plus_PCho, ...
        CRLB23, Cr_plus_PCr, CRLB24, Glc_plus_Tau, CRLB25, GPC_plus_PCho_plus_PE, ...
        CRLB26);
    end 
    
    % convert table to .csv
    % directory to save spreadsheet
    cd('/home/labast/Documents/AABCProcessing/')
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