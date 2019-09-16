
# library(PharmacoGxPrivate)


myfn <- list.files("/pfs/input/", full.names=TRUE)
slices <- list()

for(fn in myfn){
	temp <- readRDS(fn)
	parTable <- do.call(rbind,temp[[3]])
	n <- cbind("AAC" = as.numeric(unlist(temp[[1]]))/100, "IC50" = as.numeric(unlist(temp[[2]])), parTable) 
	slices[[fn]] <- n
}

res <- do.call(rbind, slices)

save(res, file="/pfs/out/profiles.RData")
