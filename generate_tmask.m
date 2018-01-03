function [tmask] = generate_tmask(motion_par,scrubthresh)
% cjl
% motion_par is the rp*.txt file from realignment preproc step
% scrubthresh is the motion threshold, Chuck uses 0.2mm I set 0.5

for mi=1:6 
    motion_par_deri(:,mi)=...
    abs([0;diff(motion_par(:,mi))]);
end

for mi = 4:6
    motion_par_deri(:,mi)=50*2*(sin(motion_par_deri(:,mi)/2));
end

% compute 
% framewise 
% displacement
FD = sum(motion_par_deri,2);

% generate 
% temporal 
% mask
tmask(FD>scrubthresh) = 0;
tmask(FD<scrubthresh) = 1;

% save tmask 
% as a .txt files 
save('tmask.txt',...
    'tmask','-ascii');
        
end
