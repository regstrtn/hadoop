#!/usr/bin/env Rscript
# wc_mapper.r

setwd("~/a10")
input = file("stdin", "r")

while(length(line <- readLines(input, n = 1, warn = F))) {
  fields = unlist(strsplit(line, " "))
  for(i in 1:length(fields)) {
    cat(fields[i], "\t1\n")
  }
}