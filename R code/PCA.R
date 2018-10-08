prx = list()
yr_pca = list()
for (y in 20:length(yr)) {
  ind_updated = c(rep(TRUE,nrow(yr[[y]])))
  for (c in 1:ncol(yr[[y]])) {
    ind = (!is.na(yr[[y]][,c]) & (yr[[y]][,c] != Inf))
    ind_updated = ind & ind_updated
  }
  subset = yr[[y]][ind_updated,]
  for (i in 1:ncol(subset)){
    subset[,i] = (subset[,i]-mean(subset[,i]))/sd(subset[,i])
  }
  pca = prcomp(subset)
  prx[[y]] = pca
  yr_pca[[y]] = prx[[y]]$x[,(1:2)]
  
}

save(yr_pca,file = "after_normal_PCA.Rdata")


