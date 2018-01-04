#!/bin/bash

export maindir=/Users/newportlab/Desktop
export subdir=$maindir/subjects
export subs=`ls $subdir`

for subject in $subs
do
#mkdir $maindir/subjects/$subject
#cp $subdir/$subject/SPM/s*.nii $maindir/subjects/$subject

cd $subdir/$subject/Rest
fslmerge -t Rest4D.$subject.nii.gz raf*

cd $maindir

done

echo ALL done


