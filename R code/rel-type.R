relationship = list()

for (i in 1:length(edges$rel_type)) {
  relationship[i] = strsplit(as.character(edges$rel_type[i][1]), "/")
}

for (j in 1:length(relationship)) {
  relationship[j] = strsplit(as.character(relationship[[j]][1]), ",")
}


ind = c(rep(0,length(relationship)))

for (ii in 1:length(relationship)) {
  ind[ii] = (length(relationship[[ii]])  == 1)
}
sum(ind)

edges$relationship = relationship

#Owner Level = 1, shareholder = 2, Director = 3, Vp = 4, secretary = 5, member = 6, Other relationship = 0



