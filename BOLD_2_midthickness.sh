#!/bin/bash
set -x

CaretAtlasDir=/Users/newportlab/Applications/caret/Caret/spheres
SubjectDir=/Users/newportlab/Desktop/subjects_postrecon2/$1
SurfDir=$SubjectDir/surf
ResampleDir=$SubjectDir/CaretOutput/$1

Subject=`basename $1`

for sub in $Subject
do

  VolumeInput=$SubjectDir/Rest4D.$Subject.nii.gz

#Left Hemisphere Map & Smooth____________________________________________________

  SurfaceInputL=$SubjectDir/surf/$Subject.lh.midthickness.32k_fs_LR.surf.gii
  MetricOutputL=$SubjectDir/$Subject.L.Rest_32k_fs_LR.shape.gii
  InnerSurfInputL=$ResampleDir/$Subject.L.white_orig.32k_fs_LR.surf.gii
  OuterSurfInputL=$ResampleDir/$Subject.L.pial_orig.32k_fs_LR.surf.gii

  MetricOutputSmoothedL=$SubjectDir/$Subject.L.Rest_32k_fs_LR_smoothed.shape.gii

  #Map functional EPI data to 32k_fs_LR surface
    wb_command -volume-to-surface-mapping $VolumeInput $SurfaceInputL $MetricOutputL -ribbon-constrained $InnerSurfInputL $OuterSurfInputL

  #Smooth functional images on 32k surface using 2.55 sigma kernel
    wb_command -metric-smoothing $SurfaceInputL $MetricOutputL 2.55 $MetricOutputSmoothedL

#Right Hemisphere Map & Smooth___________________________________________________

  SurfaceInputR=$SubjectDir/surf/$Subject.rh.midthickness.32k_fs_LR.surf.gii
  MetricOutputR=$SubjectDir/$Subject.R.Rest_32k_fs_LR.shape.gii
  InnerSurfInputR=$ResampleDir/$Subject.R.white_orig.32k_fs_LR.surf.gii
  OuterSurfInputR=$ResampleDir/$Subject.R.pial_orig.32k_fs_LR.surf.gii

  MetricOutputSmoothedR=$SubjectDir/$Subject.R.Rest_32k_fs_LR_smoothed.shape.gii

  #Map functional EPI data to 32k_fs_LR surface
    wb_command -volume-to-surface-mapping $VolumeInput $SurfaceInputR $MetricOutputR -ribbon-constrained $InnerSurfInputR $OuterSurfInputR

  #Smooth functional images on 32k surface using 2.55 sigma kernel
    wb_command -metric-smoothing $SurfaceInputR $MetricOutputR 2.55 $MetricOutputSmoothedR

#CIFTIFY Both____________________________________________________________________

#Create functional data CIFTI file

wb_command -cifti-create-dense-timeseries $SubjectDir/$Subject.Rest.dtseries.nii -left-metric $MetricOutputSmoothedL -roi-left $CaretAtlasDir/medial_wall.L.32k_fs_LR.func.gii -right-metric $MetricOutputSmoothedR -roi-right $CaretAtlasDir/medial_wall.R.32k_fs_LR.func.gii

done
