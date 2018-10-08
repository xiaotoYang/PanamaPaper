count_deg2 = matrix(data = NA, nrow = 46, ncol = 207)
mean_year = matrix(data = NA, nrow = 46, ncol = 207)
sd_year = matrix(data = NA, nrow = 46, ncol = 207)
seventyfiveperc = matrix(data = NA, nrow = 46, ncol = 207)
one_proportion = matrix(data = NA, nrow = 46, ncol = 207)

for (i in 1:207) {
  for (j in 1:46) {
    count_deg2[j, i] = sum(count_edges[[i]][[j]]$Freq == 2)
    mean_year[j, i] = mean(count_edges[[i]][[j]]$Freq)
    sd_year[j, i] = sd(count_edges[[i]][[j]]$Freq)
    one_proportion[j, i] = sum(count_edges[[i]][[j]]$Freq == 1)/length(count_edges[[i]][[j]]$Freq)
    seventyfiveperc[j, i] = quantile(count_edges[[i]][[j]]$Freq)[4]
  }
}
save(count_deg2, mean_year, one_proportion, sd_year, seventyfiveperc, file = "Summary.RData")