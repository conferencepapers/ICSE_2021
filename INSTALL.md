# [Dependencies](#dependencies) 

- Versions:
   - Python: 3.8.5 (earlier version such as 3.5 may work, but we did not test on those versions)
   - R: 4.0.3
- All experiments run on Macos x. (We assume similar performance on Ubuntu 14.0.4+)

## [Python](#python)
The python dependencies used for all the scripts can be installed running

```
pip install -r REQUIREMENTS.txt
```

## [RScript](#rscript)
The dependencies for the R script can be installed using following in R header. 

```
for (package in c('ggplot2', 'dplyr', 'survival','survminer','ranger','ggfortify','reshape2','Hmisc','lattice','Formula','gridExtra')) {
  if (!require(package, character.only=T, quietly=T)) {
    install.packages(package)
    library(package, character.only=T)
  }
}
```
