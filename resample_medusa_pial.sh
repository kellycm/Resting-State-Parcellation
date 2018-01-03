#!/bin/bash
set -x

#ExtractDir=/share/cjv2/resources
ExtractDir=/Users/newportlab/Applications/caret/Caret
#SubjectDir=/share/cjv2/data/hubs/$1/fs_LR_output_directory/$1
SubjectDir=/Users/newportlab/Desktop/subjects_postrecon2/$1/CaretOutput/$1
SubjList=$1
ResamplingMethod=BARYCENTRIC

for Subject in $SubjList
do
  for Hemisphere in L R
  do
    CoordInput=$SubjectDir/"$Subject".$Hemisphere.pial_orig.164k_fs_LR.coord.gii
    TopoInput=$SubjectDir/"$Subject".$Hemisphere.164k_fs_LR.topo.gii
    SurfaceInput=$SubjectDir/"$Subject".$Hemisphere.pial_orig.164k_fs_LR.surf.gii
    caret_command -file-convert -sc -is CARET $CoordInput $TopoInput -os GS $SurfaceInput
    CurrentSphere=$ExtractDir/spheres/standard.$Hemisphere.sphere.164k_fs_LR.surf.gii
    #CurrentSphere=$ExtractDir/spheres/fs_LR-deformed_to-fsaverage.$Hemisphere.sphere.164k_fs_LR.surf.gii 
    NewSphere=$ExtractDir/spheres/standard.$Hemisphere.sphere.32k_fs_LR.surf.gii
    #NewSphere=$ExtractDir/spheres/fs_LR-deformed_to-fsaverage.$Hemisphere.sphere.32k_fs_LR.surf.gii
    SurfaceOutput=$SubjectDir/"$Subject".$Hemisphere.pial_orig.32k_fs_LR.surf.gii
    wb_command -surface-resample \
	$SurfaceInput \
	$CurrentSphere \
	$NewSphere \
	$ResamplingMethod \
	$SurfaceOutput
  done
done
###################################################################
exit                
###################################################################
###################################################################
standard.L.sphere.164k_fs_LR.surf.gii
standard.L.sphere.32k_fs_LR.surf.gii
standard.R.sphere.164k_fs_LR.surf.gii
standard.R.sphere.32k_fs_LR.surf.gii

