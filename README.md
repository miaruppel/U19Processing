# U19Processing

Scripts/macros used to easily manage data and ultimately assist in batch processing 

Procedure

1. After downloading the appropriate data from IntraDB, run 'ExtractDicomInfo' in MATLAB terminal. This script conveniently renames all the files as well as gives relevant information found within the DICOM header, such as the age of the participant. A directory can also be automatically created with the participant ID which is intended to house all LCModel outputs. 

2. Run MRSpa/LCModel as normal, saving the outputs (named with the participant ID) in the directory mentioned above. 

3. Run 'ExcelSheet' in the MATLAB terminal. This script generates a running spreadsheet of all the data collected from each participant thus far. Multiple folders can be selected and looped through if necessary. Relative paths in this code will need to be altered to successfully run on another machine/environment.  

