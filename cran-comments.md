## Test environments
* local R installation, R 3.6.2
* ubuntu 16.04 (on travis-ci), R 3.6.2
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Resubmission
* Single quotes were added to DESCRIPTION for all package names
* The .Rmd files were given titles
* The default 'file' variable for init() was replaced with default == NULL.  Files are only written when the user specifies the output file, otherwise nothing is written.
