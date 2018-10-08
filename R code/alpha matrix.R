alpha = matrix(NA, nrow = length(subsets[[1]]), ncol = length(subsets))
for (i in 1:length(subsets)){
  N = 0
  p = 0
  officer_hist = NULL
  officer_total = NULL
  officer_new = NULL
  for (j in 1:length(subsets[[i]])){ #data of each country each year
    officer_new = unique(subsets[[i]][[j]]$node_1)
    if(length(officer_hist) == 0 | length(officer_new) == 0){
      alpha[j,i] = Inf
    }else{
      officer_total = officer_new
      #get new officers each year
      for (k in 1:length(officer_new)){
        if (officer_new[k] %in% officer_hist){
          officer_new[k]=NA
        }
      }
      officer_new = officer_new[!is.na(officer_new)]
      p = length(officer_new)/length(officer_total)
      N = length(officer_hist)
      alpha[j,i] = p*N/(1-p)
    }
    officer_hist = c(officer_hist, officer_new)
  }
}
 
rownames(alpha) = c(1970:2015)
colnames(alpha) = names(subsets)

save(alpha, file = "alpha.RData")
