entity$incorporation_year = as.integer(entity$incorporation_year)
Top50_countries = names(head(sort(table(entity$countries), decreasing = TRUE),50))
Top50_num_entity = as.integer(head(sort(table(entity$countries), decreasing = TRUE), 50))
Entity20 = entity[(entity$countries %in% Top50_countries[1:20]),]
Edges20 = edges[(edges$countries %in% Top50_countries[1:20]),]

library(ggplot2)
ind_mat = matrix(nrow = 20, ncol = length(entity$countries))

for (i in 1:20){
  ind_mat[i,] = (entity$countries == Top50_countries[i])
}


incorporation_year_1 = na.omit(entity$incorporation_year[ind_mat[1,]])
incorporation_year_2 = na.omit(entity$incorporation_year[ind_mat[2,]])
incorporation_year_3 = na.omit(entity$incorporation_year[ind_mat[3,]])
incorporation_year_4 = na.omit(entity$incorporation_year[ind_mat[4,]])
incorporation_year_5 = na.omit(entity$incorporation_year[ind_mat[5,]])
incorporation_year_6 = na.omit(entity$incorporation_year[ind_mat[6,]])
incorporation_year_7 = na.omit(entity$incorporation_year[ind_mat[7,]])
incorporation_year_8 = na.omit(entity$incorporation_year[ind_mat[8,]])
incorporation_year_9 = na.omit(entity$incorporation_year[ind_mat[9,]])
incorporation_year_10 = na.omit(entity$incorporation_year[ind_mat[10,]])
incorporation_year_11 = na.omit(entity$incorporation_year[ind_mat[11,]])
incorporation_year_12 = na.omit(entity$incorporation_year[ind_mat[12,]])
incorporation_year_13 = na.omit(entity$incorporation_year[ind_mat[13,]])
incorporation_year_14 = na.omit(entity$incorporation_year[ind_mat[14,]])
incorporation_year_15 = na.omit(entity$incorporation_year[ind_mat[15,]])
incorporation_year_16 = na.omit(entity$incorporation_year[ind_mat[16,]])
incorporation_year_17 = na.omit(entity$incorporation_year[ind_mat[17,]])
incorporation_year_18 = na.omit(entity$incorporation_year[ind_mat[18,]])
incorporation_year_19 = na.omit(entity$incorporation_year[ind_mat[19,]])
incorporation_year_20 = na.omit(entity$incorporation_year[ind_mat[20,]])



ggplot(data.frame(incorporation_year_1), aes(x=incorporation_year_1)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[1])
ggplot(data.frame(incorporation_year_2), aes(x=incorporation_year_2)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[2])
ggplot(data.frame(incorporation_year_3), aes(x=incorporation_year_3)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[3])
ggplot(data.frame(incorporation_year_4), aes(x=incorporation_year_4)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[4])
ggplot(data.frame(incorporation_year_5), aes(x=incorporation_year_5)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[5])
ggplot(data.frame(incorporation_year_6), aes(x=incorporation_year_6)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[6])
ggplot(data.frame(incorporation_year_7), aes(x=incorporation_year_7)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[7])
ggplot(data.frame(incorporation_year_8), aes(x=incorporation_year_8)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[8])
ggplot(data.frame(incorporation_year_9), aes(x=incorporation_year_9)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[9])
ggplot(data.frame(incorporation_year_10), aes(x=incorporation_year_10)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[10])
ggplot(data.frame(incorporation_year_11), aes(x=incorporation_year_11)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[11])
ggplot(data.frame(incorporation_year_12), aes(x=incorporation_year_12)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[12])
ggplot(data.frame(incorporation_year_13), aes(x=incorporation_year_13)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[13])
ggplot(data.frame(incorporation_year_14), aes(x=incorporation_year_14)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[14])
ggplot(data.frame(incorporation_year_15), aes(x=incorporation_year_15)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[15])
ggplot(data.frame(incorporation_year_16), aes(x=incorporation_year_16)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[16])
ggplot(data.frame(incorporation_year_17), aes(x=incorporation_year_17)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[17])
ggplot(data.frame(incorporation_year_18), aes(x=incorporation_year_18)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[18])
ggplot(data.frame(incorporation_year_19), aes(x=incorporation_year_19)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[19])
ggplot(data.frame(incorporation_year_20), aes(x=incorporation_year_20)) + geom_histogram(color="black", fill="white", binwidth = 1) + ggtitle(Top50_countries[20])


