# U19 Processing

Scripts/macros used to manage U19 data and prepare for further analysis 

Procedure

1. After downloading the appropriate data from IntraDB, run 'ExtractDicomInfo' in MATLAB terminal. This script conveniently renames all the files as well as gives relevant information found within the DICOM header, such as the age of the participant. Optional directories (depending on the control/fitting criteria) can also be automatically created with the participant ID which are intended to house all LCModel outputs. 

2. Run MRSpa/LCModel as normal, saving all the outputs for an individual (labeled with the participant ID) in a single directory that is also labeled with the participant ID). (Note: MRSpa is optional, as long as LCModel outputs are obtained, the spreadsheet code should run)

3. Run 'ExcelSheet' in the MATLAB terminal. This script generates a running spreadsheet of all the data collected from each participant thus far. Multiple folders can be selected and looped through if necessary. If the spreadsheet already exists, this code can simply add a new line at the end for a single participant as well. Relative paths in this code will need to be altered to successfully run on another machine/environment.  

# Historical Data Processing 

Scripts/macros to look through historical data with various control/fitting criteria 

NOTE: Code is specific to a select directory structure. 



