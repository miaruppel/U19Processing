% 2nd draft - running spreadsheet script 
% to be run after LCModel / MRSpa

% need MRSpa/LCModel output files to complete the spreadsheet 
% concentrations (.conc file)
% convert to text file first ???
conc_table = readtable('test.txt'); % last 7 rows are NaN values 

% to get all metabolites 
for i = 1:30 % loop through all 30 rows
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

    elseif strcmpi(metab_cell, {'Lip14'})
        Lip14 = relat_conc;
        CRLB27 = SD;

    elseif strcmpi(metab_cell, {'MM17'})
        MM17 = relat_conc;
        CRLB28 = SD;

    elseif strcmpi(metab_cell, {'MM20'})
        MM20 = relat_conc;
        CRLB29 = SD;

    elseif strcmpi(metab_cell, {'MM387'})
        MM387 = relat_conc;
        CRLB30 = SD;
    end

end 

% all other variables to include - NOT FINISHED 
% need 'dicom' variable from ExtractDicomInfo scripts for some of these...
Patient_ID = {ID};
Age = {age_str};
if age < 60 % range may change later...
   Category = {'Young'};
else 
   Category = {'Elderly'};
end
Project_Name = {proj_name};

% put variables into table (row)
t = table(Patient_ID, Age, Category, Project_Name, MacY, CRLB1, Asc, ...
    CRLB2, Asp, CRLB3, PCho, CRLB4, GPC, CRLB5, Cr, CRLB6, ...
    PCr, CRLB7, GABA, CRLB8, Glc, CRLB9, Gln, CRLB10, Glu, ...
    CRLB11, GSH, CRLB12, Ins, CRLB13, Lac, CRLB14, NAA, ...
    CRLB15, NAAG, CRLB16, PE, CRLB17, sIns, CRLB18, Tau, CRLB10, ...
    Sup, CRLB20, NAA_plus_NAAG, CRLB21, Glu_plus_Gln, CRLB22, GPC_plus_PCho, ...
    CRLB23, Cr_plus_PCr, CRLB24, Glc_plus_Tau, CRLB25, GPC_plus_PCho_plus_PE, ...
    CRLB26, Lip14, CRLB27, MM17, CRLB28, MM20, CRLB29, MM387, CRLB30);

% convert table to .csv
% initial file generation - run once, then comment out 
%writetable(t, 'U19_spreadsheet.csv', 'WriteRowNames', true)

% to append file 
writetable(t,'U19_spreadsheet.csv','WriteMode','Append',...
'WriteVariableNames',false,'WriteRowNames',true)
