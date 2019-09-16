
# library(PharmacoGxPrivate)


myfn <- list.files("/pfs/input/", full.names=TRUE)
slices <- list()

for(fn in myfn){
	temp <- readRDS(fn)
	parTable <- do.call(rbind,temp[[3]])
	# print(head(rownames(parTable)))
	print(str(temp[[3]]))
	n <- data.frame("AAC" = as.numeric(unlist(temp[[1]]))/100, 
					"IC50" = as.numeric(unlist(temp[[2]])), 
					"HS" = as.numeric(unlist(temp[[3]]$HS)),
					"E_inf" = as.numeric(unlist(temp[[3]]$E_inf)),
					"EC50" = as.numeric(unlist(temp[[3]]$EC50))) 
	print(head(rownames(n)))
	slices[[fn]] <- n
}

res <- do.call(rbind, slices)

save(res, file="/pfs/out/profiles.RData")
