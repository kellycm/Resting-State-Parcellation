README for homogeneity testing

Tests homogeneity of cifti parcellation(s) made using parcel_creator_cifti.m

Order of scripts to run:
make_cov_corr.m - create a matrix that is the all-to-all covariance of correlations, for each hemisphere.
Batch_homogeneity_testing_cifti.m - generate randomly rotated versions of the parcellation and test homogeneity
Homogeneity_values_and_figures.m - get statistics and make figures of the calculated homogeneities

See help text of these scripts for details.