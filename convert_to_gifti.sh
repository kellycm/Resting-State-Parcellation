#!/bin/bash

#not necessary if you will later run wb_shortcuts -freesurfer-resample-prep

export maindir=/Users/newportlab/Desktop
export subdir=$maindir/subjects_postrecon2
export subs=`ls $subdir`

for subject in $subs
do
#mkdir $maindir/subjects/$subject
#cp $subdir/$subject/SPM/s*.nii $maindir/subjects/$subject

cd $subdir/$subject/surf

mris_convert lh.white lh.white.gii
mris_convert lh.pial lh.pial.gii
mris_convert rh.white rh.white.gii
mris_convert rh.pial rh.pial.gii

done

echo ALL done


