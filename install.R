  

# DO NOT EDIT 'install.R'; instead, edit 'install.R.in' and
# use 'rake' to generate 'install.R'.

if ("BiocManager" %in% rownames(installed.packages()))
  remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")
#install.packages("devtools", repos="https://cran.rstudio.com")
#devtools::install_github("Bioconductor/BiocManager")
library(BiocManager)

if(BiocManager::version() != "3.16"){
  BiocManager::install(version="3.16",
                       update=TRUE, ask=FALSE)
}

for (thispackage in c("ggplot2",  "ggthemes" , "Seurat" , "dplyr" , "devtools")){
  if(! thispackage %in% installed.packages() ){
    install.packages(thispackage )
  }
}

if (! "scFeatures" %in% installed.packages() ){
  devtools::install_github("SydneyBioX/scFeatures")
}


if (! "ClassifyR" %in% installed.packages() ){
  if (!require("BiocManager", quietly = TRUE)){
     install.packages("BiocManager")} 
  BiocManager::install("ClassifyR")
}

