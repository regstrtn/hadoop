#!/usr/bin/env Rscript
# Reducer 1
#args = commandArgs(trailingOnly = T)
args = c(10)
is_first_line = T
df = data.frame(title = character(), id = character(), numtags = numeric(), stringsAsFactors = F)

input = file("stdin", "r")
while(length(line <- readLines(input, n=1, warn = F))> 0) {
  line = unlist(strsplit(line, "\t", fixed = T))
  cat(line[1], "\t", line[2], "\t", line[3], "\n")
#  newrow = data.frame(title = line[1], id = line[2], numtags = as.integer(line[3]), stringsAsFactors = F)
#  df = rbind(df, newrow)
}


# df = df[order(-df$numtags),]
# for(i in 1:nrow(df)) {
#   if(df$numtags[i]>args[1]) cat(df$title[i], "\t", df$numtags[i], "\n")
#   }
# close(input)
