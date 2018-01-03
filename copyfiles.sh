#!/bin/bash

export maindir=/Users/newportlab/Desktop
# export subdir=$maindir/HealthyKidRSFC
export subdir=$maindir/HealthyAdultRSFC
export subs=`ls $subdir`

for subject in $subs
do
mkdir $maindir/subjects/$subject
cp $subdir/$subject/SPM/s*.nii $maindir/subjects/$subject
done

echo ALL done
 

