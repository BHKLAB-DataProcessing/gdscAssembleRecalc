
# library(PharmacoGxPrivate)


myfn <- list.files("/pfs/input/", full.names=TRUE)
slices <- list()

for(fn in myfn){
	temp <- readRDS(fn)
	parTable <- do.call(rbind,temp[[3]])
	print(head(rownames(parTable)))
	print(str(parTable))
	n <- data.frame("AAC" = as.numeric(unlist(temp[[1]]))/100, "IC50" = as.numeric(unlist(temp[[2]])), apply(parTable, c(1,2), function(x) return(as.numeric(unlist(x))))) 
	slices[[fn]] <- n
}

res <- do.call(rbind, slices)

save(res, file="/pfs/out/profiles.RData")
