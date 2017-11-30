#!/bin/bash

export maindir=/Users/newportlab/Desktop
export subdir=$maindir/subjects_postrecon2
export subs=`ls $subdir`

for subject in $subs

do

wb_shortcuts -freesurfer-resample-prep $SUBJECTS_DIR/$subject/surf/lh.white $SUBJECTS_DIR/$subject/surf/lh.pial $SUBJECTS_DIR/$subject/surf/lh.sphere.reg /Users/newportlab/Applications/workbench/standard_mesh_atlases/resample_fsaverage/fs_LR-deformed_to-fsaverage.L.sphere.32k_fs_LR.surf.gii $SUBJECTS_DIR/$subject/surf/lh.midthickness.surf.gii $SUBJECTS_DIR/$subject/surf/$subject.lh.midthickness.32k_fs_LR.surf.gii $SUBJECTS_DIR/$subject/surf/lh.sphere.reg.surf.gii

wb_shortcuts -freesurfer-resample-prep $SUBJECTS_DIR/$subject/surf/rh.white $SUBJECTS_DIR/$subject/surf/rh.pial $SUBJECTS_DIR/$subject/surf/rh.sphere.reg /Users/newportlab/Applications/workbench/standard_mesh_atlases/resample_fsaverage/fs_LR-deformed_to-fsaverage.R.sphere.32k_fs_LR.surf.gii $SUBJECTS_DIR/$subject/surf/rh.midthickness.surf.gii $SUBJECTS_DIR/$subject/surf/$subject.rh.midthickness.32k_fs_LR.surf.gii $SUBJECTS_DIR/$subject/surf/rh.sphere.reg.surf.gii

done

echo ALL done


