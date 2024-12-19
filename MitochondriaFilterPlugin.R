library(dplyr)
library(Seurat)
library(patchwork)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
    pbmc <- readRDS(paste(pfix, parameters["rdsfile", 2], sep="/"))
    pbmc <- subset(pbmc, subset = nFeature_RNA > as.integer(parameters["minRNA", 2]) & nFeature_RNA < as.integer(parameters["maxRNA", 2]) & percent.mt < as.integer(parameters["mt", 2]))
    saveRDS(pbmc, outputfile)
}


