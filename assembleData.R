
library(PharmacoGxPrivate)


myfn <- list.files("/pfs/input/", full.names=TRUE)
slices <- list()

for(fn in myfn){
	temp <- readRDS(fn)
	parTable <- do.call(rbind,temp[[3]])
	n <- cbind("auc_recomputed" = temp[[1]], "ic50_recomputed" = temp[[2]], parTable) 
	slices[[fn]] <- n
}

res <- do.call(rbind, slices)

saveRDS(res, file=paste("/pfs/out/", "gdscProfile.rds"))
