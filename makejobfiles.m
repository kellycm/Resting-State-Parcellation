function makejobfiles

main_dir = '/Users/newportlab/Desktop/';
cd(main_dir)

if ~exist('jobfiles','dir')
    mkdir('jobfiles')
else
end

medusa_dir = '/home/kcm81/newport_healthy_dev';

% Local_Data_Dir = '/Users/newportlab/Desktop/HealthyKidRSFC';
Local_Data_Dir = '/Users/newportlab/Desktop/HealthyAdultRSFC';

subdir = dir(Local_Data_Dir);
subjects = cell(1,length(subdir)-3);

counter = 0+10;

for i=1:length(subdir)-3
    subjects{i} = subdir(i+3).name;
    
    anat_dir = [Local_Data_Dir '/' subjects{i} '/SPM/'];
    cd(anat_dir)
    anat_file =  strtrim(ls('s*.nii'));
    anat = [medusa_dir '/subjects/' subjects{i} '/' anat_file];
    
    recon_command = ['recon-all' ' -' 'subjid ' subjects{i} ' -' 'i ' anat ' -' 'all'];
    
    counter = counter+1;
    fileID = string(counter);
    
    cd([main_dir '/jobfiles'])
    % save(['jobfile_' subjects{i} '.txt'], 'recon_command');
    fid = fopen(fileID,'a');
    if fid > -1
        disp(counter);
        disp(['Writing text to file for ' subjects{i}])
        fprintf(fid,recon_command,'Interpreter','none');
        fclose(fid);
    else
        disp(['Error opening file for ' subjects{i}])
    end
end

cd(main_dir);