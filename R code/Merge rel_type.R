#Frequency plot of node1
table_node1 = as.data.frame(table(edges$node_1))
freq_node1 = table_node1[order(-table_node1$Freq),]
freq_node1$node1 = as.vector(freq_node1$Var1)

top10_node1 = freq_node1$node1[c(1:10)]
top50_node1 = freq_node1$node1[c(1:50)]
barplot(freq_node1$Freq[c(1:10)], xlab = "Node1", ylab = "Frequency", 
     main = "Top 10 frequent node 1")
xgap = seq(from = 1, to = 12, by = 1.2)
axis(1, at = xgap, labels = top10_node1, las = 2)


edges[which(edges$node_1 %in% top10_node1),] 
head(edges) 

#Frequency plot of node2 
table_node2 = as.data.frame(table(edges$node_1))
freq_node2 = table_node1[order(-table_node1$Freq),]
freq_node2$node2 = as.vector(freq_node1$Var1)

barplot(freq_node2$Freq[c(1:10)], xlab = "Node1", ylab = "Frequency", 
        main = "Top 10 frequent node 2")
xgap = seq(from = 1, to = 12, by = 1.2)
axis(1, at = xgap, labels = freq_node2$node2[c(1:10)], las = 2)

#frequency by entities' countries
table_country1 = as.data.frame(table(entity$countries))
freq_country1 = table_country1[order(-table_country1$Freq),]
freq_country1$Var1 = as.vector(freq_country1$Var1)
barplot(freq_country1$Freq[c(1:10)], xlab = "Country", ylab = "Frequency", 
        main = "Top 10 countries by entity")
xgap = seq(from = 1, to = 12, by = 1.2)
axis(1, at = xgap, labels = freq_country1$Var1[c(1:10)], las = 2)


#frequency by officers' countries
table_country2 = as.data.frame(table(officer$countries))
freq_country2 = table_country2[order(-table_country2$Freq),]
freq_country2$Var1 = as.vector(freq_country2$Var1)
barplot(freq_country2$Freq[c(1:10)], ylab = "Frequency", 
        main = "Top 10 countries by officer")
xgap = seq(from = 1, to = 12, by = 1.2)
axis(1, at = xgap, labels = freq_country2$Var1[c(1:10)], las = 2)

#frequency by intermediarys' country
table_country3 = as.data.frame(table(intermediary$countries))
freq_country3 = table_country3[order(-table_country3$Freq),]
freq_country3$Var1 = as.vector(freq_country3$Var1)
barplot(freq_country3$Freq[c(1:10)], ylab = "Frequency", 
        main = "Top 10 countries by intermediary")
xgap = seq(from = 1, to = 12, by = 1.2)
axis(1, at = xgap, labels = freq_country3$Var1[c(1:10)], las = 2)

#Growth of intermediary in Hongkong
node_hk = intermediary$node_id[intermediary$countries == "Hong Kong"]
edges[which(edges$node_1 %in% node_hk),]
counts_hk <- table(edges$Year[which(edges$node_1 %in% node_hk)])
barplot(counts_hk)

#Growth of intermediary in UK
node_uk = intermediary$node_id[intermediary$countries == "United Kingdom"]
edges[which(edges$node_1 %in% node_uk),]
counts_uk <- table(edges$Year[which(edges$node_1 %in% node_uk)])
barplot(counts_uk)

#Growth of intermediary in US
node_us = intermediary$node_id[intermediary$countries == "United States"]
counts_us <- table(edges$Year[which(edges$node_1 %in% node_us)])

node_swl = intermediary$node_id[intermediary$countries == "Switzerland"]
counts_swl <- table(edges$Year[which(edges$node_1 %in% node_swl)])

node_tw = intermediary$node_id[intermediary$countries == "Taiwan"]
counts_tw <- table(edges$Year[which(edges$node_1 %in% node_tw)])


plot(counts_hk, type = "l", col = "red", lwd = 0.5, xlim = c(1988, 2010),ylim = c(0, 300), ylab = "New Relationship By Year")
lines(counts_uk, type = "l",col = "blue", lwd = 0.5)
lines(counts_us, type = "l", col = "green")
lines(counts_swl, type = "l", col = "black")
lines(counts_tw, type = "l", col = "dark blue")

save(edges, entity, intermediary, officer,Year, Year2, duration, file = "country.RData")

count_ex_us <- table(edges$Year2[which(edges$node_1 %in% node_us)])

